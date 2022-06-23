/* -1- */select MIN(CodigoDepartamento) as "Menor Código" from Empregados;
/* -2- */select nome from empregados where CodigoDepartamento = 20;
/* -3- */Select nome,salario from empregados where salario=(select MIN(salario)from empregados); 
/* -4- */update Empregados set salario=salario*0.10 where CodigoDepartamento = 10;
/* -5- */select NEmpregado as "Empregado", nome as "Nome" from empregados where codigodepartamento = (select codigodepartamento from departamentos where Localizacao = "Lisboa" order by nome);
/* -6- */select Nome, Departamento, Categoria from empregados inner join departamentos on empregados.codigodepartamento = departamentos.codigodepartamento order by categoria DESC, Nome ASC;
