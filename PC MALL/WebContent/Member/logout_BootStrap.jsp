<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if( session.getAttribute("uid") == null) {
%>
		<script type="text/javascript">
			location.href="login_BootStrap.jsp";
		</script>
<%
	} else {	
		//  저장된 세션 삭제
		String uid = session.getAttribute("uid").toString();
		session.invalidate();
		
		// out.println(uid+" 님은 로그아웃 되었습니다.");
%>	
		<script type="text/javascript">
			alert('로그아웃 되었습니다.');
			location.href="index_BootStrap.jsp";
		</script>
<%
	}
%>
