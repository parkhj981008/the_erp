package com.erp.common.security;

import com.erp.common.rest.RestBusinessException;
import com.erp.common.rest.RestBusinessException.StatusCode;

public class SecurityContext{
	
	private static final ThreadLocal<UserInfo> currentUser = new ThreadLocal<>();

    public static UserInfo getCurrentUser() {
    	try {
    		return currentUser.get();	
    	} catch(Exception e) {
    		throw new RestBusinessException(StatusCode.UNAUTHORIZED);
    	}
    }

    public static void setCurrentUser(UserInfo user) {
        currentUser.set(user);
    }

    public static void clear() {
        currentUser.remove();
    }
}