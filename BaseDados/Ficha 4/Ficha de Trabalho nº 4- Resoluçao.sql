/* -2.1- */select nome, localidade from aeroportos where pais ="Portugal";
/* -2.2- */select nome from avioes as Avi, modelos as Model where Avi.codmodelo = Model.codmodelo and versao = 'DC-10';
/* -2.3- */select nome, nummotores from avioes as Avi inner join modelos as Model where Avi.codmodelo = Model.codmodelo;
/* -2.4- */select count(duracao) from voos where duracao between 2 and 3;
/* -2.5- */select*from modelos where versao like 'A3%';
/* -2.6- */select codvoo, duracao from voos order by duracao DESC, codvoo ASC;
/* -2.7- */select*from voos as PrimVoo, voos as SegVoo where PrimVoo.decodaerop=1 and SegVoo.paracodaerop=12 and PrimVoo.paracodaerop=SegVoo.decodaerop;
/* -2.8- */select Pais,count(codaerop) as "Numero de aeroportos" from aeroportos group by pais order by pais, count(codaerop) DESC;
/* -2.9- */select codvoo as 'Voos', origem.localidade as 'Localidade origem', destino.localidade as 'Localidade Destino' from voos, aeroportos as origem, aeroportos as destino where voos.decodaerop = origem.codaerop and voos.paracodaerop = destino.codaerop order by 'Localidade origem', 'Localidade Destino';
/* -2.10- */select count(codvoo) as 'Voos', Localidade from Voos, aeroportos where aeroportos.localidade = 'Lisboa' and 'Porto';
/* -2.11- */select Pais,count(codaerop) as "Numero de aeroportos" from aeroportos group by pais having count(codaerop) > 2;
/* -2.12- */select pais, count(codaerop) as aeroportos from aeroportos group by pais order by count(pais) DESC limit 1;
/* -2.13- */select codvoo as 'Voos', origem.nome as 'aeroporto de partida', destino.nome as 'aeroporto de chegada' from voos, aeroportos as origem, aeroportos as destino where voos.decodaerop = origem.codaerop and voos.paracodaerop = destino.codaerop order by 'aeroporto de partida', 'aeroporto de chegada';
/* -2.14- */select construtor, versao, count(avioes.codaviao) as 'Numero de avioes' from avioes,modelos where avioes.codmodelo=modelos.codmodelo group by modelos.versao, construtor order by count(avioes.codaviao);


