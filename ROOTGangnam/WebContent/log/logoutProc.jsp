<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// session �� ����ִ� flag �� �����ְ�, index �� �����ַ���.
	// �α׾ƿ� ���� �����񽺸� �����ϴ°� �ǹ��ϱ⶧����
	// session.removeAttribute("flag");
	// ������ ���ٴ�
	// ���� �α��� �ϰ� �ִ� ����� id ���� �ʿ��ϴٸ�
	String gId =(String)session.getAttribute("flag");
	session.invalidate();
	
	Cookie t = new Cookie("keep", "");
	t.setMaxAge(0);
	t.setPath("/");
	
	response.addCookie(t);
	
//	response.sendRedirect("/index.jsp");
%>
<script>
	alert("<%=gId%> �� �α׾ƿ�.");
	location.href="/index.jsp";
</script>

