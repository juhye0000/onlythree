package com.onlythree.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.onlythree.vo.CookLevel;

@Mapper
@Repository("cookLevelDAO")
public interface CookLevelDAO {
	public void insertCookLevel(CookLevel cookLevel) throws Exception;
	public CookLevel selectCookLevel(String level_id) throws Exception;
	public void updateCookLevelTitle(CookLevel cookLevel) throws Exception;
	public List<CookLevel> selectAllCookLevelList() throws Exception;
	public void deleteCookLevel(String level_id) throws Exception;
}
