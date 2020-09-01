<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> WebContent/fileuputf/flieUploadPro.jsp </h1>
	<!-- 파일 업로드 처리 -->
	<%
		// 파일 저장 위치 (D:\JSP_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\fileUpload/upload)
		// System.out.println("가상경로 : " + request.getRealPath("/upload"));
		String uploadPath = request.getRealPath("/upload");
		
		// 저장 크기 지정(10MB)
		int maxSize = 10 * 1024 * 1024;
		
		// 정보 저장 변수
		String name = "";
		String subject = "";
		String filename = "";
		String OFilename = "";
		
		try{
		// MultipartRequest 객체 사용 파일 업로드
		MultipartRequest multi = 
					new MultipartRequest(
							request,
							uploadPath,
							maxSize,
							"UTF-8",
							new DefaultFileRenamePolicy()							
							);
		
		// 파일 업로드 완료
		
		// 전달되는 이름, 제목 저장
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
		// 전달 된 파일의 이름 확인
		Enumeration files = multi.getFileNames();
		
		String file1 = (String) files.nextElement();
		// 서버에 저장되는 파일이름
		filename = multi.getFilesystemName(file1);
		
		// 원래 파일이름
		OFilename = multi.getOriginalFileName(file1);
		System.out.println("OFilename : " + OFilename);
		
		// 업로드 동작 끝
		// => 예외 발생가능성 높음 
		
		}catch (Exception e){
			e.printStackTrace();
		}
	%>
	
	<!-- 데이터 전달해서 업로드를 확인
	<form action="fileCheck.jsp" method="post">
	  <input type="text" name="name" value="<%=name%>" readonly><br>
	  <input type="text" name="subject" value="<%=subject%>" disabled><br> 
	  <input type="text" name="filename" value="<%=filename%>"><br>
	  <input type="text" name="ofliename" value="<%=OFilename%>"><br>
	  <input type="submit" value="확인하기">
	</form> -->
	
	
	<form action="fileCheck.jsp" method="post" name="filecheck">
	  <input type="text" name="name" value="<%=name%>" readonly><br>
	  <input type="text" name="subject" value="<%=subject%>"><br> 
	  <input type="text" name="filename" value="<%=filename%>"><br>
	  <input type="text" name="ofilename" value="<%=OFilename%>"><br>
	</form>
	
	<h3><a href="#" onclick="javascript:filecheck.submit();"> 업로드 확인 & 다운로드 페이지 이동 </a></h3>
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>