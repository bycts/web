package ccit.byc.tamall.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import ccit.byc.tamall.admain.User;
import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

public class UserDao {
	private QueryRunner qr = new TxQueryRunner();

	
	
	/**
	 * 校验用户名是否注册
	 * 
	 * @param loginname
	 * @return
	 * @throws SQLException
	 */
	public boolean ajaxVaildatename(String loginname) throws Exception {
		String sql = "select count(1) from t_user where loginname=?";
		Number number = (Number) qr.query(sql, new ScalarHandler(), loginname);
		return number.intValue() == 0;
	}

	/**
	 * 添加用户
	 * 
	 * @param user
	 * @throws SQLException
	 */
	public void add(User user) throws SQLException {
		String sql = "insert into t_user values(?,?,?,?,?)";
		Object[] params = { user.getUid(), user.getLoginname(), user.getLoginpass(), user.getStatus(),
				user.getActivationCode() };
		qr.update(sql, params);
	}

	/**
	 * login 按用户名和密码查询
	 * 
	 * @param loginname
	 * @param loginpass
	 * @return
	 * @throws SQLException
	 */
	public User findByLoginnameAndLoginpass(String loginname, String loginpass) throws SQLException {
		String sql = "select * from t_user where loginname=? and loginpass=?";
		return qr.query(sql, new BeanHandler<User>(User.class), loginname, loginpass);
	}
	
	
	public List<User> findAll() throws SQLException{
		String sql = "select * from t_User";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler());
		List<User> users = toUserList(mapList);
		for(User user:users) {
			
		}
		return users;
	}
	
	
	
	private List<User> toUserList(List<Map<String, Object>> mapList) {
		List<User> userList=new ArrayList<User>();//创建一个空集合
		for(Map<String, Object> map:mapList) {
			User user=toUser(map);
			userList.add(user);
	}
		return userList;
	}
	
	private User toUser(Map<String, Object> map) {
		if (map == null || map.size() == 0)
			return null;
		User user=CommonUtils.toBean(map, User.class);
	return user;
	}
	
	/**
	 * 修改用户状态
	 *
	 */
	public void updateStatus(String uid, int status) throws SQLException {
		String sql = "update t_user set status=? where uid=?";
		qr.update(sql, status, uid);
	}	
	
	public User findByUser(String code) throws SQLException {
		String sql = "select * from t_user where activationCode=?";
		return qr.query(sql, new BeanHandler<User>(User.class), code);
	}
}
