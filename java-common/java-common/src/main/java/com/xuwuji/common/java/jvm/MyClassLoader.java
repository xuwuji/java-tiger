package com.xuwuji.common.java.jvm;

public class MyClassLoader extends ClassLoader {
	public static void main(String[] args) {
		ClassLoader loader = MyClassLoader.class.getClassLoader();
		while (loader != null) {
			System.out.println(loader.toString());
			loader = loader.getParent();
		}
	}
}
