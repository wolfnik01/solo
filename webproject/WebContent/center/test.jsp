<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>썸머노트 테스트</title>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<script src="../script/main.js" defer></script>
<script src="https://kit.fontawesome.com/3a52ba898d.js" crossorigin="anonymous"></script>

<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/top.css" rel="stylesheet" type="text/css">


</head>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/header.jsp" />
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 메인이미지 -->
		<div></div>
		<!-- 메인이미지 -->

		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
		<ul>
			<li><a href="test.jsp">글쓰기</a></li>
			<li><a href="notice.jsp">글 목록 보기</a></li>
			<li><a href="#">파일 업로드/다운로드</a></li>
			<li><a href="#">Service Policy</a></li>
		</ul>
		</nav>
		<!-- 왼쪽메뉴 -->

		<!-- 게시판 -->
		<article> <!-- 로그인 한 사용자만 글쓰기 가능
  로그인한 사람의 ID값을 글쓴이로 지정
--> <%
 	// 세션ID값을 사용해서 글쓴이 지정
 	// 로그인 X -> 로그인 페이지로 이동

 	String id = (String) session.getAttribute("id");
 	String pw = (String) session.getAttribute("pw");
 	String name = (String) session.getAttribute("name");
 	if (id == null) {
 		response.sendRedirect("../member/loginForm.jsp");
 	}
 %>
 		
 		
 
		<form action="writePro.jsp" method="post" name="fr">
		<div id="sumsub">
		<input class="sumsub" type="text" name="subject" placeholder="제목"><br>
		<input type="hidden" name="id" value="<%=id%>">
	 	<input type="hidden" name="pw" value="<%=pw%>">
	 	<input type="hidden" name="name" value="<%=name%>">
		<input id="fwbtn" type="file" name="file"><br>
		</div>
			<div id="summernote"></div>

			<!-- <form method="post">
  <textarea id="summernote" name="content"></textarea>
</form> -->

		
			<script type="text/javascript">
				$(document).ready(function() {
					$('#summernote').summernote({
						 height: 300,                 // 에디터 높이
						  minHeight: null,             // 최소 높이
						  maxHeight: null,             // 최대 높이
						  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
						  lang: 'ko-KR',					// 한글 설정
						  placeholder: '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
					});		
				});
			</script>
			
			
		
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