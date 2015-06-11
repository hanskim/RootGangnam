<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<body>
	<h2>글쓰기</h2>
	<hr />
	<!-- 1. action  설정 안함! -->
	<form method="post" action="/board/writeProc.jsp">
		<table style="width: 95%;">
			<!-- 2. param name 설정 안함 -->
			<tr>
				<td align="right">글제목</td>
				<td><input type="text" size="78" name="title"/></td>
			</tr>
			<tr>
				<td align="right">공개설정</td>
				<td>
				<input type="radio" name="type" value="공개" checked="checked" />공개 
				<input type="radio" name="type" value="비공개" />비공개
				</td>
			</tr>
			<tr>
				<td valign="top" align="right">글내용</td>
				<td><textarea rows="14" cols="80" name="content"></textarea></td>
			</tr>
		</table>
		<hr/>
		<input type="submit" value="등록" />&nbsp;<input type="button"
			value="목록" onclick="location.href='/board/list.jsp'" />
	</form>
</body>
</html>
