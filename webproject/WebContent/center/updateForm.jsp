<%@page import="com.itwillbs.Board.BoardBean"%>
<%@page import="com.itwillbs.Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/updateForm.jsp</h1>
	<h1> 글정보 수정하기 </h1>
	
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
	
	<fieldset>
	<form action="updatePro.jsp?bno=<%=bno%>&pageNum=<%=pageNum%>" method="post">
	<!-- input-type(hidden) : 화면에는 안보이지만 실제 input 타입처럼
	         데이터 저장 및 전달 가능하다.
	-->
	
    <%--
          폼태그 안에는 BoardBean 형태의 데이터만 저장해서 처리 할 수 있도록 해야한다.(액션태그) 
      BoardBean에 포함되지 않는 데이터는 액션페이지 주소줄에 get방식으로 전달    
      *만약 전달되는 데이터가 BoardBean에는 포함안되는 데이터지만,
             중요한 정보(개인정보)일때는 get방식 전달을 피해야한다.
      
     <input type="hidden" name="pageNum" value="<%=pageNum%>">
        
    --%>
	
	
	<input type="hidden" name="bno" value="<%=bb.getBno()%>">	
	 글쓴이  : <input type="text" name="name" value="<%=bb.getName()%>"> <br>
	 비밀번호 : <input type="password" name="pw" ><br>
	 제목 : <input type="text" name="subject" value="<%=bb.getSubject()%>"><br>
	 내용 : <br>
	 <textarea rows="10" cols="25" name="content" ><%=bb.getContent()%></textarea> <br><br><br>
	 
	 <input type="submit" value="수정하기">
	<input type="reset" value="취소하기" onclick="location.href='notice.jsp'">
	</form>
	</fieldset>

</body>
</html>