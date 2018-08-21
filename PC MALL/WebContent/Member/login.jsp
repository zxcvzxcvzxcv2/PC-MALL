<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="m3.css" type=text/css rel=stylesheet>
<script language="JavaScript">
	function checkInput() {
		if(document.fname.uid.value == "") {
			alert("ID를 입력하세요");
			return;
		}
		if(document.fname.pwd.value == "") {
			alert("비밀번호를 입력하세요");
			return;
		} 
		document.fname.submit();
	}
</script>
</head>
<body bgcolor="#bfefff">
	<center><br><br>
	<form name=fname method=post action="login_ok.jsp">
	<table width="350" border="1" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="#0000ff" height="28" align="center"><font size=3 color="#ffffff"><font >회 원 로 그 인</font></td>
	</tr>
	<tr bgcolor="#ffffff"> 
		<td align=center bgcolor="#eff4f8" height="120"> 
			<table width="220" border="1" cellspacing="0" cellpadding="1">
				<tr> 
					<td width="80" align=center>아 이 디</td>
					<td><input type=text name="uid" size=15 style="width:150"></td>
				</tr>
				<tr> 
					<td align=center>비밀번호</td>
					<td><input type=password name="pwd" size=15 style="width:150"></td>
				</tr>
				<tr height=35 valign=middle>
           			<td colspan=2 align=center>
						<input type="button" value="로그인" OnClick="checkInput()">
						<input type="reset" value="취 소"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr> 
		<td bgcolor="#ffffff" align=center height="110"> 
			<p>아이디(ID)와 패스워드를 입력하세요!!!.<br><br>
아이디가 없으신 분은 <a href="insert_form.jsp">회원가입</a>을 하시기 바랍니다.<br></p>
		</td>
	</tr>
	</table>
</form></center>
</body>
</html>