<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	// �׸�����ʹٰ� �ѻ���鿡�Դ� stop ��Ű�� ������ �ص״�
	// �� �������� ������ stop ��������, �̰� �۵����ϰ� ������ �ȴٴ� �Ҹ���.
	// ��Ű�� �ִٸ� �۵� �ȵǰ� �ϸ� �ȴ�.
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


