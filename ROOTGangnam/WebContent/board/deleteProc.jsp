<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.board.*"%>
<% 
	int key = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = new BoardDao();
	int n = dao.deleteOne(key);
	// ���ǿ��� �α��ΰ��� ���� ��
	// dto�� Ÿ���� ������̸鼭 writer �α��ΰ��̶� �ٸ��� �Ⱥ��̰�.
	if(n > 0 ) {
		%>
		<script>
			alert("�Խñ� ���� ����");
			location.href="/board/list.jsp";
		</script>
		<%
	}else {
		%>
		<script>
			alert("�Խñ� ���� �� ���� �߻�");
			location.href="/board/detail.jsp?num=<%=key%>";
		</script>
		<%
	}
%>