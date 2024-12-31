package com.erp.common.security;

public class SecurityContext{
	
	private static final ThreadLocal<UserInfo> currentUser = new ThreadLocal<>();

    public static UserInfo getCurrentUser() {
        return currentUser.get();
    }

    public static void setCurrentUser(UserInfo user) {
        currentUser.set(user);
    }

    public static void clear() {
        currentUser.remove();
    }
}