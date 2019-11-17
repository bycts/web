package ccit.byc.tamall.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import ccit.byc.tamall.admain.Order;
import ccit.byc.tamall.admain.OrderItem;
import ccit.byc.tamall.admain.Product;
import ccit.byc.tamall.admain.User;
import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

public class OrderDao {
private QueryRunner  qr=new TxQueryRunner();

public List<Order> findByUser(String uid) throws SQLException {
	String sql="select * from t_order where uid=?";
	List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler(),uid);
	return toOrderList(mapList);
}


private List<Order> toOrderList(List<Map<String, Object>> mapList) throws SQLException {
	List<Order> orderList = new ArrayList<Order>();
	for(Map<String,Object> map : mapList) {
		Order order = toOrder(map);
		orderList.add(order);
		loadOrderItem(order);
	}
	
	return orderList;
}

/*
 * 把一个Map转换成一个Order
 */
private Order toOrder(Map<String, Object> map) {
	if (map == null || map.size() == 0)
		return null;
	Order order = CommonUtils.toBean(map, Order.class);	
	User user = CommonUtils.toBean(map, User.class);	
	order.setOwner(user);
	return order;
}
/*
 * 为指定的order载它的所有OrderItem
 */
private void loadOrderItem(Order order) throws SQLException {
	/*
	 * 1. 给sql语句select * from t_orderitem where oid=?
	 * 2. 执行之，得到List<OrderItem>
	 * 3. 设置给Order对象
	 */
	String sql = "select * from t_orderitem where oid=?";
	List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler(), order.getOid());
	List<OrderItem> orderItemList = toOrderItemList(mapList);
	order.setOrderItemList(orderItemList);
}
/**
 * 把多个Map转换成多个OrderItem
 * @param mapList
 * @return
 */
private List<OrderItem> toOrderItemList(List<Map<String, Object>> mapList) {
	List<OrderItem> orderItemList = new ArrayList<OrderItem>();
	for(Map<String,Object> map : mapList) {
		OrderItem orderItem = toOrderItem(map);
		orderItemList.add(orderItem);
	}
	return orderItemList;
}

/*
 * 把一个Map转换成一个OrderItem
 */
private OrderItem toOrderItem(Map<String, Object> map) {
	OrderItem orderItem = CommonUtils.toBean(map, OrderItem.class);
	Product product = CommonUtils.toBean(map, Product.class);
	orderItem.setProduct(product);
	return orderItem;
}


/**
 * 生成订单
 * @param order
 * @throws SQLException 
 */
public void add(Order order) throws SQLException {
	/*
	 * 1. 插入订单
	 */
	String sql = "insert into t_order values(?,?,?,?,?,?)";
	Object[] params = {order.getOid(), order.getOrdertime(),
			order.getTotal(),order.getStatus(),order.getAddress(),
			order.getOwner().getUid()};
	qr.update(sql, params);
	
	/*
	 * 2. 循环遍历订单的所有条目,让每个条目生成一个Object[]
	 * 多个条目就对应Object[][]
	 * 执行批处理，完成插入订单条目
	 */
	sql = "insert into t_orderitem values(?,?,?,?,?,?,?,?)";
	int len = order.getOrderItemList().size();
	Object[][] objs = new Object[len][];
	for(int i = 0; i < len; i++){
		OrderItem item = order.getOrderItemList().get(i);
		objs[i] = new Object[]{item.getOrderItemId(),item.getQuantity(),
				item.getSubtotal(),item.getProduct().getBid(),
				item.getProduct().getBname(),item.getProduct().getOriginalPrice(),
				item.getProduct().getBigimg(),order.getOid()};
	}
	qr.batch(sql, objs);
}

/**
 * 加载订单
 * @param oid
 * @return
 * @throws SQLException
 */
public Order load(String oid) throws SQLException {
	String sql = "select * from t_order where oid=?";
	Order order = qr.query(sql, new BeanHandler<Order>(Order.class), oid);
	loadOrderItem(order);//为当前订单加载它的所有订单条目
	return order;
}

/**
 * 查询订单状态
 * @param oid
 * @return
 * @throws SQLException 
 */
public int findStatus(String oid) throws SQLException {
	String sql = "select status from t_order where oid=?";
	Number number = (Number)qr.query(sql, new ScalarHandler(), oid);
	return number.intValue();
}

/**
 * 修改订单状态
 * @param oid
 * @param status
 * @throws SQLException
 */
public void updateStatus(String oid, int status) throws SQLException {
	String sql = "update t_order set status=? where oid=?";
	qr.update(sql, status, oid);
}

/*后台*/
public List<Order> findAll() throws SQLException {
	String sql="select * from t_order";
	List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler());
	
	return toOrderList(mapList);
}

}
