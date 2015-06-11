<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<body>
	<form action="/research/proc.jsp">
		<h2>Q. 당신의 인생의 시간을 설정할수 있다면, 언제로 가고 싶은가?</h2>
		<hr />
		<input type="radio" name="ans" value="1" />태어난 직 후<br /> 
		<input type="radio" name="ans" value="2" />고등학교 입학 직 후<br /> 
		<input type="radio" name="ans" value="3" />IT를 시작하기 직 전<br /> 
		<input type="radio" name="ans" value="4" />죽기 직 전<br />
		<hr />
		<input type="submit" value="등록" />
	</form>
</body>
</html>