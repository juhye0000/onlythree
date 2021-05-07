package com.onlythree.service;

import java.util.List;

import com.onlythree.vo.Ingredient;

public interface IngredientService {
	public void makeIngredient(Ingredient ingredient) throws Exception;
	public void updateIngredientName(String ingredient_id, String ingredient_name) throws Exception;
	public Ingredient ingredientInfo(String ingredient_id) throws Exception;
	public List<Ingredient> allIngredientInfo() throws Exception;
	public void deleteIngredient(String ingredient_id) throws Exception;


	//0423 재현추가 재료 카테고리명 목록
	public List<Ingredient> allIngredientCategory() throws Exception;
	//0423 재현추가 카테고리명에 따른 재료목록
	public List<String> allIngredientByCategory(String ingredient_category) throws Exception;
}
