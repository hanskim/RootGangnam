<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	// 에러페이지로 작동시킬때 꼭 설정해야되는게 있는데,
	// 브라우저를 속이기 위해서 
	// (상태코드가 정상처리가 된게 아니면 html을 막고, 자체 오류 페이지를 띄우는 애들이 있어서)
	

	response.setStatus(200);	
%>
<html>
<body>
	<h2>서버측 장애</h2>
	<hr />
	잘못된 접근입니다. 다시 처음부터 확인하시고, 사용해주세요.
</body>
</html>