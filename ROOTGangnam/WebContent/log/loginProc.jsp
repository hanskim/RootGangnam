<%@page import="it.util.ConnUtil, it.member.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String tId =request.getParameter("tId");
	String tPass =request.getParameter("tPass");

	MemberDao dao = new MemberDao();
	MemberDto dto = dao.readOne(tId);
	
	if(dto!= null && dto.getPass().equals(tPass)) {
		session.setAttribute("flag", tId);
		// üũ�ڽ� �����ߴ����� ����, ��Ű ó���ϴ°� �߰�.
		%>
		<script>
			alert("<%=tId%>��, �������");
			location.href="/index.jsp";
		</script>
		<%
	}else {
		%>
		<script>
			alert("���̵� Ȥ�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			location.href="/index.jsp";
		</script>
		<%
	}
	
%>




