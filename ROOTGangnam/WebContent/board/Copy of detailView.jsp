<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.board.*"%>
<%
	int key = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = new BoardDao();
	dao.upCount(key);
	BoardDto dto = dao.readOne(key);
	// ���ǿ��� �α��ΰ��� ���� ��
	// dto�� Ÿ���� ������̸鼭 writer �α��ΰ��̶� �ٸ��� �Ⱥ��̰�.
%>
<html>
<body>
	<h2>�� ����</h2>
	<hr />
	<div align="center">
		<table style="width: 100%">
			<tr bgcolor="#B2CCFF">
				<td align="center" width="15%"><%=dto.getNum()%></td>
				<td><%=dto.getTitle()%></td>
				<td align="center" width="15%">�ۼ��� : <%=dto.getWriter()%>
				</td>
			</tr>
			<tr bgcolor="#B2FFFF">
				<td colspan="3" align="right">��ȸ�� : <%=dto.getCount()%> | Ÿ�� :
					<%=dto.getType()%> | �ۼ��� : <%=dto.getRegdate()%></td>
			</tr>
			<tr height="250" valign="top">
				<td colspan="3"><pre><%=dto.getContent()%></pre></td>
			</tr>
			<tr bgcolor="#B2CCFF">
				<td colspan="3" align="right">ip : <%=dto.getIp()%></td>
			</tr>
		</table>
		<hr />
		<input type="button" value="�ۻ���"
			onclick="location.href='/board/deleteProc.jsp?num=<%=dto.getNum()%>'" />
		<input type="button" value="�ۼ���" /> <input type="button" value="�۸��"
			onclick="location.href='/board/list.jsp'" />
	</div>
</body>
</html>


























