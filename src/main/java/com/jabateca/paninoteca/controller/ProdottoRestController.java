package com.jabateca.paninoteca.controller;

import java.util.List;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Optional;

import com.jabateca.paninoteca.model.Carrello;
import com.jabateca.paninoteca.model.Ordine;
import com.jabateca.paninoteca.model.Prodotto;
import com.jabateca.paninoteca.repository.CarrelloRepository;
import com.jabateca.paninoteca.repository.OrdineRepository;
import com.jabateca.paninoteca.repository.ProdottoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class ProdottoRestController {

	@Autowired
	private ProdottoRepository prodottoRepository;

	@Autowired
	private CarrelloRepository carrelloRepository;

	@Autowired
	private OrdineRepository ordineRepository;

	@GetMapping("/carrello")
	public ArrayList<HashMap<String, String>> carrello_altro() {
		ArrayList<HashMap<String, String>> elementi = new ArrayList<HashMap<String, String>>();

		Integer indice = ((List<Ordine>) ordineRepository.findAll()).size();
		for (Carrello carrello : carrelloRepository.findAll()) {
			if (carrello.getOrdine().getId() == ordineRepository.findById(indice).get().getId() ) {
				Optional<Prodotto> prodotto = prodottoRepository.findById(carrello.getProdotto().getId());
				HashMap<String, String> elemento = new HashMap<String, String>();
				elemento.put("nome", prodotto.get().getNome());
				elemento.put("quantita", String.valueOf(carrello.getQuantita()));
				elemento.put("id", String.valueOf(prodotto.get().getId()));
				elemento.put("prezzo", String.format("%.2f", prodotto.get().getPrezzo() * carrello.getQuantita()));
				elementi.add(elemento);
			}
		}

		return elementi;
	}

	@GetMapping("/totale")
	public ArrayList<HashMap<String, String>> totale() {
		double totale = 0.0;

		ArrayList<HashMap<String, String>> elementi = new ArrayList<HashMap<String, String>>();

		HashMap<String, String> elemento = new HashMap<String, String>();


		Integer indice = ((List<Ordine>) ordineRepository.findAll()).size();
		for (Carrello carrello : carrelloRepository.findAll()) {
			if (carrello.getOrdine().getId() == ordineRepository.findById(indice).get().getId() ) {
				totale += carrello.getQuantita()*carrello.getProdotto().getPrezzo();
			}
		}

		elemento.put("totale", String.format("%.2f", totale));
		elementi.add(elemento);

		return  elementi;
	}
}
