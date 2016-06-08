package com.xuwuji.common.java.jvm;

public class A extends B {
	static {
		System.out.println("Class A is initialized."); // 不会输出
	}
}