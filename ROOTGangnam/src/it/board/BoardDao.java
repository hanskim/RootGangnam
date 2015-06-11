package it.board;

import it.util.ConnUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDao {
	// 1. 글 등록
	public int createOne(BoardDto dto) {
		int r = 0;
		try {
			// 1. 드라이버 검색 연결
			Connection conn = ConnUtil.open();
			// 2. 준비
			String sql = "insert into board values(board_seq.nextval,?,?,?,?,0,sysdate,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getType());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			ps.setString(5, dto.getIp());
			// 3. 수행
			r = ps.executeUpdate();
			// 4. 자원반납
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r;
	} // end createOne.

	// 2. 글 목록 전체
	public ArrayList<BoardDto> readAll() {
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		// java.util.List // java.util.ArrayList
		try {
			Connection conn = ConnUtil.open();
			String sql = "select * from board order by num desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BoardDto tp = new BoardDto();
				tp.setNum(rs.getInt("num"));
				tp.setType(rs.getString("type"));
				tp.setTitle(rs.getString("title"));
				tp.setWriter(rs.getString("writer"));
				tp.setCount(rs.getInt("count"));
				tp.setRegdate(rs.getDate("regdate"));
				list.add(tp);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} // end selectAll

	// 3. 글 하나 
	public BoardDto readOne(int key) {
		BoardDto dto = null;
		try {
			Connection conn = ConnUtil.open();
			String sql = "select * from board where num=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, key);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setType(rs.getString("type"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setCount(rs.getInt("count"));
				dto.setRegdate(rs.getDate("regdate"));
				dto.setIp(rs.getString("ip"));
				dto.setContent(rs.getString("content"));
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	} // end readOne..

	
	public int upCount(int key) {
		int r=0;
		try {
			Connection conn = ConnUtil.open();
			String sql ="update board set count = count+1 where num=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, key);
			r = ps.executeUpdate();
			ps.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return r;
	}
	
	public int deleteOne(int key) {
		int r=0;
		try {
			Connection conn = ConnUtil.open();
			String sql ="delete from board where num=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, key);
			r = ps.executeUpdate();
			ps.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return r;
	}
}

// 수정 sql 문
// update 테이블명 set  열이름=값, 열이름=값, 열이름 =값     where ... 









