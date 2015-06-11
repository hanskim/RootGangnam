<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="it.upload.*, com.oreilly.servlet.*"%>
<%
	// Upload 하나 생성후, 값 옮기고 난후 UploadDao 생성해서 createOne
	UploadDto dto = new UploadDto();
	
	String savePath = application.getRealPath("/upload");
	
	MultipartRequest mr = new MultipartRequest(request, savePath, 1024*1024*20, "euc-kr");

	String info= mr.getParameter("info");
	String filename = mr.getOriginalFileName("file");
	String fileaddress = savePath+filename;
	String filelink = "/upload/"+filename;

	
	dto.setInfo(info);
	dto.setFileaddress(fileaddress);
	dto.setFilelink(filelink);
	dto.setFilename(filename);
	
	// createOne 결과물 받아다가 성공/실패
	UploadDao dao = new UploadDao();
	int n = dao.createOne(dto);
	if(n > 0 ) {
		%>
		<script>
			alert("자료 등록 성공");
			location.href="/upload/list.jsp";
		</script>
		<%
	}else {
		%>
		<script>
			alert("자료 등록 중 오류 발생");
			location.href="/upload/write.jsp";
		</script>
		<%
	}

%>