package com.xuwuji.eshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.LotteryHistoryDao;
import com.xuwuji.eshop.db.dao.UserDao;
import com.xuwuji.eshop.model.Lottery;
import com.xuwuji.eshop.model.LotteryConstants;
import com.xuwuji.eshop.model.LotteryHistory;
import com.xuwuji.eshop.model.LotteryState;
import com.xuwuji.eshop.model.LotteryType;
import com.xuwuji.eshop.model.User;
import com.xuwuji.eshop.model.UserState;
import com.xuwuji.eshop.util.StringUtil;

/**
 * 
 * 抽奖Controller
 * 
 * @author xuwuji
 *
 */
@Controller
@RequestMapping(value = "/lottery")
public class LotteryController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private LotteryHistoryDao lotteryHistoryDao;

	/**
	 * 获取此用户的抽奖相关信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getLotteryInfoByOpenId", method = RequestMethod.GET)
	@ResponseBody
	public User getLotteryInfoByOpenId(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		User user = new User();
		user.setOpenId(openId);
		User userFromDB = userDao.getByCondition(user);
		// 如果是新用户，添加到表中，并且给予一次抽奖机会(数据库添加时自动做了)
		if (userFromDB.getId() == 0 || StringUtil.isEmpty(userFromDB.getState())) {
			userFromDB.setOpenId(openId);
			userFromDB.setState(UserState.NEW.getCode());
			userDao.add(userFromDB);
			userFromDB = userDao.getByCondition(user);
		}
		return userFromDB;
	}

	/**
	 * 获取这一次抽奖的结果
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getLotteryByOpenId", method = RequestMethod.GET)
	@ResponseBody
	public Lottery getLotteryByOpenId(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		User user = new User();
		user.setOpenId(openId);
		User userFromDB = userDao.getByCondition(user);
		if (userFromDB.getLotteryRemainCount() <= 0) {
			return null;
		}
		// 用户通过抽奖累计得到的金额
		double lotteryAmount = userFromDB.getLotteryAmount();
		// 用户累计抽奖次数
		int lotteryTotalCount = userFromDB.getLotteryTotalCount();
		// 此用户的当前抽奖次数
		int currentLotteryTranscationId = lotteryTotalCount + 1;
		Lottery lottery = new Lottery();
		// 此次抽到的金额
		double luckMoney = 0;
		// 默认不中奖
		lottery.setName("再接再厉哦");
		lottery.setLuck(false);
		if (currentLotteryTranscationId < LotteryConstants.TEN) {
			// 若目前抽奖累计金额还未到达10次可以得到的最大金额，则可以继续抽奖
			if (lotteryAmount < LotteryConstants.AMOUNT_MAX_IN_TEN) {
				// 1-10次，单次max
				luckMoney = Math.random() * LotteryConstants.AMOUNT_MAX_PER_IN_TEN;
				// 保留两位小数
				luckMoney = (double) Math.round(luckMoney * 100) / 100;
				lottery.setType(LotteryType.MONEY.getCode());
				lottery.setAmount(luckMoney);
				lottery.setName(luckMoney + "元红包");
				lottery.setLuck(true);
			}
		} else if (currentLotteryTranscationId == LotteryConstants.TEN) {
			// 若经过九次还没达到10元，则第十次补剩余金额
			if (lotteryAmount < LotteryConstants.AMOUNT_MAX_IN_TEN) {
				luckMoney = (double) (10.00 - lotteryAmount);
				// 保留两位小数
				luckMoney = (double) Math.round(luckMoney * 100) / 100;
				lottery.setType(LotteryType.MONEY.getCode());
				lottery.setAmount(luckMoney);
				lottery.setName(luckMoney + "元红包");
				lottery.setLuck(true);
			}
		}
		// 将剩余次数减一
		userFromDB.setLotteryRemainCount(userFromDB.getLotteryRemainCount() - 1);
		// 将累计抽奖次数加一
		userFromDB.setLotteryTotalCount(currentLotteryTranscationId);
		if (lottery.isLuck()) {
			// 更新累计中奖金额
			userFromDB.setLotteryAmount(userFromDB.getLotteryAmount() + luckMoney);
			// 发送至用户账户余额
			userFromDB.setBalance(userFromDB.getBalance() + luckMoney);
		}
		userDao.updateLotteryInfo(userFromDB);
		// 将本次抽奖进行记录
		LotteryHistory lotteryHistory = new LotteryHistory();
		lotteryHistory = convertToHistory(lottery);
		lotteryHistory.setOpenId(openId);
		lotteryHistory.setLotteryTranscationId(String.valueOf(currentLotteryTranscationId));
		lotteryHistoryDao.add(lotteryHistory);
		return lottery;
	}

	/**
	 * 将用户此次抽奖情况纪录在表内
	 * 
	 * @return
	 */
	private LotteryHistory convertToHistory(Lottery lottery) {
		LotteryHistory lotteryHistory = new LotteryHistory();
		lotteryHistory.setAmount(lottery.getAmount());
		lotteryHistory.setName(lottery.getName());
		lotteryHistory.setType(lottery.getType());
		if (lottery.isLuck()) {
			lotteryHistory.setIsLuck(LotteryState.ISLUCK.getCode());
		} else {
			lotteryHistory.setIsLuck(LotteryState.NOLUCK.getCode());
		}
		return lotteryHistory;
	}

}
