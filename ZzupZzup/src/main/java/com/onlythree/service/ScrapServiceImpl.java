package com.onlythree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.onlythree.dao.RecipeDAO;
import com.onlythree.dao.ScrapDAO;
import com.onlythree.vo.Scrap;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ScrapServiceImpl implements ScrapService {
	@Autowired
	private ScrapDAO scrapDAO;

	/*
	 * 0430 주혜 삭제
	 * 
	 * @Autowired private RecipeDAO recipeDAO;
	 */

	@Override
	public void makeScrap(Scrap scrap) throws Exception {
		int SCRAP_ID = scrapDAO.selectMaxScrapID() + 1;
		scrap.setSCRAP_ID(SCRAP_ID);
		Scrap tscrap = scrapDAO.selectScrapByTitle(scrap.getSCRAP_TITLE());
		if (tscrap != null) {
			throw new Exception("스크랩 타이틀 중복");
		} else {
			scrapDAO.insertScrap(scrap);
		}
	}

	@Override
	public void updateScrap(int SCRAP_ID, String SCRAP_TITLE) throws Exception {
		Scrap scrap = scrapDAO.selectScrapByID(SCRAP_ID);
		if (scrap == null) {
			throw new Exception("스크랩ID 없음");
		} else {
			scrap.setSCRAP_TITLE(SCRAP_TITLE);
			scrapDAO.updateScrapTitle(scrap);
		}
	}

	@Override
	public Scrap scrapInfoById(int SCRAP_ID) throws Exception {
		return scrapDAO.selectScrapByID(SCRAP_ID);
	}

	@Override
	public List<Scrap> allScrapInfo(String MEMBER_ID) throws Exception {
		return scrapDAO.selectAllScrapList(MEMBER_ID);
	}

	@Override
	public void deleteScrap(int SCRAP_ID) throws Exception {
		Scrap scrap = scrapDAO.selectScrapByID(SCRAP_ID);
		if (scrap == null) {
			throw new Exception("스크랩ID 없음");
		} else {
			scrapDAO.deleteScrap(SCRAP_ID);
		}
	}

	/*
	 * // 0430 주혜 삭제
	 * 
	 * @Override public Scrap scrapInfoByTitle(String SCRAP_TITLE) throws Exception
	 * { return scrapDAO.selectScrap(SCRAP_TITLE); }
	 */

	/*
	 * 0430 주혜 삭제 // 0427 재현 마이페이지 스크랩목록 public List<Scrap> allMyScrapInfo(String
	 * MEMBER_ID) throws Exception { return
	 * scrapDAO.selectAllMyScrapList(MEMBER_ID); }
	 */

	// 0428
	public List<Scrap> getMyScrapInfo(String MEMBER_ID) throws Exception {
		List<Scrap> scrap = scrapDAO.getMyScrap(MEMBER_ID);

		return scrap;
	}

	// 0430 주혜 수정 - 기가지니
	@Override
	public int scrapIdInfo(Scrap scrap) throws Exception {
		return scrapDAO.selectScrapGenie(scrap);
	}
	
	//0504 재현 마이페이지: 내가 스크랩한 레시피 건수
	public int NumMyScrapRecipe(String id) throws Exception{
		return scrapDAO.countMyScrapRecipe(id);
	}
	
}
