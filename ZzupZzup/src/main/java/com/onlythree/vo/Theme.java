package com.onlythree.vo;

import org.springframework.stereotype.Component;

@Component("theme")
public class Theme {
	private String theme_id;
	private String theme_title;
	
	public String getTheme_id() {
		return theme_id;
	}
	public void setTheme_id(String theme_id) {
		this.theme_id = theme_id;
	}
	public String getTheme_title() {
		return theme_title;
	}
	public void setTheme_title(String theme_title) {
		this.theme_title = theme_title;
	}
}
