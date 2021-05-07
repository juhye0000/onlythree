package com.onlythree.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.onlythree.service.CookLevelService;
import com.onlythree.service.IngredientService;
import com.onlythree.service.MethodService;
import com.onlythree.service.ThemeService;
import com.onlythree.vo.CookLevel;
import com.onlythree.vo.Ingredient;
import com.onlythree.vo.Method;
import com.onlythree.vo.Theme;

@Controller
public class CategoryController {
	@Autowired
	private ThemeService themeService;
	@Autowired
	private MethodService methodService;
	@Autowired
	private CookLevelService cookLevelService;
	@Autowired
	private IngredientService ingredientService;

	//카테고리 생성
	@RequestMapping(value = "/maketheme", method = RequestMethod.GET)
	public String makeTheme(Model model) {
		model.addAttribute("page", "maketheme_form");
		return "adminindex";
	}

	@RequestMapping(value = "/maketheme", method = RequestMethod.POST)
	public String makeTheme(@ModelAttribute Theme theme, Model model) {
		try {
			themeService.makeTheme(theme);
			model.addAttribute("page", "maketheme_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 입력 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/makemethod", method = RequestMethod.GET)
	public String makeMethod(Model model) {
		model.addAttribute("page", "makemethod_form");
		return "adminindex";
	}

	@RequestMapping(value = "/makemethod", method = RequestMethod.POST)
	public String makeMethod(@ModelAttribute Method method, Model model) {
		try {
			methodService.makeMethod(method);
			model.addAttribute("page", "makemethod_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 입력 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/makelevel", method = RequestMethod.GET)
	public String makeLevel(Model model) {
		model.addAttribute("page", "makelevel_form");
		return "adminindex";
	}

	@RequestMapping(value = "/makelevel", method = RequestMethod.POST)
	public String makeLevel(@ModelAttribute CookLevel cookLevel, Model model) {
		try {
			cookLevelService.makeCookLevel(cookLevel);
			model.addAttribute("page", "makelevel_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 입력 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/makeingredient", method = RequestMethod.GET)
	public String makeIngredient(Model model) {
		model.addAttribute("page", "makeingredient_form");
		return "adminindex";
	}

	@RequestMapping(value = "/makeingredient", method = RequestMethod.POST)
	public String makeIngredient(@ModelAttribute Ingredient ingredient, Model model) {
		try {
			ingredientService.makeIngredient(ingredient);
			model.addAttribute("page", "makeingredient_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 입력 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	//카테고리 수정
	@RequestMapping(value = "/updatetheme", method = RequestMethod.GET)
	public String updateTheme(Model model) {
		try {
			List<Theme> themes = themeService.allThemeInfo();
			model.addAttribute("themes", themes);
			model.addAttribute("page", "updatetheme_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 수정 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/updatetheme", method = RequestMethod.POST)
	public String updateTheme(@RequestParam(value = "theme_id", required = true) String theme_id,
							  @RequestParam(value = "theme_title", required = true) String theme_title, Model model) {
		try {
			themeService.updateTheme(theme_id, theme_title);
			model.addAttribute("page", "updatetheme_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 수정 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}
	
	@RequestMapping(value = "/updatemethod", method = RequestMethod.GET)
	public String updateMethod(Model model) {
		try {
			List<Method> methods = methodService.allMethodInfo();
			model.addAttribute("methods", methods);
			model.addAttribute("page", "updatemethod_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 수정 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/updatemethod", method = RequestMethod.POST)
	public String updateMethod(@RequestParam(value = "method_id", required = true) String method_id,
							   @RequestParam(value = "method_title", required = true) String method_title, Model model) {
		try {
			methodService.updateMethod(method_id, method_title);
			model.addAttribute("page", "updatemethod_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 수정 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}
	
	@RequestMapping(value = "/updatelevel", method = RequestMethod.GET)
	public String updateLevel(Model model) {
		try {
			List<CookLevel> cookLevels = cookLevelService.allCookLevelInfo();
			model.addAttribute("cookLevels", cookLevels);
			model.addAttribute("page", "updatelevel_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 수정 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/updatelevel", method = RequestMethod.POST)
	public String updateLevel(@RequestParam(value = "level_id", required = true) String level_id,
							  @RequestParam(value = "level_title", required = true) String level_title, Model model) {
		try {
			cookLevelService.updateCookLevel(level_id, level_title);
			model.addAttribute("page", "updatelevel_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 수정 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}
	
	@RequestMapping(value = "/updateingredient", method = RequestMethod.GET)
	public String updateIngredient(Model model) {
		try {
			List<Ingredient> ingredients = ingredientService.allIngredientInfo();
			model.addAttribute("ingredients", ingredients);
			model.addAttribute("page", "updateingredient_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 수정 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/updateingredient", method = RequestMethod.POST)
	public String updateIngredient(@RequestParam(value = "ingredient_id", required = true) String ingredient_id,
							  	   @RequestParam(value = "ingredient_name", required = true) String ingredient_name, Model model) {
		try {
			ingredientService.updateIngredientName(ingredient_id, ingredient_name);
			model.addAttribute("page", "updateingredient_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 수정 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	//카테고리 조회
	@RequestMapping(value = "/categorytheme", method = RequestMethod.GET)
	public String categoryTheme(Model model) {
		try {
			List<Theme> themes = themeService.allThemeInfo();
			model.addAttribute("themes", themes);
			model.addAttribute("page", "categorytheme_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 조회 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/categorymethod", method = RequestMethod.GET)
	public String categoryMethod(Model model) {
		try {
			List<Method> methods = methodService.allMethodInfo();
			model.addAttribute("methods", methods);
			model.addAttribute("page", "categorymethod_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 조회 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/categorylevel", method = RequestMethod.GET)
	public String categoryLevel(Model model) {
		try {
			List<CookLevel> cookLevels = cookLevelService.allCookLevelInfo();
			model.addAttribute("cookLevels", cookLevels);
			model.addAttribute("page", "categorylevel_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 조회 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/categoryingredient", method = RequestMethod.GET)
	public String categoryIngredient(Model model) {
		try {
			List<Ingredient> ingredients = ingredientService.allIngredientInfo();
			model.addAttribute("ingredients", ingredients);
			model.addAttribute("page", "categoryingredient_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 조회 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	//카테고리 삭제
	@RequestMapping(value = "/deletetheme", method = RequestMethod.GET)
	public String deleteTheme(Model model) {
		try {
			List<Theme> themes = themeService.allThemeInfo();
			model.addAttribute("themes", themes);
			model.addAttribute("page", "categorytheme_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 조회 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/deletetheme", method = RequestMethod.POST)
	public String deleteTheme(@RequestParam(value = "theme_id", required = true) String theme_id, Model model) {
		try {
			themeService.deleteTheme(theme_id);
			model.addAttribute("page", "deletetheme_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 삭제 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/deletemethod", method = RequestMethod.GET)
	public String deleteMethod(Model model) {
		try {
			List<Method> methods = methodService.allMethodInfo();
			model.addAttribute("methods", methods);
			model.addAttribute("page", "categorymethod_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 조회 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/deletemethod", method = RequestMethod.POST)
	public String deleteMethod(@RequestParam(value = "method_id", required = true) String method_id, Model model) {
		try {
			methodService.deleteMethod(method_id);
			model.addAttribute("page", "deletemethod_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 삭제 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/deletelevel", method = RequestMethod.GET)
	public String deleteLevel(Model model) {
		try {
			List<CookLevel> cookLevels = cookLevelService.allCookLevelInfo();
			model.addAttribute("cookLevels", cookLevels);
			model.addAttribute("page", "categorylevel_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 조회 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/deletelevel", method = RequestMethod.POST)
	public String deleteLevel(@RequestParam(value = "level_id", required = true) String level_id, Model model) {
		try {
			cookLevelService.deleteCookLevel(level_id);
			model.addAttribute("page", "deletelevel_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 삭제 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/deleteingredient", method = RequestMethod.GET)
	public String deleteIngredient(Model model) {
		try {
			List<Ingredient> ingredients = ingredientService.allIngredientInfo();
			model.addAttribute("ingredients", ingredients);
			model.addAttribute("page", "categoryingredient_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 조회 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/deleteingredient", method = RequestMethod.POST)
	public String deleteIngredient(@RequestParam(value = "ingredient_id", required = true) String ingredient_id,
			Model model) {
		try {
			ingredientService.deleteIngredient(ingredient_id);
			model.addAttribute("page", "deleteingredient_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "카테고리 삭제 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}
}
