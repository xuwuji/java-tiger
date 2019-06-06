package com.xuwuji.eshop.controller;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.LotteryHistoryDao;
import com.xuwuji.eshop.db.dao.LotteryShareHistoryDao;
import com.xuwuji.eshop.db.dao.UserDao;
import com.xuwuji.eshop.model.Lottery;
import com.xuwuji.eshop.model.LotteryConfig;
import com.xuwuji.eshop.model.LotteryConstants;
import com.xuwuji.eshop.model.LotteryHistory;
import com.xuwuji.eshop.model.LotteryShareHistory;
import com.xuwuji.eshop.model.LotteryState;
import com.xuwuji.eshop.model.LotteryType;
import com.xuwuji.eshop.model.User;
import com.xuwuji.eshop.model.UserState;
import com.xuwuji.eshop.util.EshopConfigUtil;
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
	@Autowired
	private EshopConfigUtil eshopConfigUtil;
	@Autowired
	private LotteryShareHistoryDao lotteryShareHistoryDao;

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
		Random random = new Random();
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
		int points = 0;
		// 默认不中奖
		lottery.setName("再接再厉哦");
		lottery.setLuck(false);
		LotteryConfig lotteryConfig = getLotteryConfig();
		// 处于第一阶段内
		if (currentLotteryTranscationId < lotteryConfig.getLotteryStageOne()) {
			// 若目前抽奖累计金额还未到达第一阶段最大金额，则可以继续抽奖
			if (lotteryAmount < lotteryConfig.getAmountMaxInStageOne()) {
				// 随机判断是否中奖
				/**
				 * 1、二分之一概率得红包
				 * 
				 * 2、二分之一概率得积分,50~100
				 */
				int randomNum = random.nextInt(2);
				if (randomNum == 0) {
					luckMoney = random.nextDouble() * lotteryConfig.getAmountPerInStageOne();
					// 保留两位小数
					luckMoney = (double) Math.round(luckMoney * 100) / 100;
					lottery.setType(LotteryType.MONEY.getCode());
					lottery.setAmount(luckMoney);
					lottery.setName(luckMoney + "元红包");
					lottery.setLuck(true);
				} else {
					points = random.nextInt(50) + 50;
					lottery.setType(LotteryType.POINTS.getCode());
					lottery.setAmount(points);
					lottery.setName(luckMoney + "积分");
					lottery.setLuck(true);
				}
			}
		}
		// 处于第二阶段内
		else if (currentLotteryTranscationId < lotteryConfig.getLotteryStageTwo()) {
			// 若目前抽奖累计金额还未到达第二阶段最大金额，则可以继续抽奖
			if (lotteryAmount < lotteryConfig.getAmountMaxInStageTwo()) {
				/**
				 * 1、三分之一概率红包
				 * 
				 * 2、三分之一概率积分,40~80
				 */
				int randomNum = random.nextInt(3);
				if (randomNum == 0) {
					// 单次
					luckMoney = random.nextDouble() * lotteryConfig.getAmountPerInStageTwo();
					// 保留两位小数
					luckMoney = (double) Math.round(luckMoney * 100) / 100;
					lottery.setType(LotteryType.MONEY.getCode());
					lottery.setAmount(luckMoney);
					lottery.setName(luckMoney + "元红包");
					lottery.setLuck(true);
				} else if (randomNum == 1) {
					points = random.nextInt(40) + 40;
					lottery.setType(LotteryType.POINTS.getCode());
					lottery.setAmount(points);
					lottery.setName(luckMoney + "积分");
					lottery.setLuck(true);
				}
			}
		}
		// 抽奖次数已经超过第二阶段
		else {
			/**
			 * 1、四分之一概率红包
			 * 
			 * 2、四分之一概率积分,30~60
			 */
			int randomNum = random.nextInt(4);
			if (randomNum == 0) {
				// 单次
				luckMoney = Math.random() * lotteryConfig.getAmountPerOverStageTwo();
				// 保留两位小数
				luckMoney = (double) Math.round(luckMoney * 100) / 100;
				lottery.setType(LotteryType.MONEY.getCode());
				lottery.setAmount(luckMoney);
				lottery.setName(luckMoney + "元红包");
				lottery.setLuck(true);
			} else if (randomNum == 1) {
				points = random.nextInt(30) + 30;
				lottery.setType(LotteryType.POINTS.getCode());
				lottery.setAmount(points);
				lottery.setName(luckMoney + "积分");
				lottery.setLuck(true);
			}
		}
		// 将剩余次数减一
		userFromDB.setLotteryRemainCount(userFromDB.getLotteryRemainCount() - 1);
		// 将累计抽奖次数加一
		userFromDB.setLotteryTotalCount(currentLotteryTranscationId);
		// 现金红包更新金额相关
		if (lottery.isLuck() && lottery.getType().equals(LotteryType.MONEY.getCode())) {
			// 更新累计中奖金额
			userFromDB.setLotteryAmount(userFromDB.getLotteryAmount() + luckMoney);
			// 发送至用户账户余额
			userFromDB.setBalance(userFromDB.getBalance() + luckMoney);
		}
		// 积分更新相关
		if (lottery.isLuck() && lottery.getType().equals(LotteryType.POINTS.getCode())) {
			// 更新累计中奖金额
			userFromDB.setPoints(userFromDB.getPoints() + points);
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
	 * 打开分享页面，增加分享人的抽奖次
	 * 
	 * 增加抽奖次数条件：打开人是第一次打开分享人的页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/openLotterySharePage", method = RequestMethod.GET)
	@ResponseBody
	public void openLotterySharePage(HttpServletRequest request, HttpServletResponse response) {
		String sourceUser = request.getParameter("sourceUser");
		String openUser = request.getParameter("openUser");
		if (sourceUser.equals(openUser)) {
			return;
		}
		List<LotteryShareHistory> result = lotteryShareHistoryDao.checkExist(sourceUser, openUser);
		// 表里无记录，说明此打开人是第一次打开此分享人的记录
		if (result.size() == 0) {
			/**
			 * 
			 * 1、增加分享人的抽奖次数
			 * 
			 * 2、添加此分享的记录，下次再分享给这个打开人就不会重复增加抽奖次数了
			 * 
			 */
			User user = new User();
			user.setOpenId(sourceUser);
			user = userDao.getByCondition(user);
			user.setLotteryRemainCount(user.getLotteryRemainCount() + 1);
			userDao.updateLotteryInfo(user);
			
			LotteryShareHistory lotteryShareHistory = new LotteryShareHistory();
			lotteryShareHistory.setOccur(new Date());
			lotteryShareHistory.setOpenUser(openUser);
			lotteryShareHistory.setSourceUser(sourceUser);
			lotteryShareHistoryDao.add(lotteryShareHistory);
		}
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

	private LotteryConfig getLotteryConfig() {
		LotteryConfig lotteryConfig = new LotteryConfig();
		lotteryConfig.setLotteryStageOne(Integer.valueOf(eshopConfigUtil.getParam(LotteryConstants.LOTTERY_STAGE_ONE)));
		lotteryConfig.setLotteryStageTwo(Integer.valueOf(eshopConfigUtil.getParam(LotteryConstants.LOTTERY_STAGE_TWO)));
		lotteryConfig.setAmountPerInStageOne(
				Double.valueOf(eshopConfigUtil.getParam(LotteryConstants.AMOUNT_PER_IN_STAGE_ONE)));
		lotteryConfig.setAmountMaxInStageOne(
				Double.valueOf(eshopConfigUtil.getParam(LotteryConstants.AMOUNT_MAX_IN_STAGE_ONE)));
		lotteryConfig.setAmountPerInStageTwo(
				Double.valueOf(eshopConfigUtil.getParam(LotteryConstants.AMOUNT_PER_IN_STAGE_TWO)));
		lotteryConfig.setAmountMaxInStageTwo(
				Double.valueOf(eshopConfigUtil.getParam(LotteryConstants.AMOUNT_MAX_IN_STAGE_TWO)));
		lotteryConfig.setAmountPerOverStageTwo(
				Double.valueOf(eshopConfigUtil.getParam(LotteryConstants.AMOUNR_PER_OVER_STAGE_TWO)));
		return lotteryConfig;
	}
}
