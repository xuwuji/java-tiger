package com.xuwuji.common.java.Enum;

import java.util.EnumSet;

/**
 * 
 * @author wuxu
 *
 *         继承自ENUM类，不可以再继承其他的类，但可以implements其他接口,不能向enum中添加或者删除元素
 */
public enum Price {

	// 相当于在这里声明每一个Price的constant,括号中是初始化时传入的参数，也就是构造器的参数
	/**
	 * 可以为enum中的每一个实例编写方法，注意方法要一致，从而为每个enum赋予不同的行为，但是首先要在enum类中定义这样一个abstract方法，
	 * 然后每个实例去实现它
	 * 
	 */
	CHEAP("it is cheap") {
		String getInfo() {
			return "Cheap";
		}
	},
	NORMAL("it is normal") {
		String getInfo() {
			return "Normal";
		}
	},
	DEAR("it is dear") {
		String getInfo() {
			return "Dear";
		}
	};

	private String description;

	private Price(String description) {
		this.description = description;
	}

	abstract String getInfo();

	// 可以覆盖enum中的方法
	@Override
	public String toString() {
		return name() + " " + this.ordinal() + " " + this.description;
	}

	public static void main(String[] args) {

		for (Price p : Price.values()) {
			System.out.println(p.toString());
			System.out.println(p.getInfo());
		}

		// 可以使用enumset对enum进行set操作
		EnumSet<Price> prices = EnumSet.of(Price.CHEAP);
		// 重复的不会再添加到set中
		prices.add(CHEAP);
		prices.add(DEAR);
		System.out.println(prices);
	}
}
