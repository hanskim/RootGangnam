<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cid = request.getParameter("cid");
	MemberDao dao = new MemberDao();
	MemberDto dto = dao.readOne(cid);
	request.setAttribute("cid", cid);
	request.setAttribute("dto", dto);
%>
<html>
<head>
<style type="text/css">
body, h3, input {
	font-family: 맑은 고딕;
}
</style>
</head>
<body>
	<h3>아이디중복검사</h3>
	<hr />
	<b>[ ${cid } ]</b> 은/는
	<c:choose>
		<c:when test="${dto eq null }">
			<b><font color="blue">사용가능</font></b> 합니다.
		<script>
			opener.reg.id.value = "${cid}";
		</script>
			<input type="button" value="확인" onclick="javascript:self.close()" />
		</c:when>
		<c:otherwise>
			<b><font color="red">사용불가능</font></b> 합니다.
	</c:otherwise>
	</c:choose>
	<hr />
	<input type="button" value="재확인"
		onclick="javascript:location.href='/member/chk.jsp'" />
</body>
</html>






