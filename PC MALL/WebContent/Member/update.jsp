<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>

<%
 	request.setCharacterEncoding("UTF-8");
	String m_uid=request.getParameter("uid");
	String m_pwd=request.getParameter("pwd");
	String m_email=request.getParameter("email");
	String m_phone=request.getParameter("tel");
	
	String sql = "update member set m_pwd=?,  m_phone=?, m_email=? ";
		   sql = sql + " where m_uid ='"+m_uid+"'";
			 
    try {
	Connection conn = null;
	PreparedStatement pstmt = null; 
		    
	DBConnectionManager pool = DBConnectionManager.getInstance();
	conn = pool.getConnection("ora8");
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, m_pwd);
	pstmt.setString(2, m_phone);
	pstmt.setString(3, m_email);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="m3.css" type=text/css rel=stylesheet>
</head>
<body bgcolor="#ffffff">
<%
	
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
%> 
		<h3>회원정보 수정</h3>
		<%= m_uid %> 님의 회원 정보가 수정되었습니다.<p>
<%
	} catch (Exception e) {
%>
		<h3>회원정보 수정 실패</h3>
		<%= m_uid %> 님의 회원정보를 수정하지 못했습니다.<p>
<% } %>
</BODY>
</body>
</html>