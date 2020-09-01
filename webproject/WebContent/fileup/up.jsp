<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/fileup/up.jsp</h1>

	<%
	  // 전달되는 데이터 인코딩 
	  request.setCharacterEncoding("euc-kr");
	   
	  // 업로드 폴더 지정 (절대경로)
	  String savePath = "D:/test";
	  // 업로드 파일 크키
	  int maxSize = 10 * 1024 * 1024; // 10MB
	  
	  // 파일이름 
	  String fileName="";
	  String originalFileName="";
	  
	  // 파일업로드 (+ 예외처리 )
	  try{
		  MultipartRequest multi =
				  new MultipartRequest(
						  request,
						  savePath,
						  maxSize,
						  "euc-kr",
						  new DefaultFileRenamePolicy()
						  );
		  
		  // 파일업로드 완료
		  ///////////////////////////////////////////////////////
		  // 결과를 화면에 출력
		  
		  // 폼의 이름 반환 
		  Enumeration formNames = multi.getFileNames();
		  
		  // 전달된 파일의 정보를 저장
		  String formname = (String) formNames.nextElement();
		  
		  // 서버에 저장된 파일의 이름 저장
		  fileName = multi.getFilesystemName(formname);
		  // 원래 파일의 이름 저장
		  originalFileName = multi.getOriginalFileName(formname);
		  
		  // 파일업로드 성공시  해당정보 출력
		  
		  if(fileName == null){
			  out.println("파일 업로드 실패! ");
		  }else{
			  out.println("업로드 한사람 : "+multi.getParameter("name")+"<br>");
			  out.println("업로드 파일이름 (서버저장) : "+fileName+"<br>");
			  out.println("업로드 파일이름 (원본) : "+originalFileName+"<br>");
			  out.println("file 태그 정보 : "+formname+"<br>");
		  }
		  
	  }catch(Exception e){
		 out.println("예외 상황 발생!!!!!!!!!!!!!!!!!!");
		 e.printStackTrace();
	  }
		
	%>
	
	<fieldset>
	  <form method="post" name="myform">
	    <input type="text" name="filename" value="<%=fileName%>">
	    <input type="button" value="파일 삭제" onclick="delfile()">
	    <input type="button" value="파일 다운로드" onclick="downfile()" >	  
	  </form>	
	</fieldset>
	
	
	<script type="text/javascript">
	  function delfile() {
		 document.myform.action="./delup.jsp";
		 document.myform.submit();
	  }
	  
	  function downfile(){
		  document.myform.action="./down.jsp";
		  document.myform.submit();  
	  }
	
	</script>
	






</body>
</html>