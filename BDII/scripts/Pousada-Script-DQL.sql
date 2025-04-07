-- SQL: DQL
select * from funcionario;

select nome, cpf, dataNasc, genero, 
	email, salario from funcionario;
    
select nome as "Funcionário", cpf "CPF", 
	dataNasc "Data de Nascimento", 
    genero "Gênero", 
	email "E-mail", salario "Salário" 
		from funcionario;
    
select nome as "Funcionário", cpf "CPF", 
	dataNasc "Data de Nascimento", 
    genero "Gênero", 
	email "E-mail", salario "Salário" 
		from funcionario
			order by salario desc;    

select nome as "Funcionário", cpf "CPF", 
	dataNasc "Data de Nascimento", 
    genero "Gênero", 
	email "E-mail", salario "Salário" 
		from funcionario
			order by genero, nome; 
            
select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    format(salario, 2, 'de_DE') "Salário" 
		from funcionario
			order by nome;
