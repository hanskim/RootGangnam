<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.board.*"%>
<%
	// �����ͺ��̽����� member ���̺��� ��� ������ ���� �� �並 �ٸ��ָ� �ȴ�.
	BoardDao dao = new BoardDao();
	// db���̺� �ִ� ������ ����dto���¹ٲ��� �ӷ� ���ļ� �����ְ� ��ɼ����ص�
	java.util.ArrayList<BoardDto> list = dao.readAll();
%>
<html>
<head>
</head>
<body>
	<h2>�Խ���</h2>
	<hr />
	<div align="right" style="width: 98%">
		<input type="button" value="�۾���"
			onclick="location.href='/board/write.jsp'" />
	</div>
	<table style="width: 99%;">
		<tr bgcolor="#BFE5FF">
			<th width="7%">�۹�ȣ</th>
			<th width="12%">Ÿ��</th>
			<th>����</th>
			<th width="12%">�ۼ���</th>
			<th width="7%">��ȸ��</th>
			<th width="20%">�ۼ���</th>
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








