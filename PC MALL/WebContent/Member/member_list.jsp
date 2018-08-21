<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>
    
<%
	request.setCharacterEncoding("UTF-8");
	// 관리자 아이디와 비밀번호를 검사.
	// 세션 aid 값이 'admin' 또는 세션 apwd 값이 '1234' 가 아니면 admin_login.jsp로 페이지 이동 
	if (!("admin".equals(session.getAttribute("aid")))) 
	{
%>    
		<jsp:forward page="admin_login.jsp" /> 
<%  }
	if (!("1234".equals(session.getAttribute("apwd")))) 
	{
%>		
			<jsp:forward page="admin_login.jsp" />  
<%  } 

	Connection conn = null;
	Statement stmt = null; 
	    
	DBConnectionManager pool = DBConnectionManager.getInstance();
	conn = pool.getConnection("ora8");
	
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

	// 페이지 네비게이션 관련 변수
	int PAGE_SIZE = 5;		// 한페이지에 보여질 게시물의 수
	int GROUP_SIZE = 2;		// 그룹의 크기
	String reqPage;			// 요청 페이지 : linkPage 값임
	int curPage;			// 현재 페이지
	int totalCount;			// 전체 게시물의 개수
	int pageCount;			// 전체 페이지의 수

	reqPage = request.getParameter("page");
	if(reqPage == null) {
		curPage = 1;
	} else
		curPage = Integer.parseInt(reqPage);
	
	// 총회원수 계산
	String sql= "select count(*) from member";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	totalCount = rs.getInt(1);
    rs.close();
    //conn.close();
%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="m3.css" type=text/css rel=stylesheet>

<script>
	alert('관리자로 로그인 되었습니다.');
</script>

</head>
<body bgcolor="#ccffff">
	<center><br>
	<table cellpadding=3 cellspacing=0 border=1 width=450>       
		<tr bgcolor=#7aaad5 height=30>
			<td width=250 align=center bgcolor="#0000ff"><font color="#ffffff" size=3><b>회 원 명 부</b></font></td>
			<td width=100  bgcolor="#ccffff">총회원 : <%=  totalCount %>명</td>
		</tr>
	</table>
	<table cellpadding=3 cellspacing=0 border=1 width=450> 
		<tr bgcolor=#ffff33  align=center>
			<td width="30">순번</td>
			<td width="60">아이디</td>
			<td width="50">이름</td>
			<td width="70" >전화번호</td>
			<td width="60">email주소</td>
			<td width="60">방문횟수</td>
		</tr>
<%
	try{
		// 회원 정보 검색을 위한 select 문
		sql = "SELECT m_uid, m_name,m_phone,m_email,m_visit FROM  member ";
		rs = stmt.executeQuery(sql);

		int i=totalCount+1;
		// 요청 페이지에 대한 커서를 해당 포인터로 이동
		if(curPage > 1){
			rs.absolute((curPage-1)*PAGE_SIZE);
			i = i - ((curPage-1)*PAGE_SIZE);  // 현재 페이지의 번호 계산
		}
		
		int j = 1;            // 현재 페이지의 순번
		// 현재 페이지에 해당하는 회원만 출력.
		while (rs.next() && (j <= PAGE_SIZE)) {
			i--;
%>
		<tr bgcolor="#ffffff">
			<td align=center><%= i %></td>
			<td><%= rs.getString("m_uid") %></td>
			<td><%= rs.getString("m_name") %></td>
			<td><%= rs.getString("m_phone") == null ? "" : rs.getString("m_phone")%></td>
			<td><%= rs.getString("m_email") == null ? "" : rs.getString("m_email")%></td>
			<td align=center><%= rs.getString("m_visit") %></td>
		</tr>
<%
		j++;
	}
	rs.close();
	stmt.close();
	
	} catch(Exception e) {
	    System.out.println(e);
	   } finally {
		   conn.close();
	   }
%>
   </table><br>

<%
	// 전체 페이지수를 계산
	pageCount = (int)Math.ceil(totalCount / (PAGE_SIZE+0.0));
	
	// 현재그룹 설정
	int curGroup = (curPage-1) / GROUP_SIZE;
	int linkPage = curGroup * GROUP_SIZE;
	
	// 이전그룹이 있는 경우
	if(curGroup > 0) {
		out.println("<a href=member_list.jsp?page="+linkPage+"><<이전</a>");
	}
	linkPage++;           // 링크증가
	int loopCount = GROUP_SIZE;
	
	// 그룹범위의 페이지 링크
	while((loopCount > 0) && (linkPage <= pageCount)) {
		out.println("[<a href=member_list.jsp?page="+linkPage+">"+linkPage+"</a>]&nbsp;");
		linkPage++;
		loopCount--;
	}
	
	// 다음그룹이 있는 경우
	if(linkPage <= pageCount) {
		out.println("<a href=member_list.jsp?page="+linkPage+">다음 >></a>");
	}
%>
   </center>
</body>
</html>