package com.xuwuji.common.java.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class FileSize {

	public enum Size {
		KB, MB, GB;
	}

	private String initPath;
	private double count = 0L;
	private ArrayList<File> files;

	public FileSize(String initPath) {
		this.files = new ArrayList<File>();
		this.initPath = initPath;
	}

	public class FileComparator implements Comparator<File> {

		public int compare(File f1, File f2) {
			if (f1.length() >= f2.length()) {
				return 1;
			} else {
				return -1;
			}
		}

	}

	public void run() {
		File file = new File(initPath);
		if (file.isDirectory()) {
			try {
				directoryProcess(file);
			} catch (InterruptedException e) {
				System.out.printf("%s: The search has been interrupted", Thread.currentThread().getName());
				cleanResources();
			}
		}
	}

	/**
	 * Method for cleaning the resources. In this case, is empty
	 */
	private void cleanResources() {

	}

	/**
	 * Method that process a directory
	 * 
	 * @param file
	 *            : Directory to process
	 * @throws InterruptedException
	 *             : If the thread is interrupted
	 */
	private void directoryProcess(File file) throws InterruptedException {
		// System.out.printf("%s : %s\n", Thread.currentThread().getName(),
		// file.getAbsolutePath());
		// Get the content of the directory
		File list[] = file.listFiles();
		if (list != null) {
			for (int i = 0; i < list.length; i++) {
				if (list[i].isDirectory()) {
					// If is a directory, process it
					directoryProcess(list[i]);
				} else {
					// If is a file, process it
					fileProcess(list[i]);
				}
			}
		}
		// Check the interruption
		if (Thread.interrupted()) {
			throw new InterruptedException();
		}
	}

	/**
	 * Method that process a File
	 * 
	 * @param file
	 *            : File to process
	 * @throws InterruptedException
	 *             : If the thread is interrupted
	 */
	private void fileProcess(File file) throws InterruptedException {
		files.add(file);
		count += file.length();
		// System.out.printf("%s : %s\n", Thread.currentThread().getName(),
		// file.getAbsolutePath());
		// Check the interruption
		if (Thread.interrupted()) {
			throw new InterruptedException();
		}
	}

	public String getCount() {
		return formatCount(count);
	}

	public ArrayList<File> getFiles() {
		System.setProperty("java.util.Arrays.useLegacyMergeSort", "true");
		Collections.sort(files, new FileComparator());
		Collections.reverse(files);
		return files;
	}

	private String formatCount(double count) {
		double kb = (count / 1024);
		double mb = (kb / 1024);
		double gb = (mb / 1024);
		if (kb < 1024) {
			return format(kb) + Size.KB.toString();
		} else if (mb < 1024) {
			return format(mb) + Size.MB.toString();
		} else {
			return format(gb) + Size.GB.toString();
		}
	}

	private String format(double number) {
		DecimalFormat d = new DecimalFormat("0.00");
		return d.format(number);
	}

	public static void main(String[] args) {
		FileSize f = new FileSize("/Users/wuxu/Project/eBook");
		f.run();
		ArrayList<File> files = f.getFiles();
		System.out.println(f.getCount());
		for (int i = 0; i < files.size() / 10; i++) {
			System.out.println(files.get(i).getName() + " " + files.get(i).getAbsolutePath() + " "
					+ f.formatCount(files.get(i).length()));
		}
	}

}
