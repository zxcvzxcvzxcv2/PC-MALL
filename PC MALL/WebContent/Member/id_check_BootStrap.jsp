<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String sql = "select count(1) from member where m_uid = '";
		   sql = sql + request.getParameter("uid") + "'";

	Connection conn = null;
	Statement stmt = null; 
		    
	DBConnectionManager pool = DBConnectionManager.getInstance();
	conn = pool.getConnection("ora8");
	
	stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	rs.next();
	if(rs.getInt(1) > 0) {
 %>
		<center>
		<img src="img/warning.gif"><br>
		<font size=2>입력한 아이디(id)는 사용중입니다.</font><br>
		<a href="JavaScript:window.close()">닫기</a>
		</center>
<%
	} else {
%>
		<center>
		<img src="img/cong.gif"><br>
		<font size=2>입력한 아이디(id)는 사용 가능합니다.</font><br>
		<a href="JavaScript:window.close()">계속하기</a>
		</center>
<%	}
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>