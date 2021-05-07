package com.onlythree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.onlythree.dao.ThemeDAO;
import com.onlythree.vo.Theme;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ThemeServiceImpl implements ThemeService {
	@Autowired
	private ThemeDAO themeDAO;
	
	@Override
	public void makeTheme(Theme theme) throws Exception {
		Theme ttheme = themeDAO.selectTheme(theme.getTheme_title());
		if(ttheme!=null) {
			throw new Exception("테마명 중복");
		} else {
			themeDAO.insertTheme(theme);
		}
	}

	@Override
	public void updateTheme(String theme_id, String theme_title) throws Exception {
		Theme theme = themeDAO.selectTheme(theme_id);
		if(theme==null) {
			throw new Exception("테마명 없음");
		} else {
			theme.setTheme_title(theme_title);
			themeDAO.updateThemeTitle(theme);
		}
	}

	@Override
	public Theme themeInfo(String theme_id) throws Exception {
		return themeDAO.selectTheme(theme_id);
	}

	@Override
	public List<Theme> allThemeInfo() throws Exception {
		return themeDAO.selectAllThemeList();
	}

	@Override
	public void deleteTheme(String theme_id) throws Exception {
		Theme theme = themeDAO.selectTheme(theme_id);
		if(theme==null) {
			throw new Exception("테마명 없음");
		} else {
			themeDAO.deleteTheme(theme_id);
		}
	}
}
