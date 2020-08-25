package com.itwillbs.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext;

public class MemberDAO {
	// 정보를 처리해서 데이터 베이스에 저장

	// 디비연결에 필요한 변수 선언
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

	// 회원가입 메서드 (insertMember())
	public void insertMember(MemberBean mb) {

		try {

			con = getCon();

			sql = "insert into solo_member(id,pw,name,email,gender,phone)"
					+ " values(?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getEmail());
			pstmt.setString(5, mb.getGender());
			pstmt.setString(6, mb.getPhone());
			

			pstmt.executeUpdate();

			System.out.println("회원 정보 가입 완료");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			CloseDB();
		}

	}
	// 회원가입 메서드 (insertMember())

	// 중복아이디 체크하는 메서드 joinIdCheck(ID);

	public int joinIdCheck(String ID) {

		int result = -1;

		// DB연결
		try {
			con = getCon();

			// SQL(select) - pstmt
			// 전달 받은 ID에 해당하는 정보가 있는지 판단
			sql = "select * from solo_member where id=?";

			// 실행
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, ID);

			// rs 데이터 처리
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 0 - 사용 불가능한 아이디
				result = 0;
			} else {

				// 1 - 사용가능한 아이디
				result = 1;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return result;
	} // 중복아이디 체크하는 메서드 joinIdCheck(ID);

	// 로그인 체크 메서드 idCheck(id, pw)
	public int idCheck(String id, String pw) {
		int result = -1;

		// DB연결
		try {
			con = getCon();

			// sql(id에 해당하는 정보가 있는지 없는지 판단)

			sql = "select pw from solo_member where id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (pw.equals(rs.getString("pw"))) {
					// 아이디,비밀번호 같을때 로그인 처리(1)
					result = 1; // 로그인성공
				} else {
					// 비밀번호x (0)
					result = 0; // 비밀번호 오류
				}
				
			}else{
			// 아이디X (-1)
			result = -1; // 아이디가 없음
			}
			
			System.out.println("로그인처리 완료 : " + result);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return result;
	}

	// 로그인 체크 메서드 idCheck(id, pw)
	
	//getMember(id)
		public MemberBean getMember(String id){
			MemberBean mb = null;
			
			
				
			try {
				// 1,2 DB연결
			con = getCon();
						
			sql = "select * from solo_member where id=? ";
			// 3-1. ??

			
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				// 4. 실행 -> rs
				rs = pstmt.executeQuery();
				// 5 데이터 처리
				if(rs.next()){
					// DB에 있는 회원정보를 저장 -> 페이지로 전달 (테이블)
					mb = new MemberBean();
					
					mb.setEmail(rs.getString("email"));
					mb.setGender(rs.getString("gender"));
					mb.setId(rs.getString("id"));
					mb.setName(rs.getString("name"));
					mb.setPw(rs.getString("pw"));	
					mb.setPhone(rs.getString("phone"));
					
					System.out.println(" 회원정보 저장 완료 ");
					System.out.println(mb);
					
				}
				
				System.out.println(" 구문 실행 완료 ");	
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			} finally {
				
				CloseDB();
				
			}
			
			return mb;
			
		} //getMember(id)
		
		//updateMember(mb)
		
		public int updateMember(MemberBean mb){
			int result = -1;
			
			try {
			// 1,2 DB연결
			con = getCon();
			// 3 sql 작성(select)- 수정하는 사람이 있는지 체크
			sql = "select pw from solo_member where id=?";
			// pstmt 객체 생성
			pstmt = con.prepareStatement(sql);
			// 4 실행	
			pstmt.setString(1, mb.getId());
			
			rs = pstmt.executeQuery();
			
			// 5 데이터 처리
			//  사용자 O - 비밀번호 체크 (O/X) => 비밀번호 수정(3,4단계)
			//  사용자 X - 에러
			if(rs.next()){
				if(mb.getPw().equals(rs.getString("pw"))){
					// 데이터 수정
					
					// 3 sql & pstmt
					
					sql = "update solo_member set name=?, gender=?, email=?, phone=? where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mb.getName());
					pstmt.setString(2, mb.getGender());
					pstmt.setString(3, mb.getEmail());
					pstmt.setString(4, mb.getPhone());
					pstmt.setString(5, mb.getId());
					
								
					// 4 실행
					
					pstmt.executeUpdate();
					System.out.println("정보수정 완료");
					
					
					result = 1;
				}else {
					// 비밀번호가 틀린경우
					result = 0;
				}
			}else{
				// 사용자가 없는 경우
				result = -1;
			}
		
			} catch (Exception e) {
				
				e.printStackTrace();
			} finally {
				CloseDB();
			}

			return result;
		} //updateMember(mb)
		
		//deleteMember(id,pw)
		
		public int deleteMember(String id, String pw){
					
			int result = -1;
			
			try {
			con = getCon();
			
			sql = "select pw from solo_member where id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pw.equals(rs.getString("pw"))){
					
					sql = "delete from solo_member where id=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					
					pstmt.executeUpdate();
					result = 1;
				}else{
					result = 0;
				}
			}else{
				result = -1;
		}
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally{
				CloseDB();
			}	
			
			return result;
		}
		
		//deleteMember(id,pw)
		
		//getMemberList()
		public ArrayList getMemberList(){
			
			// 가변길이 배열 (갯수에 맞춰서 배열수가 늘어난다) 
			// => 타입 지정없이는 Object로 저장가능(모든 타입으로 저장가능)
			ArrayList memberList = new ArrayList();
			
			try {
			// 1,2 DB연결
			con = getCon();
			
			// 3 sql & pstmt
			sql = "select * from solo_member";
		    pstmt = con.prepareStatement(sql);
		    
		    // 4 실행 -> rs
		    rs = pstmt.executeQuery();
		    
		    // 5 데이터 처리
		    while(rs.next()){
		    	// DB테이블 결과 1행의 정보 모두를 MemberBean으로 저장
		    	// 1명(1행)의 정보를 배열 한칸에 저장
		    	
		    	MemberBean mb = new MemberBean();
		    	
		    	mb.setPhone(rs.getString("phone"));
		    	mb.setEmail(rs.getString("email"));
		    	mb.setGender(rs.getString("gender"));
		    	mb.setId(rs.getString("id"));
		    	mb.setName(rs.getString("name"));
		    	mb.setPw(rs.getString("pw"));
		    	
		    	///////////////////////////////////////////
		    	// 회원 1명의 정보 저장 완료
		    	
		    	// 배열(ArrayList) 저장
		    	memberList.add(mb);
		    	// 배열 한칸에 회원1명의 정보 저장 완료
		    	
		    	// memberList.add(3);
		    	// Wrapper 클래스
		    	
		    	System.out.println(memberList.toString());
		    	
		    	
		    } // while
		    System.out.println("정보 검색 완료");
		    // System.out.println(memberList);
		    
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				CloseDB();
			}
			
			return memberList;
			
		} //getMemberList()	
		

} // MemberDAO
