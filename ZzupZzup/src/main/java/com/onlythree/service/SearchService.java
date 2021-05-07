package com.onlythree.service;

import java.util.List;

import com.onlythree.vo.Recipe;

public interface SearchService {
	
	//0504 검색결과
	public List<Recipe> recipeBySearchWord(String searchword) throws Exception;

	//0504 검색결과 건수
	public int NumRecipeBySearchWord(String searchword) throws Exception;


}
