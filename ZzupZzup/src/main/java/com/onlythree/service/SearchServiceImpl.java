package com.onlythree.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.onlythree.dao.RecipeDAO;
import com.onlythree.vo.Recipe;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private RecipeDAO recipeDAO;

	//0504 검색결과
	@Override
	public List<Recipe> recipeBySearchWord(String searchword) throws Exception {
		return recipeDAO.selectRecipeBySearchWord(searchword);
	}

	public int NumRecipeBySearchWord(String searchword) throws Exception{
		return recipeDAO.countRecipeBySearchWord(searchword);
	}

}
