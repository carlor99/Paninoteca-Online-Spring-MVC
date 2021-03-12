package com.jabateca.paninoteca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PrimaPaginaController {
	@RequestMapping("/")
	public String primapagina() {
		return "index";
	}
}
