package com.xuwuji.eshop.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.BarginItemDao;
import com.xuwuji.eshop.db.dao.BarginOrderDao;
import com.xuwuji.eshop.db.dao.BarginOrderHistoryDao;
import com.xuwuji.eshop.model.BarginItem;
import com.xuwuji.eshop.model.BarginOrder;
import com.xuwuji.eshop.model.BarginOrderHistory;
import com.xuwuji.eshop.model.BarginOrderState;
import com.xuwuji.eshop.util.EshopConfigUtil;
import com.xuwuji.eshop.util.QRCodeUtil;

@Controller
@RequestMapping(value = "/bargin")
public class BarginController {
	@Autowired
	private BarginOrderDao barginOrderDao;
	@Autowired
	private BarginOrderHistoryDao barginOrderHistoryDao;
	@Autowired
	private BarginItemDao barginItemDao;
	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@Autowired
	private QRCodeUtil qRCodeUtil;

	/**
	 * 
	 * 用户开始了一个砍价
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/addBarginOrder", method = RequestMethod.GET)
	@ResponseBody
	public BarginOrder addBarginOrder(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		String barginItemId = request.getParameter("barginItemId");
		String lastHour = request.getParameter("lastHour");
		String barginOrderId = UUID.randomUUID().toString().replaceAll("-", "");
		BarginOrder barginOrder = new BarginOrder();
		barginOrder.setOpenId(openId);
		barginOrder.setOccur(new Date());
		barginOrder.setBarginItemId(barginItemId);
		barginOrder.setBarginOrderId(barginOrderId);
		barginOrder.setLastHour(Integer.valueOf(lastHour));
		barginOrderDao.add(barginOrder);
		return barginOrder;
	}

	@RequestMapping(value = "/cancelBarginOrder", method = RequestMethod.GET)
	@ResponseBody
	public void cancelBarginOrder(HttpServletRequest request, HttpServletResponse response) {
		String barginOrderId = request.getParameter("barginOrderId");
		barginOrderDao.updateState(barginOrderId, BarginOrderState.CANCEL.getCode());
	}

	/**
	 * 用户查看自己的砍价
	 * 
	 * 在查看时，首先判断是不是已经超时了，从而更改状态
	 * 
	 * 这样就省去了定时扫描的功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getBarginOrderByOpenId", method = RequestMethod.GET)
	@ResponseBody
	public List<BarginOrder> getBarginOrderByOpenId(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		// 第一次会把超时的显示出来，然后再更新操作结束后，第二次再点进来时就看不到超时的
		List<BarginOrder> list = barginOrderDao.getByOpenIdAndState(openId, BarginOrderState.DOING.getCode());
		String PRODUCT_IMG_BASE = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE);
		for (BarginOrder barginOrder : list) {
			Calendar occur = Calendar.getInstance();
			occur.setTime(barginOrder.getOccur());
			occur.set(Calendar.HOUR_OF_DAY, occur.get(Calendar.HOUR_OF_DAY) + barginOrder.getLastHour());
			Date deadline = occur.getTime();
			Calendar now = Calendar.getInstance();
			// 说明已经过期了，需要更新状态
			if (occur.compareTo(now) < 0) {
				barginOrder.setState(BarginOrderState.FAILED.getCode());
				barginOrderDao.update(barginOrder);
			}
			BarginItem barginItem = barginItemDao.getById(barginOrder.getBarginItemId());
			barginItem.setProductImg(PRODUCT_IMG_BASE + barginItem.getProductId() + "-0.jpg");
			barginOrder.setBarginItem(barginItem);
			barginOrder.setDeadline(deadline);
		}
		return list;
	}

	/**
	 * 用户点击查看砍价详情
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/viewBarginOrder", method = RequestMethod.GET)
	@ResponseBody
	public BarginOrder viewBarginOrder(HttpServletRequest request, HttpServletResponse response) {
		String barginOrderId = request.getParameter("barginOrderId");
		BarginOrder barginOrder = barginOrderDao.getByBarginOrderId(barginOrderId);
		BarginItem barginItem = barginItemDao.getById(barginOrder.getBarginItemId());
		String PRODUCT_IMG_BASE = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE);
		barginItem.setProductImg(PRODUCT_IMG_BASE + barginItem.getProductId() + "-0.jpg");
		barginOrder.setBarginItem(barginItem);
		return barginOrder;
	}

	/**
	 * 好友点开需要帮砍价的链接
	 * 
	 * 需要判断是否已经帮点过
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/checkHelp", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> checkHelp(HttpServletRequest request, HttpServletResponse response) {
		String barginOrderId = request.getParameter("barginOrderId");
		String openUser = request.getParameter("openUser");
		BarginOrder barginOrder = barginOrderDao.getByBarginOrderId(barginOrderId);
		String sourceUser = barginOrder.getOpenId();
		HashMap<String, Object> result = new HashMap<String, Object>();
		boolean isExist = barginOrderHistoryDao.checkExist(sourceUser, openUser, barginOrderId);
		// 已经帮忙砍过价
		if (isExist) {
			result.put("isHelped", true);
		} else {
			result.put("isHelped", false);
		}
		return result;
	}

	/**
	 * 好友点击帮忙砍价
	 * 
	 * 由于在打开此页面时已经检查过是否砍过价
	 * 
	 * 1、点击后将人数加一
	 * 
	 * 2、添加砍价记录
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/clickBargin", method = RequestMethod.GET)
	@ResponseBody
	public void barginHelp(HttpServletRequest request, HttpServletResponse response) {
		String barginOrderId = request.getParameter("barginOrderId");
		String openUser = request.getParameter("openUser");
		BarginOrder barginOrder = barginOrderDao.getByBarginOrderId(barginOrderId);
		// 检查是不是点过了
		boolean isExist = barginOrderHistoryDao.checkExist(barginOrder.getOpenId(), openUser, barginOrderId);
		if (isExist) {
			return;
		}
		barginOrder.setPeople(barginOrder.getPeople() + 1);
		barginOrderDao.update(barginOrder);
		BarginOrderHistory barginOrderHistory = new BarginOrderHistory();
		barginOrderHistory.setBarginOrderId(barginOrderId);
		barginOrderHistory.setOpenUser(openUser);
		barginOrderHistory.setSourceUser(barginOrder.getOpenId());
		barginOrderHistory.setOccur(new Date());
		barginOrderHistoryDao.add(barginOrderHistory);
	}

	/**
	 * 检查此用户是否已经参加此砍价活动
	 * 
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/checkJoined", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> checkJoined(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		String barginItemId = request.getParameter("barginItemId");
		List<BarginOrder> orders = barginOrderDao.isJoined(openId, barginItemId);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("isJoined", orders.size() > 0);
		if (orders.size() > 0) {
			result.put("barginOrder", orders.get(0));
		}
		return result;
	}

	/**
	 * 生成砍价的二维码
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/getBarginQRCode", method = RequestMethod.GET)
	@ResponseBody
	public void getBarginQRCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		@SuppressWarnings("static-access")
		String barginOrderId = request.getParameter("barginOrderId");
		byte[] result = qRCodeUtil.getBarginQRCoderByte(barginOrderId);
		response.setContentType("image/png");
		OutputStream os = response.getOutputStream();
		os.write(result);
		os.flush();
		os.close();
	}

}
