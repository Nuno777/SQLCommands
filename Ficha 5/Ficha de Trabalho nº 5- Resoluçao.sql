/* -1- */select marca from carro where nif ="1232";
/* -2- */select matricula from estacionamento join lugar on estacionamento.numero = lugar.numero where andar = 2;
/* -3- */select data from estacionamento join carro on estacionamento.matricula = carro.matricula where marca = 'Ferrari' order by data ASC;
/* -4- */select horae, matricula from estacionamento where data = '2010-01-01' order by horae ASC;
/* -5- */select count(nif) as 'Nº Carros' from carro where nif = 1232;
/* -6- */select count(*) as Lugares  from lugar where andar > 1;
/* -7- */select Andar, count(numero) as Lugares from lugar group by andar;
/* -8- */select Nif,Nome,count(*) as Quantidade from cliente join carro using (nif) group by nif, nome order by count(*) desc, nome;
/* -9- */select Nif,Nome from cliente join carro using (nif) group by nif, nome having nif >1;
/* -10- */
/* -11- */
/* -12- */
/* -13- */insert into cliente (nif, nome) values (9999, 'Marco Polo');
/* -14- */
