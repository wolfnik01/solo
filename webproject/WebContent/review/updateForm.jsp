<%@page import="com.itwillbs.Review.BoardBean"%>
<%@page import="com.itwillbs.Review.BoardDAO"%>
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
<li><a href="notice.jsp">글 목록 보기</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>

<%
request.setCharacterEncoding("UTF-8");
	   // 전달된 파라미터값 저장(bno,pageNum)
	   int bno = Integer.parseInt(request.getParameter("bno"));
	   String pageNum = request.getParameter("pageNum");
	   
	   // 글정보를 가져오기
	   // BoardDAO 객체 생성
	   BoardDAO bdao = new BoardDAO();	
	   
	   // 글정보 가져오는 메서드 - getBoard(bno)
	   BoardBean bb = bdao.getBoard(bno);
	   
	   // 수정할 정보를 출력 (글쓴이, 제목, 내용)
	   
	   
	
	%>
	<h1>리뷰 수정</h1>
	<%
	
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	if(id == null){
		%>
		<script type="text/javascript">
			alert("관리자만 작성가능합니다.")
			location.href="../member/loginForm.jsp";
		</script>		
		<%
	} else if(id.equals("admin")){
	%>
   <fieldset>
	<form class="rvf" action="updatePro.jsp?bno=<%=bno%>&pageNum=<%=pageNum%>" method="post" enctype="multipart/form-data">
	   작성자 : <input type="text" name="name" value="<%=bb.getName()%>"> <br>
	   비밀번호 : <input type="password" name="pw"> <br>
	   매장이름 : <input type="text" name="subject" value="<%= bb.getSubject()%>"><br>
	   매장정보 : <br> 
	   <textarea rows="10" cols="25" name="content"><%= bb.getContent()%></textarea><br>
	   주소 : <input type="text" id="sample5_address" name="addres"  value="<%= bb.getAddres()%>">
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
 이미지 : <input type="file" name="file" width="300" height="300" ><br>
	   
	  <input type="submit" value="수정">	
	</form>
   </fieldset>
   
   <%
	} else {
		%>
		<script type="text/javascript">
			alert("관리자만 작성가능합니다.")
			location.href="../review/notice.jsp";
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
</script>
</html>