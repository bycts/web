package ccit.byc.tamall.service;

import java.sql.SQLException;
import java.util.List;

import ccit.byc.tamall.admain.Category;
import ccit.byc.tamall.dao.CategoryDao;
/**
 * 
 * 分类模块业务层
 *
 */
public class CategoryService {
private CategoryDao categoryDao=new CategoryDao();
/**
 * 查询所有分类
 * @return
 */
public List<Category> findAll() {
	try {
		return categoryDao.findAll();
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}

}

public void add(Category category) {
	try {
		categoryDao.add(category);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}

public void edit(Category category) {
	try {
		categoryDao.edit(category);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}

public Category load(String cid) {
	try {
		return categoryDao.load(cid);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
	
}


public void delete(String cid) {
	try {
		categoryDao.delete(cid);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}

public List<Category> findParents() {
	try {
		return categoryDao.findParents();
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}
}