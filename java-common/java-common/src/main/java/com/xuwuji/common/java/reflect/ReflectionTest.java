package com.xuwuji.common.java.reflect;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class ReflectionTest {

	public static void main(String[] args) {
		try {
			Class c = Class.forName("com.xuwuji.common.java.reflect.ReflectBean");
			ReflectBean instance1 = (ReflectBean) c.newInstance();
			ReflectBean instance2 = (ReflectBean) c.newInstance();
			Method[] methods = c.getDeclaredMethods();
			for (Method m : methods) {
				System.out.println(m.getName());
				if (m.getName().equals("setA")) {
					m.invoke(instance1, 1);
					m.invoke(instance2, 2);
				}
			}
			System.out.println(instance1.getA());
			System.out.println(instance2.getA());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
