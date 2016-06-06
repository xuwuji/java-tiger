package com.xuwuji.backend.security;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class EncryptUtil {

	private static final String ALGO = "AES";
	private static final byte[] keyValue = new byte[] { 'T', 'h', 'e', 'B', 'e', 's', 't', 'S', 'e', 'c', 'r', 'e', 't',
			'K', 'e', 'y' };

	public static String encode(String Data) throws Exception {
		Key key = generateKey();
		Cipher c = Cipher.getInstance(ALGO);
		c.init(Cipher.ENCRYPT_MODE, key);
		byte[] encVal = c.doFinal(Data.getBytes());
		String encryptedValue = new String(Base64.encodeBase64(encVal));
		return encryptedValue;
	}

	public static String decode(String encryptedData) throws Exception {
		Key key = generateKey();
		Cipher c = Cipher.getInstance(ALGO);
		c.init(Cipher.DECRYPT_MODE, key);
		byte[] decordedValue = Base64.decodeBase64(encryptedData.getBytes());
		byte[] decValue = c.doFinal(decordedValue);
		String decryptedValue = new String(decValue);
		return decryptedValue;
	}

	private static Key generateKey() throws Exception {
		Key key = new SecretKeySpec(keyValue, ALGO);
		return key;
	}

	public static void main(String[] args) throws Exception {

		String password = "mypassword";
		String passwordEnc = EncryptUtil.encode(password);
		String passwordDec = EncryptUtil.decode(passwordEnc);

		System.out.println("Plain Text : " + password);
		System.out.println("Encrypted Text : " + passwordEnc);
		System.out.println("Decrypted Text : " + passwordDec);
	}
}
