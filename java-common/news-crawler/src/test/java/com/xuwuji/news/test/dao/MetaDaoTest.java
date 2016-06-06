package com.xuwuji.news.test.dao;

import java.util.ArrayList;

import org.junit.Test;

import com.xuwuji.news.dao.MetaDao;
import com.xuwuji.news.model.Category;

public class MetaDaoTest {
	MetaDao dao = MetaDao.getInstance();

	// @Test
	public void findId() {

		ArrayList<Integer> list = (ArrayList<Integer>) dao.findId("教育", "", "");
		System.out.println(list);
	}

	// @Test
	public void findId2() {
		ArrayList<Integer> list = (ArrayList<Integer>) dao.findId2("教育", "", "");
		System.out.println(list);
	}

	// @Test
	public void insertId() {
		dao.insert("a", "b", "c");
	}

	// @Test
	public void getTypes() {
		System.out.println(dao.getTypes());
	}

	// @Test
	public void getBigCategoryByType() {
		for (String type : dao.getTypes()) {
			System.out.println(dao.getBigCategoryByType(type));
		}
	}

	// @Test
	public void getsubCategoryByBig() {
		for (String type : dao.getTypes()) {
			for (String bigCategory : dao.getBigCategoryByType(type)) {
				System.out.println(dao.getsubCategoryByBig(bigCategory));
			}
		}
	}

	@Test
	public void selectAll() {
		for (Category c : dao.selectAll()) {
			System.out.println(c.toString());
		}
	}

}
