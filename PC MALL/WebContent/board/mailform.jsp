
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
    <div>
        <form action="reportAction.jsp" method="post">
            <table>
                <tr><th colspan="2">신고 메일 보내기</th></tr>
                <tr><td>reportTitle</td><td><input type="text" name="subject" /></td></tr>
                <tr><td>reportContent</td><td><textarea name="content" style="width:170px; height:200px;"></textarea></td></tr>
                <tr><td colspan="2" style="text-align:right;"><input type="submit" value="Transmission"/></td></tr>
            </table>
        </form>
    </div>
</body>
</html>
