<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<body>
	<h2>�۾���</h2>
	<hr />
	<!-- 1. action  ���� ����! -->
	<form method="post" action="/board/writeProc.jsp">
		<table style="width: 95%;">
			<!-- 2. param name ���� ���� -->
			<tr>
				<td align="right">������</td>
				<td><input type="text" size="78" name="title"/></td>
			</tr>
			<tr>
				<td align="right">��������</td>
				<td>
				<input type="radio" name="type" value="����" checked="checked" />���� 
				<input type="radio" name="type" value="�����" />�����
				</td>
			</tr>
			<tr>
				<td valign="top" align="right">�۳���</td>
				<td><textarea rows="14" cols="80" name="content"></textarea></td>
			</tr>
		</table>
		<hr/>
		<input type="submit" value="���" />&nbsp;<input type="button"
			value="���" onclick="location.href='/board/list.jsp'" />
	</form>
</body>
</html>
