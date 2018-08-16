<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %> 
<%@ page import="javax.mail.Address" %> 
<%@ page import="javax.mail.internet.InternetAddress" %> 
<%@ page import="javax.mail.internet.MimeMessage" %> 
<%@ page import="javax.mail.Session" %> 
<%@ page import="javax.mail.Authenticator" %> 
<%@ page import="java.util.Properties" %> 
<%@ page import="user.UserDAO" %> 
<%@ page import="util.SHA256" %>  
<%@ page import="util.Gmail" %>
<%@ page import="java.io.PrintWriter" %>   

<%
   UserDAO userDAO = new UserDAO();
String userID = null;
if(session.getAttribute("userID") != null) {
	userID = (String) Session.getAttribute("userID");
}
if(userID == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 해주세요.');");
	script.println("location.href = 'userLogin.jsp'");
	script.println("</script>");
	script.close();
	return;
}
boolean emailChecked =userDAO.getUserEmailChecked(userID);
if(emailChecked == true) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 인증 된 회원입니다.');");
	script.println("location.href = 'declaration.jsp'");
	script.println("</script>");
	script.close();
	return;
}

request.setCharacterEncoding("UTF-8");
String reportTitle = null;
String reportContent = null;
if(request.getParameter("reportTitle") != null) {
	reportTitle = request.getParameter("reportTitle");
}
if(request.getParameter("reportContent") != null) {
	reportTitle = request.getParameter("reportContent");
}
if(reportTitle == null || reportContent == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안 된 사항이 있습니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}

String host = "http://localhost:8080/Lecture_Evaluation/";
String from = "gmldnjs062@gmail.com";
String to = userDAO.getUserEmail(userID);
String subject = "강의평가를 위한 이메일 인증 메일입니다.";
String content = "다음 링크에 접속하여 이메일 인증을 진행하세요.";
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>