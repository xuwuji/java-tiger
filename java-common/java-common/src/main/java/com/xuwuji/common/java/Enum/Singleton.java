package com.xuwuji.common.java.Enum;

/**
 * This approach implements the singleton by taking advantage of Java's
 * guarantee that any enum value is instantiated only once in a Java program.
 * Since Java enum values are globally accessible, so is the singleton,
 * initialized lazily by the class loader. The drawback is that the enum type is
 * somewhat inflexible.
 * 
 * 
 * @author wuxu
 *
 */
public enum Singleton {

	INSTANCE;

	public void execute() {
		// ....
	}
}
