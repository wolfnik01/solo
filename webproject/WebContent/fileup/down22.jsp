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
		// 다운로드 페이지
		String filename 
		 = new String((request.getParameter("filename")).getBytes("8859_1"),"euc-kr");
	   
	    // 파일 저장 경로(절대경로)
	    String filePath = "D:\\upfile/";
	    
	    // 입출력 객체 
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
		        // 전달된 파일 경로,이름 사용해서 파일 객체 생성
		    	file = new File(filePath,fname);
		        viewFile = new File(filePath,fname1);
		        
		        out.print("file : "+file+"<br>");
		        out.print("viewFile : "+viewFile+"<br>");
		        
		        // 파일을 읽어오기 위해서 입력 통로를 생성
		        // InputStream is = null;
		        is = new FileInputStream(file);
	    	}catch(FileNotFoundException e){
	    		skip = true;
	    	}
	    	
	    	
	    	fname2 = new String(fname1.getBytes("euc-kr"),"8859_1");
	    	
	    	// 응답 객체를 초기화
	    	response.reset();
	    	
	    	// 클라이언트가 다운로드 요청시 사용자 웹브라우저 정보필요
	    	client = request.getHeader("User-Agent");
	    	
	    	System.out.println("client : "+client);
	    	
	    	// 사용자 브라우저에 따른 처리
	    	
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
	    		
	    		// 사용자 브라우저에 따른 처리	
	    		// 데이터 출력할수 있는 통로 생성
	    		os = response.getOutputStream();
	    		
	    		byte[] b = new byte[4096];
	    		int leng = 0;
	    		
	    		// 파일을 읽어서 데이터가 있을경우에만 진행
	    		while((leng = is.read()) > 0){
	    			// 데이터 출력(다운로드)
	    			os.write(b,0,leng);	    			
	    		}	    		
	    	} // if
	    	else{
	    		out.print(" 파일 다운로드 실패! ");
	    		return;
	    	}
	    }catch(Exception e){
	    	System.out.println("에러발생");
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