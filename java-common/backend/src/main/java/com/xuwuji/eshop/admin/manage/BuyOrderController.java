package com.xuwuji.eshop.admin.manage;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.metadata.Sheet;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.xuwuji.eshop.util.EshopConfigUtil;
import com.xuwuji.eshop.util.TimeUtil;

@Controller
@RequestMapping(value = "/admin/buyOrder")
public class BuyOrderController {

	private List<Item> items;

	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/buyorder");
	}

	@RequestMapping(value = "/init", method = RequestMethod.GET)
	public void init(HttpServletRequest request, HttpServletResponse response) {
		items = new ArrayList<Item>();
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String count = request.getParameter("count");
		String address = request.getParameter("address");
		String vandor = request.getParameter("vandor");
		String productId = request.getParameter("id");
		Item item = new Item();
		item.setAddress(address);
		item.setCount(count);
		item.setName(name);
		item.setVandor(vandor);
		item.setProductId(productId);
		String PRODUCT_IMG_BASE = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE);
		item.setMainImgUrl(PRODUCT_IMG_BASE + productId + "-0.jpg");
		items.add(item);
	}

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, List<Item>> get(HttpServletRequest request, HttpServletResponse response) {
		Map<String, List<Item>> result = items.stream().collect(Collectors.groupingBy(Item::getAddress));
		return result;
	}

	@RequestMapping(value = "/summary", method = RequestMethod.GET)
	public void summary(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException {
		OutputStream os = new FileOutputStream(
				new File("/home/ubuntu/{date}.xlsx".replace("{date}", TimeUtil.dateToString(new Date()))));
		ExcelWriter writer = new ExcelWriter(os, ExcelTypeEnum.XLSX, true);
		Sheet sheet1 = new Sheet(1, 0, BuyOrderExcel.class);
		List<BuyOrderExcel> result = this.getBuyOrders();
		writer.write(result, sheet1);
		writer.finish();
	}

	private List<BuyOrderExcel> getBuyOrders() {
		List<BuyOrderExcel> result = new ArrayList<BuyOrderExcel>();
		items.forEach(item -> {
			BuyOrderExcel buyOrderExcel = new BuyOrderExcel();
			buyOrderExcel.setName(item.getName());
			buyOrderExcel.setVandor(item.getVandor());
			buyOrderExcel.setAddress(item.getAddress());
			buyOrderExcel.setCount(item.getCount());
			result.add(buyOrderExcel);
		});
		return result;
	}

	class Item {
		private String name;
		private String count;
		private String vandor;
		private String address;
		private String productId;
		private String mainImgUrl;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getCount() {
			return count;
		}

		public void setCount(String count) {
			this.count = count;
		}

		public String getVandor() {
			return vandor;
		}

		public void setVandor(String vandor) {
			this.vandor = vandor;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getProductId() {
			return productId;
		}

		public void setProductId(String productId) {
			this.productId = productId;
		}

		public String getMainImgUrl() {
			return mainImgUrl;
		}

		public void setMainImgUrl(String mainImgUrl) {
			this.mainImgUrl = mainImgUrl;
		}

	}

}
