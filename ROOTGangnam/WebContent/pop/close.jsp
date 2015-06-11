<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	Cookie a = new Cookie("stop", "");
	a.setPath("/");
	a.setMaxAge(60*60*3);
	response.addCookie(a);
%>
<script>
	self.close();
</script>
