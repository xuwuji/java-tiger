package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.TreeSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.BrandDao;
import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.model.Brand;
import com.xuwuji.eshop.util.EshopConfigUtil;

import net.sourceforge.pinyin4j.PinyinHelper;

@Controller
@RequestMapping(value = "/brand")
public class BrandController {
	@Autowired
	private BrandDao brandDao;
	@Autowired
	private EshopConfigUtil eshopConfigUtil;
	@Autowired
	private String brandRecommendList;
	@Autowired
	private ProductDao productDao;

	@RequestMapping(value = "/getAlphaBrandList", method = RequestMethod.GET)
	@ResponseBody
	public AlphaBrandList getAlphaBrandList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Brand/getAlphaBrandList");
		List<Brand> list = new ArrayList<Brand>();
		list = brandDao.getAll();
		AlphaBrandList alphaBrandList = new AlphaBrandList();
		for (Brand brand : list) {
			// ����ƴ����һ����ĸ
			String firstLetterCN = getFirstLetter(brand.getBrandCN()).substring(0, 1).toUpperCase();
			// Ӣ�ĵ�һ����ĸ
			String firstLetterEN = brand.getBrandEN().substring(0, 1).toUpperCase();
			if (firstLetterCN.equals(firstLetterEN)) {
				alphaBrandList = builAplhaBrandList(brand, alphaBrandList, firstLetterCN);
			} else {
				alphaBrandList = builAplhaBrandList(brand, alphaBrandList, firstLetterCN);
				alphaBrandList = builAplhaBrandList(brand, alphaBrandList, firstLetterEN);
			}

		}
		return alphaBrandList;
	}

	@RequestMapping(value = "/getAlphaBrandListByCountry", method = RequestMethod.GET)
	@ResponseBody
	public AlphaBrandList getAlphaBrandListByCountry(HttpServletRequest request, HttpServletResponse response) {
		String country = request.getParameter("country");
		List<Brand> list = new ArrayList<Brand>();
		list = brandDao.getActiveAllByCountry(country);
		AlphaBrandList alphaBrandList = new AlphaBrandList();
		for (Brand brand : list) {
			// ����ƴ����һ����ĸ
			String firstLetterCN = getFirstLetter(brand.getBrandCN()).substring(0, 1).toUpperCase();
			// Ӣ�ĵ�һ����ĸ
			String firstLetterEN = brand.getBrandEN().substring(0, 1).toUpperCase();
			if (firstLetterCN.equals(firstLetterEN)) {
				alphaBrandList = builAplhaBrandList(brand, alphaBrandList, firstLetterCN);
			} else {
				alphaBrandList = builAplhaBrandList(brand, alphaBrandList, firstLetterCN);
				alphaBrandList = builAplhaBrandList(brand, alphaBrandList, firstLetterEN);
			}

		}
		return alphaBrandList;
	}

	@RequestMapping(value = "/getById", method = RequestMethod.GET)
	@ResponseBody
	public Brand getById(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Brand/getById");
		List<Brand> list = new ArrayList<Brand>();
		list = brandDao.getById(id);
		if (list.size() == 1) {
			Brand brand = list.get(0);
			brand.setCountryFlagImg(
					eshopConfigUtil.getParam(eshopConfigUtil.COUNTRY_FLAG_BASE) + brand.getCountry() + ".jpg");
			brand.setImgUrl(eshopConfigUtil.getParam(eshopConfigUtil.BRAND_IMG_BASE) + brand.getId() + ".jpg");
			return brand;
		}
		return null;
	}

	@RequestMapping(value = "/getByIds", method = RequestMethod.GET)
	@ResponseBody
	public List<Brand> getByIds(@RequestParam("ids") String ids, HttpServletRequest request,
			HttpServletResponse response) {
		List<Brand> list = new ArrayList<Brand>();
		List<Brand> result = new ArrayList<Brand>();
		Set<String> idsList = new HashSet<String>();
		String[] temp = ids.split(",");
		for (String t : temp) {
			idsList.add(t);
		}
		list = brandDao.getByIds(idsList);
		for (Brand brand : list) {
			brand.setImgUrl(eshopConfigUtil.getParam(eshopConfigUtil.BRAND_IMG_BASE) + brand.getId() + ".jpg");
			result.add(brand);
		}
		return result;
	}

	@RequestMapping(value = "/getHomeRecommend", method = RequestMethod.GET)
	@ResponseBody
	public List<Brand> getHomeRecommend(HttpServletRequest request, HttpServletResponse response) {
		List<Brand> list = new ArrayList<Brand>();
		for (String id : brandRecommendList.split(",")) {
			Brand brand = brandDao.getById(id).get(0);
			brand.setHomeImg(
					eshopConfigUtil.getParam(eshopConfigUtil.BRAND_IMG_BASE) + "home-" + brand.getId() + ".jpg");
			brand.setProducts(productDao.getActiveByBrandId(String.valueOf(brand.getId())));
			list.add(brand);
		}
		return list;
	}

	@RequestMapping(value = "/getActiveCountry", method = RequestMethod.GET)
	@ResponseBody
	public List<String> getActiveCountry(HttpServletRequest request, HttpServletResponse response) {
		List<String> list = new ArrayList<String>();
		list = brandDao.getActiveCountry();
		return list;
	}

	class AlphaBrandList {
		private HashMap<String, List<Brand>> brandsMap = new HashMap<String, List<Brand>>();
		private TreeSet<String> letters = new TreeSet<String>();

		public HashMap<String, List<Brand>> getBrandsMap() {
			return brandsMap;
		}

		public void setBrandsMap(HashMap<String, List<Brand>> brandsMap) {
			this.brandsMap = brandsMap;
		}

		public TreeSet<String> getLetters() {
			return letters;
		}

		public void setLetters(TreeSet<String> letters) {
			this.letters = letters;
		}

	}

	private String getFirstLetter(String name) {
		char[] charArray = name.toCharArray();
		StringBuilder pinyin = new StringBuilder();
		for (int i = 0; i < charArray.length; i++) {
			if (Character.toString(charArray[i]).matches("[\\u4E00-\\u9FA5]+")) {
				pinyin.append(PinyinHelper.toHanyuPinyinStringArray(charArray[i])[0]);
			} else {
				pinyin.append(charArray[i]);
			}
		}
		return pinyin.substring(0, 1);
	}

	private AlphaBrandList builAplhaBrandList(Brand brand, AlphaBrandList alphaBrandList, String firstLetter) {

		HashMap<String, List<Brand>> brandMap = alphaBrandList.getBrandsMap();
		TreeSet<String> letters = alphaBrandList.getLetters();
		letters.add(firstLetter);
		if (brandMap.containsKey(firstLetter)) {
			List<Brand> list = brandMap.get(firstLetter);
			list.add(brand);
			brandMap.put(firstLetter, list);
		} else {
			List<Brand> list = new ArrayList<Brand>();
			list.add(brand);
			brandMap.put(firstLetter, list);
		}
		return alphaBrandList;
	}

}
