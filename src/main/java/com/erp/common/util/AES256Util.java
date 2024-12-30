package com.erp.common.util;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import com.erp.common.constant.SecurityConstant;

public class AES256Util{
	
	
	public static String encrypt(String text) throws Exception {
        Cipher cipher = Cipher.getInstance(SecurityConstant.ENCRYPT_ALG);
        SecretKeySpec keySpec = new SecretKeySpec(SecurityConstant.ENCRYPT_IV.getBytes(), "AES");
        IvParameterSpec ivParamSpec = new IvParameterSpec(SecurityConstant.ENCRYPT_IV.getBytes());
        cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivParamSpec);

        byte[] encrypted = cipher.doFinal(text.getBytes("UTF-8"));
        return Base64.getEncoder().encodeToString(encrypted);
    }

    public static String decrypt(String cipherText) throws Exception {
        Cipher cipher = Cipher.getInstance(SecurityConstant.ENCRYPT_ALG);
        SecretKeySpec keySpec = new SecretKeySpec(SecurityConstant.ENCRYPT_IV.getBytes(), "AES");
        IvParameterSpec ivParamSpec = new IvParameterSpec(SecurityConstant.ENCRYPT_IV.getBytes());
        cipher.init(Cipher.DECRYPT_MODE, keySpec, ivParamSpec);

        byte[] decodedBytes = Base64.getDecoder().decode(cipherText);
        byte[] decrypted = cipher.doFinal(decodedBytes);
        return new String(decrypted, "UTF-8");
    }
}
