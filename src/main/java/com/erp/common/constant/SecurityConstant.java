package com.erp.common.constant;

import java.io.IOException;
import java.util.Properties;

public class SecurityConstant {

	private static final Properties props;

	static {
		props = new Properties();
		try {
			props.load(SecurityConstant.class.getClassLoader().getResourceAsStream("security.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static final String ENCRYPT_ALG = "AES/CBC/PKCS5Padding";
	public static final String ENCRYPT_KEY = "01234567899254321111012345678901";
	public static final String ENCRYPT_IV = ENCRYPT_KEY.substring(0, 16);
}