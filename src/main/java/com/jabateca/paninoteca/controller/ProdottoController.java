package com.jabateca.paninoteca.controller;

import java.util.List;

import com.jabateca.paninoteca.model.Carrello;
import com.jabateca.paninoteca.model.Ordine;
import com.jabateca.paninoteca.repository.CarrelloRepository;
import com.jabateca.paninoteca.repository.CategoriaRepository;
import com.jabateca.paninoteca.repository.OrdineRepository;
import com.jabateca.paninoteca.repository.ProdottoRepository;
import com.jabateca.paninoteca.repository.RistoranteRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class ProdottoController {

	@Autowired
	private ProdottoRepository prodottoRepository;

	@Autowired
	private CarrelloRepository carrelloRepository;

	@Autowired
	private OrdineRepository ordineRepository;

	@Autowired
	private CategoriaRepository categoriaRepository;

	@Autowired RistoranteRepository ristoranteRepository;

	@ModelAttribute
	public void addAttributes(Model model) {
		model.addAttribute("esempio", "attributo globale!");
	}

	@RequestMapping("/ordine")
	public String ordine(Model model, @RequestParam(defaultValue = "-1") Integer ristorante_id) {
		Integer indice = ((List<Ordine>) ordineRepository.findAll()).size();
		if (ristorante_id != -1) {
			Ordine ordine = ordineRepository.findById(indice).get();
			ordine.setRistorante(ristoranteRepository.findById(ristorante_id).get());
			ordineRepository.save(ordine);
		}
		model.addAttribute("prodotto", prodottoRepository.findAll());
		model.addAttribute("categoria", categoriaRepository.findAll());
		model.addAttribute("ordine", ordineRepository.findById(indice).get());
		return "ordine";
	}

	@PostMapping("/aggiungi")
	public @ResponseBody Boolean aggiungi(@RequestParam Integer prodotto_id, @RequestParam Integer prodotto_quantita) {
		Integer indice = ((List<Ordine>) ordineRepository.findAll()).size();
		for (Carrello record : carrelloRepository.findAll()) {
			if (record.getOrdine().getId() == ordineRepository.findById(indice).get().getId() ) {
				if (record.getProdotto().getId() == prodotto_id) {
					record.setQuantita(record.getQuantita() + prodotto_quantita);
					if (record.getQuantita() < 1) {
						carrelloRepository.delete(record);
					} else {
						carrelloRepository.save(record);
					}
					return true;
				}
			}
		}

		Carrello carrello = new Carrello();
		carrello.setProdotto(prodottoRepository.findById(prodotto_id).get());
		carrello.setQuantita(prodotto_quantita);
		carrello.setOrdine(ordineRepository.findById(indice).get());
		carrelloRepository.save(carrello);
		return true;
	}

	@PostMapping("/cancella")
	public @ResponseBody Boolean cancella() {
		carrelloRepository.deleteAll();
		return true;
	}

}
