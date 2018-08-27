
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
 <link href="../common/u3.css" type=text/css rel=stylesheet>
</head>
<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>
    <br>
  <table border=1 width=550 height=30 bordercolor=black>
	<tr>
		<td align=center bgcolor=0063ce><font size=3 color=#FFFFFF><b>게시물 신고하기</b></td>
	</tr>
  </table>
  <br>  
    <div>
        <form action="sendMail.jsp" method="post">
            <table width="550" border="1" cellspacing="0" cellpadding="0">
                
                
                <tr><td width=120 align=center bgcolor="#7eaee9">신고 제목</td><td><input type="text" name="reportTitle" /></td></tr>
                <tr><td width=120 align=center bgcolor="#7eaee9">신고 내용</td><td><textarea name="reportContent" cols=58 rows=15;">이메일:
전화번호:
신고 내용:</textarea></td></tr>
                <tr><td colspan=4 align=right height=25><input type="submit" value="신고하기"/></td></tr>
                <td><input type="hidden" name="from" value="hw8400@naver.com" /></td>
                <td><input type="hidden" name="to" value="hw8400@naver.com"/></td>
            </table>
        </form>
    </div>
</body>
</html>
