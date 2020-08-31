<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String imagePath = "/upfile";
int size = 1024*1024*5;

MultipartRequest multi
	= new MultipartRequest(request,
	        imagePath,
	        size,
	        "utf-8",
	        new DefaultFileRenamePolicy());

Enumeration enu = multi.getFileNames();
// while (enu.hasMoreElements()) {
//     String filename = enu.nextElement();
// }

String file = (String) enu.nextElement(); // file타입 input태그의 name속성값들을 하나씩 가져옴
String filename = multi.getFilesystemName(file);

ParameterBlock pb = new ParameterBlock();
pb.add(imagePath + "/" + filename);
RenderedOp rOp = JAI.create("fileload", pb);
//JAI.create(파일로드 옵션값, 원본파일이름), 원본이미지 로드

BufferedImage bi = rOp.getAsBufferedImage();//// 이미지를 버퍼로 만들어라
BufferedImage thumb = new BufferedImage(100,100,BufferedImage.TYPE_INT_RGB);
//썸네일 용(가로, 세로, 색상모델지정) 

// https://blog.naver.com/jsh10973/222002512389 썸네일 비율 고정
// https://blog.naver.com/liza0124/221078575231 현재 페이지 소스

Graphics2D g = thumb.createGraphics(); // 펜? 
g.drawImage(bi, 0, 0, 100, 100, null);
/* 이 생성된 펜으로 그린다. 
obuffer에 있는 이미지를 0,0에서 twidth, theight 만큼 그린다. */

File thumbnailFile = new File(imagePath, "sm_"+filename);
ImageIO.write(thumb, "jpg", thumbnailFile);
ImageIO.write(thumb, "png", thumbnailFile);
ImageIO.write(thumb, "gif", thumbnailFile);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
-원본이미지-<br>
<img src="../image/<%=filename %>"><br><br>
-썸네일 이미지<br>
<img src="../image/sm_<%=filename %>"><br>
</body>
</html>