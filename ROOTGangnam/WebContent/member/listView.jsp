<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 데이터베이스에서 member 테이블의 모든 정보를 얻어온 후 뷰를 꾸며주면 된다.
	MemberDao dao = new MemberDao();
	// db테이블에 있는 내용을 전부dto형태바꾼후 머로 합쳐서 돌려주게 기능설계해둠
	java.util.ArrayList<MemberDto> list = dao.readAll();
	request.setAttribute("all", list);
%>
<html>
<head>
</head>
<body>
	<h2>회원목록</h2>
	<hr />
	<table style="width: 99%">
		<tr bgcolor="#DAD9FF">
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>생년</th>
			<th>주소</th>
			<th>가입일</th>
		</tr>
		<c:forEach items="${all }" var="tx">
			<tr>
				<td>${tx.id }</td>
				<td>${tx.name }</td>
				<td>${tx.gender }</td>
				<td>${tx.birth }년</td>
				<td>${tx.address }</td>
				<td>${tx.regdate }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>










