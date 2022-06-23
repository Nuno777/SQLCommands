create database EmpDepartamentos;
Use EmpDepartamentos;

Create Table Departamentos
(
CodigoDepartamento int,
Departamento Varchar(20),
Localizacao Varchar(30),
Primary key (CodigoDepartamento)
);

Create Table Empregados
(
NEmpregado int,
Nome Varchar(20),
Categoria Char(1),
CodigoDepartamento int,
DataAdmissao date,
Salario decimal (6,2),
NFilhos int,
Primary key (NEmpregado),
Foreign key (CodigoDepartamento) References Departamentos(CodigoDepartamento)
);

Insert Into Departamentos VALUES
(10,'Contabilidade','Porto' ),
(20,'Recursos Humanos','Lisboa'),
(30,'Staff','Porto');

Insert Into Empregados VALUES
(1,'Maria','B',20,'2000-12-04',1000,2),
(2,'Carla','A',10,'1996-10-03',1200,0),
(3,'António','C',20,'1998-12-04',1300,1),
(4,'José','C',30,'1996-11-02',2000,null),
(5,'Rita','B',10,'2000-08-12',3000,2),
(6,'Cátia','B',20,'1996-11-02',1200,1),
(7,'Gonçalo','B',20,'1998-12-05',5000,4);
