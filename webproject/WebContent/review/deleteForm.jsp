<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/deleteForm.jsp</h1>
	
	<h1> 글 삭제 </h1>
	
	<%
	// 전달 된 데이터 bno,pageNum 저장
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");
	
	// 사용자가 삭제하는 동작을 인지하도록하는 페이지
	// 해당 글 비밀번호를 입력 -> deletePro.jsp 페이지로 이동
	
	
	
	// 
	
	
	
	%>
	
	<fieldset>
	 <form action="deletePro.jsp?pageNum=<%=pageNum%>" method="post">
	  <input type="hidden" name="bno" value="<%=bno%>">
	    비밀번호 : <input type="password" name="pw">
	    <input type="submit" value="삭제">
	    <input type="button" value="취소" onclick="history.back()">
	    
	 </form>	
	</fieldset>
	
	
	
	

</body>
</html>