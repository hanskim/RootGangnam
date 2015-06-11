<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	it.member.MemberDao dao = new it.member.MemberDao();

	String key = (String)session.getAttribute("flag");
	int r =dao.deleteOne(key);
	
	if(r > 0) {
		%>
		<script>
			alert("呕硼 贸府 己傍");
			location.href="/log/logoutProc.jsp";
		</script>
		<%
	}else {
		 %>
		<script>
			alert("呕硼贸府吝 坷幅惯积");
			location.href="/log/pass.jsp";
		</script>
		<%
	}
%>
