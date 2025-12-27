package com.controller;

import java.security.SecureRandom;

public class RandomString {
	public static String generatekey() {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(16);
        
        for (int i = 0; i < 16; i++) {
            int digit = random.nextInt(10); // generates a number between 0-9
            sb.append(digit);
        }

        String randomString = sb.toString();
        System.out.println("Random 16-digit string: " + randomString);
		return randomString;
    }
}
