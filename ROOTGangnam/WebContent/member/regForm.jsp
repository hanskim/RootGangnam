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
	<h2>ȸ������</h2>
	<hr />
	<form action="/member/regProc.jsp" method="post" name="reg">
		<ul style="line-height: 2">
			<li>���̵� : <input type="text" name="id" readonly="readonly">
				<input type="button" value="�ߺ�üũ" onclick="javascript:chkopen()" />
			</li>
			<li>��й�ȣ : <input type="password" name="pass" /></li>
			<li>��й�ȣ ��Ȯ��: <input type="password" name="repass" /></li>
			<li>�̸� : <input type="text" name="name" /></li>
			<li>���� : <input type="radio" name="gender" value="��" />���� <input
				type="radio" name="gender" value="��" />����
			<li>���� : <select name="birth">
					<c:forEach var="i" begin="0" end="70">
						<option value="${2015-i }">
						${2015-i }��</option>
					</c:forEach>
			</select>
			</li>
			<li>�ּ� : <input type="text" size="50" name="address" /></li>
		</ul>
		<hr />
		<input type="submit" value="���Խ�û" />
	</form>
</body>
</html>







