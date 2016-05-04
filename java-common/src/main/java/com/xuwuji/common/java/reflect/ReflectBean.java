package com.xuwuji.common.java.reflect;

import java.util.ArrayList;

public class ReflectBean {

	private int a;
	private String b;
	private float c;
	private ArrayList<String> d;

	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}

	public float getC() {
		return c;
	}

	public void setC(float c) {
		this.c = c;
	}

	public ArrayList<String> getD() {
		return d;
	}

	public void setD(ArrayList<String> d) {
		this.d = d;
	}

	@Override
	public String toString() {
		return "ReflectBean [a=" + a + ", b=" + b + ", c=" + c + ", d=" + d + "]";
	}

}
