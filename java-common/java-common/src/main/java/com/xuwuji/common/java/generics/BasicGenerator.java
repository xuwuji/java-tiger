package com.xuwuji.common.java.generics;

import java.util.Map;

public class BasicGenerator<T extends Comparable<T>> {

	private Class<T> type;

	public BasicGenerator(Class<T> type) {
		this.type = type;
	}

	// 这里由于不需要有参数，所以不需要定义为 public <T> T next()
	public T next() {
		try {
			return type.newInstance();
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	// 这里需要有参数，需要定义为 public <T> T next(Class<T> type)
	// 参数需要是T类型
	public static <T> T next(Class<T> type) {
		try {
			return type.newInstance();
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	/**
	 * <T> 代表被传进去的变量的类型必须是T类型，相当于声明了变量的类型
	 * 
	 * @param type
	 *            需要传进去的变量名
	 * @return
	 */
	public static <T extends Comparable<T>> BasicGenerator<T> create(Class<T> type) {
		return new BasicGenerator<T>(type);
	}

	public static void main(String[] args) {
		BasicGenerator<String> g = BasicGenerator.create(String.class);
		System.out.println(g.next().valueOf("a").toString());
		System.out.println(BasicGenerator.next(String.class).valueOf("b").toString());
	}

}
