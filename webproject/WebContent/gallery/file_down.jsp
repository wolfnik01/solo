<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> WebContent/fileuputf/file_down.jsp</h1>
	<%
		// 전달 된 데이터 저장
		String filename = request.getParameter("file_name");
		System.out.println("전달 된 파일명 : " + filename);
		
		// 파일 다운로드할 위치(= 파일 업로드 위치)
		// 저장되는 폴더명
		
		String savepath = "upload";
		
		// 내 프로젝트 정보 
		ServletContext context = getServletContext();
		String DownloadPath = context.getRealPath(savepath);
		// => 서버 안에 있는 실제로 파일이 저장되는 물리적 위치
		System.out.println(" DownloadPath : " + DownloadPath);
		
		// 다운로드할 파일의 전체 경로
		String FilePath = DownloadPath+"\\"+filename;
		
		//////////////////////////////////////////////////////
		// 데이터 응답 처리를 다운로드 형태로 구현

		// 파일을 한번에 처리하기 위한 배열
		byte[] b = new byte[4069];
		// 파일 입출력 => 파일 입력 스트림 객체 (파일을 읽어오는 통로)
		FileInputStream fis = new FileInputStream(FilePath);
		
		// 다운로드할 파일의 마임타입 확인(MIME)
		// => 클라이언트에게 전송되는 데이터(문서) 다양하게 처리 가능하도록 하는 메커니즘
		// 웹에서 파일의 확장자는 큰 의미가 없음 (스트림형태로 데이터가 전달)
		// 각 데이터(문서)에서 올바른 형태의 데이터를 전달하도록 MIME 타입을 지정
		// 브라우저들이 응답정보(리소스)를 받았을때 어떤 형태로 처리해야하는지 판단하는
		String MimeType =  getServletContext().getMimeType(FilePath);
		System.out.println("MimeType : " + MimeType);
		
		if(MimeType == null ){
			// 기본값 지정 - 이진파일을 처리하기위한 기본타입
			// => 잘 알려지지 않은 파일을 의미하기 때문에
			// 브라우저는 보통 자동실행을 하지 않음. (대화상자를 사용해서 사용자 질문)
			MimeType = "application/octet=stream";
		}
		
		// 응답 정보를 마임타입으로 지정(다운로드할 파일의 마임타입)
		response.setContentType(MimeType);
		
		// 브라우저에 따른 데이터 처리(대응)
		// 접속한 사용자 정보 
		String agent = request.getHeader("User-Agent");
		System.out.println("agent : " + agent);
		// IE 인지 아닌지 판단
		boolean ieBrowser = agent.indexOf("MSIE") > -1 || agent.indexOf("Trident") > -1;
		if(ieBrowser){
			// IE 일때 => 다운로드시 한글파일이 깨짐
			// => 인코딩해서 다운로드 필요 => 공백문자가 "+" => 공백문자변경 "%20"
			
			filename = 
			URLEncoder.encode(filename,"UTF-8").replaceAll("\\+","%20");
			
		}else{ 
			// IE 아닐때 => 데이터 인코딩(한글 깨짐처리)
			filename = new String(filename.getBytes("UTF-8"),"iso-8859-1");
		}
		
		
		
		
		
		
		
		// 데이터 다운로드 처리
		// => 브라우저가 응답정보를 읽어서 (해석) 처리시
		// "Content-Disposition" 설정값이 "attachment;" 모든 데이터 다운로드 처리
		response.setHeader("Content-Disposition", "attachment; filename=" + filename);
		
		// java.lang.IllegalStateException:
		// 이 응답을 위해 getOutputStream()이 이미 호출되었습니다.
		// => JSP -> Servlet 변환시 out 객체가 자동생성, 추가로 OutputStream
		// 오류 메세지 출력( 다운로드 문제 x, 서버에 에러 메세지 로그 쌓임)
				
		out.clear();
		out = pageContext.pushBody();
		
		// 데이터 출력(다운로드)
		// 데이터 출력 통로 생성
		ServletOutputStream out2 = response.getOutputStream();
		
		int data = 0;
		while((data = fis.read(b,0,b.length)) != -1){
			// 데이터 출력을 파일이 있을때 동안 계속 진행
			out2.write(b,0,data);
			out2.flush();
			// => 배열의 빈공간을 채워서 데이터 처리
		} // while
		
		
			
		out2.close();
		fis.close();		
		
		
	%>

</body>
</html>