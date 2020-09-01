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
					<td class="ssimg"><img src="../upfile/<%= bb.getFile() %>" width="200px" ></td>
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
						%> 
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c12e6108eceda4edea2a47f4f8b4682&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</html>