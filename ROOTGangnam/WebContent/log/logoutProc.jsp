<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// session 에 들어있는 flag 를 없애주고, index 로 보내주려고.
	// 로그아웃 경우는 웹서비스를 종료하는걸 의미하기때문에
	// session.removeAttribute("flag");
	// 리무브 보다는
	// 현재 로그인 하고 있는 사람의 id 값이 필요하다면
	String gId =(String)session.getAttribute("flag");
	session.invalidate();
	
	Cookie t = new Cookie("keep", "");
	t.setMaxAge(0);
	t.setPath("/");
	
	response.addCookie(t);
	
//	response.sendRedirect("/index.jsp");
%>
<script>
	alert("<%=gId%> 님 로그아웃.");
	location.href="/index.jsp";
</script>

