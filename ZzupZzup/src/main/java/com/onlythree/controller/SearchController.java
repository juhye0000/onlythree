package com.onlythree.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.onlythree.service.RecipeService;
import com.onlythree.service.SearchService;
import com.onlythree.vo.Recipe;

@Controller
public class SearchController {
	@Autowired
	private RecipeService recipeService;
	
	@Autowired
	private SearchService searchService;

	// 재료별 레시피 조회
	@RequestMapping(value = "/SearchRecipeList", method = RequestMethod.POST)
	public ModelAndView SearchRecipeList(HttpSession session,
			HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			String searchword = request.getParameter("searchword");
			int searchCount = searchService.NumRecipeBySearchWord(searchword);
			List<Recipe> recipes = searchService.recipeBySearchWord(searchword);
			modelAndView.addObject("searchCount", searchCount);
			modelAndView.addObject("recipes", recipes);
			modelAndView.addObject("page", "recipe_list_search");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("listIndex");
		return modelAndView;
	}

	
}
