package com.onlythree.service;

import java.util.List;

import com.onlythree.vo.Theme;

public interface ThemeService {
	public void makeTheme(Theme theme) throws Exception;
	public void updateTheme(String theme_id, String theme_title) throws Exception;
	public Theme themeInfo(String theme_id) throws Exception;
	public List<Theme> allThemeInfo() throws Exception;
	public void deleteTheme(String theme_id) throws Exception;
}
