package com.onlythree.vo;

import org.springframework.stereotype.Component;

@Component("cookLevel")
public class CookLevel {
	private String level_id;
	private String level_title;
	
	public String getLevel_id() {
		return level_id;
	}
	public void setLevel_id(String level_id) {
		this.level_id = level_id;
	}
	public String getLevel_title() {
		return level_title;
	}
	public void setLevel_title(String level_title) {
		this.level_title = level_title;
	}
}
