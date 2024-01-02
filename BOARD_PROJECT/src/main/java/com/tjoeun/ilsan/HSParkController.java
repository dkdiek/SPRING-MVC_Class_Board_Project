package com.tjoeun.ilsan;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HSParkController {
	
	@GetMapping(value = "/hspark/happy")
	public String happy(Model model) {
		model.addAttribute("year","2024");
		return "hspark";
	}

}
