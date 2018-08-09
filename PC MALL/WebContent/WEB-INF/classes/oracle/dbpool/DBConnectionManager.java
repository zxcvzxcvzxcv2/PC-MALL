package oracle.dbpool;

import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.Date;

public class DBConnectionManager {
    static private DBConnectionManager instance;       // �̱� �ν��Ͻ�
    static private int clients;

    private Vector drivers = new Vector();
    private PrintWriter log;
    private Hashtable pools = new Hashtable();
    
   // DB ���� �ν��Ͻ�
    static synchronized public DBConnectionManager getInstance() {
        if (instance == null) {
            instance = new DBConnectionManager();
        }
        clients++;
        return instance;
    }
    
    // ������
    private DBConnectionManager() {
        init();
    }
    
    // DB ���� ����
    public void freeConnection(String name, Connection con) {
        DBConnectionPool pool = (DBConnectionPool) pools.get(name);
        if (pool != null) {
            pool.freeConnection(con);
        }
    }
        
    // DB ���� ���� �޼ҵ�

    public Connection getConnection(String name) {
        DBConnectionPool pool = (DBConnectionPool) pools.get(name);
        if (pool != null) {
            return pool.getConnection();
        }
        return null;
    }
    
	public synchronized void release() {
        // ������ ������ ���Ͻñ��� ��ٸ�
        if (--clients != 0) {
            return;
        }
        
        Enumeration allPools = pools.elements();
        while (allPools.hasMoreElements()) {
            DBConnectionPool pool = (DBConnectionPool) allPools.nextElement();
            pool.release();
        }
        Enumeration allDrivers = drivers.elements();
        while (allDrivers.hasMoreElements()) {
            Driver driver = (Driver) allDrivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
                log("Deregistered JDBC driver " + driver.getClass().getName());
            }
            catch (SQLException e) {
                log(e, "Can't deregister JDBC driver: " + driver.getClass().getName());
            }
        }
    }
    
    // @param Ŀ�ؼ� Ǯ �ɼ�
    private void createPools(Properties props) {
        Enumeration propNames = props.propertyNames();
        while (propNames.hasMoreElements()) {
            String name = (String) propNames.nextElement();
            if (name.endsWith(".url")) {
                String poolName = name.substring(0, name.lastIndexOf("."));
                String url = props.getProperty(poolName + ".url");
                if (url == null) {
                    log("No URL specified for " + poolName);
                    continue;
                }
                String user = props.getProperty(poolName + ".user", "system");
                String password = props.getProperty(poolName + ".password", "1234");
                String maxconn = props.getProperty(poolName + ".maxconn", "0");
                int max;
                try {
                    max = Integer.valueOf(maxconn).intValue();
                }
                catch (NumberFormatException e) {
                    log("Invalid maxconn value " + maxconn + " for " + poolName);
                    max = 0;
                }
                DBConnectionPool pool = 
                    new DBConnectionPool(poolName, url, user, password, max);
                pools.put(poolName, pool);
                log("Initialized pool " + poolName);
            }
        }
    }
    
    // �ʱ�ȭ ���� �о����
    private void init() {
        InputStream is = getClass().getResourceAsStream("db.properties");
		Properties dbProps = new Properties();
        try {
            dbProps.load(is);
        }
        catch (Exception e) {
            System.err.println("Can't read the properties file. " +
                "Make sure db.properties is in the CLASSPATH");
            return;
        }
        String logFile = dbProps.getProperty("logfile", "DBConnectionManager.log");
        try {
            log = new PrintWriter(new FileWriter(logFile, true), true);
        }
        catch (IOException e) {
            System.err.println("Can't open the log file: " + logFile);
            log = new PrintWriter(System.err);
        }
        loadDrivers(dbProps);
        createPools(dbProps);
    }
    
    // �����ͺ��̽� ����̹� �о� ����
    private void loadDrivers(Properties props) {
        String driverClasses = props.getProperty("drivers", "oracle.jdbc.driver.OracleDriver");
        StringTokenizer st = new StringTokenizer(driverClasses);
        while (st.hasMoreElements()) {
            String driverClassName = st.nextToken().trim();
            try {
                Driver driver = (Driver) 
                    Class.forName(driverClassName).newInstance();
                DriverManager.registerDriver(driver);
                drivers.addElement(driver);
                log("Registered JDBC driver " + driverClassName);
            }
            catch (Exception e) {
                log("Can't register JDBC driver: " +
                    driverClassName + ", Exception: " + e);
            }
        }
    }
    
    // �α� ���Ͽ� ��� �����
    private void log(String msg) {
        log.println(new Date() + ": " + msg);
    }
    
    // �α����Ͽ� �ð� ��� �����
    private void log(Throwable e, String msg) {
        log.println(new Date() + ": " + msg);
        e.printStackTrace(log);
    }
    
    // DBConnectionPool Ŭ����
    class DBConnectionPool {
        private int checkedOut;
        private Vector freeConnections = new Vector();
        private int maxConn;
        private String name;
        private String password;
        private String URL;
        private String user;
        
        /**
         * connection pool. �����ϱ�
         * @param name Ǯ �̸�
         * @param URL JDBC URL �ɼ� ����
         * @param user �����ͺ��̽� ��� ����
         * @param password �����ͺ��̽� ��� ��ȣ
         * @param maxConn  �ִ� DB POOL ����, 0�ϰ�� ���Ѵ�
         */
        public DBConnectionPool(String name, String URL, String user, String password, 
                int maxConn) {
            this.name = name;
            this.URL = URL;
            this.user = user;
            this.password = password;
            this.maxConn = maxConn;
        }
        
        // @param con ���� ���� üũ 
        public synchronized void freeConnection(Connection con) {
            freeConnections.addElement(con);
            checkedOut--;
            notifyAll();
        }
        
        public synchronized Connection getConnection() {
            Connection con = null;
            if (freeConnections.size() > 0) {
               
                con = (Connection) freeConnections.firstElement();
                freeConnections.removeElementAt(0);
                try {
                    if (con.isClosed()) {
                        log("Removed bad connection from " + name);
               
                        con = getConnection();
                    }
                }
                catch (SQLException e) {
                    log("Removed bad connection from " + name);
               
					con = getConnection();
                }
            }
            else if (maxConn == 0 || checkedOut < maxConn) {
                con = newConnection();
            }
            if (con != null) {
                checkedOut++;
            }
            return con;
        }
        
        public synchronized Connection getConnection(long timeout) {
            long startTime = new Date().getTime();
            Connection con;
            while ((con = getConnection()) == null) {
                try {
                    wait(timeout);
                }
                catch (InterruptedException e) {}
                if ((new Date().getTime() - startTime) >= timeout) {

                    return null;
                }
            }
            return con;
        }
        
        // connections. ���� ����
        public synchronized void release() {
            Enumeration allConnections = freeConnections.elements();
            while (allConnections.hasMoreElements()) {
                Connection con = (Connection) allConnections.nextElement();
                try {
                    con.close();
                    log("Closed connection for pool " + name);
                }
                catch (SQLException e) {
                    log(e, "Can't close connection for pool " + name);
                }
            }
            freeConnections.removeAllElements();
        }
        
        private Connection newConnection() {
            Connection con = null;
            try {
                if (user == null) {
                    con = DriverManager.getConnection(URL);
                }
                else {
                    con = DriverManager.getConnection(URL, user, password);
                }
                log("Created a new connection in pool " + name);
            }
            catch (SQLException e) {
                log(e, "Can't create a new connection for " + URL);
                return null;
            }
            return con;
        }
    }
}
