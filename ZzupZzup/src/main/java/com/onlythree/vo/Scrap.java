package com.onlythree.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("scrap")
public class Scrap {
	private int SCRAP_ID;
	private String SCRAP_TITLE;
	private Date SCRAP_DATE;
	private String MEMBER_ID;
	private int RECIPE_ID;
	
	private String TITLE;
	private String MAINPIC1_URL;
	
	public int getSCRAP_ID() {
		return SCRAP_ID;
	}
	public void setSCRAP_ID(int sCRAP_ID) {
		SCRAP_ID = sCRAP_ID;
	}
	public String getSCRAP_TITLE() {
		return SCRAP_TITLE;
	}
	public void setSCRAP_TITLE(String sCRAP_TITLE) {
		SCRAP_TITLE = sCRAP_TITLE;
	}
	public Date getSCRAP_DATE() {
		return SCRAP_DATE;
	}
	public void setSCRAP_DATE(Date sCRAP_DATE) {
		SCRAP_DATE = sCRAP_DATE;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public int getRECIPE_ID() {
		return RECIPE_ID;
	}
	public void setRECIPE_ID(int rECIPE_ID) {
		RECIPE_ID = rECIPE_ID;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getMAINPIC1_URL() {
		return MAINPIC1_URL;
	}
	public void setMAINPIC1_URL(String mAINPIC1_URL) {
		MAINPIC1_URL = mAINPIC1_URL;
	}
	
}
