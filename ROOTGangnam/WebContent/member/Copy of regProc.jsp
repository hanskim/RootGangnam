<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,it.util.*" %>
<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	int birth = Integer.parseInt(request.getParameter("birth"));

	int r = 0;
	try {
		// DB 연결 부분만..  매번 치기 귀찮으니까, 메서드 화시켜둔거다.
		Connection conn = ConnUtil.open();
		String sql ="insert into member values(?, ?, ?, ?, ?, ?, sysdate)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pass);
		ps.setString(3, name);
		ps.setString(4, gender);
		ps.setInt(5, birth);
		ps.setString(6, address);
		r=  ps.executeUpdate();
		ps.close();
		conn.close();
	}catch(Exception e) {
		e.printStackTrace();
	}
	//-------------------------------------
	// 정상등록이 되었다면  1,  그외의 모든 상황은 0
	if(r > 0) {
		// 로그인하고 싶은 효과를 주고 싶다면.
		session.setAttribute("flag", id);
		%>
		<script>
			alert("회원 등록 성공");
			location.href="/index.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("등록 중 오류 발생");
			location.href="/member/reg.jsp";
		</script>
		<%
	}
%>











