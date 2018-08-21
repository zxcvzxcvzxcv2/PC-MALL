<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	var msg = "";
	var idCheck = "no";
	
	function form_check() {
				
		var form = document.form_name;
		msg ="";
				
			if(form.name.value == "") {
				msg += "회원성명을 입력하세요.";
				alert(msg);
				form.name.focus();
				return false;
			}
		
			if(!isNumber(form.ssn1.value, form.ssn1)) {
				form.ssn1.focus();
				return false; 
			}
					
			if(form.ssn1.value == "") {
				msg += "앞 주민등록번호를 입력하세요";
				alert(msg);
				form.ssn1.focus();
				return false;
			}
		
		
			if(!isNumber(form.ssn2.value, form.ssn2)) {
				form.ssn2.focus();
				return false; 
			}
		
			if(form.ssn2.value == "") {
				msg += "뒷 주민등록번호를 입력하세요";
				alert(msg);
				form.ssn2.focus();
				return false;
			}		
	 	
		 	if(form.uid.value=="") {
				msg += "회원ID를 입력하세요.";
				alert(msg);
				form.uid.focus();
				return false;
		 	}
		
			else if(form.uid.value.length < 5) {
				msg += "회원ID는 5자 이상 입력해야 합니다.";
				alert(msg);
				form.uid.focus();
				return false;
			}
			else if(!a_or_d(form.uid.value)) {
				msg += "회원ID는 영문이나 숫자로 입력하세요.";
				alert(msg);
				form.uid.focus();
				return false;
			}
		
			if(form.pwd.value=="") {
				msg += "비밀번호를 입력하세요";
				alert(msg);
				form.pwd.focus();
				return false;
			}
		
			else if(form.pwd.value.length < 5) {
				msg += "비밀번호는 5자 이상 입력해야 합니다";
				alert(msg);
				form.pwd.focus();
				return false;
			}
		
			else if(!a_or_d(form.pwd.value)) {
				msg += "비밀번호는 영문이나 숫자로 입력하세요";
				alert(msg);
				form.pwd.focus();
				return false;
			}
		
			if(form.pwd.value != form.repwd.value) {
				msg += "비밀번호와 비밀번호 확인 값이 서로 다릅니다";
				alert(msg);
				form.repwd.focus();
				return false;
			}	

		
			// 전화번호 입력시 숫자만 입력.
			
			if(!isNumber(form.tel1.value, form.tel1)) {
				form.tel1.focus();
				return false; 
			}
		
			if(!isNumber(form.tel2.value, form.tel2)) {
				form.tel2.focus();
				return false; 
			}
		
			if(!isNumber(form.tel3.value, form.tel3)) {
				form.tel3.focus();
				return false; 
			}
			 
			if(idCheck == "no") { 
				alert('아이디 중복체크를 하세요');
				return false;
			}
	 
	}

	// 숫자와 영문 입력 체크
	function a_or_d(str)  {	
		lower_str = str.toLowerCase();
	
		for(i=0; i<lower_str.length; i++) {
			ch = lower_str.charAt(i);
			if(((ch < 'a') || (ch > 'z')) && ((ch < '0') ||(ch > '9')))
				return false;
			}
		return true;
	}
	
	// 숫자 입력 체크
	function isNumber(str, path)  {	
		lower_str = str.toLowerCase();
		//alert(path.value);
		for(i=0; i<lower_str.length; i++) {
			ch = lower_str.charAt(i);
			if( (ch < '0') || (ch > '9') ) {
				alert('숫자만 입력 가능 합니다.');
				path.value = "";
				
				return false;
				
			}
		}
		return true;
	}

	function openuid_check() 
	{		
		if (document.form_name.uid.value == "") {
			alert("아이디를 입력하세요");
			document.form_name.uid.focus();
			return false;
			
		} else if (document.form_name.uid.value.length < 5) {
			alert("아이디에 길이는 5글자 이상입니다.");
			document.form_name.uid.focus();
			return false;
			
		} else {
			idCheck = "yes";
		}
		
		url = "id_check_BootStrap.jsp?uid=" + document.form_name.uid.value ;
		open(url, "id_repeat_check", "width=300, height=220");
		
		return false;
		
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
                                    <p class="category">(*)란은 필수 입력 하셔야 합니다.</p>
                                </div>
                                <div class="card-content">
                                 
                                    <form name="form_name" method="post"  onSubmit="return form_check()" action="insert_BootStrap.jsp">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">회원성명 (*)</label>
                                                    <input type="text" name="name" class="form-control" >
                                                <span class="material-input"></span></div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">앞 주민번호 (*)</label>
                                                    <input type="text" name="ssn1" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div>
                                            
                                            <div class="col-md-3">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">뒤 주민번호 (*)</label>
                                                    <input type="text" name="ssn2" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">회원ID (*) </label>
                                                    <input type="text" name="uid" class="form-control"> 
                                                    <span class="material-input"></span>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <!-- <input type="email" class="form-control"> -->
                                                    <button type="" OnClick="return openuid_check()" class="btn btn-primary pull-right">아이디 중복체크</button>
                                                <span class="material-input"></span></div>
                                            </div>
                                         </div>
                                         <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">비밀번호 (*) </label>
                                                    <input type="password" name="pwd" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div> 
                                            <div class="col-md-6">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">비밀번호 확인 (*)</label>
                                                    <input type="password" name="repwd" class="form-control"> 
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">전화번호(앞자리)</label>
                                                    <input type="text" name="tel1" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">전화번호(중간자리)</label>
                                                    <input type="text" name="tel2" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">전화번호3(뒷자리)</label>
                                                    <input type="text" name="tel3" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div>                                                                                        
                                        </div>
                                        
                                         <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">이메일</label>
                                                    <input type="email"  name="email" class="form-control">
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>                                       
                                        
                                        
                                        
                                        <div class="row">
<!--                                             
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>About Me</label>
                                                    <div class="form-group label-floating is-empty">
                                                        <label class="control-label"> Lamborghini Mercy, Your chick she so thirsty, I'm in that two seat Lambo.</label>
                                                        <textarea class="form-control" rows="5"></textarea>
                                                    <span class="material-input"></span></div>
                                                </div>
                                            </div>
                                             -->
                                        </div>
                                        <button type="reset" class="btn btn-primary pull-right">취소</button>
                                        <button type="submit" class="btn btn-primary pull-right">회원가입</button>
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
    	<!-- </form> -->
    
           
  
	
	
           
           


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
<script type="text/javascript">
    $(document).ready(function() {

        // Javascript method's body can be found in assets/js/demos.js
        // demo.initDashboardPageCharts();
		// alert('$(document).ready(function()');
    });
</script>
</html>    