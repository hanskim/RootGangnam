<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.upload.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	String word = request.getParameter("word");
	// �����ͺ��̽����� member ���̺��� ��� ������ ���� �� �並 �ٸ��ָ� �ȴ�.
	UploadDao dao = new UploadDao();

	// db���̺� �ִ� ������ ����dto���¹ٲ��� �ӷ� ���ļ� �����ְ� ��ɼ����ص�
	java.util.ArrayList<UploadDto> list = dao.readSome(word);
%>
<html>
<head>
</head>
<body>
	<h2>�ڷ��</h2>
	<hr />
	<div align="right" style="width: 98%">
		<input type="button" value="�ڷ���"
			onclick="location.href='/upload/write.jsp'" />
	</div>
	<table style="width: 99%;">
		<tr bgcolor="#BFE5FF">
			<th width="7%">��ȣ</th>
			<th>���ϼ���</th>
			<th width="20%">�ٿ�ε�</th>
			<th width="12%">����</th>
		</tr>
		<%
			for (UploadDto dto : list) {
		%>
		<tr bgcolor="#D4F4FA">
			<td align="center"><%=dto.getNum()%></td>
			<td><%=dto.getInfo()%></td>
			<td align="center"><a href="<%=dto.getFilelink()%>"><%=dto.getFilename()%></a>
			</td>
			<td align="center"><input type="button" value="����"
				onclick="javascript:location.href='/upload/chk.jsp?n=<%=dto.getNum()%>'" /></td>
		</tr>
		<%
			}
		%>
	</table>
	<!-- �˻�â -->
	<hr/>
	<div align="center">
		<form action="/upload/search.jsp" method="post">
			�˻� <input type="text" name="word" size="30" value="<%=word%>"/>	
		</form>
	</div>
</body>
</html>












