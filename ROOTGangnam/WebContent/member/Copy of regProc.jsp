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
		// DB ���� �κи�..  �Ź� ġ�� �������ϱ�, �޼��� ȭ���ѵаŴ�.
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
	// �������� �Ǿ��ٸ�  1,  �׿��� ��� ��Ȳ�� 0
	if(r > 0) {
		// �α����ϰ� ���� ȿ���� �ְ� �ʹٸ�.
		session.setAttribute("flag", id);
		%>
		<script>
			alert("ȸ�� ��� ����");
			location.href="/index.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("��� �� ���� �߻�");
			location.href="/member/reg.jsp";
		</script>
		<%
	}
%>











