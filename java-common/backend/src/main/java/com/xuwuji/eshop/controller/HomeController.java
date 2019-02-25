package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.model.Banner;
import com.xuwuji.eshop.model.BannerItem;
import com.xuwuji.eshop.model.Category;
import com.xuwuji.eshop.model.Img;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.model.Theme;

@Controller
@RequestMapping(value = "/home")
public class HomeController {

	@RequestMapping(value = "/banner/1", method = RequestMethod.GET)
	@ResponseBody
	public Banner getBannerData(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<BannerItem> items = new ArrayList<BannerItem>();
		Img img = new Img();
		img.setId(1);
		img.setUrl("http://i2.bvimg.com/677237/ba590505ced58030.jpg");
		BannerItem item1 = new BannerItem.Builder().bannerId("1").imgId("1").keyWord("first").id(1).img(img).build();

		Img img2 = new Img();
		img2.setId(2);
		img2.setUrl(
				"http://i2.bvimg.com/677237/7480ce7ac3ff6b3f.jpg");
		BannerItem item2 = new BannerItem.Builder().bannerId("2").imgId("2").keyWord("second").id(2).img(img2).build();

		items.add(item1);
		items.add(item2);
		Banner banner = new Banner();
		banner.setItems(items);
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
		Category category1 = new Category();
		category1.setId(1);
		category1.setName("新品上架");
		Category category2 = new Category();
		category2.setId(2);
		category2.setName("美妆");
		Category category3 = new Category();
		category3.setId(3);
		category3.setName("护肤");

		Product product1 = new Product();
		product1.setName("阿玛尼唇釉红管405");
		product1.setMainImgUrl("http://i2.bvimg.com/677237/cc92d8022c69f686.jpg");
		product1.setPrice(1.00);
		Product product2 = new Product();
		product2.setName("dior迪奥魅惑蓝金");
		product2.setMainImgUrl(
				"http://i2.bvimg.com/677237/03f00d1fa6c72ddc.jpg");
		product2.setPrice(2);
		Product product3 = new Product();
		product3.setName("雅诗兰黛 小棕瓶密集修护眼精华眼霜 抗皱 紧致轮廓 淡眼袋去干燥");
		product3.setMainImgUrl("http://i2.bvimg.com/677237/4a2151eaf802b7f6.jpg");
		product3.setPrice(3);
		Product product4 = new Product();
		product4.setName("4");
		product4.setMainImgUrl(
				"https://img-blog.csdnimg.cn/20181227174846262.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3N1cGVyZGFuZ2Jv,size_16,color_FFFFFF,t_70");
		product4.setPrice(4);
		Product product5 = new Product();
		product5.setName("5");
		product5.setMainImgUrl("https://www.baidu.com/img/baidu_jgylogo3.gif");
		product5.setPrice(5);
		Product product6 = new Product();
		product6.setName("6");
		product6.setMainImgUrl(
				"https://img-blog.csdnimg.cn/20181227174846262.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3N1cGVyZGFuZ2Jv,size_16,color_FFFFFF,t_70");
		product6.setPrice(6);
		Product product7 = new Product();
		product7.setName("7");
		product7.setMainImgUrl("https://www.baidu.com/img/baidu_jgylogo3.gif");
		product7.setPrice(7);
		Product product8 = new Product();
		product8.setName("8");
		product8.setMainImgUrl(
				"https://img-blog.csdnimg.cn/20181227174846262.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3N1cGVyZGFuZ2Jv,size_16,color_FFFFFF,t_70");
		product8.setPrice(8);
		Product product9 = new Product();
		product9.setName("9");
		product9.setMainImgUrl("https://www.baidu.com/img/baidu_jgylogo3.gif");
		product9.setPrice(9);
		List<Product> products1 = new ArrayList<Product>();
		products1.add(product1);
		products1.add(product1);
		products1.add(product1);
		products1.add(product2);
		products1.add(product3);
		products1.add(product3);
		products1.add(product1);
		products1.add(product2);
		products1.add(product3);
		category1.setProducts(products1);
		List<Product> products2 = new ArrayList<Product>();
		products2.add(product1);
		products2.add(product1);
		products2.add(product1);
		products2.add(product2);
		products2.add(product3);
		category2.setProducts(products2);
		List<Product> products3 = new ArrayList<Product>();
		products3.add(product1);
		products3.add(product2);
		products3.add(product3);
		category3.setProducts(products3);
		categories.add(category1);
		categories.add(category2);
		categories.add(category3);
		return categories;
	}



}
