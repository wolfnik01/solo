<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>오늘 뭐먹지?</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/top.css" rel="stylesheet" type="text/css">

<script src="../script/main.js" defer></script>
<script src="https://kit.fontawesome.com/3a52ba898d.js" crossorigin="anonymous"></script>

<script type="text/javascript" src="./js/jquery-3.1.0.min.js" charset="utf-8"></script>
<script type="text/javascript">

</script>
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
<li><a href="gallery.jsp">글 목록 보기</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
	<h1>갤러리 게시판</h1>
	<%
	
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	
	if(id != null){
		
	%>
   <fieldset>
	<form class="rvf" action="flieUploadPro.jsp" method="post" enctype="multipart/form-data">
	  <div id="sumsub">
	 <input class="sumsub" type="text" name="subject" placeholder="제목"><br>
	   작성자 : <input type="text" name="name" value="<%= id%>"> 비밀번호 : <input type="text" name="pw"> <br>
          이미지 : <input type="file" name="file" width="300" height="300" ><br>
	   
	  <input type="submit" value="등록">	
	</form>
   </fieldset>
   
   <%
	} else {
		%>
		<script type="text/javascript">
			alert("로그인을 하세요.")
			location.href="../main/main.jsp";
		</script>
		<%
		
	}
	%>

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