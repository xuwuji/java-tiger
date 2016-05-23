package com.xuwuji.news.test.dao;

import java.util.ArrayList;

import org.junit.Test;

import com.xuwuji.news.dao.MetaDao;

public class MetaDaoTest {

	@Test
	public void findId() {
		MetaDao dao = new MetaDao();
		ArrayList<Integer> list = (ArrayList<Integer>) dao.findId("教育", "", "");
		System.out.println(list);
	}

	@Test
	public void findId2() {
		MetaDao dao = new MetaDao();
		ArrayList<Integer> list = (ArrayList<Integer>) dao.findId2("教育", "", "");
		System.out.println(list);
	}

	// @Test
	public void insertId() {
		MetaDao dao = new MetaDao();
		dao.insert("a", "b", "c");
	}

	// @Test
	public void getTypes() {
		MetaDao dao = new MetaDao();
		System.out.println(dao.getTypes());
	}

	// @Test
	public void getBigCategoryByType() {
		MetaDao dao = new MetaDao();
		for (String type : dao.getTypes()) {
			System.out.println(dao.getBigCategoryByType(type));
		}
	}

	// @Test
	public void getsubCategoryByBig() {
		MetaDao dao = new MetaDao();
		for (String type : dao.getTypes()) {
			for (String bigCategory : dao.getBigCategoryByType(type)) {
				System.out.println(dao.getsubCategoryByBig(bigCategory));
			}
		}
	}

}
