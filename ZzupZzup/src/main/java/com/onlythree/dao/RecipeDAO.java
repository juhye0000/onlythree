package com.onlythree.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.onlythree.vo.Recipe;
import com.onlythree.vo.RecipeContent;



@Mapper
@Repository("recipeDAO")
public interface RecipeDAO {
	//0423 우리 
	public int selectMaxRecipeID() throws Exception;
	public void insertRecipe(Recipe recipe) throws Exception;
	public ArrayList<RecipeContent> insertRecipeContent(RecipeContent recipeContent) throws Exception;
	public Recipe getRecipe(int RECIPE_ID) throws Exception;
	public ArrayList<RecipeContent> getRecipeContent (int RECIPE_ID) throws Exception;
	public void updateRecipe(Recipe recipe, int RECIPE_ID) throws Exception;
	
	//0423 재현 마이페이지 내가 작성한 레시피
	public List<Recipe> selectMyRecipeinfo(String id) throws Exception;
	
	//0504 주혜 추가
	public List<Recipe> selectRecipeHitsTop() throws Exception;
	public List<Recipe> selectRecipeHits() throws Exception;
	public List<Recipe> selectRecipeNewTop() throws Exception;
	public List<Recipe> selectRecipeNew() throws Exception;
	
	//0428 주혜 추가 - 레시피 리스트
	public List<Recipe> selectRecipeByIngredient(String INGREDIENT_CATEGORY) throws Exception;
	public List<Recipe> selectRecipeByTheme(String THEME_TITLE) throws Exception;
	public List<Recipe> selectRecipeByMethod(String METHOD_TITLE) throws Exception;
	public List<Recipe> selectRecipeByLevel(String LEVEL_TITLE) throws Exception;
	
	//0506 주혜 추가 - 레시피 조회수 추가
	public void updateRecipeHits(int RECIPE_ID) throws Exception;
	
	//0423 주혜 기가지니
	public int selectRecipeId(String search) throws Exception;
	//0430 주혜 변경사항
	//public ArrayList<RecipeContent> selectRecipeContent(String search) throws Exception;
	
	//0423 주혜 관리자 페이지
	public Recipe selectRecipe(int RECIPE_ID) throws Exception;
	public List<Recipe> selectAllRecipeList() throws Exception;
	public void deleteRecipe(int RECIPE_ID) throws Exception;
	
	//0428 재현 마이페이지 내가 작성한 레시피 목록
	public List<Recipe> getRecipeInfo(int RECIPE_ID) throws Exception;
	
	//0503 재현 레시피 작성
	public void insertRecipeContent2(RecipeContent recipeContent) throws Exception;
	
	//0504 재현 검색기능
	public List<Recipe> selectRecipeBySearchWord(String searchword) throws Exception;
	//0504 재현 검색건수
	public int countRecipeBySearchWord(String searchword) throws Exception;
	//0504 재현 마이페이지 내가 작석한 레시피 건수
	public int countMyRecipe(String id) throws Exception;
}
