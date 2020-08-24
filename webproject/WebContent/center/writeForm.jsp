<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
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
<div id="sub_img_center"></div>
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

<!-- 게시판 -->
<article>
<h1>게시판글쓰기</h1>
<!-- 로그인 한 사용자만 글쓰기 가능
  로그인한 사람의 ID값을 글쓴이로 지정
-->
<%
// 세션ID값을 사용해서 글쓴이 지정
// 로그인 X -> 로그인 페이지로 이동

String id = (String)session.getAttribute("id");
if(id == null){
	response.sendRedirect("../member/loginForm.jsp");
}

%>
<form action="writePro.jsp" method="post" name="fr">
<table id="notice">
 <tr>
  <td>글쓴이</td>
  <td>
   <input type="text" name="name" value="<%=id%>" readonly>   
  </td>
 </tr>
 <tr>
  <td>비밀번호</td>
  <td>
   <input type="password" name="pw">   
  </td>
 </tr>
 <tr>
  <td>제목</td>
  <td>
   <input type="text" name="subject">   
  </td>
 </tr>
 <tr>
  <td>내용</td>
  <td>
   <textarea rows="10" cols="20" name="content"></textarea>   
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