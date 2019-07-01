package com.xuwuji.eshop.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.xuwuji.eshop.db.mapper.TreasureItemMapper;
import com.xuwuji.eshop.db.mapper.TreasureJoinHistoryMapper;
import com.xuwuji.eshop.db.mapper.TreasureShareMapper;
import com.xuwuji.eshop.model.TreasureItem;
import com.xuwuji.eshop.model.TreasureJoinHistory;
import com.xuwuji.eshop.model.TreasureShare;
import com.xuwuji.eshop.util.StringUtil;

@RestController
@RequestMapping(value = "/treasure")
public class TreasureController {
	@Autowired
	private TreasureJoinHistoryMapper treasureJoinHistoryMapper;
	@Autowired
	private TreasureItemMapper treasureItemMapper;
	@Autowired
	private TreasureShareMapper treasureShareMapper;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void addJoinHistory(HttpServletRequest request) {
		String openId = request.getParameter("openId");
		String treasureItemId = request.getParameter("treasureItemId");
		TreasureJoinHistory treasureJoinHistory = new TreasureJoinHistory();
		treasureJoinHistory.setOccur(new Date());
		treasureJoinHistory.setOpenId(openId);
		treasureJoinHistory.setTreasureItemId(treasureItemId);
		treasureJoinHistory.setCount(1);
		treasureJoinHistoryMapper.add(treasureJoinHistory);
		TreasureItem treasureItem = treasureItemMapper.getById(treasureItemId);
		treasureItem.setCurrentCount(treasureItem.getCurrentCount() + 1);
		treasureItemMapper.update(treasureItem);
	}

	@RequestMapping(value = "/isJoined", method = RequestMethod.GET)
	public HashMap<String, Object> isJoined(HttpServletRequest request) {
		String openId = request.getParameter("openId");
		String treasureItemId = request.getParameter("treasureItemId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<TreasureJoinHistory> list = treasureJoinHistoryMapper.getByOpenIdAndTreasureId(openId, treasureItemId);
		boolean isJoined = list.size() > 0;
		map.put("isJoined", isJoined);
		if (isJoined) {
			map.put("joinHistory", list.get(0));
		}
		return map;
	}

	@RequestMapping(value = "/getById", method = RequestMethod.GET)
	public TreasureJoinHistory getById(HttpServletRequest request) {
		String id = request.getParameter("id");
		TreasureJoinHistory treasureJoinHistory = treasureJoinHistoryMapper.getById(id);
		return treasureJoinHistory;
	}

	@RequestMapping(value = "/checkHelp", method = RequestMethod.GET)
	public HashMap<String, Object> checkHelp(HttpServletRequest request) {
		String openUser = request.getParameter("openUser");
		String sourceUser = request.getParameter("sourceUser");
		String joinHistoryId = request.getParameter("joinHistoryId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<TreasureShare> list = treasureShareMapper.checkExist(sourceUser, openUser, joinHistoryId);
		List<TreasureShare> helpList = treasureShareMapper.getHelpInfo(sourceUser, joinHistoryId);
		boolean isHelped = list.size() > 0;
		map.put("isHelped", isHelped);
		map.put("helpCount", helpList.size());
		return map;
	}

	/**
	 * 点击帮忙助力
	 * 
	 * @param request
	 */
	@RequestMapping(value = "/clickHelp", method = RequestMethod.GET)
	public void clickHelp(HttpServletRequest request) {
		String openUser = request.getParameter("openUser");
		if (StringUtil.isEmpty(openUser)) {
			return;
		}
		String joinHistoryId = request.getParameter("joinHistoryId");
		TreasureJoinHistory treasureJoinHistory = treasureJoinHistoryMapper.getById(joinHistoryId);
		TreasureItem treasureItem = treasureItemMapper.getById(treasureJoinHistory.getTreasureItemId());
		int totalCount = treasureItem.getTotalCount();
		int currentCount = treasureItem.getCurrentCount();
		/**
		 * 防止并发情况下，超卖情况
		 */
		if (currentCount >= totalCount) {
			return;
		}
		/**
		 * 检查是不是已经点过
		 */
		List<TreasureShare> list = treasureShareMapper.checkExist(treasureJoinHistory.getOpenId(), openUser,
				joinHistoryId);
		if (list.size() > 0) {
			return;
		}
		if (currentCount < totalCount) {
			treasureItem.setCurrentCount(currentCount + 1);
			treasureItemMapper.update(treasureItem);
			treasureJoinHistory.setCount(treasureJoinHistory.getCount() + 1);
			treasureJoinHistoryMapper.update(treasureJoinHistory);
		}
		TreasureShare treasureShare = new TreasureShare();
		treasureShare.setJoinHistoryId(joinHistoryId);
		treasureShare.setOccur(new Date());
		treasureShare.setOpenUser(openUser);
		treasureShare.setSourceUser(treasureJoinHistory.getOpenId());
		treasureShare.setTreasureItemId(treasureJoinHistory.getTreasureItemId());
		treasureShareMapper.add(treasureShare);
	}

}
