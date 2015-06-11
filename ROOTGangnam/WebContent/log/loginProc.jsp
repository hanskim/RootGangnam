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
		// 체크박스 선택했는지에 따라서, 쿠키 처리하는거 추가.
		%>
		<script>
			alert("<%=tId%>님, 어서오세요");
			location.href="/index.jsp";
		</script>
		<%
	}else {
		%>
		<script>
			alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
			location.href="/index.jsp";
		</script>
		<%
	}
	
%>




