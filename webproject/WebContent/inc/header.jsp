<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



    
	<%
	  // 화면 상단에 위치하는 메뉴처리 (모든페이지에 공유)
	  
	  // 로그인 체크 (세션 id 값이 있는지 없는지 체크)
	  String id = (String)session.getAttribute("id");
	%>
	
<header class="h001">
<nav class="navbar3">
<!-- 로고들어가는 곳 -->
<div class="logo">
<a href="../index.jsp">
<img id="main_logo" src="../images/Angkko.png"  width="50" alt="logo" style="vertical-align:middle">
</a>
<a href="../index.jsp">앙꼬네맛집</a>
</div>
<!-- 로고들어가는 곳 -->

<form><fieldset><input class="scinput" type="search" /><button class="btn01" type="submit"><i class="fa fa-search"></i></button></fieldset></form>


<div class="login01">
<%
if(id == null){
%>
<a href="../member/loginForm.jsp">로그인</a> 
| <a href="../member/joinForm.jsp">회원가입</a>
<%
}else {
	%>
	
	<%=id%>님 환영합니다.  
	<a href="../member/memberInfo.jsp">회원정보</a>
	| <a href="../member/logout.jsp">로그아웃</a></div>
<%
}
%>

<a href="#" class="top_toogle">
<i class="fas fa-bars"></i>
</a>
</nav>

<div class="navbar2">

<ul  class="top_menu" >
	<li><a href="../review/notice.jsp">오늘 뭐먹지?</a></li>
	<li><a href="../HotPlace/notice.jsp">오늘 뭐하지?</a></li>
	<li><a href="../center/notice.jsp">여기는 어때?</a></li>
</ul>
</div>


<!-- <div class="left">
<ul>
 <li><i class="fab fa-twitter-square" ></i><li>
</ul>
</div> -->

</header>