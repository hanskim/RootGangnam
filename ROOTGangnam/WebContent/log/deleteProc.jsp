<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	it.member.MemberDao dao = new it.member.MemberDao();

	String key = (String)session.getAttribute("flag");
	int r =dao.deleteOne(key);
	
	if(r > 0) {
		%>
		<script>
			alert("Ż�� ó�� ����");
			location.href="/log/logoutProc.jsp";
		</script>
		<%
	}else {
		 %>
		<script>
			alert("Ż��ó���� �����߻�");
			location.href="/log/pass.jsp";
		</script>
		<%
	}
%>
