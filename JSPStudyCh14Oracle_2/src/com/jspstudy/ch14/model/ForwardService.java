package com.jspstudy.ch14.model;

// Redirect 정보와 View 페이지의 경로 정보를 저장하는 클래스
public class ForwardService {
	
	/* Redirect 정보를 저장하는 변수
	 * 이 값이 true면 Redirect를 시키고 false면 Forward 시킨다.
	 **/
	private boolean isRedirect = false;
	
	// View 페이지 경로 정보를 저장하는 변수
	private String path = null;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
