<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>  
    
<%
	if( session.getAttribute("uid") == null) {
%>
		<script type="text/javascript">
		location.href="login.jsp";
		</script>
<%
	} else {

		String m_uid = session.getAttribute("uid").toString();
		String m_name, m_ssn, m_pwd, m_phone, m_email;
		String sql = "select m_name,m_ssn,m_pwd,m_phone,m_email from member where m_uid='"+ m_uid +"'";

try {
	
	Connection conn = null;
	Statement stmt = null; 
	ResultSet rs = null;
	
	DBConnectionManager pool = DBConnectionManager.getInstance();
	conn = pool.getConnection("ora8"); 
	
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	
	if(rs.next()) {
		m_name=rs.getString(1);
		m_ssn = rs.getString(2);
		m_pwd = rs.getString(3);
		m_phone = rs.getString(4);
		m_email = rs.getString(5);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="m3.css" type=text/css rel=stylesheet>

	<script language="JavaScript">
		function checkInput() {
			if(document.mform.pwd.value == "") {
				alert("비밀번호를 입력하세요");
				return;
			}
			document.mform.submit();
		}   
	</script>
</head>
<body bgcolor="#e0eee0">
<center><br><br>
<form name=mform method=post action="update.jsp" >
	<table cellpadding=3 cellspacing=0 border=1 width=550>
		<tr bgcolor=#7aaad5 height=30>
			<td align=center bgcolor="#0000FF" colspan=2><font color="#ffffff"><b>회원정보 수정&nbsp;</b></font></td>
		</tr>
		<tr>
			<td bgcolor=#eff4f8>&nbsp;회원 성명</td>
			<td>
				<input type=text name="name" size=20 readonly value="<%= m_name %>"></td>
		</tr>
		<tr>
			<td bgcolor="#eff4f8">&nbsp;주민등록번호</td>
			<td>
				<input type=text name=ssn size=13 value="<%= m_ssn %>" readonly></td>
		</tr>
		<tr>
			<td bgcolor="#eff4f8">&nbsp;회원 id</td>
			<td>
			<%= m_uid %>
			<input type=hidden name=uid size=12 value="<%= m_uid %>" readonly style="width:120"></td>
		</tr>
		<tr>
			<td bgcolor="#eff4f8">&nbsp;비밀번호<font color=red>&nbsp;*</font></td>
			<td>
				<input type=password name=pwd size=8 maxlength=15 style="width:80" value="<%= m_pwd %>"></td>
		</tr>
		<tr>
			<td bgcolor="#eff4f8">&nbsp;비밀번호확인<font color=red>&nbsp;*</font></td>
			<td><input type=password name=repwd size=8 maxlength=12 value="<%= m_pwd %>" style="width:80">&nbsp;비밀번호를 한번 더 입력해 주세요. </td>
		</tr>
		<tr>
			<td bgcolor="#eff4f8">&nbsp;전화번호<font color=red>&nbsp;*</font></td>
			<td>
				<input type=text name=tel size=12 maxlength=12 value="<%= m_phone %>"></td>
		</tr>
		<tr>
			<td bgcolor="#eff4f8">&nbsp;e-mail<font color=red>&nbsp;*</font></td>
			<td>
				<input type=text name=email size=30 maxlength=30 value="<%= m_email %>"></td>
		</tr>
		<tr bgcolor=#ffffff>
			<td colspan=4>&nbsp;<font color=red>*</font> 표시만 수정할 수 있습니다&nbsp;&nbsp;
				<input type="button" name="modify" value="수 정" OnClick="checkInput()"></td>
		</tr>
	</table> 
 </form>
<%	 
	} 
		stmt.close();
		rs.close();
		conn.close();
		} catch (Exception e){} 
}
%>
</center>	
</body>
</html>