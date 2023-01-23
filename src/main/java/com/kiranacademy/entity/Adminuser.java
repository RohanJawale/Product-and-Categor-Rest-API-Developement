package com.kiranacademy.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Adminuser {
	@Id
	private String username;
	private String password;
	
	public Adminuser(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public Adminuser() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Adminuser [username=" + username + ", password=" + password + "]";
	}
	
	
	
	
}
