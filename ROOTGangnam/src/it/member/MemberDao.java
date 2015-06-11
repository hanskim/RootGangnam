package it.member;

import it.util.ConnUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// Data Access Object : ������ ó�� ���(����) ��ü
// db������ �ϴ� �۾��� �̸� �������ѵΰ�, �� ���������� �ҷ��ٰ� ������ڴ� ����
// 
public class MemberDao {
	// 1. ���� ��� ���
	public int createOne(MemberDto dto) { // �Ű������� �Ӹ� �޾ƾߵɱ�..?
		int r = 0;
		try {
			// DB ���� �κи�.. �Ź� ġ�� �������ϱ�, �޼��� ȭ���ѵаŴ�.
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

	// 2. ���� �ϳ� �����ִ� ���
	public MemberDto readOne(String key) { // �� �����ϰ� �ؾߵ���?
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

	// 3. ���� ��ü�������� ���
	public ArrayList<MemberDto> readAll() { // ctrl + shift+ o
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		try {
			Connection conn = ConnUtil.open();
			// ������ ������ �����
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

	// 4. ���� ���� ���
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
	// 5. ���� ���� ���

}
