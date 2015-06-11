<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.upload.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	String word = request.getParameter("word");
	// 데이터베이스에서 member 테이블의 모든 정보를 얻어온 후 뷰를 꾸며주면 된다.
	UploadDao dao = new UploadDao();

	// db테이블에 있는 내용을 전부dto형태바꾼후 머로 합쳐서 돌려주게 기능설계해둠
	java.util.ArrayList<UploadDto> list = dao.readSome(word);
%>
<html>
<head>
</head>
<body>
	<h2>자료실</h2>
	<hr />
	<div align="right" style="width: 98%">
		<input type="button" value="자료등록"
			onclick="location.href='/upload/write.jsp'" />
	</div>
	<table style="width: 99%;">
		<tr bgcolor="#BFE5FF">
			<th width="7%">번호</th>
			<th>파일설명</th>
			<th width="20%">다운로드</th>
			<th width="12%">삭제</th>
		</tr>
		<%
			for (UploadDto dto : list) {
		%>
		<tr bgcolor="#D4F4FA">
			<td align="center"><%=dto.getNum()%></td>
			<td><%=dto.getInfo()%></td>
			<td align="center"><a href="<%=dto.getFilelink()%>"><%=dto.getFilename()%></a>
			</td>
			<td align="center"><input type="button" value="삭제"
				onclick="javascript:location.href='/upload/chk.jsp?n=<%=dto.getNum()%>'" /></td>
		</tr>
		<%
			}
		%>
	</table>
	<!-- 검색창 -->
	<hr/>
	<div align="center">
		<form action="/upload/search.jsp" method="post">
			검색 <input type="text" name="word" size="30" value="<%=word%>"/>	
		</form>
	</div>
</body>
</html>












