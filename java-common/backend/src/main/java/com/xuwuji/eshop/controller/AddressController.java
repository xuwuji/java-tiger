package com.xuwuji.eshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.AddressDao;
import com.xuwuji.eshop.model.Address;

@Controller
@RequestMapping(value = "/address")
public class AddressController {
	@Autowired
	private AddressDao addressDao;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String wechatId = request.getParameter("wechatId");
		String openId = request.getParameter("openId");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		Address addressDTO = new Address();
		addressDTO.setAddress(address);
		addressDTO.setName(name);
		addressDTO.setOpenId(openId);
		addressDTO.setPhone(phone);
		addressDTO.setWechatId(wechatId);
		addressDao.add(addressDTO);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	@ResponseBody
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		String addressId = request.getParameter("id");
		addressDao.delete(addressId);
	}

	@RequestMapping(value = "/getByOpenId", method = RequestMethod.GET)
	@ResponseBody
	public List<Address> getByOpenId(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		List<Address> result = addressDao.getAllByOpenId(openId);
		return result;
	}
}
