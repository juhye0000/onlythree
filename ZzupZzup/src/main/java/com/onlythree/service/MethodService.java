package com.onlythree.service;

import java.util.List;

import com.onlythree.vo.Method;

public interface MethodService {
	public void makeMethod(Method method) throws Exception;
	public void updateMethod(String method_id, String method_title) throws Exception;
	public Method methodInfo(String method_id) throws Exception;
	public List<Method> allMethodInfo() throws Exception;
	public void deleteMethod(String method_id) throws Exception;
}
