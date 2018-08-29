<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>

<%@ page import="org.apache.log4j.*" %>
<%! 
	static Logger logger = Logger.getLogger("userpw_ok.jsp"); 
%>

<%
	try{
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		String uid="", email="", name="", pwd="";
		String mem_name = request.getParameter("name"); 
		String mem_email = request.getParameter("email");
		String sql = "select m_uid, m_name, m_email, m_pwd from member where m_email ='" + mem_email +"'"; 
		
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
			
			uid = rs.getString(1);
			name = rs.getString(2);
			email = rs.getString(3);
			pwd=rs.getString(4);
			
			System.out.println(uid);
			System.out.println(name);
			System.out.println(email);
			
			logger.info("id:"+ uid);

			
		} else{
			
			System.out.println("!!!!!!!!! ID 없으니 회원가입");
 %>

			<script language="JavaScript"> 
				alert("아이디가 존재하지 않습니다.");
				history.go(-1);        // 1단계 이전 페이지로 이동
			</script>

 <% }
		System.out.println("!!!!!!!!! ");
		
        if(name.equals(mem_name) && email.equals(mem_email)) {
        	session.setAttribute("pid",uid);	 //회원아이디
			session.setAttribute("pname",name);	 //회원 이름
			session.setAttribute("pmember","y"); //회원 인지 아닌지..
			System.out.println("???????");
%>

			<script>
				alert("당신의 ID는" + <%= %> + " 입니다.");
				location.href="../member/login.jsp";	   // 메인페이지로 이동
			</script>
				
<%		 
			//response.sendRedirect("../main/index.jsp");  위 스크립트와 동일
		 } else if( name.equals(mem_name) && !email.equals(mem_email)) {
			 System.out.println("ID 찾기 실패 -  이메일 오류");
%>

			<script>
				alert("이메일이 일치하지 않습니다");
				history.go(-1); 
			</script>

<%
		}
		stmt.close();                       // stmt 닫기   
		rs.close();                         // rs 닫기
		pool.freeConnection("ora8", con);   // 커넥션 풀 종료
	} catch(Exception e) {
		out.println(e);
	}
	// response.sendRedirect("../main/index.jsp");
%>