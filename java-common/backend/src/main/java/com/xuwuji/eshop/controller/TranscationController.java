package com.xuwuji.eshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.TranscationDao;
import com.xuwuji.eshop.model.Transcation;

@Controller
@RequestMapping(value = "/transcation")
public class TranscationController {

	@Autowired
	private TranscationDao transcationDao;

	@RequestMapping(value = "/getByOpenIdAndType", method = RequestMethod.GET)
	@ResponseBody
	public List<Transcation> getByOpenIdAndType(HttpServletRequest request) {
		String type = request.getParameter("type");
		String openId = request.getParameter("openId");
		/**
		 * 每个用户一天只可提现一次
		 */
		List<Transcation> list = transcationDao.getByOpenIdAndType(openId, type);
		return list;
	}
}
