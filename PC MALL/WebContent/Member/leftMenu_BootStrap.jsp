<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getServletPath();
	String  activeAry[] = { "", "", "", "", "", "", "", "" };
		
	if(path.equals("/Member/login_BootStrap.jsp")) {
		activeAry[0] = "active"; // 로그인
	}
	else if(path.equals("/Member/index_BootStrap.jsp")) {
		activeAry[0] = "active";  // 시작 페이지 
	} else if(path.equals("/Member/insert_form_BootStrap.jsp")) {
		activeAry[1] = "active";  // 회원가입
	} else if(path.equals("/Member/update_form_BootStrap.jsp")) {
		activeAry[2] = "active";  // 회원정보수정
	} else if(path.equals("/Member/delete_BootStrap.jsp")) {
		activeAry[3] = "active";  // 회원탈퇴
	} else if(path.equals("/Member/logout_BootStrap.jsp")) {
		activeAry[4] = "active";  // 로그아웃
	} else if(path.equals("/Member/admin_login_BootStrap.jsp")) {
		activeAry[5] = "active";  // 관리자 로그인
	} else if(path.equals("/Member/member_list_BootStrap.jsp")) {
		activeAry[6] = "active";  // 회원명부 출력
	} else {
		//activeAry[7] = "active";  //로그아웃
	}
		
	
%>
<div class="sidebar" data-color="purple" data-image="../assets/img/sidebar-1.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="logo">
                <a href="#" class="simple-text">

<%
	if( session.getAttribute("uid") == null) {
%>                   
                    
                    MMS
                    
<% 
	} else {
		String uid = (String)session.getAttribute("uid");
%>
           <%= uid %> 님.    
<%
	}
%>
                </a>
            </div>
            <div class="sidebar-wrapper ps-container ps-theme-default" data-ps-id="e992a768-8dbd-98cc-3288-da984fdd470d">
                <ul class="nav">
                    <li class="<%=activeAry[0] %>">
                        <a href="index_BootStrap.jsp">
                            <i class="material-icons">dashboard</i>
                            <p>로그인</p>
                        </a>
                    </li>
                    <li class="<%=activeAry[1] %>">
                        <a href="./insert_form_BootStrap.jsp">
                            <i class="material-icons">person</i>
                            <p>회원가입</p>
                        </a>
                    </li>
                    <li class="<%=activeAry[2] %>">
                        <a href="./update_form_BootStrap.jsp">
                            <i class="material-icons">content_paste</i>
                            <p>회원정보 수정</p>
                        </a>
                    </li>
                    <li class="<%=activeAry[3] %>">
                        <a href="./delete_BootStrap.jsp">
                            <i class="material-icons">library_books</i>
                            <p>회원탈퇴</p>
                        </a>
                    </li>
                    <li class="<%=activeAry[4] %>">
                        <a href="./logout_BootStrap.jsp">
                            <i class="material-icons">bubble_chart</i>
                            <p>로그아웃</p>
                        </a>
                    </li>
                    <li class="<%=activeAry[5] %>">
                        <a href="./admin_login_BootStrap.jsp">
                            <i class="material-icons">location_on</i>
                            <p>관리자 로그인</p>
                        </a>
                    </li>
                    <li class="<%=activeAry[6] %>">
                        <a href="./member_list_BootStrap.jsp">
                            <i class="material-icons text-gray">notifications</i>
                            <p>회원명부 출력</p>
                        </a>
                    </li>
                    <li class="<%=activeAry[7] %>">
                        <a href="./admin_logout_BootStrap.jsp">
                            <i class="material-icons text-gray">notifications</i>
                            <p>로그아웃</p>
                        </a>
                    </li>
                </ul>
            <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;"><div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 0px;"><div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>
        <div class="sidebar-background" style="background-image: url(../assets/img/sidebar-1.jpg) "></div></div>