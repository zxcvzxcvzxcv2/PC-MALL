<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>
    
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
	
	<script type="text/javascript">
			alert('<%= uid %>' + '님은 탈퇴 처리 되었습니다.');
			location.href="index_BootStrap.jsp";
	</script>
	
	
<%
    
	session.invalidate(); // 세션제거
}  catch (Exception e) {
%>

	<script type="text/javascript">
			alert('<%= uid %>' + '님은 아직 회원에서 탈퇴되지 않았습니다.<p>');
			location.href="index_BootStrap.jsp";
	</script>	
<% 
} 
%>