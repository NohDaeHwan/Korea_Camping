package com.nolja.home.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.nolja.home.config.DB;
import com.nolja.home.dto.Comment;

public class CommentDao {
	private static CommentDao commentDao = new CommentDao();
	
	public static CommentDao getCommentDao() {
		return commentDao;
	}
	
	public int createComment(int boardId, int userId, String comment) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "INSERT INTO comment(boardId, userId, comment, createDate) VALUES(?, ?, ?, now())";
        try {
        		pstmt = conn.prepareStatement(sql);       
        		pstmt.setInt(1, boardId);
        		pstmt.setInt(2, userId);
        		pstmt.setString(3, comment);
            	int result = pstmt.executeUpdate();           	
    			return result;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt);
        }     
		return 0;
	}

	public ArrayList<Comment> getBoardComment(int boardId) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<Comment> comments = new ArrayList<Comment>();
	    String sql = "SELECT c.id, u.userId, c.boardId, c.comment, c.createDate, c.modifyDate "
	    		+ "FROM comment as c inner join board as b on c.boardId = b.id "
	    		+ "inner join user as u on c.userId = u.id WHERE c.boardId = ?";
        try {
        		pstmt = conn.prepareStatement(sql);       
        		pstmt.setInt(1, boardId);
            	rs = pstmt.executeQuery(); 
            	while (rs.next()) {
            		Comment comment = new Comment();
            		comment.setId(rs.getInt("id"));
            		comment.setUserId(rs.getString("userId"));
            		comment.setBoardId(rs.getInt("boardId"));
            		comment.setComment(rs.getString("comment"));
            		comment.setCreateDate(rs.getTimestamp("createDate"));
            		comment.setModifyDate(rs.getTimestamp("modifyDate"));
            		comments.add(comment);
            	}
    			return comments;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt);
        }     
		return null;
	}
	
	public int deleteBoardComment(int boardId) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "DELETE FROM comment WHERE boardId = ?";
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
