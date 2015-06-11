<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.board.*"%>
<%
	// 데이터베이스에서 member 테이블의 모든 정보를 얻어온 후 뷰를 꾸며주면 된다.
	BoardDao dao = new BoardDao();
	// db테이블에 있는 내용을 전부dto형태바꾼후 머로 합쳐서 돌려주게 기능설계해둠
	java.util.ArrayList<BoardDto> list = dao.readAll();
%>
<html>
<head>
</head>
<body>
	<h2>게시판</h2>
	<hr />
	<div align="right" style="width: 98%">
		<input type="button" value="글쓰기"
			onclick="location.href='/board/write.jsp'" />
	</div>
	<table style="width: 99%;">
		<tr bgcolor="#BFE5FF">
			<th width="7%">글번호</th>
			<th width="12%">타입</th>
			<th>제목</th>
			<th width="12%">작성자</th>
			<th width="7%">조회수</th>
			<th width="20%">작성일</th>
		</tr>
		<%for(BoardDto dto : list) { %>
		<tr bgcolor="#D4F4FA">
			<td align="center"><%=dto.getNum() %></td>
			<td align="center"><%=dto.getType() %></td>
			<td>
				<a href="/board/detail.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a>
			</td>
			<td align="center"><%=dto.getWriter() %></td>
			<td align="center"><%=dto.getCount() %></td>
			<td align="center"><%=dto.getRegdate() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>








