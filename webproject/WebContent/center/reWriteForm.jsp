<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../script/main.js" defer></script>
<script src="https://kit.fontawesome.com/3a52ba898d.js"
	crossorigin="anonymous"></script>

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

	<h1>게시판 답글쓰기</h1>
		<article>

	<%
		// 세션ID값을 사용해서 글쓴이 지정
		// 로그인 X -> 로그인 페이지로 이동

		String id = (String) session.getAttribute("id");
		if (id == null) {
			response.sendRedirect("../member/loginForm.jsp");
		}
		// 전달한 데이터 (파라미터) 저장 ( bon re_ref re_lev re_seq )

			int bno = Integer.parseInt(request.getParameter("bno"));
			int re_ref = Integer.parseInt(request.getParameter("re_ref"));
			int re_lev = Integer.parseInt(request.getParameter("re_lev"));
			int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	%>

	<form action="reWritePro.jsp" method="post" name="fr">
	<input type="hidden" name="bno" value="<%=bno%>">
	<input type="hidden" name="re_ref" value="<%=re_ref%>">
	<input type="hidden" name="re_lev" value="<%=re_lev%>">
	<input type="hidden" name="re_seq" value="<%=re_seq%>">
		<table id="notice" class="noti2">
			<colgroup>
				<col width="15%">
				<col width="*">
			</colgroup>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" value="[답글]"></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="name" value="<%=id%>" readonly>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="20" name="content"></textarea></td>
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