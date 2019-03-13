package com.xuwuji.eshop.controller;

import java.util.ArrayList;
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
import com.xuwuji.eshop.model.Banner;
import com.xuwuji.eshop.model.BannerItem;
import com.xuwuji.eshop.model.Category;
import com.xuwuji.eshop.model.Img;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.model.Theme;
import com.xuwuji.eshop.util.EshopConfigUtil;

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
	private EshopConfigUtil eshopConfigUtil;

	@RequestMapping(value = "/banner/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Banner getBannerData(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		Banner banner = new Banner();
		banner.setBannerId(id);
		List<BannerItem> list = new ArrayList<BannerItem>();
		list = bannerDao.getAll();
		for (BannerItem bannerItem : list) {
			bannerItem.setImgUrl(eshopConfigUtil.getParam(EshopConfigUtil.BANNER_IMG_BASE) + bannerItem.getId() + ".jpg");
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
	public List<Category> getProductPartData(HttpServletRequest request, HttpServletResponse response) {
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
					imgUrls.add(eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE) + product.getId() + "-" + i + ".jpg");
				}
				product.setImgUrls(imgUrls);
				String mainImgUrl = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE) + product.getId() + "-0.jpg";
				product.setMainImgUrl(mainImgUrl);
			}
			c.setProducts(products);
		}
		return categories;
	}

}
