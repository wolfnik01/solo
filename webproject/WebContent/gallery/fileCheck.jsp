<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> WebContent/fileuputf/fileCheck.jsp </h1>
	
	<%
		// 전달되는 데이터 화면 출력
		
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String filename = request.getParameter("filename");
		String ofilename = request.getParameter("ofilename");
	%>
	
	<h2> 정보 확인 </h2>
	<h3> 올린사람 : <%= name %> </h3>
	<h3> 제목 : <%= subject %> </h3>
	<h3> 서버에 저장된 파일명 : <img src="file_down.jsp?file_name=<%=filename %>"><%= filename %></a></h3>
	<h3> 원본 파일명 : <%= ofilename %> </h3>
	
	

</body>
</html>