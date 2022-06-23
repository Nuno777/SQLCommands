DROP DATABASE IF EXISTS BDDespesas;
CREATE DATABASE IF NOT EXISTS BDDespesas;
USE BDDespesas;

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


insert into pessoas (nome,nif,genero,dataNasc) value('António Jorge Júnior','182555685','M',str_to_date('25-11-1934','%d-%m-%Y'));
select*from pessoas;
update pessoas set nome=UPPER(nome), nif=123456789 WHERE IDPessoa=3;
select * from tipos where designacao like 'casa%' Order by designacao ASC;
select * from despesas where modoPagamento = 'Transferencia' and valorPago or modoPagamento ='Multibanco' and valorPago >50  Order by valorPago ASC;
select COUNT(despesas.valorPago) from despesas, pessoas where pessoas.genero ='M';