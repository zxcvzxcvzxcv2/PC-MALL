<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	String m_uid=request.getParameter("uid");
	String m_pwd=request.getParameter("pwd");
	String m_name=request.getParameter("name");
	String m_email=request.getParameter("email");
	String m_ssn = request.getParameter("ssn1")+"-"+request.getParameter("ssn2");
	
	// 전화번호 값 전달
	String m_phone1 = request.getParameter("tel1");
	String m_phone2 = request.getParameter("tel2");
	String m_phone3 = request.getParameter("tel3");
	
	String m_phone = "";
	
	// 3개의 전화번호 칸이 모두 공백이 아닐때만 입력처리
	if( !m_phone1.equals("") && !m_phone2.equals("") && !m_phone3.equals("")) 
	{
		m_phone=m_phone1+ "-" + m_phone2 + "-" + m_phone3;
	}
	
	/* else 
	{
		m_phone=m_phone1 + m_phone2 + m_phone3;
	}
	*/
	
	String sql1 = "select m_uid from member where m_uid='"+m_uid+"'";
	String sql2 = "insert into member values (?,?,?,?,?,?,?)";
	//String sql2 = "insert into member values (?,?,?,?,?,?,now(),?,now())"; 
	//오라클 쿼리 String sql2 = "insert into member values (?,?,?,?,?,?,sysdate,?,sysdate)";

	Connection conn = null;
	Statement stmt = null; 
	ResultSet rs = null;
	
	try {

		DBConnectionManager pool = DBConnectionManager.getInstance();
		conn = pool.getConnection("ora8"); 
		
		stmt = conn.createStatement();
		rs=stmt.executeQuery(sql1);
 
		// rs.next() 메소드는 조회된 데이터가 한건이라도 있다면 true 값 반환.
		// 해당 아이디로 member 테이블에서 데이터 조회된 아이디가 존재하는지 체크.
		if(rs.next()) {
			rs.close();
%>
		<script type="text/javascript">
			alert("중복되는 아이디가 존재합니다.");
			history.back(); 
		</script>
<%
		// 조회된 아이디가 없다면 신규회원가입 진행.
		} else {
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, m_uid);
			pstmt.setString(2, m_pwd);
			pstmt.setString(3, m_name);
			pstmt.setString(4, m_ssn);
			pstmt.setString(5, m_email);
			pstmt.setString(6, m_phone);
			pstmt.setInt(7, 0);
			pstmt.executeUpdate();

			// 세션 uid에 사용자 id값 저장
			session.setAttribute("uid", m_uid);
			rs.close();
			pstmt.close();
			conn.close();
%>


			<script type="text/javascript">
				alert('<%= m_name %>' + '님의 가입을 축하합니다!');
				location.href="index_BootStrap.jsp";
			</script>

<%
		}
	} catch (SQLException e) {
%>

		<script type="text/javascript">
			alert('<%= m_name %>' + '님의 회원가입은 실패했습니다. 다시 한번 시도해 보시기 바랍니다. ');
			history.back();
		</script>
		
<% 
	}
%>