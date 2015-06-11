<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.board.*"%>
<% 
	int key = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = new BoardDao();
	int n = dao.deleteOne(key);
	// 세션에서 로그인값을 뽑은 후
	// dto의 타입이 비공개이면서 writer 로그인값이랑 다르면 안보이게.
	if(n > 0 ) {
		%>
		<script>
			alert("게시글 삭제 성공");
			location.href="/board/list.jsp";
		</script>
		<%
	}else {
		%>
		<script>
			alert("게시글 삭제 중 오류 발생");
			location.href="/board/detail.jsp?num=<%=key%>";
		</script>
		<%
	}
%>