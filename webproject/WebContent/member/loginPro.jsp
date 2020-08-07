<%@page import="com.itwillbs.member.MemberDAO"%>
<%@page import="com.itwillbs.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<h1>WebContent/member/loginPro.jsp</h1>
	<%
	// 전달된 정보 (id,pw)출력
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// DAO 객체 생성 -> idCheck(id,pass);
	MemberDAO mdao = new MemberDAO();
	
	int result = mdao.idCheck(id, pw);
	

	if(result == 1 ) {
		// 로그인 성공
		
		// 아이디 값을 세션 객체에 저장
		session.setAttribute("id", id);
		response.sendRedirect("../main/main.jsp");
		
	}else if(result == 0){
		%>
		<script type="text/javascript">
			alert("비밀번호가 다릅니다.");
			history.back();
		</script>
		<%
	}else{ // result == -1
		%>
		<script type="text/javascript">
			alert("아이디가 없습니다.");
			history.back();
		</script>
		<%	
	}

	%>
	
	<%=id %>
	<%=pw %>
<body>

</body>
</html>