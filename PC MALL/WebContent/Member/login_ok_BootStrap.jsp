<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>
    
<%

	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection conn = pool.getConnection("ora8");
		
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	String sql = "select m_uid, m_pwd from member where m_uid = ? ";
	String sql1 = "update member set m_visit=m_visit+1 where m_uid = ? ";
  	
	PreparedStatement pstmt = null;    
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
 			
 			<script type="text/javascript">
 				alert('<%= uid %>' + '님이 로그인 하셨습니다.');
 				location.href = "index_BootStrap.jsp";
 			</script>
 			
<%
		} else {
 %>
            <script type="text/javascript">
 				alert('비밀 번호를 다시 확인해 주세요.');
 				history.go(-1);
 			</script>

<%       
		}          
	} else {
%>
            <script type="text/javascript">
 				alert('아이디를 다시 확인해 주세요.');
 				history.go(-1);
 			</script>

<%	
	}
	rs.close();
	pstmt.close();
	conn.close();
%>