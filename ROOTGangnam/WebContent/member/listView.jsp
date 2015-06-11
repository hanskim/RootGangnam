<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// �����ͺ��̽����� member ���̺��� ��� ������ ���� �� �並 �ٸ��ָ� �ȴ�.
	MemberDao dao = new MemberDao();
	// db���̺� �ִ� ������ ����dto���¹ٲ��� �ӷ� ���ļ� �����ְ� ��ɼ����ص�
	java.util.ArrayList<MemberDto> list = dao.readAll();
	request.setAttribute("all", list);
%>
<html>
<head>
</head>
<body>
	<h2>ȸ�����</h2>
	<hr />
	<table style="width: 99%">
		<tr bgcolor="#DAD9FF">
			<th>���̵�</th>
			<th>�̸�</th>
			<th>����</th>
			<th>����</th>
			<th>�ּ�</th>
			<th>������</th>
		</tr>
		<c:forEach items="${all }" var="tx">
			<tr>
				<td>${tx.id }</td>
				<td>${tx.name }</td>
				<td>${tx.gender }</td>
				<td>${tx.birth }��</td>
				<td>${tx.address }</td>
				<td>${tx.regdate }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>










