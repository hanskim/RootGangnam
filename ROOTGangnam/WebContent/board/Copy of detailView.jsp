<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.board.*"%>
<%
	int key = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = new BoardDao();
	dao.upCount(key);
	BoardDto dto = dao.readOne(key);
	// 세션에서 로그인값을 뽑은 후
	// dto의 타입이 비공개이면서 writer 로그인값이랑 다르면 안보이게.
%>
<html>
<body>
	<h2>글 보기</h2>
	<hr />
	<div align="center">
		<table style="width: 100%">
			<tr bgcolor="#B2CCFF">
				<td align="center" width="15%"><%=dto.getNum()%></td>
				<td><%=dto.getTitle()%></td>
				<td align="center" width="15%">작성자 : <%=dto.getWriter()%>
				</td>
			</tr>
			<tr bgcolor="#B2FFFF">
				<td colspan="3" align="right">조회수 : <%=dto.getCount()%> | 타입 :
					<%=dto.getType()%> | 작성일 : <%=dto.getRegdate()%></td>
			</tr>
			<tr height="250" valign="top">
				<td colspan="3"><pre><%=dto.getContent()%></pre></td>
			</tr>
			<tr bgcolor="#B2CCFF">
				<td colspan="3" align="right">ip : <%=dto.getIp()%></td>
			</tr>
		</table>
		<hr />
		<input type="button" value="글삭제"
			onclick="location.href='/board/deleteProc.jsp?num=<%=dto.getNum()%>'" />
		<input type="button" value="글수정" /> <input type="button" value="글목록"
			onclick="location.href='/board/list.jsp'" />
	</div>
</body>
</html>


























