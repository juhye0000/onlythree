package com.onlythree.vo;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component("recipe")
public class Recipe {
	private int RECIPE_ID;
	private String TITLE;
	private String MEMBER_ID;
	private String NICKNAME;
	private String INGREDIENT_CATEGORY;
	private String METHOD_ID;
	private String METHOD_TITLE;
	private String THEME_ID;
	private String THEME_TITLE;
	private String LEVEL_ID;
	private String LEVEL_TITLE;
	private Date CREATED_DATE;
	private Date UPDATED_DATE;
	private String TAG;
	private int RECIPE_HITS=0;
	private String TIME;
	private String MEALS_FOR;
	private String MAINPIC1_URL;
	private String MAINPIC2_URL;
	private String MAINPIC3_URL;
	private String FINALPIC1_URL;
	private String FINALPIC2_URL;
	private String FINALPIC3_URL;
	private String INGREDIENT;
	private String SOURCE;

	private ArrayList<RecipeContent> CONTENT;
	private String searchword;

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

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getNICKNAME() {
		return NICKNAME;
	}

	public void setNICKNAME(String nICKNAME) {
		NICKNAME = nICKNAME;
	}

	public String getINGREDIENT_CATEGORY() {
		return INGREDIENT_CATEGORY;
	}

	public void setINGREDIENT_CATEGORY(String iNGREDIENT_CATEGORY) {
		INGREDIENT_CATEGORY = iNGREDIENT_CATEGORY;
	}

	public String getMETHOD_ID() {
		return METHOD_ID;
	}

	public void setMETHOD_ID(String mETHOD_ID) {
		METHOD_ID = mETHOD_ID;
	}

	public String getMETHOD_TITLE() {
		return METHOD_TITLE;
	}

	public void setMETHOD_TITLE(String mETHOD_TITLE) {
		METHOD_TITLE = mETHOD_TITLE;
	}

	public String getTHEME_ID() {
		return THEME_ID;
	}

	public void setTHEME_ID(String tHEME_ID) {
		THEME_ID = tHEME_ID;
	}

	public String getTHEME_TITLE() {
		return THEME_TITLE;
	}

	public void setTHEME_TITLE(String tHEME_TITLE) {
		THEME_TITLE = tHEME_TITLE;
	}

	public String getLEVEL_ID() {
		return LEVEL_ID;
	}

	public void setLEVEL_ID(String lEVEL_ID) {
		LEVEL_ID = lEVEL_ID;
	}

	public String getLEVEL_TITLE() {
		return LEVEL_TITLE;
	}

	public void setLEVEL_TITLE(String lEVEL_TITLE) {
		LEVEL_TITLE = lEVEL_TITLE;
	}

	public Date getCREATED_DATE() {
		return CREATED_DATE;
	}

	public void setCREATED_DATE(Date cREATED_DATE) {
		CREATED_DATE = cREATED_DATE;
	}

	public Date getUPDATED_DATE() {
		return UPDATED_DATE;
	}

	public void setUPDATED_DATE(Date uPDATED_DATE) {
		UPDATED_DATE = uPDATED_DATE;
	}

	public String getTAG() {
		return TAG;
	}

	public void setTAG(String tAG) {
		TAG = tAG;
	}

	public int getRECIPE_HITS() {
		return RECIPE_HITS;
	}

	public void setRECIPE_HITS(int rECIPE_HITS) {
		RECIPE_HITS = rECIPE_HITS;
	}

	public String getTIME() {
		return TIME;
	}

	public void setTIME(String tIME) {
		TIME = tIME;
	}

	public String getMEALS_FOR() {
		return MEALS_FOR;
	}

	public void setMEALS_FOR(String mEALS_FOR) {
		MEALS_FOR = mEALS_FOR;
	}

	public String getMAINPIC1_URL() {
		return MAINPIC1_URL;
	}

	public void setMAINPIC1_URL(String mAINPIC1_URL) {
		MAINPIC1_URL = mAINPIC1_URL;
	}

	public String getMAINPIC2_URL() {
		return MAINPIC2_URL;
	}

	public void setMAINPIC2_URL(String mAINPIC2_URL) {
		MAINPIC2_URL = mAINPIC2_URL;
	}

	public String getMAINPIC3_URL() {
		return MAINPIC3_URL;
	}

	public void setMAINPIC3_URL(String mAINPIC3_URL) {
		MAINPIC3_URL = mAINPIC3_URL;
	}

	public String getFINALPIC1_URL() {
		return FINALPIC1_URL;
	}

	public void setFINALPIC1_URL(String fINALPIC1_URL) {
		FINALPIC1_URL = fINALPIC1_URL;
	}

	public String getFINALPIC2_URL() {
		return FINALPIC2_URL;
	}

	public void setFINALPIC2_URL(String fINALPIC2_URL) {
		FINALPIC2_URL = fINALPIC2_URL;
	}

	public String getFINALPIC3_URL() {
		return FINALPIC3_URL;
	}

	public void setFINALPIC3_URL(String fINALPIC3_URL) {
		FINALPIC3_URL = fINALPIC3_URL;
	}

	public String getINGREDIENT() {
		return INGREDIENT;
	}

	public void setINGREDIENT(String iNGREDIENT) {
		INGREDIENT = iNGREDIENT;
	}

	public String getSOURCE() {
		return SOURCE;
	}

	public void setSOURCE(String sOURCE) {
		SOURCE = sOURCE;
	}

	public ArrayList<RecipeContent> getCONTENT() {
		return CONTENT;
	}

	public void setCONTENT(ArrayList<RecipeContent> cONTENT) {
		CONTENT = cONTENT;
	}

	public String getSearchword() {
		return searchword;
	}

	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}

	
	
}
