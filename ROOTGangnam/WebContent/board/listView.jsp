<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="it.board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 페이징 처리를 해서, 모든 정보를 전부 출력하지 말고 끊어서 출력해보자.
	BoardDao dao = new BoardDao();
	java.util.ArrayList<BoardDto> list = dao.readAll();

	int size = list.size(); // 글이 몇개인가..
	int part = 7; // 한페이지에 몇개를 찍을껀가..

	// 그렇다면 총 몇페이지 분량이 나오는가..?
	// size 12 ? → tot 2
	// size 14 ? → tot 2
	// size 15 ? → tot 3
	int tot = size / part; // 총 몇페이지가 계산된 결과물이 설정될수 있게 해보자.
	if (size % part > 0) {
		tot++;
	}

	// 클라이언트측에서 이 list.jsp로 올때.. p이라는 올때가 있을꺼다.
	int now = 1; // 페이지 번호 .. 
	if (request.getParameter("p") != null) {
		now = Integer.parseInt(request.getParameter("p"));
	}
	// 여기서   now 값과,  part 값을 조합을 해서 필요한 숫자를 확보해야된다.
	// now1 =>0, 6   , now2=> 7, 13   now3 => 14, 20
	int start = (now - 1) * part;
	int end = now * part - 1;
	// end는 어떤 상황이라면 멀로 변경시켜야 한다.
	if (tot == now) {
		end = list.size() - 1;
	}
	// ArrayList 란 클래스의 기능중에  sublist . 	// start <=   <end
	java.util.List<BoardDto> slist = list.subList(start, end + 1);

	request.setAttribute("slist", slist);
	request.setAttribute("tot", tot);
	request.setAttribute("now", now);
%>
<html>
<head>
</head>
<body>
	<h2>게시판</h2>
	<hr />
	<div align="right" style="width: 98%">
		<input type="button" value="글쓰기"
			onclick="location.href='/board/write.jsp'" />
	</div>
	<table style="width: 99%;">
		<tr bgcolor="#BFE5FF">
			<th width="7%">글번호</th>
			<th width="12%">타입</th>
			<th>제목</th>
			<th width="12%">작성자</th>
			<th width="7%">조회수</th>
			<th width="20%">작성일</th>
		</tr>
		<c:forEach items="${slist }" var="t">
			<tr bgcolor="#D4F4FA">
				<td align="center">${t.num }</td>
				<td align="center">${t.type }</td>
				<td><c:choose>
						<c:when
							test="${t.type eq '비공개' and t.writer ne sessionScope.flag }">
							블라인드 처리된 글입니다.
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
	<!-- 페이지 이동을 클라이언트가 쉽게 할수 잇게 링크부분만들려고 한다. -->
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








