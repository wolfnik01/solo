<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인프로젝트</title>
<!-- <input type="text" id="sample5_address" placeholder="주소">
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div> -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c12e6108eceda4edea2a47f4f8b4682&libraries=services"></script>

<script src="../script/main.js" defer></script>
<script src="https://kit.fontawesome.com/3a52ba898d.js" crossorigin="anonymous"></script>

<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/top.css" rel="stylesheet" type="text/css">
</head>
<body>


<!-- 헤더파일들어가는 곳 (페이지 인클루드) -->
	<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<div id="wrap">
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 리뷰들어가는 곳 -->
<jsp:include page="../inc/review.jsp"/>
<!-- 리뷰들어가는 곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->


<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
 <jsp:include page="../inc/bottom.jsp" />
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>