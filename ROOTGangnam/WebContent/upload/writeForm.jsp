<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<body>
	<h2>자료등록</h2>
	<hr />
	<!-- 1. action  설정 안함! -->
	<form method="post" action="/upload/writeProc.jsp" enctype="multipart/form-data">
		<table style="width: 95%;">
			<!-- 2. param name 설정 안함 -->
			<tr>
				<td align="right">파일설명</td>
				<td><input type="text" size="78" name="info"/></td>
			</tr>
			<tr>
				<td align="right">첨부파일</td>
				<td><input type="file" size="78" name="file"/></td>
			</tr>
		</table>
		<hr/>
		<input type="submit" value="등록" />&nbsp;<input type="button"
			value="목록" onclick="location.href='/upload/list.jsp'" />
	</form>
</body>
</html>
