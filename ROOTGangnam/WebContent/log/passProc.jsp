<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="it.member.*" %>

<%
	// �α��� ���¿��� ���üũ�� �����̵ǰ� �Ϸ��� ������ ���ִ� ������
	String cpass = request.getParameter("cpass");
	MemberDao dao = new MemberDao();
	
	// 
	String id = (String)session.getAttribute("flag");
	MemberDto dto = dao.readOne(id);
	if(dto.getPass().equals(cpass)) {
		response.sendRedirect("/log/info.jsp");
	}else {
		response.sendRedirect("/log/pass.jsp");
	}

%>