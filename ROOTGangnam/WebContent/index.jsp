<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	// 인덱스로 사용자가 접근 할때, 쿠키를 가지고 오는 경우가 있을테니까
	// 그걸 처리를 하는 로직을 구현해보자.
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
	
	// value 가 null 인가 아닌가로 쿠키가 잇었는지 없었는지 확인이 가능
	if(value != null) {
		session.setAttribute("flag", value);
	}
	



	// 실제 우리 서비스를 사용하는 사람들의 홈
	request.setAttribute("center", "/main.jsp");
%>
<jsp:forward page="/template.jsp" />


