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
<h1>WebContent/center/writePro.jsp</h1>
<!-- 
DB- fun_baord 테이블

BoardBean 객체

BoardDAO 객체 
-->

<!-- 전달되는 정보를 BoardBean 객체에 저장(액션태그)  -->

<%
// 한글처리 Bean처리 하기전에 해야함 아니면 깨짐
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="bb" class="com.itwillbs.Board.BoardBean" />
<jsp:setProperty property="*" name="bb"/>




<!-- ip 정보 추가 저장  -->
<% 
bb.setIp(request.getRemoteAddr());
%>

<!-- BoardDAO 객체 생성 => insertBoard() -->
<%
BoardDAO bdao = new BoardDAO();
bdao.insertBoard(bb);
// 페이지 이동 (notice.jsp)
response.sendRedirect("notice.jsp");
%>

</body>
</html>