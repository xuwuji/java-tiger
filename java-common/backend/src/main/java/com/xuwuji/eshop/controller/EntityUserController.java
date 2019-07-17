package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.mapper.EntityTranscationMapper;
import com.xuwuji.eshop.db.mapper.EntityUserMapper;
import com.xuwuji.eshop.enums.EntityTranscationType;
import com.xuwuji.eshop.model.EntityTranscation;
import com.xuwuji.eshop.model.EntityUser;

@Controller
@RequestMapping(value = "/entityUser")
public class EntityUserController {
	@Autowired
	private EntityTranscationMapper entityTranscationMapper;
	@Autowired
	private EntityUserMapper entityUserMapper;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String wechatId = request.getParameter("wechatId");
		String openId = request.getParameter("openId");
		String phone = request.getParameter("phone");
		String entityId = request.getParameter("entityId");
		EntityUser entityUser = new EntityUser();
		entityUser.setWechatId(wechatId);
		entityUser.setOpenId(openId);
		entityUser.setPhone(phone);
		entityUser.setEntityId(entityId);
		entityUserMapper.add(entityUser);
	}

	/**
	 * 给用户充值
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/topup", method = RequestMethod.POST)
	@ResponseBody
	public void topup(HttpServletRequest request, HttpServletResponse response) {
		// 为用户充值
		String phone = request.getParameter("phone");
		String entityId = request.getParameter("entityId");
		String amount = request.getParameter("amount");
		EntityUser entityUser = entityUserMapper.getByPhoneAndEntityId(phone, entityId);
		entityUser.setBalance(entityUser.getBalance() + Integer.valueOf(amount));
		entityUserMapper.updateUserInfo(entityUser);
		// 记录
		EntityTranscation entityTranscation = new EntityTranscation();
		entityTranscation.setAmount(Integer.valueOf(amount));
		entityTranscation.setEntityId(entityId);
		entityTranscation.setType(EntityTranscationType.TOPUP.getCode());
		entityTranscation.setEntityUserId(String.valueOf(entityUser.getId()));
		entityTranscationMapper.add(entityTranscation);
	}

	/**
	 * 给用户充值
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	@ResponseBody
	public void pay(HttpServletRequest request, HttpServletResponse response) {
		// 为用户充值
		String phone = request.getParameter("phone");
		String entityId = request.getParameter("entityId");
		String amount = request.getParameter("amount");
		EntityUser entityUser = entityUserMapper.getByPhoneAndEntityId(phone, entityId);
		entityUser.setBalance(entityUser.getBalance() + Integer.valueOf(amount));
		entityUserMapper.updateUserInfo(entityUser);
		// 记录
		EntityTranscation entityTranscation = new EntityTranscation();
		entityTranscation.setAmount(Integer.valueOf(amount));
		entityTranscation.setEntityId(entityId);
		entityTranscation.setType(EntityTranscationType.TOPUP.getCode());
		entityTranscation.setEntityUserId(String.valueOf(entityUser.getId()));
		entityTranscationMapper.add(entityTranscation);
	}

	/**
	 * 用户进行消费
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/addEntityTranscation", method = RequestMethod.GET)
	@ResponseBody
	public void addEntityTranscation(HttpServletRequest request, HttpServletResponse response) {
		String phone = request.getParameter("phone");
		int amount = Integer.valueOf(request.getParameter("amount"));
		String item = request.getParameter("item");
		String entityId = request.getParameter("entityId");
		EntityUser entityUser = entityUserMapper.getByPhoneAndEntityId(phone, entityId);
		// 更新客户的信息
		// 余额用完或者单次消费不进行充值
		if (entityUser.getBalance() == 0) {
			entityUser.setPoints(entityUser.getPoints() + amount);
		} else if (entityUser.getBalance() >= amount) {
			entityUser.setBalance(entityUser.getBalance() - amount);
			entityUser.setPoints(entityUser.getPoints() + amount);
		}
		// 优先使用余额，进行清0，不够的钱额外线下进行付款
		else if (entityUser.getBalance() < amount) {
			entityUser.setBalance(0);
			entityUser.setPoints(entityUser.getPoints() + amount);
		}
		entityUserMapper.updateUserInfo(entityUser);
		// 记录
		EntityTranscation entityTranscation = new EntityTranscation();
		entityTranscation.setAmount(amount);
		entityTranscation.setItem(item);
		entityTranscation.setEntityId(entityId);
		entityTranscation.setType(EntityTranscationType.PAY.getCode());
		entityTranscation.setEntityUserId(String.valueOf(entityUser.getId()));
		entityTranscationMapper.add(entityTranscation);
	}

	@RequestMapping(value = "/getUserData", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getUserData(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		String entityId = request.getParameter("entityId");
		Map<String, Object> result = new HashMap<String, Object>();
		List<EntityUser> user = entityUserMapper.getByOpenIdAndEntityId(openId, entityId);
		if (user.size() == 1) {
			result.put("exist", true);
			result.put("user", user.get(0));
			return result;
		} else {
			result.put("exist", false);
		}
		return result;
	}

	@RequestMapping(value = "/getUserByPhoneAndEntityId", method = RequestMethod.GET)
	@ResponseBody
	public List<EntityUser> getUserByPhoneAndEntityId(HttpServletRequest request, HttpServletResponse response) {
		String phone = request.getParameter("phone");
		String entityId = request.getParameter("entityId");
		List<EntityUser> user = new ArrayList<EntityUser>();
		user.add(entityUserMapper.getByPhoneAndEntityId(phone, entityId));
		return user;
	}

	@RequestMapping(value = "/getTranscationByOpenIdAndEntityId", method = RequestMethod.GET)
	@ResponseBody
	public List<EntityTranscation> getTranscationByOpenIdAndEntityId(HttpServletRequest request,
			HttpServletResponse response) {
		String openId = request.getParameter("openId");
		String entityId = request.getParameter("entityId");
		List<EntityTranscation> transcations = entityTranscationMapper.getByEntityIdAndOpenId(entityId, openId);
		return transcations;
	}

}
