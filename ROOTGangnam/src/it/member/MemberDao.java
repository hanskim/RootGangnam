package it.member;

import it.util.ConnUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// Data Access Object : 데이터 처리 담당(제어) 객체
// db연결을 하는 작업을 미리 구현시켜두고, 웹 페이지에선 불러다가 사용하자는 개념
// 
public class MemberDao {
	// 1. 정보 등록 기능
	public int createOne(MemberDto dto) { // 매개변수를 머머 받아야될까..?
		int r = 0;
		try {
			// DB 연결 부분만.. 매번 치기 귀찮으니까, 메서드 화시켜둔거다.
			Connection conn = ConnUtil.open();
			String sql = "insert into member values(?, ?, ?, ?, ?, ?, sysdate)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPass());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getGender());
			ps.setInt(5, dto.getBirth());
			ps.setString(6, dto.getAddress());
			r = ps.executeUpdate();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r;
	}

	// 2. 정보 하나 구해주는 기능
	public MemberDto readOne(String key) { // 멀 리턴하게 해야되지?
		MemberDto dto = null;
		try {
			Connection conn = ConnUtil.open();
			String sql = "select * from member where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, key);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				dto = new MemberDto();
				dto.setId(rs.getString("id"));
				dto.setAddress(rs.getString("address"));
				dto.setBirth(rs.getInt("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRegdate(rs.getDate("regdate"));
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 3. 정보 전체가져오기 기능
	public ArrayList<MemberDto> readAll() { // ctrl + shift+ o
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		try {
			Connection conn = ConnUtil.open();
			// 가입일 오래된 사람순
			String sql = "select * from member order by regdate asc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setId(rs.getString("id"));
				dto.setAddress(rs.getString("address"));
				dto.setBirth(rs.getInt("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRegdate(rs.getDate("regdate"));
				list.add(dto);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 4. 정보 삭제 기능
	public int deleteOne(String key) {
		int r = 0;
		try {
			Connection conn = ConnUtil.open();
			String sql = "delete from member where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, key);
			r = ps.executeUpdate();

			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return r;
	}
	// 5. 정보 수정 기능

}
