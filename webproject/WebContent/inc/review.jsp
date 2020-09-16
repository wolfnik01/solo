<%@page import="com.itwillbs.Review.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.Review.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/review.css" rel="stylesheet" type="text/css">
</head>
<body>

<%
	// BoardDAO 객체 생성
	BoardDAO bdao = new BoardDAO();
	// 테이블에 저장된 글의 개수 계산 메서드
	// getBoardCount()
	int cnt = bdao.getBoardCount();
	
     // 디비에서 전체 글목록을 읽어서 가져오기
     
//      // BoardDAO 객체 생성
//      BoardDAO bdao = new BoardDAO();
     
//      // 테이블에 글이 있는지 없는지 판단(getBoardCount())
//      int count = bdao.getBoardCount();
     
      System.out.println("테이블에 저장된 글의 수 : "+cnt);
     // 페이징 처리************************************************
     
     // 한 페이지에서  보여줄 글의 개수 설정
     int pageSize = 6;
     // 현 페이지의 페이지값을 확인
     String pageNum = request.getParameter("pageNum");
     if(pageNum == null){ // 페이지 정보가 없을경우 항상 1페이지 
    	 pageNum = "1";
     }
     
     // 시작 행번호  계산   1...10 / 11...20 / 21...30 / 31...40
     int currentPage = Integer.parseInt(pageNum);
     
     int startRow = (currentPage-1) * pageSize + 1;
     
     // 끝 행번호 계산
     int endRow = currentPage * pageSize;
     
     // 페이징 처리************************************************
     // 게시판의 글의 수를 모두 화면에 출력
     
     ArrayList boardList = null;
     // 글 모두 가져오기 getBoardList()
     if(cnt != 0){
    	 //boardList = bdao.getBoardList();
    	 // 페이징 처리한 리스트 호출(시작행,페이지크기)
    	 boardList = bdao.getBoardList(startRow,pageSize);
     }
	
%>

<!-- 게시판 -->
<article class="mainrv">
<table id="notice" class="rvtt">
<tr><th class="tttt">맛집정보</th>
    </tr>
</table>

<% for(int i=0; i<boardList.size(); i++ ){ 
	BoardBean bb = (BoardBean)boardList.get(i);
%>

<table id="ssum">   
<tr>
 
<td class="ssimg">
<a class="left" href="../review/ReviewContent.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>">
<img src="../upfile/<%= bb.getFile() %>" width="150px" >
</a>
</td>

</tr>
<tr>
		<td class="rvsj">
		         <a class="left" href="../review/ReviewContent.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>"> 
		          <%=bb.getSubject() %>
		         </a>
		       </td>
		       </tr>
<% } %>
</table>

</body>
</html>