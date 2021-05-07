package com.onlythree.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.onlythree.dao.RecipeDAO;
import com.onlythree.vo.Recipe;
import com.onlythree.vo.RecipeContent;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class RecipeServiceImpl implements RecipeService {
	
	//0423 우리
	@Autowired
	private RecipeDAO recipeDAO;

	@Override
	public Recipe getRecipe(int RECIPE_ID) throws Exception {
		System.out.println(RECIPE_ID);
		Recipe recipe = recipeDAO.getRecipe(RECIPE_ID);
		recipe.setCONTENT(recipeDAO.getRecipeContent(RECIPE_ID));
		return recipe;
	}
	@Override
	   public void insertRecipe(Recipe recipe) throws Exception {
	      int recipe_id = recipeDAO.selectMaxRecipeID()+1;
	      recipe.setRECIPE_ID(recipe_id);
	      RecipeContent recipeContent = new RecipeContent();
	      recipeContent.setRECIPE_ID(recipe_id);
	      recipeDAO.insertRecipe(recipe);
	}
	@Override
	public void updateRecipe(Recipe recipe, int RECIPE_ID) throws Exception {
		recipe = recipeDAO.selectRecipe(RECIPE_ID);
		recipeDAO.updateRecipe(recipe, RECIPE_ID);
	}
	
	//0423 주혜 기가지니
	@Override
	public int recipeIdInfo(String search) throws Exception {
		int RECIPE_ID = recipeDAO.selectRecipeId(search);
		Recipe recipe = recipeDAO.selectRecipe(RECIPE_ID);
		if(recipe==null) {
			throw new Exception("레시피 정보 없음");
		} else {
			return RECIPE_ID;
		}
	}
	
	@Override
	public ArrayList<RecipeContent> allRecipeContentList(int RECIPE_ID) throws Exception {
		return recipeDAO.getRecipeContent(RECIPE_ID);
	}	
	
	
	//0504 주혜 추가
	@Override
	public List<Recipe> recipeByHitsTop() throws Exception {
		return recipeDAO.selectRecipeHitsTop();
	}
	
	@Override
	public List<Recipe> recipeByHits() throws Exception {
		return recipeDAO.selectRecipeHits();
	}
	
	@Override
	public List<Recipe> recipeByNewTop() throws Exception {
		return recipeDAO.selectRecipeNewTop();
	}
	
	@Override
	public List<Recipe> recipeByNew() throws Exception {
		return recipeDAO.selectRecipeNew();
	}
	
	
	//0428 주혜 추가 - 레시피 리스트
	@Override
	public List<Recipe> recipeByIngredient(String INGREDIENT_CATEGORY) throws Exception {
		return recipeDAO.selectRecipeByIngredient(INGREDIENT_CATEGORY);
	}
	
	@Override
	public List<Recipe> recipeByTheme(String THEME_TITLE) throws Exception {
		return recipeDAO.selectRecipeByTheme(THEME_TITLE);
	}
	@Override
	public List<Recipe> recipeByMethod(String METHOD_TITLE) throws Exception {
		return recipeDAO.selectRecipeByMethod(METHOD_TITLE);
	}
	@Override
	public List<Recipe> recipeByLevel(String LEVEL_TITLE) throws Exception {
		return recipeDAO.selectRecipeByLevel(LEVEL_TITLE);
	}
	
	//0506 주혜 추가 - 레시피 조회수 추가
	@Override
	public void updateRecipeHits(int RECIPE_ID) throws Exception {
		recipeDAO.updateRecipeHits(RECIPE_ID);
	}
	
	//0423 주혜 관리자페이지
	@Override
	public List<Recipe> allRecipeInfo() throws Exception {
		return recipeDAO.selectAllRecipeList();
	}
	
	@Override
	public void deleteRecipe(int RECIPE_ID) throws Exception {
		Recipe recipe = recipeDAO.selectRecipe(RECIPE_ID);
		if(recipe==null) {
			throw new Exception("레시피 정보 없음");
		} else {
			recipeDAO.deleteRecipe(RECIPE_ID);
		}
	}
	
	//0503 재현
	public void insertRecipeContent(RecipeContent recipecontent) throws Exception{
		recipeDAO.insertRecipeContent2(recipecontent);
	}
}
