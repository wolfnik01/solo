<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/fileup/down.jsp</h1>
	<%
		// �ٿ�ε� ������
		String filename 
		 = new String((request.getParameter("filename")).getBytes("8859_1"),"euc-kr");
	   
	    // ���� ���� ���(������)
	    String filePath = "D:\\upfile/";
	    
	    // ����� ��ü 
	    InputStream is = null;
	    OutputStream os = null;
	    
	    File file = null;
	    File viewFile = null;
	    
	    
	    boolean skip = false;
	    String client ="";
	    
	    try{
	    	
	    	String fname1 = "";
	    	String fname2 = "";
	    	String fname ="";
	    	
	    	fname =filename;
	    	
	    	fname1 = new String(fname.getBytes("8859_1"),"euc-kr");
	    	
	    	
	    	try{
		        // ���޵� ���� ���,�̸� ����ؼ� ���� ��ü ����
		    	file = new File(filePath,fname);
		        viewFile = new File(filePath,fname1);
		        
		        out.print("file : "+file+"<br>");
		        out.print("viewFile : "+viewFile+"<br>");
		        
		        // ������ �о���� ���ؼ� �Է� ��θ� ����
		        // InputStream is = null;
		        is = new FileInputStream(file);
	    	}catch(FileNotFoundException e){
	    		skip = true;
	    	}
	    	
	    	
	    	fname2 = new String(fname1.getBytes("euc-kr"),"8859_1");
	    	
	    	// ���� ��ü�� �ʱ�ȭ
	    	response.reset();
	    	
	    	// Ŭ���̾�Ʈ�� �ٿ�ε� ��û�� ����� �������� �����ʿ�
	    	client = request.getHeader("User-Agent");
	    	
	    	System.out.println("client : "+client);
	    	
	    	// ����� �������� ���� ó��
	    	
	    	response.setContentType("application/x-msdownload;");
	    	response.setHeader("Content-Description", "JSP Generated Data");
	    	
	    	if(!skip){
	    		if(client.indexOf("MSIE 5.5") != -1){
	    			response.setHeader("Content-Type",
	    					  "doesn/matter; charset=euc-kr");
	    			response.setHeader("Content-Disposition", 
	    					"filename"+new String(fname.getBytes("euc-kr"),"8859_1"));
	    		}else{
	    			response.setHeader("Content-Type", "application/octet-stream; charset=euc-kr");
	    			response.setHeader("Content-Disposition", "attachment; filename"+new String(fname.getBytes("euc-kr"),"8859_1"));
	    		}
	    		
	    		response.setHeader("Content-Transfer-Encoding", "binary;");
	    		response.setHeader("Content-Length", ""+file.length());
	    		response.setHeader("Pragma", "no-cache");
	    		response.setHeader("Expires", "-1;");
	    		
	    		// ����� �������� ���� ó��	
	    		// ������ ����Ҽ� �ִ� ��� ����
	    		os = response.getOutputStream();
	    		
	    		byte[] b = new byte[4096];
	    		int leng = 0;
	    		
	    		// ������ �о �����Ͱ� ������쿡�� ����
	    		while((leng = is.read()) > 0){
	    			// ������ ���(�ٿ�ε�)
	    			os.write(b,0,leng);	    			
	    		}	    		
	    	} // if
	    	else{
	    		out.print(" ���� �ٿ�ε� ����! ");
	    		return;
	    	}
	    }catch(Exception e){
	    	System.out.println("�����߻�");
	    	e.printStackTrace();
	    }finally{
	    	if(is != null)
	    		is.close();
	    	if(os != null)
	    		os.close();
	    }
	    
	    
	    
	
	
	
	
	
	
	
	
	
	
	
	%>







</body>
</html>