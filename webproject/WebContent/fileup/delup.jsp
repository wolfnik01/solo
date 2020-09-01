<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Insert title here</title>
</head>
<body>

  <h1>WebContent/fileup/delup.jsp</h1>
  <%
     // 파일 삭제 페이지
     
     // 전달된 파일 이름 저장
     String filename = request.getParameter("filename");
     
     out.println("filename : "+filename);
  
     // 파일 객체 생성 -> 삭제
     //File f = new File("해당 파일의 위치+파일명");
     File f = new File("D:\\upfile/"+filename);
     
     // 파일 삭제
     f.delete();
     
     out.println("파일 삭제 완료!! ");
    
  
  %>
  
  
  
  
  
  
  
  
  
  
  

</body>
</html>