<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page="/pop/up.jsp"/>
<%
	// 이 페이지는 클라이언트측에서는 있는지 알아서도 안됨.
	String top = "/log/login.jsp";
	String center = (String) request.getAttribute("center");
	String bottom = "/bottom.jsp";
%>
<html>
<head>
<title>salz pAge</title>
<style type="text/css">
	body, h1, h2, input, select, pre, td, th, textarea, li, b, i {
		font-family: 맑은 고딕;
	}
</style>
</head>
<body>
	<table style="height: 100%; width: 100%">
		<tr height="8%" bgcolor="#C7D3ED">
			<td><jsp:include page="<%=top%>" /></td>
		</tr>
		<tr height="84%">
			<td><jsp:include page="<%=center%>" /></td>
		</tr>
		<tr height="8%" bgcolor="#C7D3ED">
			<td><jsp:include page="<%=bottom%>" /></td>
		</tr>
	</table>
</body>
</html>











