<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	// 관리자 아이디와 비밀번호를 검사.
	// 세션 aid 값이 'admin' 또는 세션 apwd 값이 '1234' 가 아니면 admin_login.jsp로 페이지 이동 
	if (!("admin".equals(session.getAttribute("aid")))) 
	{
%>    
		<jsp:forward page="admin_login_BootStrap.jsp" /> 
<%  }
	if (!("1234".equals(session.getAttribute("apwd")))) 
	{
%>		
		<jsp:forward page="admin_login_BootStrap.jsp" />  
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

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Material Dashboard by Creative Tim</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- Bootstrap core CSS     -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
<!--  Material Dashboard CSS    -->
<link href="../assets/css/material-dashboard.css?v=1.2.0"
	rel="stylesheet" />
<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="../assets/css/demo.css" rel="stylesheet" />
<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>

</head>
<body>
	<div class="wrapper">

		<jsp:include page="leftMenu_BootStrap.jsp" flush="false" />

		<div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#"> Member Management System </a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#pablo" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="material-icons">dashboard</i>
									<p class="hidden-lg hidden-md">Dashboard</p>
							</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="material-icons">notifications</i>
									<span class="notification">5</span>
									<p class="hidden-lg hidden-md">Notifications</p>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">Mike John responded to your email</a></li>
									<li><a href="#">You have 5 new tasks</a></li>
									<li><a href="#">You're now friend with Andrew</a></li>
									<li><a href="#">Another Notification</a></li>
									<li><a href="#">Another One</a></li>
								</ul></li>
							<li><a href="#pablo" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="material-icons">person</i>
									<p class="hidden-lg hidden-md">Profile</p>
							</a></li>
						</ul>
						<form class="navbar-form navbar-right" role="search">
							<div class="form-group  is-empty">
								<input type="text" class="form-control" placeholder="Search">
								<span class="material-input"></span>
							</div>
							<button type="submit"
								class="btn btn-white btn-round btn-just-icon">
								<i class="material-icons">search</i>
								<div class="ripple-container"></div>
							</button>
						</form>
					</div>
				</div>
			</nav>


			<div class="content">
				<div class="container-fluid">

					<div class="row">

						<div class="col-md-12">
							<div class="card">
								<div class="card-header" data-background-color="purple">
									<h4 class="title">회원 목록</h4>
									<p class="category">Member List</p>
								</div>

								<div class="card-content table-responsive">
									<table class="table  table-hover">
										<thead class="text-primary">
											<tr>
												<th>순번</th>
												<th>아이디</th>
												<th>이름</th>
												<th>전화번호</th>
												<th>email주소</th>
												<th>방문횟수</th>
											</tr>
										</thead>
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
										<tbody>
											<tr>
												<td><%= i %></td>
												<td><%= rs.getString("m_uid") %></td>
												<td><%= rs.getString("m_name") %></td>
												<td><%= rs.getString("m_phone") == null ? "" : rs.getString("m_phone")%></td>
												<td><%= rs.getString("m_email") == null ? "" : rs.getString("m_email")%></td>
												<td class=""><%= rs.getString("m_visit") %></td>
											</tr>
										</tbody>
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
									</table>

									<div align="center">
										<ul class="pagination pagination-primary">

											<%
											// 전체 페이지수를 계산
											pageCount = (int)Math.ceil(totalCount / (PAGE_SIZE+0.0));
											
											// 현재그룹 설정
											int curGroup = (curPage-1) / GROUP_SIZE;
											int linkPage = curGroup * GROUP_SIZE;
											
											// 이전그룹이 있는 경우
											if(curGroup > 0) {
												out.println("<li><a href=member_list_BootStrap.jsp?page="+linkPage+">< PREV</a></li>");
											}
											linkPage++;           // 링크증가
											int loopCount = GROUP_SIZE;
											
											// 그룹범위의 페이지 링크
											while((loopCount > 0) && (linkPage <= pageCount)) {
												
 												if(Integer.parseInt(request.getParameter("page")) == linkPage) {
													out.println("<li class='active'><a href=member_list_BootStrap.jsp?page="+linkPage+">"+linkPage+"</a></li>");
												}
												else{
													out.println("<li><a href=member_list_BootStrap.jsp?page="+linkPage+">"+linkPage+"</a></li>");
												} 
												
												//out.println("<li><a href=member_list_BootStrap.jsp?page="+linkPage+">"+linkPage+"</a></li>");
												
												linkPage++;
												loopCount--;
											}
											
											// 다음그룹이 있는 경우
											if(linkPage <= pageCount) {
												out.println("<li><a href=member_list_BootStrap.jsp?page="+linkPage+">NEXT ></a></li>");
											}
										%>

										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>



			<footer class="footer">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul>
							<li><a href="#"> Home </a></li>
							<li><a href="#"> Company </a></li>
							<li><a href="#"> Portfolio </a></li>
							<li><a href="#"> Blog </a></li>
						</ul>
					</nav>
					<p class="copyright pull-right">
						&copy;
						<script>
                            document.write(new Date().getFullYear())
                        </script>
						<a href="http://www.creative-tim.com">Creative Tim</a>, made with
						love for a better web
					</p>
				</div>
			</footer>
		</div>
	</div>
</body>
<!--   Core JS Files   -->
<script src="../assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets/js/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="../assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="../assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="../assets/js/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../assets/js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard javascript methods -->
<script src="../assets/js/material-dashboard.js?v=1.2.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        // Javascript method's body can be found in assets/js/demos.js
        //demo.initDashboardPageCharts();

    });
</script>
</html>