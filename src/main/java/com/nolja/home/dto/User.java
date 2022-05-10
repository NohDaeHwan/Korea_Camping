package com.nolja.home.dto;

import java.sql.Timestamp;

public class User {
	private int id;
	private String userId;
	private String userPassword;
	private String userEmail;
	private String userAddress;
	private String userSteaming;
	private Timestamp createDate;
	
	public User() {}
	
	public User(String userId, String userPassword, String userEmail, String userAddress) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
	}
	
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getUserSteaming() {
		return userSteaming;
	}

	public void setUserSteaming(String userSteaming) {
		this.userSteaming = userSteaming;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
}
