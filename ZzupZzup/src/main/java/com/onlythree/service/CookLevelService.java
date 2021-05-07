package com.onlythree.service;

import java.util.List;

import com.onlythree.vo.CookLevel;

public interface CookLevelService {
	public void makeCookLevel(CookLevel cookLevel) throws Exception;
	public void updateCookLevel(String level_id, String level_title) throws Exception;
	public CookLevel cookLevelInfo(String level_id) throws Exception;
	public List<CookLevel> allCookLevelInfo() throws Exception;
	public void deleteCookLevel(String level_id) throws Exception;
}
