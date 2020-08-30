<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<h2>썸네일 이미지 - 업로드 페이지</h2>

<form method="post" enctype="multipart/form-data" action="thumbnailPro.jsp">
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name">	</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><input type="file" name="img"></td>
		</tr>
		<tr>
			<th colspan="2">	
				<input type="submit" value="전송">
				<input type="reset" value="취소">
			</th>
		</tr>
	</table>
</form>
</body>
</html>