package it.upload;

import it.util.ConnUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UploadDao {
	public int createOne(UploadDto dto) {
		int r = 0;
		try {
			// 1. 드라이버 검색 연결
			Connection conn = ConnUtil.open();
			// 2. 준비
			String sql = "insert into upload values(upload_seq.nextval,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getInfo());
			ps.setString(2, dto.getFilename());
			ps.setString(3, dto.getFileaddress());
			ps.setString(4, dto.getFilelink());
			// 3. 수행
			r = ps.executeUpdate();
			// 4. 자원반납
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r;
	}

	public ArrayList<UploadDto> readAll() {
		ArrayList<UploadDto> list = new ArrayList<UploadDto>();
		try {
			Connection conn = ConnUtil.open();
			String sql = "select * from upload order by num desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UploadDto t = new UploadDto();
				t.setFileaddress(rs.getString("fileaddress"));
				t.setFilelink(rs.getString("filelink"));
				t.setFilename(rs.getString("filename"));
				t.setInfo(rs.getString("info"));
				t.setNum(rs.getInt("num"));
				list.add(t);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// -------------------------------------------------------------
	public ArrayList<UploadDto> readSome(String word) {
		ArrayList<UploadDto> list = new ArrayList<UploadDto>();
		try {
			Connection conn = ConnUtil.open();
			String sql = "select * from upload where info like ? or filename like ? order by num desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, "%" + word + "%");
			ps.setString(2, "%" + word + "%");
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UploadDto t = new UploadDto();
				t.setFileaddress(rs.getString("fileaddress"));
				t.setFilelink(rs.getString("filelink"));
				t.setFilename(rs.getString("filename"));
				t.setInfo(rs.getString("info"));
				t.setNum(rs.getInt("num"));
				list.add(t);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// ----------------------------------------------------------
}
