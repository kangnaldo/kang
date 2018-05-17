package org.study.dao;

public class UserService {

	public boolean isValidUser(User user) {
		
		if (user.getPassword().equals("servlet")) {
			user.setName("이명박");
			return true;
		}
		
		return false;
	}
	
	public Profile getProfile(String id) {
		Profile profile = new Profile(id);
		
		profile.setName("이명박");
		profile.setDesc("다스는 누구의 것인가?");
		
		return profile;
	}
}
