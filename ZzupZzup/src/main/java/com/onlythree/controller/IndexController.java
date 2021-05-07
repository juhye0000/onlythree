package com.onlythree.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onlythree.service.RecipeService;
import com.onlythree.vo.Recipe;


@Controller
public class IndexController {
	@Autowired
	private RecipeService recipeService;
	
	@RequestMapping("/")
	public String index(Model model) {
		try {
			List<Recipe> newRecipes = recipeService.recipeByNewTop();
			model.addAttribute("newRecipes", newRecipes);
			List<Recipe> bestRecipes = recipeService.recipeByHitsTop();
			model.addAttribute("bestRecipes", bestRecipes);
		} catch(Exception e) {
			model.addAttribute("err", "레시피 조회 오류");
		}
		return "index";
	}

	@RequestMapping("/recipe_list")
	public String recipe_list_ingredient() {
		return "recipe_list";
	}

}

