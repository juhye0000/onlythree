package com.onlythree.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onlythree.service.RecipeService;
import com.onlythree.service.ScrapService;
import com.onlythree.vo.Recipe;
import com.onlythree.vo.RecipeContent;
import com.onlythree.vo.Scrap;

@Controller
public class GigaGenieController {
	@Autowired
	private RecipeService recipeService;
	@Autowired
	private ScrapService scrapService;

	@ResponseBody
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	public void test(@RequestParam(value = "MEMBER_ID", required = false) String MEMBER_ID,
			@RequestParam(value = "SCRAP_TITLE", required = false) String SCRAP_TITLE, HttpServletResponse response)
			throws Exception {
		Scrap scrap = new Scrap();
		scrap.setMEMBER_ID(MEMBER_ID);
		scrap.setSCRAP_TITLE(SCRAP_TITLE);
		int RECIPE_ID = scrapService.scrapIdInfo(scrap);
		System.out.println(RECIPE_ID);
		Recipe recipe = recipeService.getRecipe(RECIPE_ID);
		String recipes = "";
		if (recipe.getINGREDIENT() != null) {
			recipes += recipe.getINGREDIENT();
		}
		if (recipe.getSOURCE() != null) {
			recipes += "$$" + recipe.getSOURCE();
		}
		ArrayList<RecipeContent> recipeContent = recipeService.allRecipeContentList(RECIPE_ID);
		for (RecipeContent i : recipeContent) {
			recipes += "$$" + i.getCONTENT_CONTENT();
		}
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.write(recipes);
	}
	
	@RequestMapping("/aboutGigagenie")
	public String aboutGigagegie() {
		return "aboutGigagenie";
	}
}
