<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/fileup/up.jsp</h1>

	<%
	  // ���޵Ǵ� ������ ���ڵ� 
	  request.setCharacterEncoding("euc-kr");
	   
	  // ���ε� ���� ���� (������)
	  String savePath = "D:/test";
	  // ���ε� ���� ũŰ
	  int maxSize = 10 * 1024 * 1024; // 10MB
	  
	  // �����̸� 
	  String fileName="";
	  String originalFileName="";
	  
	  // ���Ͼ��ε� (+ ����ó�� )
	  try{
		  MultipartRequest multi =
				  new MultipartRequest(
						  request,
						  savePath,
						  maxSize,
						  "euc-kr",
						  new DefaultFileRenamePolicy()
						  );
		  
		  // ���Ͼ��ε� �Ϸ�
		  ///////////////////////////////////////////////////////
		  // ����� ȭ�鿡 ���
		  
		  // ���� �̸� ��ȯ 
		  Enumeration formNames = multi.getFileNames();
		  
		  // ���޵� ������ ������ ����
		  String formname = (String) formNames.nextElement();
		  
		  // ������ ����� ������ �̸� ����
		  fileName = multi.getFilesystemName(formname);
		  // ���� ������ �̸� ����
		  originalFileName = multi.getOriginalFileName(formname);
		  
		  // ���Ͼ��ε� ������  �ش����� ���
		  
		  if(fileName == null){
			  out.println("���� ���ε� ����! ");
		  }else{
			  out.println("���ε� �ѻ�� : "+multi.getParameter("name")+"<br>");
			  out.println("���ε� �����̸� (��������) : "+fileName+"<br>");
			  out.println("���ε� �����̸� (����) : "+originalFileName+"<br>");
			  out.println("file �±� ���� : "+formname+"<br>");
		  }
		  
	  }catch(Exception e){
		 out.println("���� ��Ȳ �߻�!!!!!!!!!!!!!!!!!!");
		 e.printStackTrace();
	  }
		
	%>
	
	<fieldset>
	  <form method="post" name="myform">
	    <input type="text" name="filename" value="<%=fileName%>">
	    <input type="button" value="���� ����" onclick="delfile()">
	    <input type="button" value="���� �ٿ�ε�" onclick="downfile()" >	  
	  </form>	
	</fieldset>
	
	
	<script type="text/javascript">
	  function delfile() {
		 document.myform.action="./delup.jsp";
		 document.myform.submit();
	  }
	  
	  function downfile(){
		  document.myform.action="./down.jsp";
		  document.myform.submit();  
	  }
	
	</script>
	






</body>
</html>