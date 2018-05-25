package org.study.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.study.spring.model.ProductVO;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value="/product", method=RequestMethod.GET)
	public String getProductList(Model model) {
		logger.info("getProductLiat Called...");
		ProductVO product = new ProductVO("ABC",10000.0);
		model.addAttribute(product);
		return "productDetail";
	}
	@RequestMapping(value="list")
	public String list(RedirectAttributes rttr) {
		logger.info("list called");
		rttr.addFlashAttribute("msg","Message from 강태욱");
		return "redirect:/product";
	}
}
