<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script>
	function chkopen() {
		var url = '/member/chk.jsp';
		window.open(url, 'cid', 'width=320, height=180');
	}
</script>
</head>
<body>
	<h2>회원가입</h2>
	<hr />
	<form action="/member/regProc.jsp" method="post" name="reg">
		<ul style="line-height: 2">
			<li>아이디 : <input type="text" name="id" readonly="readonly">
				<input type="button" value="중복체크" onclick="javascript:chkopen()" />
			</li>
			<li>비밀번호 : <input type="password" name="pass" /></li>
			<li>비밀번호 재확인: <input type="password" name="repass" /></li>
			<li>이름 : <input type="text" name="name" /></li>
			<li>성별 : <input type="radio" name="gender" value="남" />남자 <input
				type="radio" name="gender" value="여" />여자
			<li>생년 : <select name="birth">
					<c:forEach var="i" begin="0" end="70">
						<option value="${2015-i }">
						${2015-i }년</option>
					</c:forEach>
			</select>
			</li>
			<li>주소 : <input type="text" size="50" name="address" /></li>
		</ul>
		<hr />
		<input type="submit" value="가입신청" />
	</form>
</body>
</html>







