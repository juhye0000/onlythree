package com.onlythree.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.onlythree.vo.Theme;

@Mapper
@Repository("themeDAO")
public interface ThemeDAO {
	public void insertTheme(Theme theme) throws Exception;
	public Theme selectTheme(String theme_id) throws Exception;
	public void updateThemeTitle(Theme theme) throws Exception;
	public List<Theme> selectAllThemeList() throws Exception;
	public void deleteTheme(String theme_id) throws Exception;
}
