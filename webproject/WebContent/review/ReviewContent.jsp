<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.Review.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.Review.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<jsp:include page="../inc/header.jsp" />
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
				<li><a href="#">파일 업로드/다운로드</a></li>
				<li><a href="#">Service Policy</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->

		<%
		
		
		String filename = request.getParameter("filename");
		String ofilename = request.getParameter("ofilename");
			// http://localhost:8088/JSP7/board/content.jsp?bno=20&pageNum=1
			// 글번호(pk)에 해당하는 글의 정보를 가져오기

			// 전달된 데이터 저장 (bno,pageNum)
			int bno = Integer.parseInt(request.getParameter("bno"));
			String pageNum = request.getParameter("pageNum");
			// BoardDAO 객체 생성 

			BoardDAO bdao = new BoardDAO();

			// 글의 조회수 정보를 1증가 ( updateReadCount(bno) )

			bdao.updateReadCount(bno);

			// 글정보를 가져오는 메서드 생성( getBoard(bno) )
			BoardBean bb = bdao.getBoard(bno);

			// 화면(테이블)에 출력
			
		%>

		<!-- 게시판 -->
		<article>
			<table id="notice">
				<tr>
					<th colspan="2"><%=bb.getSubject()%></th>
				</tr>
			</table>

			<table>
				<tr>
					<td class="ssimg"><img src="ReviewContent.jsp?file_name=<%=bb.getFile_name() %>"></td>
				</tr>
				<tr>
					<td class="rvn"><%=bb.getName()%></td>
				</tr>
				<tr>
					<td class="rvda"><%=bb.getDate()%></td>
				</tr>
				<tr>
					<td class="rvrc"><%=bb.getReadcount()%></td>
				</tr>
				<tr>
					<td class="rvar"><%=bb.getAddres()%></td>
				</tr>
			</table>



			<table border="1">

				<tr>

					<td>
						<!-- 로그인정보가 없거나, 글쓴이 이름과 아이디가 다를경우
	  	수정하기,삭제하기 버튼을 숨김
	  	로그인한 아이디의 정보가 글쓴이 이름과 같다면 수정하기, 삭제하기를 보여주기 --> <%
 	// 로그인정보를 가져와서 판단 
 	// 세션값 가져오기
 	String id = (String) session.getAttribute("id");

 	if (id != null && id.equals(bb.getName())) {
 		// 아이디가 있으면서, 이름이랑 아이디가 같은경우
 %> <input type="button" value="수정"
						onclick="location.href='updateForm.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>'">

						<input type="button" value="삭제"
						onclick="location.href='deleteForm.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>'">

						<%
							}
						%> <input type="button" value="답글"
						onclick="location.href='reWriteForm.jsp?bno=<%=bb.getBno()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">

						<input type="button" value="목록"
						onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr>

			</table>

			<form action="">
				<table>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>
						<input type="text" name="cmt" value="<%=bb.getName()%>">
						</td>
						<td>
						<textarea></textarea>
						</td>
					</tr>
				</table>
			</form>



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