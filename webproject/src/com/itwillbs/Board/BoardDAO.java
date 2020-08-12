package com.itwillbs.Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	// 1,2단계 DB, 드라이버 로드/연결(커넥션 풀)
		private Connection getCon() throws Exception {

			try {
				// Context 객체를 생성
				Context init = new InitialContext();

				// DB연결정보를 불러오기 "Java:comp/env/설정이름"
				DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/SPJDB");

				// ds 사용해서 연결

				con = ds.getConnection();
				System.out.println("연결성공" + con);

			} catch (NamingException e) {

				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return con;

		}// getCon();

		public void CloseDB() {

			try {

				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} // closeDB()
		
		
		// insertBoard(bb) : 글쓰기 처리
		public void insertBoard(BoardBean bb){
			int num = 0;
			try {
				// DB연결
				con = getCon();
				
				// sql(1) 글번호 계산
				sql = "select max(bno) from fun_board";
				
				pstmt = con.prepareStatement(sql);
				
				//실행
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					num = rs.getInt(1)+1;
				}
				System.out.println("저장될 글번호 : " + num);
				
				// (2) 글정보 저장
				// sql
				sql = "insert into fun_board (bno,name,pw,subject,content,"
						+ "readcount,re_ref,re_seq,re_lev,date,ip,file) "
						+ "values(?,?,?,?,?,"
						+ "?,?,?,?,now(),"
						+ "?,?)";
				
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, num);
				pstmt.setString(2, bb.getName());
				pstmt.setString(3, bb.getPw());
				pstmt.setString(4, bb.getSubject());
				pstmt.setString(5, bb.getContent());
				pstmt.setInt(6, 0); // readcount
				pstmt.setInt(7, num); // re_ref (답글 그룹번호 == 글번호)
				pstmt.setInt(8, 0); // re_lev 일반글 0
				pstmt.setInt(9, 0); // re_seq 일반글 0
				pstmt.setString(10, bb.getIp());
				pstmt.setString(11, bb.getFile());				
				
				// 실행
				pstmt.executeUpdate();
				
				System.out.println(num + "번 글쓰기 완료");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				CloseDB();
			}
			
			
		}
		
		// insertBoard(bb) : 글쓰기 처리
		
		// getBoardCount() : 글 개수 계산
		
		public int getBoardCount(){
			int count = 0;
			
			try {
				// DB연결
				con = getCon();
				
				// sql(글 개수 계산 - count()) & pstmt
				sql = "select count(*) from fun_board";
				pstmt = con.prepareStatement(sql);
				
				// 실행
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					count = rs.getInt(1);
				}
				
				// System.out.println(" 게시판 글 개수 확인  : " + count);

				// 값 리턴

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				
				CloseDB();
				
			}		
			
			return count;
		}
		
		// getBoardCount() : 글 개수 계산
		
		// getBoardList() : 글 전체 목록
		public List getBoardList(){
			// 리스트 객체 (배열) 생성
			 List boardList = new ArrayList(); // 업캐스팅
			 try {
			// DB연결			
				con = getCon();
				
				// sql(전체 글 정보 모두를 저장) & pstmt
				
				sql = "select * from fun_board";
				pstmt = con.prepareStatement(sql);
				
				// 실행 -> 정보 저장
				rs = pstmt.executeQuery();
				
				// 데이터 처리	
				while(rs.next()){
					// 행의 정보를 저장하는 객체 (BoardBean)
					BoardBean bb = new BoardBean();
					
					bb.setBno(rs.getInt("bno"));
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getDate("date"));
					bb.setFile(rs.getString("file"));
					bb.setIp(rs.getString("ip"));
					bb.setName(rs.getString("name"));
					bb.setPw(rs.getString("pw"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_seq(rs.getInt("re_seq"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setSubject(rs.getString("subject"));
					
					boardList.add(bb);
					
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				CloseDB();
			}
			return boardList;
		}
		// getBoardList() : 글 전체 목록
		
		

}
