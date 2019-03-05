package com.xuwuji.eshop.util;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.stereotype.Component;

import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.model.SortEnum;

@Component
public class ProductUtil {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Product> sort(List<Product> products, SortEnum sortRequset) {
		if (sortRequset == SortEnum.ALL) {
		} else if (sortRequset == SortEnum.TIME) {
			Comparator c = new Comparator<Product>() {
				public int compare(Product p1, Product p2) {
					return Integer.valueOf(p1.getId()).compareTo(p2.getId());
				}
			};
			products.sort(c);
		} else if (sortRequset == SortEnum.PRICE) {
			Comparator c = new Comparator<Product>() {
				public int compare(Product p1, Product p2) {
					return Double.valueOf(p1.getPrice()).compareTo(p2.getPrice());
				}
			};
			products.sort(c);
		} else if (sortRequset == SortEnum.SALE) {
			Comparator c = new Comparator<Product>() {
				public int compare(Product p1, Product p2) {
					return Integer.valueOf(p1.getSalesCount()).compareTo(p2.getSalesCount());
				}
			};
			products.sort(c);
		}
		Collections.reverse(products);
		return products;
	}
}
