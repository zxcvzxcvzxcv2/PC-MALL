<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="myutil.MultiPart" %>
<%@ page import="java.net.URLEncoder" %>

<%
	MultiPart multiPart = new MultiPart(request);
	String title = multiPart.getParameter("title");
	String description = multiPart.getParameter("description");
	
	String fileName = multiPart.getFileName("upload_file");
	
	
	// JDBC 테이블 입력 ~
		
	String newPath = application.getRealPath("/product/image/" + fileName);
	multiPart.saveFile("upload_file", newPath);
	
	String url = String.format("UploadResult.jsp?TITLE=%s&DESCRIPTION=%s&FILE_NAME=%s", 
			URLEncoder.encode(title, "UTF-8"), 
			URLEncoder.encode(description, "UTF-8"),
			URLEncoder.encode(fileName, "UTF-8"));
			
	response.sendRedirect(url);

%>