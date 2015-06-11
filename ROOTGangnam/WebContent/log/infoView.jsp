<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.member.*" %>
<%
	String id = (String)session.getAttribute("flag");
	MemberDao dao = new MemberDao();
	MemberDto dto = dao.readOne(id);
	String hid = dto.getId().substring(0, 2);
	while(true) {
		hid += "*";
		if(hid.length() == dto.getId().length()) {
			break;
		}
	}
	String hpass= dto.getPass().substring(0,2);
	while(true) {
		hpass+="*";
		if(hpass.length()== dto.getPass().length()) {
			break;
		}
	}
	request.setAttribute("to", dto);
%>
<html>
<head>
<script>
	function delchk() {
		if( confirm("회원탈퇴를 진행합니다.") ) {
			if(confirm("처리가 완료되고 나면 복구가 불가능합니다\n동의하십니까?")) {
				location.href="/log/deleteProc.jsp";	
			}		
		}
	}
</script>
</head>
<body>
	<h2>나의 정보</h2>
	<hr />
	<ul>
		<li>아이디 : <%=hid %></li>
		<li>비밀번호 : <%=hpass %></li>
		<li>이름 : ${to.name }</li>
		<li>성별 : ${to.gender }</li>
		<li>생년 : <%=dto.getBirth() %>년</li>
		<li>주소 : <%=dto.getAddress() %></li>
		<li>가입일 : <%=dto.getRegdate() %></li>
	</ul>
	<hr/>
	<input type="button" value="회원탈퇴" onclick="javascript:delchk()"/>
	
</body>
</html>



