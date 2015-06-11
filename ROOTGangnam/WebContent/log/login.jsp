<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<!-- �α��μ����� flag ��� �������� ������ -->
	<c:choose>
		<c:when test="${sessionScope.flag eq null }">
			<%-- �α����� �ϱ����� �޴� --%>
			<div align="right">
				<!-- �ֻ�ܿ� ������ �⺻ �α��� ȭ��(�̿ϼ� : action X, name X) -->
				<form action="/log/loginProc.jsp" method="post">
					<b>ID</b> <input type="text" size="8" name="tId" /> <input
						type="checkbox" name="con" /> <b>PASS</b> <input type="password"
						size="11" name="tPass" /> <input type="submit" value="�α���" /> <input
						type="button" value="ȸ������"
						onclick="javascript:location.href='/member/reg.jsp'" />
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<%-- �α����� �� ���� �޴� --%>
			<div align="right">
				<b>${sessionScope.flag }, logOn</b> <input type="button" value="������"
					onclick="javascript:location.href='/log/pass.jsp'" /> <input
					type="button" value="ȸ�����"
					onclick="javascript:location.href='/member/list.jsp'" /> <input
					type="button" value="�Խ���"
					onclick="javascript:location.href='/board/list.jsp'" /> <input
					type="button" value="�ڷ��"
					onclick="javascript:location.href='/upload/list.jsp'" /> <input
					type="button" value="�α׾ƿ�"
					onclick="javascript:location.href='/log/logoutProc.jsp'" />

			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>

