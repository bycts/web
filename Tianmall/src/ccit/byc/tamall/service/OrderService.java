package ccit.byc.tamall.service;

import java.sql.SQLException;
import java.util.List;

import ccit.byc.tamall.admain.Order;
import ccit.byc.tamall.dao.OrderDao;
import cn.itcast.jdbc.JdbcUtils;

public class OrderService {
private OrderDao orderDao=new OrderDao();



/**
 * 我的订单
 * @param uid
 * @param pc
 * @return
 */
public List<Order> myOrders(String uid) {
	try {
		JdbcUtils.beginTransaction();
		List<Order> pb = orderDao.findByUser(uid);
		JdbcUtils.commitTransaction();
		return pb;
	} catch (SQLException e) {
		try {
			JdbcUtils.rollbackTransaction();
		} catch (SQLException e1) {}
		throw new RuntimeException(e);
	}
}



/**
 * 生成订单
 * @param order
 */
public void createOrder(Order order) {
	try {
		JdbcUtils.beginTransaction();
		orderDao.add(order);
		JdbcUtils.commitTransaction();
	} catch (SQLException e) {
		try {
			JdbcUtils.rollbackTransaction();
		} catch (SQLException e1) {}
		throw new RuntimeException(e);
	}
}


/**
 * 加载订单
 * @param oid
 * @return
 */
public Order load(String oid) {
	try {
		JdbcUtils.beginTransaction();
		Order order = orderDao.load(oid);
		JdbcUtils.commitTransaction();
		return order;
	} catch (SQLException e) {
		try {
			JdbcUtils.rollbackTransaction();
		} catch (SQLException e1) {}
		throw new RuntimeException(e);
	}
}


/**
 * 修改订单状态
 * @param oid
 * @param status
 */
public void updateStatus(String oid, int status) {
	try {
		orderDao.updateStatus(oid, status);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}

/**
 * 查询订单状态
 * @param oid
 * @return
 */
public int findStatus(String oid) {
	try {
		return orderDao.findStatus(oid);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}



public List<Order> findAll() {
	try {
		JdbcUtils.beginTransaction();
		List<Order> pb = orderDao.findAll();
		JdbcUtils.commitTransaction();
		return pb;
	} catch (SQLException e) {
		try {
			JdbcUtils.rollbackTransaction();
		} catch (SQLException e1) {}
		throw new RuntimeException(e);
	}
}


}
