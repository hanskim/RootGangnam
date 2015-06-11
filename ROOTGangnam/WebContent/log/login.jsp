<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<!-- 로그인성공시 flag 라고 심을꺼기 때문에 -->
	<c:choose>
		<c:when test="${sessionScope.flag eq null }">
			<%-- 로그인을 하기전의 메뉴 --%>
			<div align="right">
				<!-- 최상단에 합쳐질 기본 로그인 화면(미완성 : action X, name X) -->
				<form action="/log/loginProc.jsp" method="post">
					<b>ID</b> <input type="text" size="8" name="tId" /> <input
						type="checkbox" name="con" /> <b>PASS</b> <input type="password"
						size="11" name="tPass" /> <input type="submit" value="로그인" /> <input
						type="button" value="회원가입"
						onclick="javascript:location.href='/member/reg.jsp'" />
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<%-- 로그인을 한 후의 메뉴 --%>
			<div align="right">
				<b>${sessionScope.flag }, logOn</b> <input type="button" value="내정보"
					onclick="javascript:location.href='/log/pass.jsp'" /> <input
					type="button" value="회원목록"
					onclick="javascript:location.href='/member/list.jsp'" /> <input
					type="button" value="게시판"
					onclick="javascript:location.href='/board/list.jsp'" /> <input
					type="button" value="자료실"
					onclick="javascript:location.href='/upload/list.jsp'" /> <input
					type="button" value="로그아웃"
					onclick="javascript:location.href='/log/logoutProc.jsp'" />

			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>

