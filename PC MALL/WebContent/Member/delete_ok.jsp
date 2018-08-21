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
	String  uid = session.getAttribute("uid").toString();
	String sql = "delete from member where m_uid = ?" ;
	
	try {
		Connection conn = null;
		PreparedStatement pstmt = null; 
    
		DBConnectionManager pool = DBConnectionManager.getInstance();
		conn = pool.getConnection("ora8");
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,uid);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
%>  
	<h3>회원 탈퇴 성공</h3>
	<img src="img/delete.gif"><p>
	<%= uid %> 님은 회원에서 탈퇴 되었습니다.<p>
<%
    
	session.invalidate(); // 세션제거
}  catch (Exception e) {
%>
	<h3>회원 탈퇴 실패</h3>
	<img src="img/warning.gif"><p>
	<%= uid %> 님은 아직 회원에서 탈퇴되지 않았습니다.<p>
<% 
} 
%>
</body>
</html>