<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="it.board.*"%>
<%

	request.setCharacterEncoding("euc-kr");
	// BoardDto 하나 생성후, 값 옮기고 난후 BoardDao 생성해서 createOne
	BoardDto dto = new BoardDto();
	
	
	String writer = (String)session.getAttribute("flag");	// 세션에서 로그인하고 있는 id값
	dto.setWriter(writer);	// 파라미터로 전달되는게 아니다.
	
	dto.setType(request.getParameter("type"));
	dto.setTitle(request.getParameter("title"));
	dto.setContent(request.getParameter("content"));
	
	String ip = request.getRemoteAddr();	// 요청지의 ip를 얻어내서
	dto.setIp(ip);	// 파라미터로 전달되는게 아니다.
	
	// createOne 결과물 받아다가 성공/실패
	BoardDao dao = new BoardDao();
	int n = dao.createOne(dto);
	if(n > 0 ) {
		%>
		<script>
			alert("게시글 등록 성공");
			location.href="/board/list.jsp";
		</script>
		<%
	}else {
		%>
		<script>
			alert("게시글 등록 중 오류 발생");
			location.href="/board/write.jsp";
		</script>
		<%
	}

%>