package com.jabateca.paninoteca.controller;

import java.util.List;

import com.jabateca.paninoteca.model.Carrello;
import com.jabateca.paninoteca.model.Ordine;
import com.jabateca.paninoteca.repository.CarrelloRepository;
import com.jabateca.paninoteca.repository.OrdineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/")
public class ScontrinoController {

    @Autowired
    private OrdineRepository ordineRepository;

    @Autowired
    private CarrelloRepository carrelloRepository;

    @RequestMapping("/scontrino")
    public String scontrinoOrdine(Model model, @RequestParam(name = "btnradio", defaultValue = "vuoto") String orario){
        int codiceCoda;
        codiceCoda= (int) (Math.random()*9999);
        while (codiceCoda<=999){
            codiceCoda= (int) (Math.random()*9999);
        }

        Integer indice = ((List<Ordine>) ordineRepository.findAll()).size();

        Ordine ordine = ordineRepository.findById(indice).get();
        if(ordine.getCodice() == null){
            ordine.setCodice(String.valueOf(codiceCoda));
        }

        if(!orario.equals("vuoto")) {
            ordine.setOrario(orario);
            ordineRepository.save(ordine);
        }

        double totale = 0.0;

        for (Carrello carrello : carrelloRepository.findAll()) {
            if (carrello.getOrdine().getId() == ordineRepository.findById(indice).get().getId() ) {
                totale += carrello.getQuantita()*carrello.getProdotto().getPrezzo();
            }
        }

        model.addAttribute("ordine", ordine);
        model.addAttribute("carrello", carrelloRepository.findAll());
        model.addAttribute("totale",String.format("%.2f",totale));
        return "scontrino";
    }


}
