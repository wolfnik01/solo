<%@page import="com.itwillbs.Board.BoardBean"%>
<%@page import="com.itwillbs.Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../script/main.js" defer></script>
<script src="https://kit.fontawesome.com/3a52ba898d.js" crossorigin="anonymous"></script>

<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/top.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">글쓰기</a></li>
<li><a href="notice.jsp">글 목록 보기</a></li>
<li><a href="#">파일 업로드/다운로드</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<article>
	<h1> 글 수정하기 </h1>
	
	<%
	
	request.setCharacterEncoding("UTF-8");
	   // 전달된 파라미터값 저장(bno,pageNum)
	   int bno = Integer.parseInt(request.getParameter("bno"));
	   String pageNum = request.getParameter("pageNum");
	   
	   // 글정보를 가져오기
	   // BoardDAO 객체 생성
	   BoardDAO bdao = new BoardDAO();	
	   
	   // 글정보 가져오는 메서드 - getBoard(bno)
	   BoardBean bb = bdao.getBoard(bno);
	   
	   // 수정할 정보를 출력 (글쓴이, 제목, 내용)
	   
	   
	   
	   
	
	%>
	
	<fieldset>
	<form action="updatePro.jsp?bno=<%=bno%>&pageNum=<%=pageNum%>" method="post">
	<!-- input-type(hidden) : 화면에는 안보이지만 실제 input 타입처럼
	         데이터 저장 및 전달 가능하다.
	-->
	
    <%--
          폼태그 안에는 BoardBean 형태의 데이터만 저장해서 처리 할 수 있도록 해야한다.(액션태그) 
      BoardBean에 포함되지 않는 데이터는 액션페이지 주소줄에 get방식으로 전달    
      *만약 전달되는 데이터가 BoardBean에는 포함안되는 데이터지만,
             중요한 정보(개인정보)일때는 get방식 전달을 피해야한다.
      
     <input type="hidden" name="pageNum" value="<%=pageNum%>">
        
    --%>
	
	<table id="notice" class="noti2">
	<input type="hidden" name="bno" value="<%=bb.getBno()%>">	
 <colgroup>
  <col width="15%">
 <col width="*">
</colgroup>
 <tr>
  <td>제목</td>
  <td>
   <input type="text" name="subject" value="<%=bb.getSubject()%>">   
  </td>
 </tr>
 <tr>
  <td>글쓴이</td>
  <td>
   <input type="text" name="name" value="<%=bb.getName()%>" readonly>   
  </td>
 </tr>
 <tr>
  <td>비밀번호</td>
  <td>
   <input type="password" name="pw">   
  </td>
 </tr>
 <tr>
  <td>내용</td>
  <td>
   <textarea rows="20" cols="20" name="content"><%=bb.getContent()%></textarea>   
  </td>
 </tr>
</table>
<div id="table_search">
<input type="submit" value="글쓰기" class="btn">
</div>
<div class="clear"></div>
</form>
<div id=""></div>

</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>

<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>