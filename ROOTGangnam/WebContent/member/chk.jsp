<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<hr/>
	<form action="/member/chkProc.jsp">
		아이디 : <input type="text" name="cid"/>
		<input type="submit" value="중복검사"/>
	</form>
</body>
</html>