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
import com.xuwuji.eshop.model.TreasureItem;
import com.xuwuji.eshop.model.TreasureJoinHistory;

@RestController
@RequestMapping(value = "/treasure")
public class TreasureController {
	@Autowired
	private TreasureJoinHistoryMapper treasureJoinHistoryMapper;
	@Autowired
	private TreasureItemMapper treasureItemMapper;

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

}
