package com.nolja.home.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.nolja.home.config.DB;
import com.nolja.home.dto.User;

@Repository
public class UserDao {
	private static UserDao userDao = new UserDao();
	
	public static UserDao getUserDao() {
		return userDao;
	}

	public int userRegister(String userId, String userPassword, String userEmail, String userAddress) {		
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "INSERT INTO user(userId, userPassword, userEmail, userAddress, userSteaming, createDate) VALUES(?,?,?,?,?,now())";
        try {
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setString(1, userId);
        		pstmt.setString(2, userPassword);
        		pstmt.setString(3, userEmail);
        		pstmt.setString(4, userAddress);
        		pstmt.setString(5, "");
        
            	int result = pstmt.executeUpdate();         		
                return result;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt);
        }     
		return 0;
	}

	public User userLogin(String userId, String userPassword) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT * FROM user WHERE userId = ? AND userPassword = ?";
        try {
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setString(1, userId);
        		pstmt.setString(2, userPassword);
        
            	rs = pstmt.executeQuery();
            	if (rs.next()) {            		
            		User user = new User();
            		user.setId(rs.getInt("id"));
            		user.setUserId(rs.getString("userId"));
            		user.setUserPassword(rs.getString("userPassword"));
            		user.setUserEmail(rs.getString("userEmail"));
            		user.setUserAddress(rs.getString("userAddress"));
            		user.setUserSteaming(rs.getString("userSteaming"));
            		user.setCreateDate(rs.getTimestamp("createDate"));
            		return user;
            	}
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt, rs);
        }     
		return null;
	}
	
	public int userIdCheck(String userIdCheck) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT * FROM user WHERE userId = ?";
        try {
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setString(1, userIdCheck);
        
            	rs = pstmt.executeQuery();
            	if (rs.next()) {            		
            		return 1;
            	}
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt, rs);
        }     
		return 0;
	}

	public int steamingAdd(User user, String boardId) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = null;
	    if (user.getUserSteaming() != "") sql = "UPDATE user SET userSteaming = Concat(userSteaming, '', ?) WHERE userId = ?";
	    else sql = "UPDATE user SET userSteaming = ?  WHERE userId = ?";	    
        try {
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setString(1, boardId + " ");
        		pstmt.setString(2, user.getUserId());       
            	int result = pstmt.executeUpdate();
            	return result;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt);
        }     
		return 0;
	}

	public int steamingDelete(User user, String boardId) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "UPDATE user SET userSteaming = REPLACE(userSteaming, '"+boardId+" ', '') WHERE userId = ?";   
        try {
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setString(1, user.getUserId());       
            	int result = pstmt.executeUpdate();
            	return result;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt);
        }     
		return 0;
	}

	public User userSearch(String userId, String userPassword) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT * FROM user WHERE userId = ? AND userPassword = ?";
        try {
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setString(1, userId);
        		pstmt.setString(2, userPassword);
        
            	rs = pstmt.executeQuery();
            	if (rs.next()) {   
            		User user = new User();
            		user.setId(rs.getInt("id"));
            		user.setUserId(rs.getString("userId"));
            		user.setUserPassword(rs.getString("userPassword"));
            		user.setUserEmail(rs.getString("userEmail"));
            		user.setUserAddress(rs.getString("userAddress"));
            		user.setUserSteaming(rs.getString("userSteaming"));
            		user.setCreateDate(rs.getTimestamp("createDate"));
            		return user;
            	}
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt, rs);
        }     
		return null;
	}
}
