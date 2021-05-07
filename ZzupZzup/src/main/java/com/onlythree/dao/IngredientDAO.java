package com.onlythree.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.onlythree.vo.Ingredient;

@Mapper
@Repository("ingredientDAO")
public interface IngredientDAO {
	public void insertIngredient(Ingredient ingredient) throws Exception;
	public Ingredient selectIngredient(String ingredient_id) throws Exception;
	public void updateIngredientName(Ingredient ingredient) throws Exception;
	public List<Ingredient> selectAllIngredientList() throws Exception;
	public void deleteIngredient(String ingredient_id) throws Exception;
	
	//재현추가
	public List<Ingredient> selectDistinctIngredientList() throws Exception;
	//재현추가
	public List<String> selectAllIngredientListByCategory(String ingredient_category) throws Exception;



}
