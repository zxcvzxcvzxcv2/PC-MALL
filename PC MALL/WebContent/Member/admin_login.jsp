<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 로그인</title>
<link href="m3.css" type=text/css rel=stylesheet>
</head>
<body bgcolor="#ccffff">
	<center><br><br>
	<form name="fname" method="post" action="admin_check.jsp">
	<table width="350" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td bgcolor="#00ff00" height="28" align="center"><font size=3>관 리 자 로 그 인</font></td>
		</tr>
		<tr bgcolor="#ffffff"> 
			<td align=center bgcolor="#eff4f8" height="120"> 
				<table width="230" border="1" cellspacing="0" cellpadding="1">
					<tr> 
						<td width=80 align=center>아 이 디</td>
							<td><input type=text name="aid" size=15 style="width:150"></td>
					</tr>
					<tr> 
						<td align=center>비밀번호</td>
						<td><input type=password name="apwd" size=15 style="width:150"></td>
					</tr>
					<tr height=35 valign=middle>
						<td colspan=2 align=center>
							<input type="submit" value="로그인">
							<input type="reset" value="취 소"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr> 
			<td bgcolor="#ffffff" align=center height="80" valign=middle> 
				<p> 관리자 아이디(ID)와 패스워드를 입력하세요!!!.</p>
			</td>
		</tr>
	</table>
	</form>
	</center>
</body>
</html>