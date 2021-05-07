package com.onlythree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.onlythree.dao.IngredientDAO;
import com.onlythree.vo.Ingredient;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class IngredientServiceImpl implements IngredientService {
	@Autowired
	private IngredientDAO ingredientDAO;
	
	@Override
	public void makeIngredient(Ingredient ingredient) throws Exception {
		Ingredient tingredient = ingredientDAO.selectIngredient(ingredient.getIngredient_name());
		if(tingredient!=null) {
			throw new Exception("재료명 중복");
		} else {
			ingredientDAO.insertIngredient(ingredient);
		}
	}

	@Override
	public void updateIngredientName(String ingredient_id, String ingredient_name) throws Exception {
		Ingredient ingredient = ingredientDAO.selectIngredient(ingredient_id);
		if(ingredient==null) {
			throw new Exception("재료명 없음");
		} else {
			ingredient.setIngredient_name(ingredient_name);
			ingredientDAO.updateIngredientName(ingredient);
		}
	}

	@Override
	public Ingredient ingredientInfo(String ingredient_id) throws Exception {
		return ingredientDAO.selectIngredient(ingredient_id);
	}

	@Override
	public List<Ingredient> allIngredientInfo() throws Exception {
		return ingredientDAO.selectAllIngredientList();
	}

	@Override
	public void deleteIngredient(String ingredient_id) throws Exception {
		Ingredient ingredient = ingredientDAO.selectIngredient(ingredient_id);
		if(ingredient==null) {
			throw new Exception("재료명 없음");
		} else {
			ingredientDAO.deleteIngredient(ingredient_id);
		}
	}
	
	// 0423 재현추가
	public List<Ingredient> allIngredientCategory() throws Exception {
		return ingredientDAO.selectDistinctIngredientList();
	}

	// 0423 재현추가
	public List<String> allIngredientByCategory(String ingredient_category) throws Exception {
		return ingredientDAO.selectAllIngredientListByCategory(ingredient_category);
	}
}
