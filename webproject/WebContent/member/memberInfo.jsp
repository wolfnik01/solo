<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="com.itwillbs.member.MemberDAO"%>
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
<!-- 본문메인이미지 -->

<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="joinForm.jsp"> 회원가입 </a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
 	
 	<%
 	 // 메인페이지는 로그인 없이 이동할 수 없는 페이지
 	 // 로그인이 없이 접근할 경우 -> 로그인 페이지로 이동
 	 String id = (String) session.getAttribute("id");

 	if(id == null){
 		response.sendRedirect("loginForm.jsp");
 	}
 	
 	// 회원의 정보를 DB에서 가져와서 페이지에 출력
 	 	
 	// MemberDAO 객체 생성
 	MemberDAO mdao = new MemberDAO();
 	
 	// 회원 정보를 가져오는 메서드 생성(getMember(id))
 	// -> 회원정보 전부를 리턴 => 테이블에 추가
 	MemberBean mb = mdao.getMember(id);

 	%>
 	
<!-- 본문내용 -->
<article>
<h1> 회원정보 </h1>
<form action="updatePro.jsp" name="fr" method="post" id="join">
<!-- <fieldset> -->
<legend>회원가입 정보</legend>
<label>아이디</label>
<input type="text" name="id" value="<%= mb.getId() %>" ><br>
<label>비밀번호</label>
<input type="password" name="pw"><br>
<label>이름</label>
<input type="text" name="name" value="<%= mb.getName() %>"><br>
<label>전화번호</label>
<input type="text" name="phone" value="<%= mb.getPhone() %>"><br>
<label>E-Mail</label>
<input type="text" name="email" value="<%= mb.getEmail() %>"><br>
<label>성별</label>
<input type="radio" name="gender" value="남"
	 <%if(mb.getGender().equals("남")){ %>
	 checked
	 <%} %>
	 readonly> 남
	 
	      <input type="radio" name="gender" value="여"
	 <%if(mb.getGender().equals("여")){ %>
	 checked
	 <%} %>
	readonly> 여 <br>
<!-- </fieldset> -->

<div class="clear"></div>
<div id="buttons">
<input type="submit" value="수정" class="submit">
<input type="button" value="탈퇴" class="submit" onclick="location.href='memberdelete.jsp'">
<input type="reset" value="취소" class="cancel" onclick="location.href='../main/main.jsp'">

</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</body>
</html>