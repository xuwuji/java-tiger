package com.xuwuji.eshop.admin.manage;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import com.alibaba.excel.metadata.Sheet;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.xuwuji.eshop.db.dao.FormatDao;
import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.util.TimeUtil;

@Controller
@RequestMapping(value = "/admin/buy/order")
public class BuyOrderController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private FormatDao formatDao;
	/**
	 * <商品id&规格id，数量>
	 */
	private Map<String, String> purchaseList;

	@RequestMapping(value = "/init", method = RequestMethod.GET)
	public void init() {
		purchaseList = new HashMap<String, String>();
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String key = request.getParameter("key");
		String count = request.getParameter("count");
		purchaseList.put(key, count);
	}

	@RequestMapping(value = "/summary", method = RequestMethod.GET)
	public void summary(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException {
		OutputStream os = new FileOutputStream(
				new File("/Users/i509669/Documents/{date}.xlsx".replace("{date}", TimeUtil.dateToString(new Date()))));
		ExcelWriter writer = new ExcelWriter(os, ExcelTypeEnum.XLSX, true);
		Sheet sheet1 = new Sheet(1, 0, OrderExcel.class);
		List<BuyOrderExcel> result = new ArrayList<BuyOrderExcel>();
		purchaseList.forEach((key, value) -> {
			BuyOrderExcel buyOrderExcel = new BuyOrderExcel();
			String productId = key.split("&")[0];
			String formatId = key.split("&")[1];
			buyOrderExcel.setId(key);
			Product product = productDao.getById(productId);
			buyOrderExcel.setName(product.getName());
			buyOrderExcel.setFormat(formatDao.getById(formatId).getName());
			buyOrderExcel.setCount(value);
			result.add(buyOrderExcel);
		});
		writer.write(result, sheet1);
		writer.finish();
	}

	class BuyOrderExcel extends BaseRowModel {

		@ExcelProperty(value = "id", index = 0)
		private String id;
		@ExcelProperty(value = "商品名称", index = 1)
		private String name;
		@ExcelProperty(value = "规格", index = 2)
		private String format;
		@ExcelProperty(value = "数量", index = 3)
		private String count;

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getFormat() {
			return format;
		}

		public void setFormat(String format) {
			this.format = format;
		}

		public String getCount() {
			return count;
		}

		public void setCount(String count) {
			this.count = count;
		}

	}

}
