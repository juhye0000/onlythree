package com.onlythree.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.onlythree.service.RecipeService;
import com.onlythree.vo.Recipe;

@Controller
public class ListController {
	@Autowired
	private RecipeService recipeService;
	//0504 주혜 추가
	//최신순 레시피 조회
	@RequestMapping(value = "/newRecipeList", method = RequestMethod.GET)
	public ModelAndView newRecipeList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			List<Recipe> recipes = recipeService.recipeByNew();
			modelAndView.addObject("recipes", recipes);
			modelAndView.addObject("page", "recipe_list_new");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("listIndex");
		return modelAndView;
	}
	
	//조회수순 레시피 조회
	@RequestMapping(value = "/hitsRecipeList", method = RequestMethod.GET)
	public ModelAndView hitsRecipeList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			List<Recipe> recipes = recipeService.recipeByHits();
			modelAndView.addObject("recipes", recipes);
			modelAndView.addObject("page", "recipe_list_hits");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("listIndex");
		return modelAndView;
	}
	
	//0504 주혜 추가
	
	// 재료별 레시피 조회
	@RequestMapping(value = "/ingredientRecipeList", method = RequestMethod.GET)
	public ModelAndView ingredientrecipeList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			List<Recipe> recipes = recipeService.allRecipeInfo();
			modelAndView.addObject("INGREDIENT_CATEGORY", "전체");
			modelAndView.addObject("recipes", recipes);
			modelAndView.addObject("page", "recipe_list_ingredient");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("listIndex");
		return modelAndView;
	}

	@RequestMapping(value = "/ingredientRecipeList", method = RequestMethod.POST)
	public ModelAndView ingredientrecipeList(
			@RequestParam(value = "INGREDIENT_CATEGORY", required = true) String INGREDIENT_CATEGORY,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			if (INGREDIENT_CATEGORY.equals("전체")) {
				List<Recipe> recipes = recipeService.allRecipeInfo();
				modelAndView.addObject("INGREDIENT_CATEGORY", INGREDIENT_CATEGORY);
				modelAndView.addObject("recipes", recipes);
			} else {
				List<Recipe> recipes = recipeService.recipeByIngredient(INGREDIENT_CATEGORY);
				modelAndView.addObject("INGREDIENT_CATEGORY", INGREDIENT_CATEGORY);
				modelAndView.addObject("recipes", recipes);
			}
			modelAndView.addObject("page", "recipe_list_ingredient");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("listIndex");
		return modelAndView;
	}

	// 테마별 레시피 조회
	@RequestMapping(value = "/themeRecipeList", method = RequestMethod.GET)
	public ModelAndView themeRecipeList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			;
			List<Recipe> recipes = recipeService.allRecipeInfo();
			modelAndView.addObject("THEME_TITLE", "전체");
			modelAndView.addObject("recipes", recipes);
			modelAndView.addObject("page", "recipe_list_theme");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("listIndex");
		return modelAndView;
	}

	@RequestMapping(value = "/themeRecipeList", method = RequestMethod.POST)
	public ModelAndView themeRecipeList(@RequestParam(value = "THEME_TITLE", required = true) String THEME_TITLE,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			if (THEME_TITLE.equals("전체")) {
				List<Recipe> recipes = recipeService.allRecipeInfo();
				modelAndView.addObject("THEME_TITLE", THEME_TITLE);
				modelAndView.addObject("recipes", recipes);
			} else {
				List<Recipe> recipes = recipeService.recipeByTheme(THEME_TITLE);
				modelAndView.addObject("THEME_TITLE", THEME_TITLE);
				modelAndView.addObject("recipes", recipes);
			}
			modelAndView.addObject("page", "recipe_list_theme");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("listIndex");
		return modelAndView;
	}

	// 방법별 레시피 조회
	@RequestMapping(value = "/methodRecipeList", method = RequestMethod.GET)
	public ModelAndView methodRecipeList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			;
			List<Recipe> recipes = recipeService.allRecipeInfo();
			modelAndView.addObject("METHOD_TITLE", "전체");
			modelAndView.addObject("recipes", recipes);
			modelAndView.addObject("page", "recipe_list_method");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("listIndex");
		return modelAndView;
	}

	@RequestMapping(value = "/methodRecipeList", method = RequestMethod.POST)
	public ModelAndView methodRecipeList(@RequestParam(value = "METHOD_TITLE", required = true) String METHOD_TITLE,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			if (METHOD_TITLE.equals("전체")) {
				List<Recipe> recipes = recipeService.allRecipeInfo();
				modelAndView.addObject("METHOD_TITLE", METHOD_TITLE);
				modelAndView.addObject("recipes", recipes);
			} else {
				List<Recipe> recipes = recipeService.recipeByMethod(METHOD_TITLE);
				modelAndView.addObject("METHOD_TITLE", METHOD_TITLE);
				modelAndView.addObject("recipes", recipes);
			}
			modelAndView.addObject("page", "recipe_list_method");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("listIndex");
		return modelAndView;
	}

	// 난이도 레시피 조회
	@RequestMapping(value = "/levelRecipeList", method = RequestMethod.GET)
	public ModelAndView levelRecipeList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			;
			List<Recipe> recipes = recipeService.allRecipeInfo();
			modelAndView.addObject("LEVEL_TITLE", "전체");
			modelAndView.addObject("recipes", recipes);
			modelAndView.addObject("page", "recipe_list_level");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("listIndex");
		return modelAndView;
	}

	@RequestMapping(value = "/levelRecipeList", method = RequestMethod.POST)
	public ModelAndView levelRecipeList(@RequestParam(value = "LEVEL_TITLE", required = true) String LEVEL_TITLE,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			if (LEVEL_TITLE.equals("전체")) {
				List<Recipe> recipes = recipeService.allRecipeInfo();
				modelAndView.addObject("LEVEL_TITLE", LEVEL_TITLE);
				modelAndView.addObject("recipes", recipes);
			} else {
				List<Recipe> recipes = recipeService.recipeByLevel(LEVEL_TITLE);
				modelAndView.addObject("LEVEL_TITLE", LEVEL_TITLE);
				modelAndView.addObject("recipes", recipes);
			}
			modelAndView.addObject("page", "recipe_list_level");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("listIndex");
		return modelAndView;
	}
}
