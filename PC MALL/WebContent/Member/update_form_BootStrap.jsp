<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>
  
    
<%
	if( session.getAttribute("uid") == null) {
%>
	
		<script type="text/javascript">
			 alert("로그인 상태가 아닙니다.");
			 location.href="login_BootStrap.jsp";
		</script>
<%
	} else {

		String m_uid = session.getAttribute("uid").toString();
		String m_name, m_ssn, m_pwd, m_phone, m_email;
		String sql = "select m_name,m_ssn,m_pwd,m_phone,m_email from member where m_uid='"+ m_uid +"'";
		
		// 주민번호 두자리 분리
		String[] m_ssnValues = new String[2];
		
		// 전화번호 세자리 분리
		String[] m_phoneValues = new String[3];
	    
		try {
	        Connection conn = null;
			Statement stmt = null; 
			ResultSet rs = null;
	
			DBConnectionManager pool = DBConnectionManager.getInstance();
			conn = pool.getConnection("ora8");
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
	
			if(rs.next()) {
				m_name  = rs.getString(1);
				m_ssn   = rs.getString(2);
				m_pwd   = rs.getString(3);
				m_phone = rs.getString(4);
				m_email = rs.getString(5);
		
				// 주민번호 분리
				m_ssnValues = m_ssn.split("-");
				
				// 전화번호 들어 있다면 분리
				if( !m_phone.equals("")) {
					m_phoneValues = m_phone.split("-");
				}
%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Material Dashboard by Creative Tim</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- Bootstrap core CSS     -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
<!--  Material Dashboard CSS    -->
<link href="../assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="../assets/css/demo.css" rel="stylesheet" />
<!--     Fonts and icons     -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>

<script type="text/javascript">

  function checkInput() {
	if(document.mform.pwd.value == "") {
			alert("비밀번호를 입력하세요");
		return;
	}
		document.mform.submit();
	}   
</script>

</head>
<body>
    <div class="wrapper">
    	
      <jsp:include page="leftMenu_BootStrap.jsp" flush="false"/>
   	   	        
        <div class="main-panel">
            <nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"> Member Management System </a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">dashboard</i>
                                    <p class="hidden-lg hidden-md">Dashboard</p>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">notifications</i>
                                    <span class="notification">5</span>
                                    <p class="hidden-lg hidden-md">Notifications</p>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">Mike John responded to your email</a>
                                    </li>
                                    <li>
                                        <a href="#">You have 5 new tasks</a>
                                    </li>
                                    <li>
                                        <a href="#">You're now friend with Andrew</a>
                                    </li>
                                    <li>
                                        <a href="#">Another Notification</a>
                                    </li>
                                    <li>
                                        <a href="#">Another One</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">person</i>
                                    <p class="hidden-lg hidden-md">Profile</p>
                                </a>
                            </li>
                        </ul>
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group  is-empty">
                                <input type="text" class="form-control" placeholder="Search">
                                <span class="material-input"></span>
                            </div>
                            <button type="submit" class="btn btn-white btn-round btn-just-icon">
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
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header" data-background-color="purple">
                                    <h4 class="title">회원가입</h4>
                                    <p class="category">(*)표시만 수정할 수 있습니다.</p>
                                </div>
                                <div class="card-content">
                                 
                                    <form name="mform" method="post"  onSubmit="return form_check()" action="update_BootStrap.jsp">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">회원성명 (*)</label>
                                                    <input type="text" name="name" value="<%= m_name %>" readonly class="form-control" >
                                                <span class="material-input"></span></div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">앞 주민번호 (*)</label>
                                                    <input type="text" name="ssn1" value="<%= m_ssnValues[0] %>" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div>
                                            
                                            <div class="col-md-3">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">뒤 주민번호 (*)</label>
                                                    <input type="text" name="ssn2" value="<%= m_ssnValues[1] %>" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">회원ID (*) </label>
                                                    <input type="text" name="uid" value="<%= m_uid %>" readonly class="form-control">
                                                    <%-- <input type="hidden" name="uid" value="<%= m_uid %>" readonly style=""> --%> 
                                                    <span class="material-input"></span>
                                                </div>
                                            </div>
											<!--                                             
												<div class="col-md-4">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="email" class="form-control">
                                                    <button type="" OnClick="return openuid_check()" class="btn btn-primary pull-right">아이디 중복체크</button>
                                                <span class="material-input"></span></div>
                                            	</div> 
                                            -->
                                         </div>
                                         <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">비밀번호 (*) </label>
                                                    <input type="password" name="pwd" value="<%= m_pwd %>" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div> 
                                            <div class="col-md-6">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">비밀번호 확인 (*)</label>
                                                    <input type="password" name="repwd" value="<%= m_pwd %>" class="form-control"> 
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">전화번호(앞자리)</label>
                                                    <input type="text" name="tel1" value="<%= m_phoneValues[0] == null ? "" : m_phoneValues[0]%>" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">전화번호(중간자리)</label>
                                                    <input type="text" name="tel2" value="<%= m_phoneValues[1] == null ? "" : m_phoneValues[1]%>" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">전화번호3(뒷자리)</label>
                                                    <input type="text" name="tel3" value="<%= m_phoneValues[2] == null ? "" : m_phoneValues[2]%>" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div>                                                                                        
                                        </div>
                                        
                                         <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">이메일</label>
                                                    <input type="email" name="email" value="<%= m_email %>" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>                                                                              
                                        <div class="row">
                                        </div>
                                        <button type="submit" class="btn btn-primary pull-right">수정</button>
                                        <div class="clearfix"></div>
                                    </form>


                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../assets/img/faces/marc.jpg">
                                    </a>
                                </div>
                                <div class="content">
                                    <h6 class="category text-gray">CEO / Co-Founder</h6>
                                    <h4 class="card-title">Alec Thompson</h4>
                                    <p class="card-content">
                                        Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                                    </p>
                                    <a href="#pablo" class="btn btn-primary btn-round">Follow</a>
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
                            <li>
                                <a href="#">
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Company
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Portfolio
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Blog
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <p class="copyright pull-right">
                        &copy;
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
                        <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
                    </p>
                </div>
            </footer>
        </div>
    </div>
</body>
<%	 
	} 
	stmt.close();
	rs.close();
	conn.close();
	} catch (Exception e){} 
	}
%>

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
<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->
<!-- Material Dashboard javascript methods -->
<script src="../assets/js/material-dashboard.js?v=1.2.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>

</html>