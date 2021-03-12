package com.jabateca.paninoteca.controller;

import java.util.List;

import com.jabateca.paninoteca.model.Carrello;
import com.jabateca.paninoteca.model.Ordine;
import com.jabateca.paninoteca.repository.CarrelloRepository;
import com.jabateca.paninoteca.repository.OrdineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@Controller
@RequestMapping("/")
public class RiepilogoController {

    @Autowired
    private CarrelloRepository carrelloRepository;

    @Autowired
    private OrdineRepository ordineRepository;

    @GetMapping("/riepilogo")
    public String riepilogo(Model model){
        Integer indice = ((List<Ordine>) ordineRepository.findAll()).size();

        double totale = 0.0;

        for (Carrello carrello : carrelloRepository.findAll()) {
            if (carrello.getOrdine().getId() == ordineRepository.findById(indice).get().getId() ) {
                totale += carrello.getQuantita()*carrello.getProdotto().getPrezzo();
            }
        }

        ArrayList<String> orari = new ArrayList<>();

        DateTimeFormatter df = DateTimeFormatter.ofPattern("HH:mm");

        LocalTime time = LocalTime.now();
        int minutes = time.getMinute();
        int mod = minutes % 15;
        LocalTime realTime = time.plusMinutes(mod < 8 ? -mod : (15-mod));

        for(int i=0; i<4; i++){
            realTime = realTime.plusMinutes(15);
            orari.add(df.format(realTime));
        }


        Ordine ordine = ordineRepository.findById(indice).get();

        model.addAttribute("ordine", ordine);
        model.addAttribute("carrello", carrelloRepository.findAll());
        model.addAttribute("totale",String.format("%.2f",totale));
        model.addAttribute("orari", orari);

        return "riepilogo";
    }
}
