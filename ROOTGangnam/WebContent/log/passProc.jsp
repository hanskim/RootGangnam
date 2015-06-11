<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="it.member.*" %>

<%
	// 로그인 상태에서 비번체크후 진행이되게 하려고 검증을 해주는 페이지
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