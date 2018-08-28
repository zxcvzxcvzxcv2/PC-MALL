<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.*" %>

<%! 
	static Logger logger = Logger.getLogger("index.jsp"); 
%>


<% logger.info("index.jsp start ~~~."); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>컴퓨터전문쇼핑몰</title>
<link href="../common/u3.css" type="text/css" rel="stylesheet"/>
</head>

<body onload="window.open('popup.html','pop','width=400px, height=300px, left=100px, top=50px, toolbar=0, status=yes, menubars=0, scrollbars=0, resizable=0, location=0, directories=0')">
	<jsp:include page="../common/basic_screen.jsp"    flush="true"/>
	<jsp:include page="../common/main_right.jsp"      flush="true"/>
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</body>
</html>

<% logger.info("index.jsp end ~~~."); %>



       