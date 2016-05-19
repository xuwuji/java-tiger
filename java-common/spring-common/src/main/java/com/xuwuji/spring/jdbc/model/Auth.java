package com.xuwuji.spring.jdbc.model;

public class Auth {

	private String username;
	private String password;
	private long authority;

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

	public long getAuthority() {
		return authority;
	}

	public void setAuthority(long authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "Auth [username=" + username + ", password=" + password + ", authority=" + authority + "]";
	}

}
