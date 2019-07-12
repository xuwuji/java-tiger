package com.xuwuji.eshop.util;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Component;

import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.model.SortEnum;

@Component
public class ProductUtil {

	public List<Product> sort(List<Product> products, SortEnum sortRequset) {
		if (sortRequset == SortEnum.ALL) {
			return products;
		} else if (sortRequset == SortEnum.TIME) {
			Collections.sort(products, (p1, p2) -> {
				return Integer.valueOf(p1.getId()).compareTo(p2.getId());
			});
		} else if (sortRequset == SortEnum.PRICE) {
			Collections.sort(products, (p1, p2) -> {
				return Double.valueOf(p1.getPrice()).compareTo(p2.getPrice());
			});
		} else if (sortRequset == SortEnum.SALE) {
			Collections.sort(products, (p1, p2) -> {
				return Integer.valueOf(p1.getSalesCount()).compareTo(p2.getSalesCount());
			});
		}
		Collections.reverse(products);
		return products;
	}
}
