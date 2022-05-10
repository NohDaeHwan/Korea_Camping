package com.nolja.home.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.nolja.home.config.DB;
import com.nolja.home.dto.Board;

public class BoardDao {
	private static BoardDao boardDao = new BoardDao();
	
	public static BoardDao getBoardDao() {
		return boardDao;
	}
	
	public int createBoard(int userId, String title, String content) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "INSERT INTO board(userId, title, content, viewCount, createDate) VALUES(?, ?, ?, ?, now())";  
        try {
        		pstmt = conn.prepareStatement(sql);   
        		pstmt.setInt(1, userId);
        		pstmt.setString(2, title);
        		pstmt.setString(3, content);
        		pstmt.setInt(4, 0);
            	int result = pstmt.executeUpdate();
            	return result;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt);
        }     
		return 0;
	}

	public ArrayList<Board> getBoardList() {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<Board> boards = new ArrayList<Board>();
	    String sql = "SELECT b.id, u.userId, b.title, b.content, b.viewCount, b.createDate, b.modifyDate "
	    		+ "FROM board as b inner join user as u on b.userId = u.id";
        try {
        		pstmt = conn.prepareStatement(sql);       
            	rs = pstmt.executeQuery();
            	
            	while (rs.next()) {  
            		Board board = new Board();
            		board.setId(rs.getInt("id"));
    				board.setUserId(rs.getString("userId"));
    				board.setTitle(rs.getString("title"));
    				board.setContent(rs.getString("content"));
    				board.setViewCount(rs.getInt("viewCount"));
    				board.setCreateDate(rs.getTimestamp("createDate"));
    				board.setModifyDate(rs.getTimestamp("modifyDate"));
    				boards.add(board);
            	}
            	return boards;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt, rs);
        }     
		return null;
	}
	
	public Board searchBoard(int boardId) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT b.id, u.userId, b.title, b.content, b.viewCount, b.createDate, b.modifyDate "
	    		+ "FROM board as b inner join user as u on b.userId = u.id WHERE b.id = ?";
        try {
        		pstmt = conn.prepareStatement(sql);       
        		pstmt.setInt(1, boardId);
            	rs = pstmt.executeQuery();
            	
            	if (rs.next()) {  
            		Board board = new Board();
            		board.setId(rs.getInt("id"));
    				board.setUserId(rs.getString("userId"));
    				board.setTitle(rs.getString("title"));
    				board.setContent(rs.getString("content"));
    				board.setViewCount(rs.getInt("viewCount"));
    				board.setCreateDate(rs.getTimestamp("createDate"));
    				board.setModifyDate(rs.getTimestamp("modifyDate"));
    				return board;
            	}
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt, rs);
        }     
		return null;
	}

	public void viewCount(int boardId) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "UPDATE board SET viewCount = viewCount + 1 WHERE id = ?";   
        try {
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setInt(1, boardId);       
            	pstmt.executeUpdate();
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt);
        }     		
	}

	public int modifyBoard(int boardId, String title, String content) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "UPDATE board SET title = ?, content = ? WHERE id = ?";  
        try {
        		pstmt = conn.prepareStatement(sql);   
        		pstmt.setString(1, title);
        		pstmt.setString(2, content);
        		pstmt.setInt(3, boardId);
            	int result = pstmt.executeUpdate();
            	return result;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt);
        }     
		return 0;
	}

	public int deleteBoard(int boardId) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "DELETE FROM board WHERE id = ?";  
        try {
        		pstmt = conn.prepareStatement(sql);   
        		pstmt.setInt(1, boardId);
            	int result = pstmt.executeUpdate();
            	return result;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt);
        }     
		return 0;
	}
}
