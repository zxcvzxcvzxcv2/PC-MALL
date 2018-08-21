<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="m3.css" type=text/css rel=stylesheet>
</head>
<body>
<%
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	String sql = "select m_uid, m_pwd from member where m_uid = ? ";
	String sql1 = "update member set m_visit=m_visit+1 where m_uid = ? ";
  	
	Connection conn = null;
	PreparedStatement pstmt = null; 
    
	DBConnectionManager pool = DBConnectionManager.getInstance();
	conn = pool.getConnection("ora8");
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, uid);
	ResultSet rs = pstmt.executeQuery();
	
	if( rs.next() ) {
		if (pwd.trim().equals(rs.getString("m_pwd").trim())) 
		{
			session.setAttribute("uid", uid);
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, uid);
			pstmt1.executeUpdate();
			pstmt1.close();
 %>
			<h3>로그인 성공</h3>
			<img src="img/love.gif"><p>
			<%= uid %> 님이 로그인 하셨습니다.<p>
<%
		} else {
 %>
			<h3>로그인 실패</h3>
			<img src="img/warning.gif"><p>
			비밀 번호를 다시 확인해 주세요...<p>
<%       
		}          
	} else {
%>
		<h3>로그인 실패</h3>
		<img src="img/warning.gif"><p>
		아이디를 다시 확인해 주세요...<p>
<%	}
	rs.close();
	pstmt.close();
	conn.close();
%>
</body>
</html>