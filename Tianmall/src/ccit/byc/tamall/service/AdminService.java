package ccit.byc.tamall.service;

import java.sql.SQLException;

import ccit.byc.tamall.admain.Admin;
import ccit.byc.tamall.dao.AdminDao;

public class AdminService {
	private AdminDao adminDao=new AdminDao();
	/**
	 * 登录功能
	 */
	public Admin login(Admin admin) {
		try {
			return adminDao.find(admin.getAdminname(), admin.getAdminpwd());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
