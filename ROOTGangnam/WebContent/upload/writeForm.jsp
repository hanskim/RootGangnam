<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<body>
	<h2>�ڷ���</h2>
	<hr />
	<!-- 1. action  ���� ����! -->
	<form method="post" action="/upload/writeProc.jsp" enctype="multipart/form-data">
		<table style="width: 95%;">
			<!-- 2. param name ���� ���� -->
			<tr>
				<td align="right">���ϼ���</td>
				<td><input type="text" size="78" name="info"/></td>
			</tr>
			<tr>
				<td align="right">÷������</td>
				<td><input type="file" size="78" name="file"/></td>
			</tr>
		</table>
		<hr/>
		<input type="submit" value="���" />&nbsp;<input type="button"
			value="���" onclick="location.href='/upload/list.jsp'" />
	</form>
</body>
</html>
