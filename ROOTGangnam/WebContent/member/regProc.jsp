<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.member.*, it.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberDao dao = new MemberDao();
	MemberDto dto = new MemberDto();

	request.setCharacterEncoding("euc-kr");

	dto.setId(request.getParameter("id"));
	dto.setPass(request.getParameter("pass"));
	dto.setName(request.getParameter("name"));
	dto.setGender(request.getParameter("gender"));
	dto.setAddress(request.getParameter("address"));
	dto.setBirth(Integer.parseInt(request.getParameter("birth")));

	int r = dao.createOne(dto);
	if(r>0) {
		session.setAttribute("flag", dto.getId());
	}
	
	
	
	
	request.setAttribute("rst", r);
%>
<c:choose>
	<c:when test="${rst gt 0 }">
		<script>
			alert("가입처리중 오류발생");
			location.href = "/member/reg.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("회원 가입 성공");
			location.href = "/index.jsp";
		</script>
	</c:otherwise>
</c:choose>










