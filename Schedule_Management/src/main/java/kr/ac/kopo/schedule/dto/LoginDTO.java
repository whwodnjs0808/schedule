package kr.ac.kopo.schedule.dto;

// dto : DB와 가까운 VO와는 달리 화면과 가깝다. 그래서 화면에서 전달되는 데이터를 수집하는 용도로 사용하는 경우가 많다. 

public class LoginDTO {

	private String userid;
	private String password;
	
	private boolean useCookie;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	
	
}
