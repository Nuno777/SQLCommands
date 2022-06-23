/* -3- */select*from empregados;
/* -4- */select*from departamentos;
/* -5- */select Categoria from empregados where Nome like 'a%';
/* -6- */select Nome,Categoria from empregados where Salario >=3000;
/* -7- */select Nome,Salario from empregados where Salario >=1000 and Salario <=1500;
/* -8- */select Nome,DataAdmissao from empregados where NFilhos;
/* -9- */select*from empregados where Nome like 'c%' or Nome like '%a';
/* -10- */select Nome,NEmpregado from empregados order by Nome;
/* -11- */select salario, salario*0.11 from empregados where DataAdmissao between ('1996-01-01') AND ('1996-12-31');
/* -12- */INSERT INTO departamentos values (40,'Educaçao Fisica','Coimbra');
INSERT INTO departamentos values (12,'Linguas','Leiria');
INSERT INTO empregados values (8,'Mario','A',20,'2002-10-07',1390,1);
INSERT INTO empregados values (9,'Nuno','F',10,'2001-05-21',5500,0);
INSERT INTO empregados values (10,'Afonso','E',30,'1999-08-15',690,2);
/* -13- */select Categoria,Nome,Salario,DataAdmissao from empregados order by Categoria;
/* -14- */select Categoria,Nome,Salario,DataAdmissao from empregados order by Categoria,Nome;
/* -15- */select*from departamentos where Localizacao='Porto';
/* -16- */select Nome,Categoria,Departamento,DataAdmissao from empregados,Departamentos;
/* -17-  ??Não percebi o que era para fazer*/