<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	int ans = Integer.parseInt(request.getParameter("ans"));

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@192.168.10.113:1521:xe", "salz",
				"1111");

		String sql = "";
		switch (ans) {
		case 1:
			sql = "update research set ans1=ans1+1 where num=1";
			break;
		case 2:
			sql = "update research set ans2=ans2+1 where num=1";
			break;
		case 3:
			sql = "update research set ans3=ans3+1 where num=1";
			break;
		case 4:
			sql = "update research set ans4=ans4+1 where num=1";
		}

		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		
		ps.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<script>
	alert("설문조사에 응답해주셔서 감사합니다.");
	location.href="/research/show.jsp";
</script>




