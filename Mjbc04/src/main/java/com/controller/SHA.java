package com.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA {
	public static String sha256(String input) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedHash = digest.digest(input.getBytes());

            // Convert to hexadecimal
            StringBuilder hexString = new StringBuilder();
            for (byte b : encodedHash) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("SHA-256 algorithm not available", e);
        }
    }
	
	public static void main(String[] args) {
		String s="hello java";
		String op=sha256(s);
		System.out.println(op);
	}
}
