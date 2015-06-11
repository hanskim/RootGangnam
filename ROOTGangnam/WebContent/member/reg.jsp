<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setAttribute("center", "/member/regForm.jsp");
//	RequestDispatcher rd = request.getRequestDispatcher("/template.jsp");
//	rd.forward(request, response);
%>
<jsp:forward page="/template.jsp"/> 
