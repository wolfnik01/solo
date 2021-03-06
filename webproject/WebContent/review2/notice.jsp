<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.Review2.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.Review2.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/top.css" rel="stylesheet" type="text/css">

<script src="../script/main.js" defer></script>
<script src="https://kit.fontawesome.com/3a52ba898d.js" crossorigin="anonymous"></script>

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
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
<li><a href="fWriteForm.jsp">글쓰기</a></li>
<li><a href="notice.jsp">글 목록 보기</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<%
	// BoardDAO 객체 생성
	BoardDAO bdao = new BoardDAO();
	// 테이블에 저장된 글의 개수 계산 메서드
	// getBoardCount()
	int cnt = bdao.getBoardCount();
	
     // 디비에서 전체 글목록을 읽어서 가져오기
     
//      // BoardDAO 객체 생성
//      BoardDAO bdao = new BoardDAO();
     
//      // 테이블에 글이 있는지 없는지 판단(getBoardCount())
//      int count = bdao.getBoardCount();
     
      System.out.println("테이블에 저장된 글의 수 : "+cnt);


     // 페이징 처리************************************************
     
     // 한 페이지에서  보여줄 글의 개수 설정
     int pageSize = 6;
     // 현 페이지의 페이지값을 확인
     String pageNum = request.getParameter("pageNum");
     if(pageNum == null){ // 페이지 정보가 없을경우 항상 1페이지 
    	 pageNum = "1";
     }
     
     // 시작 행번호  계산   1...10 / 11...20 / 21...30 / 31...40
     int currentPage = Integer.parseInt(pageNum);
     
     int startRow = (currentPage-1) * pageSize + 1;
     
     // 끝 행번호 계산
     int endRow = currentPage * pageSize;
     
     // 페이징 처리************************************************
     // 게시판의 글의 수를 모두 화면에 출력
     
     ArrayList boardList = null;
     // 글 모두 가져오기 getBoardList()
     if(cnt != 0){
    	 //boardList = bdao.getBoardList();
    	 // 페이징 처리한 리스트 호출(시작행,페이지크기)
    	 boardList = bdao.getBoardList(startRow,pageSize);
     }

	
%>

<!-- 게시판 -->
<article class="polist">
<table id="notice">
<tr><th class="tttt">여행지정보</th>
    </tr>
</table>
<div>

<% for(int i=0; i<boardList.size(); i++ ){ 
	BoardBean bb = (BoardBean)boardList.get(i);
%>
<table id="ssum">   
<tr>
<td class="ssimg"><a class="tt" href="ReviewContent.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>">
<img src="../upfile/<%= bb.getFile() %>" width="100%" height="100px"></td>
</a>
</tr>
<tr>
		<td class="rvsj">
		       <% 
		        // 답글 들여쓰기 처리
		        int wid = 0;
		        // 답글일때
		        if(bb.getRe_lev()>0){
		        	wid = 10 * bb.getRe_lev();
		       %>
		         <a class="tt" href="ReviewContent.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>"><img class="left" src="../images/level.gif" width="<%=wid%>" height="15">
		         <img  class="left" src="../images/re.gif">
		       <%
		        }
		       %>
		         <a class="tt" href="ReviewContent.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>"> 
		          <%=bb.getSubject() %>
		         </a>
		       </td>
		       </tr>
<tr>
		<td class="rvn"><%= bb.getName() %></td>
</tr>
<tr>
		<td class="rvda"><%= bb.getDate() %></td>
</tr>
<tr>
		<td class="rvrc"><%= bb.getReadcount() %></td>
</tr>
<% } %>

</table>
</div>
<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
<div class="clear"></div>
<div id="page_control">

<%--    <h2> 게시판 글의 수 : <%=cnt %> 개</h2> --%>
<!--    <h2><a href="writeForm.jsp">글쓰기</a></h2> -->
   
<!--    <table border="1"> -->
<!--      <tr> -->
<!--        <td>번호</td> -->
<!--        <td>제목</td> -->
<!--        <td>작성자</td> -->
<!--        <td>작성일</td> -->
<!--        <td>조회수</td> -->
<!--        <td>IP</td> -->
<!--      </tr> -->
     
   <%
     // 다른 페이지 이동 버튼
     if(cnt != 0){
    	 // 전체 페이지수 - 글 50 / 화면 10씩 출력 => 5페이지
    	 //           -  글 56 / 화면 10씩 출력 => 6페이지
    	 
    	 int pageCount = cnt/pageSize +(cnt % pageSize == 0? 0:1);
    	 
    	 // 한 화면에 보여줄 페이지 번호개수
    	 int pageBlock = 2;
    	 
    	 // 페이지 블럭의 시작페이지 번호  1...10/11...20/21....30/31....40
    	 int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
    	 
    	 // 페이지 블럭의 끝 페이지 번호
    	 int endPage = startPage+pageBlock-1;
    	 if(endPage > pageCount){
    		 endPage = pageCount;
    	 }
    	 
    	 
    	 // 이전
    	 if(startPage > pageBlock){
    		 %>
    		    <a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
    		 <%
    	 }
    	 // 숫자 (1...10/11...20/.....)
    	 for(int i=startPage;i<=endPage;i++){
    		 %>
    		   <a href="notice.jsp?pageNum=<%=i%>">[<%=i %>]</a>
    		 <%
    	 }
    	 // 다음
    	 if(endPage < pageCount){
    		 %>
    		   <a href="notice.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
    		 <%
    	 }
    	 
     }     
   
   %>
</div>
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