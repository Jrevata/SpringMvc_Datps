package com.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.UserDao;
import com.entities.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {

	@Autowired
	SessionFactory session;
	
	public List<User> list() {
	
		return session.getCurrentSession().createQuery("from users").list();
	
	}

	public boolean delete(User user) {
		try {
			session.getCurrentSession().delete(user);
		}catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean saveOrUpdate(User user) {
		session.getCurrentSession().saveOrUpdate(user);
		return true;
	}

}
