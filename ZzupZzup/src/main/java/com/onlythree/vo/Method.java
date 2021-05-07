package com.onlythree.vo;

import org.springframework.stereotype.Component;

@Component("method")
public class Method {
	private String method_id;
	private String method_title;
	
	public String getMethod_id() {
		return method_id;
	}
	public void setMethod_id(String method_id) {
		this.method_id = method_id;
	}
	public String getMethod_title() {
		return method_title;
	}
	public void setMethod_title(String method_title) {
		this.method_title = method_title;
	}
}
