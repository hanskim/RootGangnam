<%@page import="java.sql.*"%>
<%@page import="it.util.ConnUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String tId =request.getParameter("tId");
	String tPass =request.getParameter("tPass");

	int r = 0;		// �α��� ����� ��������� �ϳ� �İ�. �⺻ 0
	
	try {
		Connection conn = ConnUtil.open();
		String sql = "select * from member where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, tId);
		
		ResultSet rs =ps.executeQuery();
		if(rs.next()) {
			String dbPass = rs.getString("pass");
			if(dbPass.equals(tPass)) {
				r = 1;
				
			}else {
				r = 2;
			}
		}
		rs.close();
		ps.close();
		conn.close();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	if(r == 1) {
		session.setAttribute("flag", tId);
		
		if(request.getParameter("con") != null) {	// üũ�� �ѻ�Ȳ�̴�.
			Cookie tp = new Cookie("keep", tId);
			tp.setMaxAge(60*60*24*3);
			tp.setPath("/");	
			response.addCookie(tp);
		}
		%>
		<script>
			alert("<%=tId%>��, �������");
			location.href="/index.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("���̵� Ȥ�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			location.href="/index.jsp";
		</script>
		<%
	}
%>




