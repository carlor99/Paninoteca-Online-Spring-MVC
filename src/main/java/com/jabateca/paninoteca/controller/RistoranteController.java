package com.jabateca.paninoteca.controller;

import java.util.List;


import com.jabateca.paninoteca.model.Ordine;
import com.jabateca.paninoteca.model.Ristorante;
import com.jabateca.paninoteca.repository.OrdineRepository;
import com.jabateca.paninoteca.repository.RistoranteRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalTime;
import java.util.ArrayList;

@Controller
@RequestMapping("/")
public class RistoranteController {

	@Autowired
	private RistoranteRepository ristoranteRepository;

	@Autowired
	private OrdineRepository ordineRepository;

	@RequestMapping("/ristorante")
	public String prova(Model model, @RequestParam(defaultValue = "false") Boolean nuovo) {
		if (nuovo) {
			Integer indice = ((List<Ordine>) ordineRepository.findAll()).size();
			Ordine ordine = new Ordine();
			ordine.setId(indice+1);
			ordineRepository.save(ordine);
		}


		ArrayList<Ristorante> aperti = new ArrayList<Ristorante>();
		ArrayList<Ristorante> chiusi = new ArrayList<Ristorante>();



		for(Ristorante ristorante : ristoranteRepository.findAll()){
			LocalTime apertura = LocalTime.parse(ristorante.getApertura());

			LocalTime chiusura = LocalTime.parse(ristorante.getChiusura());

			if(LocalTime.now().isAfter(apertura) && LocalTime.now().isBefore(chiusura)){
				aperti.add(ristorante);
			} else{
				chiusi.add(ristorante);
			}
		}

		// model.addAttribute("ristorante", ristoranteRepository.findAll());

		model.addAttribute("ristAperti", aperti);
		model.addAttribute("ristChiusi", chiusi);

		return "ristorante";
	}


}
