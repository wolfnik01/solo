<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="../css/top.css" rel="stylesheet" type="text/css">
    
	<%
	  // 화면 상단에 위치하는 메뉴처리 (모든페이지에 공유)
	  
	  // 로그인 체크 (세션 id 값이 있는지 없는지 체크)
	  String id = (String)session.getAttribute("id");
	%>
	
<header>
<script src="https://kit.fontawesome.com/3a52ba898d.js" crossorigin="anonymous"></script>
<div id="login">
<%
if(id == null){
%>
<a href="../member/loginForm.jsp">로그인</a> 
| <a href="../member/joinForm.jsp">회원가입</a></div>
<%
}else {
	%>
	<a href="#"><%=id%>님 환영합니다.</a> 
	| <a href="../member/logout.jsp">로그아웃</a></div>
<%
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../index.jsp">홈</a></li>
	<li><a href="../center/notice.jsp">오늘 뭐먹지?</a></li>
	<li><a href="../center/notice.jsp">오늘 뭐하지?</a></li>
	<li><a href="../center/notice.jsp">여기는 어때?</a></li>
</ul>
</nav>

<!-- <div class="left">
<ul>
 <li><i class="fab fa-twitter-square" ></i><li>
</ul>
</div> -->

</header>

	
	