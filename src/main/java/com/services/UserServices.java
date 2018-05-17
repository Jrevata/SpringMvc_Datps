package com.services;

import java.util.List;

import com.entities.User;

public interface UserServices {

	public List<User> list();
	public boolean delete(User user);
	public boolean saveOrUpdate(User user);
	
}
