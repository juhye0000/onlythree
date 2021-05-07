package com.onlythree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.onlythree.dao.CookLevelDAO;
import com.onlythree.vo.CookLevel;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class CookLevelServiceImpl implements CookLevelService {
	@Autowired
	private CookLevelDAO cookLevelDAO;
	
	@Override
	public void makeCookLevel(CookLevel cookLevel) throws Exception {
		CookLevel tcookLevel = cookLevelDAO.selectCookLevel(cookLevel.getLevel_title());
		if(tcookLevel!=null) {
			throw new Exception("레벨명 중복");
		} else {
			cookLevelDAO.insertCookLevel(cookLevel);
		}
	}

	@Override
	public void updateCookLevel(String level_id, String level_title) throws Exception {
		CookLevel cookLevel = cookLevelDAO.selectCookLevel(level_id);
		if(cookLevel==null) {
			throw new Exception("레벨명 없음");
		} else {
			cookLevel.setLevel_title(level_title);
			cookLevelDAO.updateCookLevelTitle(cookLevel);
		}
	}

	@Override
	public CookLevel cookLevelInfo(String level_id) throws Exception {
		return cookLevelDAO.selectCookLevel(level_id);
	}

	@Override
	public List<CookLevel> allCookLevelInfo() throws Exception {
		return cookLevelDAO.selectAllCookLevelList();
	}

	@Override
	public void deleteCookLevel(String level_id) throws Exception {
		CookLevel cookLevel = cookLevelDAO.selectCookLevel(level_id);
		if(cookLevel==null) {
			throw new Exception("요리레벨명 없음");
		} else {
			cookLevelDAO.deleteCookLevel(level_id);
		}
	}
}
