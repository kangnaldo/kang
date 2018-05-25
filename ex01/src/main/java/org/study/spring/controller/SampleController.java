package org.study.spring.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	@RequestMapping("doA")
	public String doA() {
		logger.info("doA called");
		
		return "result";
	}
	@RequestMapping("doB")
	public String doB(@ModelAttribute("msg") String msg, Model model) {
		logger.info("doB called " + msg);
		
		model.addAttribute("hoho","abcd");
		return "result";
	}
	
}
