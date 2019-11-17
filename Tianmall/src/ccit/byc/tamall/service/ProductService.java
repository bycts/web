package ccit.byc.tamall.service;

import java.sql.SQLException;
import java.util.List;


import ccit.byc.tamall.admain.Category;
import ccit.byc.tamall.admain.PageResult;
import ccit.byc.tamall.admain.Product;
import ccit.byc.tamall.dao.ProductDao;

public class ProductService {
private ProductDao productDao=new ProductDao();



public void delete(String bid) {
	try {
		productDao.delete(bid);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}


public void edit(Product product) {
	try {
		productDao.edit(product);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}

public Product load(String bid) {
	try {
		return productDao.findByBid(bid);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}
/**
 * 按分类查
 * @param cid
 * @param pc
 * @return
 */
public List<Product> findByCategory(String cid) {
	try {
		return productDao.findByCategory(cid);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}

/**
 * 按商品名查
 * @param bname
 * @param pc
 * @return
 */
public List<Product> findByBname(String bname) {
	try {
		return productDao.findByBname(bname);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}

public void add(Product product) {
	try {
		productDao.add(product);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}
//分类
public PageResult<Product> findPageProducts(int currentPage,int pageCount,String cid){
	try {
		//1.创建PageResult
		PageResult<Product> products = new PageResult<Product>();
		
		//2.获取总记录数
		long totalCount = productDao.count(cid);
		
		//3.计算总页数
		int totalPage = (int) Math.ceil(totalCount * 1.0 / pageCount) ;
		
		//4.查询数据库
		List<Product> list = productDao.findProducts(cid, pageCount, currentPage);
		
		//5.设置PageResult
		products.setCurrentPage(currentPage);//当前页
		/*pr.setPageCount(pageCount);//每页显示记录数
*/		products.setTotalCount(totalCount);//总记录数
        products.setTotalPage(totalPage);//总页数
        products.setList(list);
		
		return products;
	} catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
	return null;

}
}
