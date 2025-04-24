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

-- https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_date-format
-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html#function_format
-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html#function_upper
-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html#function_replace
-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html#function_concat
select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
		from funcionario
			order by nome;
            
select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
		from funcionario
			where genero = 'F'
				order by nome;

select funcionario_cpf from endereco where cidade = "Olinda";

select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
		from funcionario
			where cpf in (select funcionario_cpf from endereco where cidade = "Olinda")
				order by nome;

select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
		from funcionario
			where nome like "Thiago%"
				order by nome;
                
select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
		from funcionario
			where nome like "_hiago%"
				order by nome;
                
select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
		from funcionario
			where nome like "%hiago%"
				order by nome;
                
select cpf_passaporte "CPF ou Passaporte",
	nome "Hóspede",
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento",
    email "E-mail", telefone "Telefone"
	from hospede
		where nome like "%Lima%"
			order by nome;

select cpf_passaporte "CPF ou Passaporte",
	nome "Hóspede",
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento",
    email "E-mail", telefone "Telefone"
	from hospede
		where nome like "%aria%"
			order by nome;

select cpf_passaporte "CPF ou Passaporte",
	nome "Hóspede",
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento",
    email "E-mail", telefone "Telefone"
	from hospede
		where year(dataNasc) <= 1990 and
			nome like "%Lima%"
			order by nome;
            
select cidade, count(funcionario_cpf) 
	from endereco
		group by cidade;
        
select count(cpf_passaporte) 
	from hospede
		where telefone like "+5511%";
        
select count(cpf_passaporte) 
	from hospede
		group by telefone like "+5511%";

select max(salario) from funcionario;

select avg(salario) from funcionario;

select min(salario) from funcionario;
        
select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
		from funcionario
			where salario = (select min(salario) from funcionario)
				order by nome;
                
select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
		from funcionario
			where salario = (select max(salario) from funcionario)
				order by nome;
                
select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário"
		from funcionario
			where salario <= (select avg(salario) from funcionario)
				order by nome;

select checkIn "Check-In", checkOut "Check-Out", 
	concat("R$ ", format(valorTotal, 2, 'de_DE')) "Valor da Hospedagem"
    from hospedagem
		where valorTotal >= (select avg(valorTotal) from hospedagem);

-- Qual a quantidade de hospedagem pro ano/mês         
select year(checkIn), count(Reserva_idReserva) 
	from hospedagem
		group by year(checkIn);

select date_format(checkIn, '%Y - %m'), count(Reserva_idReserva)
	from hospedagem
		group by date_format(checkIn, '%Y - %m')
			order by date_format(checkIn, '%Y - %m') desc;

select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário",
    cidade "Cidade",
    bairro "Bairro"
		from funcionario, endereco
			order by nome;

select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário",
    cidade "Cidade",
    bairro "Bairro"
		from funcionario, endereco
			where cpf = Funcionario_cpf
				order by nome;

select upper(nome) as "Funcionário", cpf "CPF", 
	date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	email "E-mail", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário",
    cidade "Cidade",
    bairro "Bairro"
		from funcionario
			inner join endereco on Funcionario_cpf = cpf
				order by nome;
                
select upper(f.nome) as "Funcionário", f.cpf "CPF", 
	date_format(f.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(f.genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	f.email "E-mail", 
    concat("R$ ", format(f.salario, 2, 'de_DE')) "Salário",
    count(d.cpf) "Quantidade de Dependentes"
		from funcionario f
			inner join dependente d on d.Funcionario_cpf = f.cpf
				group by d.funcionario_cpf
					order by f.nome;

select upper(f.nome) as "Funcionário", f.cpf "CPF", 
	date_format(f.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    replace(replace(f.genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
	f.email "E-mail", 
    concat("R$ ", format(f.salario, 2, 'de_DE')) "Salário",
    count(d.cpf) "Quantidade de Dependentes"
		from funcionario f
			left join dependente d on d.Funcionario_cpf = f.cpf
				group by f.cpf
					order by f.nome;

-- cpf do dependente, dependente, idade, genero, parentesco, 
-- cpf do responsavel, resposavel
select d.cpf "CPF do Dependente", d.nome "Dependente", 
	timestampdiff(year, d.dataNasc, now()) "Idade",
    replace(replace(d.genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
    d.parentesco "Parentesco",
    f.cpf "CPF do Responsável", f.nome "Responsável"
    from dependente d
		inner join funcionario f on f.cpf = d.Funcionario_cpf
			order by f.nome;

create view vRelFuncDependente as
	select upper(f.nome) as "Funcionário", f.cpf "CPF", 
		date_format(f.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
		replace(replace(f.genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
		f.email "E-mail", 
		concat("R$ ", format(f.salario, 2, 'de_DE')) "Salário",
		count(d.cpf) "Quantidade de Dependentes"
			from funcionario f
				left join dependente d on d.Funcionario_cpf = f.cpf
					group by f.cpf
						order by f.nome;

select * from vrelfuncdependente
	where `Quantidade de Dependentes` >= 2;




