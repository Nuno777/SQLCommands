DROP DATABASE IF EXISTS BDDespesas;
CREATE DATABASE IF NOT EXISTS BDDespesas;
USE BDDespesas;

CREATE TABLE pessoas(
IDPessoa 	INT UNSIGNED AUTO_INCREMENT,
nome     	VARCHAR(155) NOT NULL,
nif      	CHAR(9) NOT NULL,
nib			CHAR(21),
genero   	ENUM('F','M') NOT NULL,
dataNasc	DATE NOT NULL,
CONSTRAINT pk_pessoas_id PRIMARY KEY(IDPessoa),
CONSTRAINT uk_pessoas_nif UNIQUE(nif)) Engine=InnoDB;

CREATE TABLE tipos(
IDTipo		INT UNSIGNED AUTO_INCREMENT,
designacao	VARCHAR(64) NOT NULL,
CONSTRAINT pk_tipos_id PRIMARY KEY(IDTipo),
CONSTRAINT uk_tipos_designacao UNIQUE(designacao)) ENGINE=InnoDB;

CREATE TABLE despesas(
IDDespesa		INT UNSIGNED AUTO_INCREMENT,
dataDespesa		DATETIME NOT NULL,
dataRegisto		DATETIME NOT NULL DEFAULT NOW(),
valorPago		DECIMAL(7,2) NOT NULL,
modoPagamento   ENUM('Multibanco','Dinheiro','Cheque','Transferencia'),
IDTipo			INT UNSIGNED NOT NULL,
IDPessoa		INT UNSIGNED NOT NULL,
CONSTRAINT pk_despesas_id PRIMARY KEY(IDDespesa),
CONSTRAINT fk_despesas_tipos FOREIGN KEY(IDTipo) REFERENCES tipos(IDTipo),
CONSTRAINT fk_despesas_pessoas FOREIGN KEY(IDPessoa) REFERENCES pessoas(IDPessoa)) ENGINE=InnoDB;

INSERT INTO pessoas(IDPessoa, nome, nif, nib, genero, dataNasc)  
VALUES
(default, 'Ana Maria Silva Lopes','213902020',null,'F', str_to_date('24-12-1964','%d-%m-%Y')),
(default, 'António Filipe Ferreira Lopes','215902122',null,'M', str_to_date('06-07-1967','%d-%m-%Y')),
(default, 'André João Ferreira Lopes','234838282',null,'M', str_to_date('03-05-1980','%d-%m-%Y')),
(default, 'Andria Filipa Ferreira Lopes','236699202',null,'F', str_to_date('12-10-1994','%d-%m-%Y'));

INSERT INTO tipos(IDTipo, designacao)
VALUES
(default, 'Alimentação'),
(default, 'Restauração'),
(default, 'Casa-Aluger'),
(default, 'Casa-Condomínio'),
(default, 'Casa-Prestação'),
(default, 'Casa-Reparação'),
(default, 'Consulta'),
(default, 'Combustível'),
(default, 'Roupa'),
(default, 'Calçado'),
(default, 'Outra');

INSERT INTO despesas(IDDespesa, dataDespesa, dataRegisto, valorPago, modoPagamento,IDTipo, IDPessoa)
VALUES
(default, str_to_date('01-03-2019','%d-%m-%Y'), default, 56.31,'Dinheiro',1,1),
(default, str_to_date('03-03-2019','%d-%m-%Y'), default, 33.00,'Dinheiro',10,1),
(default, str_to_date('03-03-2019','%d-%m-%Y'), default, 33.00,'Multibanco',2,2),
(default, str_to_date('25-03-2019','%d-%m-%Y'), default, 25.00,NULL,8,2),
(default, str_to_date('28-03-2019','%d-%m-%Y'), default, 60.00,'Multibanco',8,1),
(default, str_to_date('29-03-2019','%d-%m-%Y'), default, 150.00,'Transferencia',7,3),
(default, str_to_date('30-03-2019','%d-%m-%Y'), default, 354.30,'Transferencia',5,2),
(default, str_to_date('30-03-2019','%d-%m-%Y'), default, 30.00,NULL,4,2);

INSERT INTO pessoas(IDPessoa, nome, nif, nib, genero, dataNasc) VALUES (default, ' Sr. António Jorge Júnior','182555685',null,'M', str_to_date('25-11-1934','%d-%m-%Y'));
UPDATE pessoas SET nif=123456789 , nome= upper(nome) where IDPessoa=3;

select IDPessoa as 'Identificador',nome as 'Designation of tips of despesa' from pessoas where nome like 'a%' ;
select * from tipos where designacao like 'casa%' Order by designacao ASC;

select IDDespesa,dataDespesa,valorPago,modoPagamento from despesas where valorPago > 50 and modoPagamento = 'Multibanco' or modoPagamento = 'Transferencia';

select IDDespesa,valorPago, ifnull(modoPagamento,'Não especificado') as 'payment metodo'from despesas;
select * from despesas where modoPagamento = 'Transferencia' and valorPago or modoPagamento ='Multibanco' and valorPago >50  Order by valorPago ASC;

select concat('A pessoa nº ',IDPessoa,' realizou uma compra em ',dataDespesa,' tendo gasto: ',valorPago,' euros')as 'Despesas entre 50 a 150'from despesas where valorPago >= 50 and valorPago <= 150;

select count(despesas.IDDespesa) as 'Quantidade de despesas' from despesas join pessoas on pessoas.IDPessoa=despesas.IDPessoa where pessoas.genero='M';

select pessoas.nome,sum(despesas.valorPago) as 'Total gasto' from pessoas join despesas on pessoas.IDPessoa=despesas.IDPessoa group by pessoas.nome order by sum(despesas.valorPago) asc;

select modoPagamento as'modo Pagamento',valorPago as'Valor Pago',(valorPago+valorPago*0.23) as'Valor com IVA' from despesas where modoPagamento <> '' order by despesas.valorPago asc;

select count(distinct modoPagamento) as 'Quantidade de Modos de Pagamentos' from despesas;
