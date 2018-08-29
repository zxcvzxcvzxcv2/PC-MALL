<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PW 찾기</title>
<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
<script language="JavaScript">
	function checkInput() {
		if (document.fname.uid.value == "") {
			alert("ID를 입력하세요");
			document.fname.uid.focus();
			return;
		}
		if (document.fname.email.value == "") {
			alert("이메일을 입력하세요");
			document.fname.email.focus();
			return;
		}
		
		document.fname.submit();  // login_ok.jsp페이지 폼 전송
	}
	
</script>
</head>
<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
	<jsp:include page="../common/basic_screen.jsp" flush="true" />

	<!--상단테이블과 메뉴테이블 끝-->

		<br>
		<br>

		<form name="fname" method="post" action="userpw_ok.jsp">
			<table width="480" border="1" cellspacing="0" cellpadding="0"
				height="25">
				<tr>
					<td bgcolor="#0000ff" height="28">
						<div align="center">
							<font color="#ffffff"><b>PW 찾기</b></font>
						</div>
					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td align=center bgcolor="#eff4f8" height="120">
						<table width="250" border="0" cellspacing="0" cellpadding="1">
							<tr>
								<td width="55" nowrap>아이디</td>
								<td width="175"><input type=text name="uid" size="16" 
									maxlength=16 style="width:155" onkeypress="if(event.keyCode==13) {checkInput(); return false;}"></td>
							</tr>
							<tr>
								<td width="55" nowrap>이메일</td>
								<td width="175"><input type=text name="email" size="14" maxlength="30" 
									style="width:155" onkeypress="if(event.keyCode==13) {checkInput(); return false;}"></td>
							</tr>
							<tr height=40 valign=bottom>
								<td></td>
								<td align=center>
								
								<input type="button" value="확인" OnClick="checkInput();">
								<input type="reset" value="취 소">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" align=center height="120">
						<p>
							아이디(ID)와 이메일을 입력하세요!!!.<br>
							<br>
							<a href="id_find.jsp">ID찾기</a> |
								<a href="pw_find.jsp">PW찾기</a>
						<p>
							아이디가 없으신 분은 <a href="user.jsp"><font color="#ff7508">회원가입</font></a>을
							하시기 바랍니다.<br>
							<br>
							<br>
						</p>
					</td>
				</tr>
			</table>
		</form>
	
	<!-- table END-->
	<%-- <jsp:include page="../common/basic_copyright.jsp" flush="true" /> --%>
</body>
</html>