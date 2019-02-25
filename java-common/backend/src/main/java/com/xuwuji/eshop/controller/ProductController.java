package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.model.Img;
import com.xuwuji.eshop.model.Product;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

	/**
	 * 获取某一具体产品
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Product getProductById(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		if(id==null||id.equals("undefined")){
			id="1";
		}
		Product product = new Product();
		product.setPrice(10);
		product.setInventory(10);
		product.setName("香奈尔cc霜");
		product.setId(Integer.valueOf(id));
		product.setMainImgUrl("http://i1.bvimg.com/677237/ac5d93a8cd171dfe.jpg");
		List<Img> imgs = new ArrayList<Img>();
		Img img = new Img();
		img.setId(1);
		img.setUrl("http://i1.bvimg.com/677237/ac5d93a8cd171dfe.jpg");

		Img img2 = new Img();
		img2.setId(2);
		img2.setUrl(
				"http://i1.bvimg.com/677237/4919e3469f3e4e6b.jpg");
		imgs.add(img);
		imgs.add(img2);
		Img img3 = new Img();
		img3.setId(1);
		img3.setUrl("http://i1.bvimg.com/677237/1c0f9f17e19dfde5.jpg");

		Img img4 = new Img();
		img4.setId(2);
		img4.setUrl(
				"http://i1.bvimg.com/677237/17464f00c5670556.jpg");
		imgs.add(img3);
		imgs.add(img4);
		product.setImgs(imgs);
		return product;
	}

}
