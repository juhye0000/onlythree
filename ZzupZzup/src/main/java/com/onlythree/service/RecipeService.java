package com.onlythree.service;


import java.util.ArrayList;
import java.util.List;

import com.onlythree.vo.Recipe;
import com.onlythree.vo.RecipeContent;

public interface RecipeService {
	//0423 우리
	public Recipe getRecipe(int RECIPE_ID) throws Exception;
	public void insertRecipe(Recipe recipe) throws Exception;
	public void updateRecipe(Recipe recipe, int RECIPE_ID) throws Exception;
	
	//0423 주혜 기가지니
	public int recipeIdInfo(String search) throws Exception;
	public ArrayList<RecipeContent> allRecipeContentList(int RECIPE_ID) throws Exception;
		
	//0504 주혜 추가
	public List<Recipe> recipeByHitsTop() throws Exception;
	public List<Recipe> recipeByHits() throws Exception;
	public List<Recipe> recipeByNewTop() throws Exception;
	public List<Recipe> recipeByNew() throws Exception;
	
	//0428 주혜 추가 - 레시피 리스트
	public List<Recipe> recipeByIngredient(String INGREDIENT_CATEGORY) throws Exception;
	public List<Recipe> recipeByTheme(String THEME_TITLE) throws Exception;
	public List<Recipe> recipeByMethod(String METHOD_TITLE) throws Exception;
	public List<Recipe> recipeByLevel(String LEVEL_TITLE) throws Exception;	
	
	//0506 주혜 추가 - 레시피 조회수 추가
	public void updateRecipeHits(int RECIPE_ID) throws Exception;
	
	//0423 주혜 관리자페이지
	public List<Recipe> allRecipeInfo() throws Exception;
	public void deleteRecipe(int RECIPE_ID) throws Exception;
	
	//0503 재현 추가
	public void insertRecipeContent(RecipeContent recipecontent) throws Exception;


}
