package com.jabateca.paninoteca.controller;


import com.jabateca.paninoteca.model.Prodotto;
import com.jabateca.paninoteca.repository.ProdottoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class GestionaleController {

    @Autowired
    private ProdottoRepository prodottoRepository;

    @RequestMapping("/aggiungiNuovoProdotto")
    public String aggiungiNuovoProdotto(@RequestParam(defaultValue = "null") String nome, @RequestParam(defaultValue = "0") Double prezzo){

        if(!(nome.equals("null") || prezzo == 0)) {

            Prodotto prodotto = new Prodotto();
            prodotto.setId((int) (prodottoRepository.count() + 1));
            prodotto.setNome(nome);
            prodotto.setPrezzo(prezzo);

            prodottoRepository.save(prodotto);
        }

        return "gestionale";
    }

}
