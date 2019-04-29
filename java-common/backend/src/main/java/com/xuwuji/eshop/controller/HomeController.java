package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.BannerDao;
import com.xuwuji.eshop.db.dao.CategoryDao;
import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.db.dao.SearchHistoryDao;
import com.xuwuji.eshop.db.dao.UserDao;
import com.xuwuji.eshop.db.dao.ViewHistoryDao;
import com.xuwuji.eshop.model.Banner;
import com.xuwuji.eshop.model.BannerItem;
import com.xuwuji.eshop.model.Category;
import com.xuwuji.eshop.model.Img;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.model.SearchHistory;
import com.xuwuji.eshop.model.SortEnum;
import com.xuwuji.eshop.model.Theme;
import com.xuwuji.eshop.model.User;
import com.xuwuji.eshop.model.UserState;
import com.xuwuji.eshop.model.ViewHistory;
import com.xuwuji.eshop.util.EshopConfigUtil;
import com.xuwuji.eshop.util.ProductUtil;

@Controller
@RequestMapping(value = "/home")
public class HomeController {
	@Autowired
	private BannerDao bannerDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ViewHistoryDao viewHistoryDao;
	@Autowired
	private SearchHistoryDao searchHistoryDao;

	@Autowired
	private ProductUtil productUtil;

	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@RequestMapping(value = "/banner/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Banner getBannerData(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		Banner banner = new Banner();
		banner.setBannerId(id);
		List<BannerItem> list = new ArrayList<BannerItem>();
		list = bannerDao.getActiveAllByBannerId(id);
		for (BannerItem bannerItem : list) {
			if (bannerItem.getImgUrl() == null || bannerItem.getImgUrl().isEmpty()) {
				bannerItem.setImgUrl(
						eshopConfigUtil.getParam(EshopConfigUtil.BANNER_IMG_BASE) + bannerItem.getId() + ".jpg");
			}
		}
		banner.setItems(list);
		return banner;
	}

	@RequestMapping(value = "/theme", method = RequestMethod.GET)
	@ResponseBody
	public List<Theme> getThemeData(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<Theme> themes = new ArrayList<Theme>();
		Theme theme1 = new Theme();
		theme1.setId(1);
		Img img1 = new Img();
		img1.setUrl("http://i2.bvimg.com/677237/cc92d8022c69f686.jpg");
		img1.setId(1);
		theme1.setImg(img1);
		themes.add(theme1);
		Theme theme2 = new Theme();
		Img img2 = new Img();
		img2.setId(2);
		img2.setUrl("http://i2.bvimg.com/677237/03f00d1fa6c72ddc.jpg");
		theme2.setImg(img2);
		themes.add(theme2);
		themes.add(theme2);
		themes.add(theme2);
		return themes;

	}

	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	@ResponseBody
	public List<Category> getRecommend(HttpServletRequest request, HttpServletResponse response) {
		List<Category> categories = new ArrayList<Category>();
		categories = categoryDao.getRecommend();
		for (Category c : categories) {
			int categoryId = c.getId();
			List<Product> products = new ArrayList<Product>();
			products = productDao.getActiveByCategory(String.valueOf(categoryId));
			System.out.println(eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE));
			for (Product product : products) {
				List<String> imgUrls = new ArrayList<String>();
				for (int i = 1; i < 5; i++) {
					imgUrls.add(eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE) + product.getId() + "-" + i
							+ ".jpg");
				}
				product.setImgUrls(imgUrls);
				String mainImgUrl = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE) + product.getId()
						+ "-0.jpg";
				product.setMainImgUrl(mainImgUrl);
			}
			c.setProducts(products);
		}
		return categories;
	}

	/**
	 * ��ҳ����ϲ��
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/like", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getLike(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		User user = new User();
		user.setOpenId(openId);
		user = userDao.getByCondition(user);
		List<Product> results = new ArrayList<Product>();
		HashSet<Integer> ids = new HashSet<Integer>();
		// recommend
		List<Category> categories = new ArrayList<Category>();
		categories = categoryDao.getRecommend();
		// 如果是新用户或者是没在user表中的里
		//if (user.getState() == null || user.getState().isEmpty() || user.getState().equals(UserState.NEW.getCode())) {
			for (Category c : categories) {
				int categoryId = c.getId();
				List<Product> products = new ArrayList<Product>();
				products = productDao.getActiveByCategory(String.valueOf(categoryId));
				productUtil.sort(products, SortEnum.SALE);
				if (products.size() > 10) {
					products = products.subList(0, 10);
				} else {
					products = products.subList(0, products.size());
				}
				for (Product product : products) {
					if (!ids.contains(product.getId())) {
						results.add(product);
						ids.add(product.getId());
					}
				}
			}
		//}
		// view history
		List<ViewHistory> viewHistoryList = viewHistoryDao.getAllByOpenId(openId);
		for (ViewHistory viewHistory : viewHistoryList) {
			String categoryId = viewHistory.getCategoryId();
			List<Product> products = new ArrayList<Product>();
			products = productDao.getActiveByCategory(String.valueOf(categoryId));
			products = productUtil.sort(products, SortEnum.SALE);
			if (products.size() > 10) {
				products = products.subList(0, 10);
			} else {
				products = products.subList(0, products.size());
			}
			for (Product product : products) {
				if (!ids.contains(product.getId())) {
					results.add(product);
					ids.add(product.getId());
				}
			}
		}
		// search kw history
		List<SearchHistory> searchHistoryList = searchHistoryDao.getAllByOpenId(openId);
		for (SearchHistory searchHistory : searchHistoryList) {
			String kw = searchHistory.getKw();
			List<Product> products = new ArrayList<Product>();
			products = productDao.getActiveByKW(kw);
			products = productUtil.sort(products, SortEnum.SALE);
			if (products.size() > 10) {
				products = products.subList(0, 10);
			} else {
				products = products.subList(0, products.size());
			}
			for (Product product : products) {
				if (!ids.contains(product.getId())) {
					results.add(product);
					ids.add(product.getId());
				}
			}
		}
		for (Product product : results) {
			// if (product.getMainImgUrl() == null ||
			// product.getMainImgUrl().isEmpty()) {
			String mainImgUrl = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE) + product.getId() + "-0.jpg";
			product.setMainImgUrl(mainImgUrl);
			// }
		}
		// max 100
		if (results.size() > 100) {
			results = results.subList(0, 100);
		}
		return results;
	}

}
