package com.xuwuji.eshop.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.model.SortEnum;
import com.xuwuji.eshop.util.EshopConfigUtil;
import com.xuwuji.eshop.util.ProductUtil;
import com.xuwuji.eshop.util.QRCodeUtil;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	@Autowired
	private ProductDao productDao;

	@Autowired
	private ProductUtil productUtil;

	@Autowired
	private QRCodeUtil qRCodeUtil;

	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	private String PRODUCT_IMG_BASE;

	private String PRODUCT_DETAIL_IMG_BASE;

	@Autowired
	public ProductController(EshopConfigUtil eshopConfigUtil) {
		PRODUCT_IMG_BASE = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE);
		PRODUCT_DETAIL_IMG_BASE = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_DETAIL_IMG_BASE);

	}

	/**
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/getQRCode/{id}", method = RequestMethod.GET)
	@ResponseBody
	public void getQRCode(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		@SuppressWarnings("static-access")
		byte[] result = qRCodeUtil.getQRCoderByte(id);
		response.setContentType("image/png");
		OutputStream os = response.getOutputStream();
		os.write(result);
		os.flush();
		os.close();
	}

	/**
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getActiveProductsByCategoryId", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getProductsByCategoryId(@RequestParam("id") String id, @RequestParam("sort") String sort,
			HttpServletRequest request, HttpServletResponse response) {
		List<Product> products = new ArrayList<Product>();
		SortEnum sortRequset = SortEnum.getByCode(sort);
		products = productDao.getActiveByCategory(id);
		products.forEach((p) -> p.setMainImgUrl(PRODUCT_IMG_BASE + p.getId() + "-0.jpg"));
		products = productUtil.sort(products, sortRequset);
		return products;
	}

	/**
	 * 
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Product getProductById(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		// 特殊情况，显示默认的商品
		if (id == null || id.equals("undefined")) {
			id = "1648";
		}
		String productId = id;
		Product product = productDao.getById(id);
		List<String> imgUrls = new ArrayList<String>();
		Stream.iterate(1, i -> i + 1).limit(4)
				.forEach(i -> imgUrls.add(PRODUCT_IMG_BASE + productId + "-" + i + ".jpg"));
		product.setImgUrls(imgUrls);
		// 获得需要展示详情的分类id
		String[] showDetailIds = eshopConfigUtil.getParam(eshopConfigUtil.SHOW_DETAIL_IDS).split(";");
		HashSet<String> detailIdsSet = new HashSet<>();
		Arrays.stream(showDetailIds).forEach(i -> detailIdsSet.add(i));
		String categoryId = product.getCategoryId();
		if (detailIdsSet.contains(categoryId)) {
			List<String> detailImgUrls = new ArrayList<String>();
			for (int i = 0; i < 6; i++) {
				String detailImgUrl = PRODUCT_DETAIL_IMG_BASE + productId + "-" + i + ".jpg";
				// 检查详情图片是否存在
				// if (HttpUtil.checkValid(detailImgUrl)) {
				detailImgUrls.add(detailImgUrl);
				// }
			}
			product.setDetailImgUrls(detailImgUrls);
		}
		product.setMainImgUrl(PRODUCT_IMG_BASE + productId + "-0.jpg");
		return product;
	}

	/**
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getActiveByBannerItem", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getActiveByBannerItem(@RequestParam("id") String id, @RequestParam("sort") String sort,
			HttpServletRequest request, HttpServletResponse response) {
		List<Product> products = new ArrayList<Product>();
		SortEnum sortRequset = SortEnum.getByCode(sort);
		products = productDao.getActiveByBannerItem(id);
		products = productUtil.sort(products, sortRequset);
		return products;
	}

	@RequestMapping(value = "/getActiveByBrandId", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getActiveByBrandId(@RequestParam("id") String id, @RequestParam("sort") String sort,
			HttpServletRequest request, HttpServletResponse response) {
		List<Product> products = new ArrayList<Product>();
		SortEnum sortRequset = SortEnum.getByCode(sort);
		products = productDao.getActiveByBrandId(id);
		products = productUtil.sort(products, sortRequset);
		products.forEach(product -> setMainImgUrl(product));
		return products;
	}

	@RequestMapping(value = "/getActiveProductNumByBrandId", method = RequestMethod.GET)
	@ResponseBody
	public Integer getActiveProductNumByBrandId(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		List<Product> products = productDao.getActiveByBrandId(id);
		return products.size();
	}

	@RequestMapping(value = "/getActiveByFlash", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getActiveByFlash(HttpServletRequest request, HttpServletResponse response) {
		List<Product> products = productDao.getActiveByFlash();
		products.forEach(product -> setMainImgUrl(product));
		return products;
	}

	@RequestMapping(value = "/getMultiByIds", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getMultiByIds(HttpServletRequest request, HttpServletResponse response) {
		String idString = request.getParameter("ids");
		List<Product> products = new ArrayList<Product>();
		if (idString == null || idString.isEmpty()) {
			return products;
		}
		List<Integer> ids = Arrays.asList(idString.split(";")).stream().map(i -> Integer.valueOf(i))
				.collect(Collectors.toList());
		products = productDao.getMultiByIds(ids);
		products.forEach(product -> {
			if (product.getMainImgUrl() == null || product.getMainImgUrl().isEmpty()) {
				setMainImgUrl(product);
			}
		});
		return products;
	}

	@RequestMapping(value = "/getActiveByGiftId", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getActiveByGiftId(@RequestParam("id") String id, @RequestParam("sort") String sort,
			@RequestParam("budget") String budget, @RequestParam("gender") String gender, HttpServletRequest request,
			HttpServletResponse response) {
		List<Product> result = new ArrayList<Product>();
		SortEnum sortRequset = SortEnum.getByCode(sort);
		result = productDao.getActiveGift(budget);
		result = productUtil.sort(result, sortRequset);
		result.forEach(product -> setMainImgUrl(product));
		return result;
	}

	private void setMainImgUrl(Product product) {
		product.setMainImgUrl(PRODUCT_IMG_BASE + product.getId() + "-0.jpg");
	}

}
