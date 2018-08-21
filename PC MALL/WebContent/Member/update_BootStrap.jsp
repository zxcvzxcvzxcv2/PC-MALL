<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>

<%
 	request.setCharacterEncoding("UTF-8");
	String m_uid   = request.getParameter("uid");
	String m_pwd   = request.getParameter("pwd");
	String m_email = request.getParameter("email");
	
	// 전화번호 값 전달
	String m_phone = "";
	String m_phone1 = request.getParameter("tel1");
	String m_phone2 = request.getParameter("tel2");
	String m_phone3 = request.getParameter("tel3");
		
	// 3개의 전화번호 칸이 모두 공백이 아닐때만 입력처리
	if( !m_phone1.equals("") && !m_phone2.equals("") && !m_phone3.equals("")) 
	{
		m_phone=m_phone1+ "-" + m_phone2 + "-" + m_phone3;
	} else {
		m_phone=m_phone1 + m_phone2 + m_phone3;
	}
		
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
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();
%> 
		
	<script type="text/javascript">
		alert('<%= m_uid %>' + '님의 회원 정보가 수정되었습니다.');
		location.href="index_BootStrap.jsp";
	</script>
		
<%
	} catch (Exception e) {
%>
       
	<script type="text/javascript">
		alert('<%= m_uid %>' + '님의 회원정보를 수정하지 못했습니다.');
		location.href="index_BootStrap.jsp";
	</script>
	
<% } %>