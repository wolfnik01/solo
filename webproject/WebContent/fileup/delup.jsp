<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Insert title here</title>
</head>
<body>

  <h1>WebContent/fileup/delup.jsp</h1>
  <%
     // ���� ���� ������
     
     // ���޵� ���� �̸� ����
     String filename = request.getParameter("filename");
     
     out.println("filename : "+filename);
  
     // ���� ��ü ���� -> ����
     //File f = new File("�ش� ������ ��ġ+���ϸ�");
     File f = new File("D:\\upfile/"+filename);
     
     // ���� ����
     f.delete();
     
     out.println("���� ���� �Ϸ�!! ");
    
  
  %>
  
  
  
  
  
  
  
  
  
  
  

</body>
</html>