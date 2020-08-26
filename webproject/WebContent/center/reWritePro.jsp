<%@page import="com.itwillbs.Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/reWriteForm.jsp</h1>
	
	<%
	  // 한글처리
	  request.setCharacterEncoding("UTF-8");
	  
	  // 액션태그 사용 파라미터값 저장
	  // useBean, setProperty
	  %>
	  <jsp:useBean id="bb" class="com.itwillbs.Board.BoardBean" /> 
	  <jsp:setProperty property="*" name="bb"/>	  
	  <%	  
	  System.out.println(bb);
	  // ip 정보 저장
	  bb.setIp(request.getParameter("ip"));

	  // BoardDAO 객체 생성 - reInsertBoard(객체)
	  BoardDAO bdao = new BoardDAO();
	  bdao.reInsertBoard(bb);
	  
	  // 페이지 이동 (글 목록)
	  
	  response.sendRedirect("notice.jsp");
	%>

</body>
</html>