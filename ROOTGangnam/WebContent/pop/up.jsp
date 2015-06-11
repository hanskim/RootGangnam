<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	// 그만보고싶다고 한사람들에게는 stop 쿠키를 보내게 해뒀다
	// 이 페이지에 왔을때 stop 이있으면, 이걸 작동안하게 막으면 된다는 소리다.
	// 쿠키가 있다면 작동 안되게 하면 된다.
	Cookie[] ar = request.getCookies();
	int r = 0;
	if(ar != null) {
		for(Cookie t : ar) {
			if(t.getName().equals("stop")) {
				r = 1;
				break;
			}
		}
	}
	if( r != 1 ) {
%>
<script>
	var url="/pop/content.jsp";
	window.open(url, "a", "width=280, height=180");
</script>
<%}
%>


