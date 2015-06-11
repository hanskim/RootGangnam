<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="it.upload.*, com.oreilly.servlet.*"%>
<%
	// Upload �ϳ� ������, �� �ű�� ���� UploadDao �����ؼ� createOne
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
	
	// createOne ����� �޾ƴٰ� ����/����
	UploadDao dao = new UploadDao();
	int n = dao.createOne(dto);
	if(n > 0 ) {
		%>
		<script>
			alert("�ڷ� ��� ����");
			location.href="/upload/list.jsp";
		</script>
		<%
	}else {
		%>
		<script>
			alert("�ڷ� ��� �� ���� �߻�");
			location.href="/upload/write.jsp";
		</script>
		<%
	}

%>