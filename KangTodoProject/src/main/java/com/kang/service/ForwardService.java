package com.kang.service;

//Redirect 정보와 View 페이지의 경로 정보를 저장하는 클래스
public class ForwardService {
	
	/*
	 * Redirect  정보를 저장 하는 변수임니당
	 * 이 값이 true이면 Redirect 시키고 false 이면 Forward 시킨당.
	 */
	private boolean isRedirect = false;
	
	//View 페이지 경로 정보를 저장하는 변수
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
