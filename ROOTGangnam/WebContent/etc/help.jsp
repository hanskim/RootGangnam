<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	// 실제 우리 서비스를 사용하는 사람들의 홈
	request.setAttribute("center", "/etc/qView.jsp");
%>
<jsp:forward page="/template.jsp" />