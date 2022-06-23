/* -1- */
/* -1.1- */select*from Pessoa;
/* -1.2- */select*from Postal;
/* -1.3- */select*from Mensagem;
/* -1.4- */select*from Comissao;

/* -2- */
/* -2.1- */select*from Pessoa order by idade;
/* -2.2- */select nome,salario from Pessoa order by salario desc;
/* -2.3- */select nome,salario from Pessoa where telefone order by salario;
/* -2.4- */select*from Comissao order by id;
/* -2.5- */select*from Comissao order by id, Id_Msg;
/* -2.6- */select id, Valor from comissao where id < 40 order by id ASC, valor DESC;
/* -2.7- */select nome,idade, idade+5 from Pessoa order by nome;
/* -2.8- */select valor, valor * 0.23 as imposto, valor + valor * 0.23 as valorbruto from comissao where id = '14' or '25' order by id and imposto;
/* -2.9- */select distinct (localidade) as localidade from postal;

/* -3- */
/* -3.1- */select count(distinct nome) as Pessoas from Pessoa;
/* -3.2- */select count(distinct nome) as Pessoas from Pessoa where telefone is not null;
/* -3.3- */select count(distinct nome) as Pessoas from Pessoa where telefone is null;
/* -3.4- */select count(distinct valor) as ValorSuperior from comissao  where Valor >=1000;
/* -3.5- */
/* -3.6- */select count(distinct id) as ID from comissao;
/* -3.7- */select max(Salario) from pessoa;
/* -3.8- */select min(idade) from pessoa;
/* -3.9- */select valor from comissao where valor>=1000 and valor <=5000;
/* -3.10- */select nome from Pessoa first;
/* -3.11- */select nome from Pessoa last;
/* -3.12- */select SUM(valor) as total  from comissao;
/* -3.13- */select SUM(valor) as total, SUM(valor* 0.23) as iva from comissao;
/* -3.14- */select SUM(idade)/count(idade) as MediaIdade from pessoa;
/* -3.15- */select SUM(salario)/count(idade) from pessoa where idade >=30;
/* -3.16- */select avg(id) from comissao where id=14;

/* -4- */
/* -4.1- */select id,sum(valor) as TotalComissao from comissao group by id;
/* -4.2- */select id,Max(valor) as MaiorComissao from comissao group by id;
/* -4.3- */select count(distinct valor) as NumeroComissao from comissao;
/* -4.4- */select id,count(distinct valor) from comissao where valor >=1000 group by id ;
/* -4.5- */select telefone, count(telefone) as Vezes from pessoa group by telefone;
/* -4.6- */select id, count(*) as Ids from comissao group by id order by Ids DESC;

/* -5- */
/* -5.1- */INSERT INTO Postal VALUES(1250,'Mouraria');
/* -5.2- */INSERT INTO Pessoa VALUES(999,'Ana Rita',35,560000,NULL,2300);
/* -5.3- Nao percebi muto bem o que era para fazer*/CREATE TABLE Adultos(Id         NUMERIC           PRIMARY KEY, 
                    Nome       CHAR(30)          NOT NULL,
                    Idade      INTEGER           NOT NULL CHECK (Idade BETWEEN 0 AND 150),
                    Salario    NUMERIC(10,2)     NOT NULL,
                    Telefone   CHAR(12)          NULL,
                    Cod_Postal NUMERIC(4)        REFERENCES Postal(Codigo)
                   );
CREATE UNIQUE INDEX iNome ON Adultos(Nome);
CREATE INDEX iTelefone ON Adultos(Telefone);

INSERT INTO Adultos VALUES(42,'António Dias',43,74000,'789654',1500);
INSERT INTO Adultos VALUES(5,'Célia Morais',26,170000,'123456',1100);
INSERT INTO Adultos VALUES(32,'Florinda Simões',35,147000,NULL,4000);
INSERT INTO Adultos VALUES(37,'Isabel Espada',28,86000,NULL,1100);
INSERT INTO Adultos VALUES(49,'José António',17,210000,NULL,1500);
INSERT INTO Adultos VALUES(14,'Nascimento Augusto',35,220000,'456123',2300);
INSERT INTO Adultos VALUES(25,'Paulo Viegas',32,95000,NULL,1500);
INSERT INTO adultos SELECT * FROM adultos WHERE idade >= 18;

/* -6- */
/* -6.1- */Update Adultos set salario=salario+salario*0.10;
/* -6.2- */update adultos set Salario=99999999, idade=33 where nome = "Paulo Viegas";
/* -6.3- */update adultos set Salario = (select MIN(Salario)) , telefone = 912345678 where nome = "Ana Rita";
/* -6.4- */select  nome from pessoa order by nome ASC limit 1;

/* -7- */
/* -7.1- */delete from Adultos;
select* from adultos;
/* -7.2- */delete from pessoa where nome='Ana Rita';
select nome from pessoa where nome='Ana Rita';