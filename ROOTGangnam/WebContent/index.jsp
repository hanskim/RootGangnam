<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	// �ε����� ����ڰ� ���� �Ҷ�, ��Ű�� ������ ���� ��찡 �����״ϱ�
	// �װ� ó���� �ϴ� ������ �����غ���.
	String value = null;
	Cookie[] ar = request.getCookies();
	if(ar != null) {
		for(Cookie t: ar) {
			String n = t.getName();
			if(n.equals("keep")) {
				value = t.getValue();
				// break;
			}
		}
	}
	
	// value �� null �ΰ� �ƴѰ��� ��Ű�� �վ����� �������� Ȯ���� ����
	if(value != null) {
		session.setAttribute("flag", value);
	}
	



	// ���� �츮 ���񽺸� ����ϴ� ������� Ȩ
	request.setAttribute("center", "/main.jsp");
%>
<jsp:forward page="/template.jsp" />


