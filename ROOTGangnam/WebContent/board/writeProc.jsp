<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="it.board.*"%>
<%

	request.setCharacterEncoding("euc-kr");
	// BoardDto �ϳ� ������, �� �ű�� ���� BoardDao �����ؼ� createOne
	BoardDto dto = new BoardDto();
	
	
	String writer = (String)session.getAttribute("flag");	// ���ǿ��� �α����ϰ� �ִ� id��
	dto.setWriter(writer);	// �Ķ���ͷ� ���޵Ǵ°� �ƴϴ�.
	
	dto.setType(request.getParameter("type"));
	dto.setTitle(request.getParameter("title"));
	dto.setContent(request.getParameter("content"));
	
	String ip = request.getRemoteAddr();	// ��û���� ip�� ����
	dto.setIp(ip);	// �Ķ���ͷ� ���޵Ǵ°� �ƴϴ�.
	
	// createOne ����� �޾ƴٰ� ����/����
	BoardDao dao = new BoardDao();
	int n = dao.createOne(dto);
	if(n > 0 ) {
		%>
		<script>
			alert("�Խñ� ��� ����");
			location.href="/board/list.jsp";
		</script>
		<%
	}else {
		%>
		<script>
			alert("�Խñ� ��� �� ���� �߻�");
			location.href="/board/write.jsp";
		</script>
		<%
	}

%>