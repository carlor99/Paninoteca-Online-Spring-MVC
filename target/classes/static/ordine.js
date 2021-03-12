function aggiorna() {
	$.getJSON("carrello", carrello)
	$.getJSON("totale", totale)
}

function carrello(data) {
	$('#carrello').empty();
	$.each(data, function (key, val) {
		$('#carrello').append('<p id=prodotto-' + val.id + '>' + val.quantita + ' x ' + val.nome + ' ' + val.prezzo + ' €' +  '</p>');
		$('#prodotto-' + val.id).prepend('<button type="button" class="btn btn-warning"' + ' id=button-' + val.id + '><i class="bi bi-dash-square"></i></button> ');
		$('#button-' + val.id).attr("onclick", 'aggiungi(\'prodotto_id=' + val.id + '&prodotto_quantita=-1\')');
	});
}

function totale(data) {
	$('#totale').empty();
	$('#totale').append('<span>Totale</span>' + '<span class="float-end">' + data[0].totale + ' ' + '€</span>');
}

function aggiungi(parametri) {
	$.post("aggiungi", parametri, aggiorna)
}

function svuota() {
	$.post("cancella", aggiorna)
}

$('#flush-collapse-Panini').addClass("show")
