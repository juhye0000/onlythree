package com.onlythree.vo;

import org.springframework.stereotype.Component;

@Component("ingredient")
public class Ingredient {
	String ingredient_id;
	String ingredient_category;
	String ingredient_name;
	
	public String getIngredient_id() {
		return ingredient_id;
	}
	public void setIngredient_id(String ingredient_id) {
		this.ingredient_id = ingredient_id;
	}
	public String getIngredient_category() {
		return ingredient_category;
	}
	public void setIngredient_category(String ingredient_category) {
		this.ingredient_category = ingredient_category;
	}
	public String getIngredient_name() {
		return ingredient_name;
	}
	public void setIngredient_name(String ingredient_name) {
		this.ingredient_name = ingredient_name;
	}
	
	
	
}
