<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String login = "";
	if( session.getAttribute("uid") == null) {
	 	login = "guest";
	} else {
		login = "login";
	}
%>  	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="m3.css" type=text/css rel=stylesheet>

<script type="text/javascript">

var isLogin = "<%=login%>";

 function isDelete(){
  
	 if(isLogin == 'guest') {
		 alert("로그인 상태가 아닙니다.");
		 location.href="login_BootStrap.jsp";
		 //history.go(-1); // 페이지  1단계 전으로 이동
	 }
	 else{
		 if(confirm("회원탈퇴 하시겠습니까?")) {
			 location.href="delete_ok_BootStrap.jsp";
		 }else {
			 history.go(-1); // 페이지  1단계 전으로 이동
			 return;
		 }
	 }
	 
 }
</script>

</head>
<body onload="isDelete();">

</body>
</html>
	