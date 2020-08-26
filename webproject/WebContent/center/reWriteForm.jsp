<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/reWriteForm.jsp</h1>
	
	<%
	
	String id = (String)session.getAttribute("id");
	if(id != null){
	
	%>
	
	<h1> 게시판 답글쓰기 </h1>
	<%
	  // 전달한 데이터 (파라미터) 저장 ( bon re_ref re_lev re_seq )
	  
	  int bno = Integer.parseInt(request.getParameter("bno"));
	  int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	  int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	  int re_seq = Integer.parseInt(request.getParameter("re_seq"));

	%>
	
	<fieldset>
	<form action="reWritePro.jsp" method="post">
	<input type="hidden" name="bno" value="<%=bno%>">
	<input type="hidden" name="re_ref" value="<%=re_ref%>">
	<input type="hidden" name="re_lev" value="<%=re_lev%>">
	<input type="hidden" name="re_seq" value="<%=re_seq%>">
	 
	 글쓴이  : <input type="text" name="name" value="<%=id%>"> <br>
	 비밀번호 : <input type="password" name="pw"><br>
	 제목 : <input type="text" name="subject" value="[답글]" ><br>
	 내용 : <br>
	 <textarea rows="10" cols="25" name="content"></textarea> <br><br><br>
	 
	 <input type="submit" value="답글쓰기" >
	 <input type="button" value="취소" onclick="location.href='notice.jsp'">
	
	</form>
	</fieldset>
	
	<%
	} else if( id == null ) {
	%>
	<script type="text/javascript">
		alert("로그인이 필요합니다.")
		location.href="../member/loginForm.jsp";
	</script>		
	<%	
	}
	%>
	
	
	
	
	
	
	
	
	
</body>
</html>