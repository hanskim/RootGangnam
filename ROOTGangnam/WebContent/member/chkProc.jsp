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
	font-family: ���� ���;
}
</style>
</head>
<body>
	<h3>���̵��ߺ��˻�</h3>
	<hr />
	<b>[ ${cid } ]</b> ��/��
	<c:choose>
		<c:when test="${dto eq null }">
			<b><font color="blue">��밡��</font></b> �մϴ�.
		<script>
			opener.reg.id.value = "${cid}";
		</script>
			<input type="button" value="Ȯ��" onclick="javascript:self.close()" />
		</c:when>
		<c:otherwise>
			<b><font color="red">���Ұ���</font></b> �մϴ�.
	</c:otherwise>
	</c:choose>
	<hr />
	<input type="button" value="��Ȯ��"
		onclick="javascript:location.href='/member/chk.jsp'" />
</body>
</html>






