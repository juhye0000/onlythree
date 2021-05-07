package com.onlythree.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.onlythree.vo.Scrap;

@Mapper
@Repository("scrapDAO")
public interface ScrapDAO {
	// 레시피 스크랩
	public void insertScrap(Scrap scrap) throws Exception;

	// 스크랩타이틀 변경
	public void updateScrapTitle(Scrap scrap) throws Exception;

	// scrap_id로 스크랩 선택
	public Scrap selectScrapByID(int SCRAP_ID) throws Exception;

	// 회원 스크랩 목록
	public List<Scrap> selectAllScrapList(String MEMBER_ID) throws Exception;

	// 스크랩 삭제
	public void deleteScrap(int SCRAP_ID) throws Exception;

	// 0430 주혜 수정 - 스크랩 선택
	public Scrap selectScrapByTitle(String SCRAP_TITLE) throws Exception;

	// 0430 주혜 수정 - 기가지니가 스크랩한 레시피 선택
	public int selectScrapGenie(Scrap scrap) throws Exception;

	// 0428 재현 마이페이지 나의 스크랩 목록
	public List<Scrap> getMyScrap(String MEMBER_ID) throws Exception;

	// 0427 마이페이지 개인스크랩목록
	public List<Scrap> selectAllMyScrapList(String MEMBER_ID) throws Exception;

	// 0428 주혜 추가
	public int selectMaxScrapID() throws Exception;
	
	//0504 재현 마이페이지 스크랩 개수
	public int countMyScrapRecipe(String MEMBER_ID) throws Exception;

}
