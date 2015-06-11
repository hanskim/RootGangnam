<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// ����¡ ó���� �ؼ�, ��� ������ ���� ������� ���� ��� ����غ���.
	BoardDao dao = new BoardDao();
	java.util.ArrayList<BoardDto> list = dao.readAll();

	int size = list.size(); // ���� ��ΰ�..
	int part = 7; // ���������� ��� ��������..

	// �׷��ٸ� �� �������� �з��� �����°�..?
	// size 12 ? �� tot 2
	// size 14 ? �� tot 2
	// size 15 ? �� tot 3
	int tot = size / part; // �� ���������� ���� ������� �����ɼ� �ְ� �غ���.
	if (size % part > 0) {
		tot++;
	}

	// Ŭ���̾�Ʈ������ �� list.jsp�� �ö�.. p�̶�� �ö��� ��������.
	int now = 1; // ������ ��ȣ .. 
	if (request.getParameter("p") != null) {
		now = Integer.parseInt(request.getParameter("p"));
	}
	// ���⼭   now ����,  part ���� ������ �ؼ� �ʿ��� ���ڸ� Ȯ���ؾߵȴ�.
	// now1 =>0, 6   , now2=> 7, 13   now3 => 14, 20
	int start = (now - 1) * part;
	int end = now * part - 1;
	// end�� � ��Ȳ�̶�� �ַ� ������Ѿ� �Ѵ�.
	if (tot == now) {
		end = list.size() - 1;
	}
	// ArrayList �� Ŭ������ ����߿�  sublist . 	// start <=   <end
	java.util.List<BoardDto> slist = list.subList(start, end + 1);

	request.setAttribute("slist", slist);
	request.setAttribute("tot", tot);
	request.setAttribute("now", now);
%>
<html>
<head>
</head>
<body>
	<h2>�Խ���</h2>
	<hr />
	<div align="right" style="width: 98%">
		<input type="button" value="�۾���"
			onclick="location.href='/board/write.jsp'" />
	</div>
	<table style="width: 99%;">
		<tr bgcolor="#BFE5FF">
			<th width="7%">�۹�ȣ</th>
			<th width="12%">Ÿ��</th>
			<th>����</th>
			<th width="12%">�ۼ���</th>
			<th width="7%">��ȸ��</th>
			<th width="20%">�ۼ���</th>
		</tr>
		<c:forEach items="${slist }" var="t">
			<tr bgcolor="#D4F4FA">
				<td align="center">${t.num }</td>
				<td align="center">${t.type }</td>
				<td><c:choose>
						<c:when
							test="${t.type eq '�����' and t.writer ne sessionScope.flag }">
							����ε� ó���� ���Դϴ�.
						</c:when>
						<c:otherwise>
							<a href="/board/detail.jsp?num=${t.num }">${t.title }</a>
							<c:if test="${t.count ge 30 }">
								<font color="red"><i>HOT</i></font>
							</c:if>
						</c:otherwise>
					</c:choose></td>
				<td align="center">${t.writer }</td>
				<td align="center">${t.count }</td>
				<td align="center">${t.regdate }</td>
			</tr>
		</c:forEach>
	</table>
	<!-- ������ �̵��� Ŭ���̾�Ʈ�� ���� �Ҽ� �հ� ��ũ�κи������ �Ѵ�. -->
	<div align="center">
		<c:forEach var="i" begin="1" end="${tot }">
			<c:choose>
				<c:when test="${i eq now }">
					<font color="red"><b>${i }</b></font>
				</c:when>
				<c:otherwise>
					<a href="/board/list.jsp?p=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</body>
</html>








