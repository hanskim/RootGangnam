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
		if( confirm("ȸ��Ż�� �����մϴ�.") ) {
			if(confirm("ó���� �Ϸ�ǰ� ���� ������ �Ұ����մϴ�\n�����Ͻʴϱ�?")) {
				location.href="/log/deleteProc.jsp";	
			}		
		}
	}
</script>
</head>
<body>
	<h2>���� ����</h2>
	<hr />
	<ul>
		<li>���̵� : <%=hid %></li>
		<li>��й�ȣ : <%=hpass %></li>
		<li>�̸� : ${to.name }</li>
		<li>���� : ${to.gender }</li>
		<li>���� : <%=dto.getBirth() %>��</li>
		<li>�ּ� : <%=dto.getAddress() %></li>
		<li>������ : <%=dto.getRegdate() %></li>
	</ul>
	<hr/>
	<input type="button" value="ȸ��Ż��" onclick="javascript:delchk()"/>
	
</body>
</html>



