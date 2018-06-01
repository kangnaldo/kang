package com.kang.dao;

import com.kang.bean.User;

public interface TodoDao {
	public boolean userInsert(User user); // 회원가입
	public boolean userOverlapCk(String id);//아이디 중복처리
	public User login(String id, String password);
}
