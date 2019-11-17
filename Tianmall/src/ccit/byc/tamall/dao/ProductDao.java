package ccit.byc.tamall.dao;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import ccit.byc.tamall.admain.Category;
import ccit.byc.tamall.admain.Product;
import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

public class ProductDao {
	private QueryRunner qr = new TxQueryRunner();
	/**
	 * 按书名模糊查询
	 * 
	 * @param bname
	 * @return
	 * @throws SQLException
	 */
	public List<Product> findByBname(String bname) throws SQLException {
		String sql = "SELECT * FROM t_product where bname like '%"+bname+"%' ";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler());
		return toProductList(mapList);
		
	}
	/**
	 * 按分类查询
	 * @param cid
	 * @return
	 * @throws SQLException 
	 */
	public List<Product> findByCategory(String cid) throws SQLException {
		String sql = "SELECT * FROM t_product b, t_category c WHERE b.cid=c.cid AND b.cid=?";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler(),cid);
		return toProductList(mapList);
	}
	

	private List<Product> toProductList(List<Map<String, Object>> mapList) {
		List<Product> productList=new ArrayList<Product>();//创建一个空集合
		for(Map<String, Object> map:mapList) {
			Product product=toProduct(map);
			productList.add(product);
	}
		return productList;
	}
	
	private Product toProduct(Map<String, Object> map) {
		if (map == null || map.size() == 0)
			return null;
	Product product=CommonUtils.toBean(map, Product.class);
	Category category = CommonUtils.toBean(map, Category.class);
	product.setCategory(category);
	return product;
	}
	/**
	 * 按bid查询
	 * 
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public Product findByBid(String bid) throws SQLException {
		String sql = "SELECT * FROM t_product b, t_category c WHERE b.cid=c.cid AND b.bid=?";
		Map<String, Object> map = qr.query(sql, new MapHandler(), bid);
		
		Product product = CommonUtils.toBean(map, Product.class);
		
		Category category = CommonUtils.toBean(map, Category.class);
		// 两者建立关系
		product.setCategory(category);
		return product;
	}
	

	/*category  类型
	 * page 当前页
	 * pageSize 每页显示的条数
	 */

		//分页查找数据
		public  List<Product> findProducts(String cid,int currentPage,int pageCount) throws SQLException{
			//定义参数
			List<Object> prmts = new ArrayList<>();
			
			//查询的sql语句
			String sql = "select * from t_product where 1=1";
			
			//条件
			if(cid!=null && !"".equals(cid)){
				sql += " and cid = ?";
				prmts.add(cid);
			}
			
			//分页
			sql += " limit ?,?";
			int start = (currentPage - 1) * pageCount;
			prmts.add(start);
			prmts.add(pageCount);
			return qr.query(sql, new BeanListHandler<Product>(Product.class), prmts.toArray());
		}
		//查询类别的总记录数
				public long count(String cid) throws SQLException{
					String sql = "select count(*) from t_product where 1=1";
					
					long count = 0;
					if(cid != null && !"".equals(cid)){
						sql+= " and  cid = ?";
						count = (long) qr.query(sql, new ScalarHandler(),cid);
					}else{
						count = (long) qr.query(sql, new ScalarHandler());
					}
					
					return count;
				}
				

	/*后台*/
	
	public void add(Product product) throws SQLException {
		String sql = "insert into t_product(bid,bname,ptitle,originalPrice,promotionPrice,xiaoliang,pinglun,smallimg,bigimg,cid) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {product.getBid(),product.getBname(),product.getPtitle(),product.getOriginalPrice(),
				product.getPromotionPrice(),product.getXiaoliang(),product.getPinglun(),product.getSmallimg(),product.getBigimg(),product.getCategory().getCid() };
		qr.update(sql, params);
	}
	
	/**
	 * 删除
	 * @param bid
	 * @throws SQLException 
	 */
	public void delete(String bid) throws SQLException {
		String sql = "delete from t_product where bid=?";
		qr.update(sql, bid);
	}
	
	/**
	 * 修改
	 * @param 
	 * 		
	 * @throws SQLException 
	 */
	public void edit(Product product) throws SQLException {
		String sql = "update t_product set bname=?,ptitle=?,originalPrice=?,promotionPrice=?," +
				"xiaoliang=?,pinglun=?," +
				"cid=? where bid=?";
		Object[] params = {product.getBname(),product.getPtitle(),
				product.getOriginalPrice(),product.getPromotionPrice(),product.getXiaoliang(),
				product.getPinglun(), 
				product.getCategory().getCid(),product.getBid()};
		qr.update(sql, params);
	}
	
	public static void main(String[] args) throws SQLException {
		ProductDao dao=new ProductDao();
		String cid= "10";
		long count=dao.count(cid);
		//List<Product> books=dao.findBooks(category, 1, 4);
		System.out.println(count);
		/*for(Product b:books) {
			System.out.println(b);
		}*/
		}
}
