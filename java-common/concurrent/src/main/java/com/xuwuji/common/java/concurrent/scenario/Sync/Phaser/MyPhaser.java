package com.xuwuji.common.java.concurrent.scenario.Sync.Phaser;

import java.util.concurrent.Phaser;

class MyPhaser extends Phaser {

	public MyPhaser(int number) {
		super(number);
	}

	/**
	 * The Phaser class provides a method that is executed each time the phaser
	 * changes the phase. It's the onAdvance() method. It receives two
	 * parameters: the number of the current phase and the number of registered
	 * participants; it returns a Boolean value, false if the phaser continues
	 * its execution, or true if the phaser has nished and has to enter into the
	 * termination state. The default implementation of this method returns true
	 * if the number of registered participants is zero, and false otherwise.
	 * But you can modify this behavior if you extend the Phaser class and you
	 * override this method. Normally, you will be interested in doing this when
	 * you have to execute some actions when you advance from one phase to the
	 * next one.
	 */
	@Override
	protected boolean onAdvance(int phase, int registeredParties) {
		System.out.printf("all tasks have finished phase %d \n", phase);
		System.out.printf("phase %d is changing \n", phase);
		return super.onAdvance(phase, registeredParties);
	}
}