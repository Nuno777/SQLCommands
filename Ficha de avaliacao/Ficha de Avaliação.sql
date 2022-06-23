select * from cliente;
select * from carro;
select * from estacionamento;
select * from lugar;

#Q1. Visualize o número total de carros com o nif "1233" da base de dados.
#SQL1
select count(marca) as 'Total de carros' from carro where nif = "1233";

#Q2. Visualize o andar, hora de entrada e saida da base de dados.
#SQL2
select andar ,entrada.horae as 'Hora de entrada', saida.horas as 'Hora de saida' from lugar, estacionamento as entrada, estacionamento as saida where lugar.numero = entrada.ref order by 'Hora de entrada', 'Hora de saida';

#Q3. Visualize a matricula que começe por M da base de dados. 
#SQL3
select matricula,marca from carro where matricula like 'M%';

#Q4. Visualize quantos carros tem cada pessoa por ordem do nome da base de dados.
#SQL4
select nome,marca,matricula from carro, cliente where carro.nif=cliente.nif order by nome;

#Q5. Visualize os carros da marca Ford da base de dados.
#SQL5
select marca, matricula from carro where marca ="Ford";

#Q6. Visualize o andar de cada carro por marca e a hora de entrada e saida da base de dados.
#SQL6
select Marca,Andar ,entrada.horae as 'Hora de entrada', saida.horas as 'Hora de saida' from carro,lugar, estacionamento as entrada, estacionamento as saida where carro.matricula = entrada.ref and lugar.numero = entrada.ref order by 'Hora de entrada', 'Hora de saida';

#Q7. Visualize o nome e os carros que acabam com a letra "A" e ordenado pelo nome da base de dados.
#SQL7
select nome,marca from cliente,carro where marca like "%a" order by nome;

#Q8. Visualize o nome, marca e andar com limite de 5 pessoas da base de dados.
#SQL8
select nome,marca,andar from cliente,carro,lugar limit 5;

#Q10. Visualize o nome, marca,data e o andar de cada carro e ordenado por nome da base de dados.
#SQL10
select nome,marca,data,andar from cliente as clie, estacionamento as estacio , carro as car, lugar as vaga where clie.nif = car.nif and estacio.numero = vaga.numero order by nome;

