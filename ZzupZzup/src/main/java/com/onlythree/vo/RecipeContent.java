package com.onlythree.vo;

import org.springframework.stereotype.Component;

@Component("recipecontent")
public class RecipeContent {
	private int RECIPE_ID;
	private int RECIPE_STEP;
	private String CONTENT_CONTENT;
	private String CONTENT_IMAGE_URL;
	public int getRECIPE_ID() {
		return RECIPE_ID;
	}
	public void setRECIPE_ID(int rECIPE_ID) {
		RECIPE_ID = rECIPE_ID;
	}
	public int getRECIPE_STEP() {
		return RECIPE_STEP;
	}
	public void setRECIPE_STEP(int rECIPE_STEP) {
		RECIPE_STEP = rECIPE_STEP;
	}
	public String getCONTENT_CONTENT() {
		return CONTENT_CONTENT;
	}
	public void setCONTENT_CONTENT(String cONTENT_CONTENT) {
		CONTENT_CONTENT = cONTENT_CONTENT;
	}
	public String getCONTENT_IMAGE_URL() {
		return CONTENT_IMAGE_URL;
	}
	public void setCONTENT_IMAGE_URL(String cONTENT_IMAGE_URL) {
		CONTENT_IMAGE_URL = cONTENT_IMAGE_URL;
	}
	
	
	
}
