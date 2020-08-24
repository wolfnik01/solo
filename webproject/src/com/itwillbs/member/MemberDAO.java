package com.itwillbs.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

			sql = "insert into solo_member(id,pw,name,email,birth,gender,"
					+ "addr,phone,mobile,reg_date) values(?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getEmail());
			pstmt.setInt(5, mb.getBirth());
			pstmt.setString(6, mb.getGender());
			pstmt.setString(7, mb.getAddr());
			pstmt.setString(8, mb.getPhone());
			pstmt.setString(9, mb.getMobile());
			pstmt.setDate(10, mb.getReg_date());

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

} // MemberDAO
