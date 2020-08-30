<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="joinForm.jsp"> 회원가입 </a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<legend><h1>회원가입</h1></legend>
<form action="joinPro.jsp" name="fr" method="post" id="join" onsubmit="return check()">
<!-- <fieldset> -->
<label>아이디</label>
<input type="text" name="id" class="id">
<input type="button" value="중복체크" class="dup" onclick="winopen();"><br>
<label>패스워드</label>
<input type="password" name="pw"><br>
<label>패스워드 확인</label>
<input type="password" name="pw2"><br>
<label>이름</label>
<input type="text" name="name"><br>
<label>전화번호</label>
<input type="text" name="phone"><br>
<label>E-Mail</label>
<input type="text" name="email"><br>
<label>성별</label>
<input type="radio" name="gender" value="남"> 남 
<input type="radio" name="gender" value="여"> 여 <br>
<!-- </fieldset> -->

<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원가입" class="submit">
<input type="reset" value="취소" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
	<script type="text/javascript">
		/* 사용자가 회원 가입시 */
		// 데이터 빈공백 체크
		// 가입조건 만족(ex.. 아이디가 최소 5자리 이상,영문자/숫자 사용)
		// 추가 정보는 입력을 안해도 됨
		
		function check(){
			
			var id = document.fr.id.value;
			var pw = document.fr.pw.value;
			var pw2 = document.fr.pw2.value;
			var name = document.fr.name.value;
			var phone = document.fr.phone.value;
			var email = document.fr.email.value;
			var ra1 = document.fr.gender[0]
 			var ra2 = document.fr.gender[1]
 			
			
			// alert("테스트");
			// 아이디가 입력이 안되어있을경우 "아이디를 입력하시오"
			if(id.length <= 0) {
				alert("아이디를 입력하시오");
				
				document.fr.id.focus();
				return false;
			}
			
		
			
			if(pw == ""){
				   alert(" 비밀번호를 입력하시오. ");
				   document.fr.pw.focus();
				   return false;	   
			   }
			
			
			   if(pw2 == ""){
				   alert(" 비밀번호를 입력하시오. ");
				   document.fr.pw2.focus();
				   return false;	   
			   }
			   
			   if(pw != pw2){
				   alert(" 입력하신 비밀번호가 다릅니다." );
				   document.fr.pw2.select();
				   return false;		   
			   }
			   
			   if(name == ""){
				   alert(" 이름을 입력하세요." );
				   document.fr.name.focus();
				   return false;		   
			   }
			
			   if(phone == ""){
				   alert(" 전화번호를 입력하세요." );
				   document.fr.phone.focus();
				   return false;   
			   }
				
			   if(email == ""){
				   alert(" E-mail주소를 입력하세요." );
				   document.fr.email.focus();
				   return false;	   
			   }
			   if(ra1.checked == false && ra2.checked == false){
	 				
	 				alert("성별을 선택하시오.");
	 				ra1.focus();
	 				return false; 
	 				}
			   
			   			   


		} //////////check()//////////////
		
		function winopen() {
			// id 입력하는 텍스트 상자에 값이 비어있는지 없는지 판단
			if(document.fr.id.value == "") {
				alert("아이디를 입력하세요.");
				document.fr.id.focus();
				return;
			}
			// 값이 비어있을경우 "ID를 입력하시오", focus(), 진행 x
			// 값이 있을경우 진행 O
					
			// 새창을 열어서 페이지 오픈 => 회원 아이디 정보 중복체크
			// 페이지 이동시 입력한 ID값 가지고 이동
			var id = document.fr.id.value;
			window.open("joinIdCheck.jsp?userid="+id,"","width=400,height=200");

		} 
		

	</script>
</body>
</html>