<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 관리자 아이디와 비밀번호 체크. 
	// id : admin , pw : 1234
	if (!("admin".equals(request.getParameter("aid").trim()))) {
%>
		<jsp:forward page="admin_login.jsp" />
<%
	} 
	else if (!("1234".equals(request.getParameter("apwd").trim()))) {
%>
		<jsp:forward page="admin_login.jsp" />
<%
	} else {
     // 관리자로 로그인 되었다면
	// 관리자에 대한 세션 지정
	session.setAttribute("aid","admin");
	session.setAttribute("apwd","1234");
	response.sendRedirect("member_list.jsp");
	}
%>      