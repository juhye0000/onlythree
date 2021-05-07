package com.onlythree.service;

import java.util.List;

import com.onlythree.vo.Scrap;

public interface ScrapService {
	// 레시피 스크랩
	public void makeScrap(Scrap scrap) throws Exception;
	// 스크랩타이틀 변경
	public void updateScrap(int SCRAP_ID, String SCRAP_TITLE) throws Exception;
	// scrap_id로 스크랩 선택
	 public Scrap scrapInfoById(int SCRAP_ID) throws Exception;
	// 회원 스크랩 목록
	public List<Scrap> allScrapInfo(String MEMBER_ID) throws Exception;
	// 스크랩 삭제
	public void deleteScrap(int SCRAP_ID) throws Exception;

	/*
	 * //0430 주혜 삭제 public Scrap scrapInfoByTitle(String SCRAP_TITLE)
	 * throws Exception;
	 */
	
	//0427 재현 마이페이지 스크랩목록
	/*
	 * public List<Scrap> allMyScrapInfo(String MEMBER_ID, int RECIPE_ID) throws
	 * Exception;
	 */
	
	//0430 주혜 삭제
	// 0427 재현 마이페이지 스크랩목록
	//public List<Scrap> allMyScrapInfo(String MEMBER_ID) throws Exception;
	
	//0428 재현 마이페이지 나의 스크랩 목록
	public List<Scrap> getMyScrapInfo(String MEMBER_ID) throws Exception;
	
	// 기가지니가 스크랩한 레시피 선택
	public int scrapIdInfo(Scrap scrap) throws Exception;
	
	//0504 재현 마이페이지: 내가 스크랩한 레시피 건수
	public int NumMyScrapRecipe(String id) throws Exception;
	
	
}
