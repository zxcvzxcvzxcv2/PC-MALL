<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
    
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 데이터 베이스 커넥셕 풀 테스트</h1>
<%
	Connection conn = null;
	Statement stmt = null; 
    
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)
	envCtx.lookup("jdbc/mySql");
	conn = ds.getConnection();

	if(conn != null) {
		out.println("<h1><font color='blue'>DataBaseConnectionPool 연결</h1></font><br>");
		conn.close();
	}
	else {
		out.println("<font color='red'>연결취득 실패</font><br>");
	}
%>

</body>
</html>