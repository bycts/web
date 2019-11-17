package ccit.byc.tamall.service;

import java.sql.SQLException;
import java.util.List;

import ccit.byc.tamall.admain.Category;
import ccit.byc.tamall.admain.User;
import ccit.byc.tamall.dao.UserDao;
import cn.itcast.commons.CommonUtils;

public class UserService {
	private UserDao userDao = new UserDao();

	/**
	 * 用户名注册校验
	 * 
	 * @param loginname
	 * @return
	 */

	public boolean ajaxVaildatename(String loginname) throws Exception {
		try {
			return userDao.ajaxVaildatename(loginname);

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void regist(User user) {
		/*
		 * 1. 数据的补齐
		 */

		user.setUid(CommonUtils.uuid());
		user.setStatus(0);
		user.setActivationCode(CommonUtils.uuid() + CommonUtils.uuid());
		/*
		 * 2. 向数据库插入
		 */
		try {
			userDao.add(user);
		} catch (SQLException e) {

			throw new RuntimeException(e);
		}

	}

	/**
	 * 登录功能
	 * 
	 * @param user
	 * @return
	 */
	public User login(User user) {
		user.setStatus(1);
		try {
			
			return userDao.findByLoginnameAndLoginpass(user.getLoginname(), user.getLoginpass());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<User> findAll() {
		try {
			return userDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	
	public void updateStatus(String code) {
		User user;
		try {
			user = userDao.findByUser(code);
			userDao.updateStatus(user.getLoginname(), 1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
