<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/top.css" rel="stylesheet" type="text/css">
<title>header</title>
</head>
<script src="../script/main.js" defer></script>
<body>

    
	<%
	  // 화면 상단에 위치하는 메뉴처리 (모든페이지에 공유)
	  
	  // 로그인 체크 (세션 id 값이 있는지 없는지 체크)
	  String id = (String)session.getAttribute("id");
	%>
	
<header class="h1">
<script src="https://kit.fontawesome.com/3a52ba898d.js" crossorigin="anonymous"></script>
<nav class="navbar">
<!-- 로고들어가는 곳 -->
<div class="logo">
<img id="main_logo" src="../images/Angkko.png"  width="50" alt="logo" style="vertical-align:middle">
<a href="../index.jsp">앙꼬네맛집</a>
</div>
<!-- 로고들어가는 곳 -->

<ul  class="top_menu" >
	<li><a href="../index.jsp">홈</a></li>
	<li><a href="../center/notice.jsp"><span class="textimp">오늘 뭐먹지?</span></a></li>
	<li><a href="../center/notice.jsp">오늘 뭐하지?</a></li>
	<li><a href="../center/notice.jsp">여기는 어때?</a></li>
</ul>

<div class="login">
<%
if(id == null){
%>
<a href="../member/loginForm.jsp">로그인</a> 
| <a href="../member/joinForm.jsp">회원가입</a></div>
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


<!-- <div class="left">
<ul>
 <li><i class="fab fa-twitter-square" ></i><li>
</ul>
</div> -->

</header>
</body>
</html>