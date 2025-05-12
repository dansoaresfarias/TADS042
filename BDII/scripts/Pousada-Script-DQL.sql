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
    
select upper(f.nome) as "Funcionário", f.cpf "CPF", 
		date_format(f.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
		replace(replace(f.genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
		f.email "E-mail", 
		concat("R$ ", format(f.salario, 2, 'de_DE')) "Salário",
		concat("R$ ", format(count(d.cpf) * 180, 2, 'de_DE')) "Auxílio Creche"
			from funcionario f
				left join dependente d on d.Funcionario_cpf = f.cpf
                where timestampdiff(year, d.dataNasc, now()) <= 6
					group by f.cpf
						order by f.nome;

select cpf, nome, timestampdiff(year, dataNasc, now()) "idade",
	funcionario_cpf from dependente
		where timestampdiff(year, dataNasc, now()) <= 6;

create view vDepAuxCreche as
	select cpf, nome, timestampdiff(year, dataNasc, now()) "idade",
		funcionario_cpf from dependente
			where timestampdiff(year, dataNasc, now()) <= 6;

select upper(f.nome) as "Funcionário", f.cpf "CPF", 
		date_format(f.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
		replace(replace(f.genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
		f.email "E-mail", 
		concat("R$ ", format(f.salario, 2, 'de_DE')) "Salário",
		concat("R$ ", format(count(d.cpf) * 180, 2, 'de_DE')) "Auxílio Creche"
			from funcionario f
				left join vdepauxcreche d on d.Funcionario_cpf = f.cpf
					group by f.cpf
						order by f.nome;
                        
create view vRelFuncionarioAuxCreche as
	select upper(f.nome) as "Funcionário", f.cpf "CPF", 
		date_format(f.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
		replace(replace(f.genero, 'F', "Feminino"), 'M', "Masculino") "Gênero", 
		f.email "E-mail", 
		concat("R$ ", format(f.salario, 2, 'de_DE')) "Salário",
        concat("R$ ", format(count(d.cpf) * 180, 2, 'de_DE')) "Auxílio Creche"
			from funcionario f
				left join vdepauxcreche d on d.Funcionario_cpf = f.cpf
					group by f.cpf
						order by f.nome;
                        
select f.cpf "CPF", f.nome "Funcionário", 
	count(r.idReserva) "Quantidade de Reservas"
		from funcionario f
			inner join reserva r on r.Funcionario_cpf = f.cpf
				where r.`status` like "Confirmada" or
					r.`status` like "Chec%" 
                     group by r.Funcionario_cpf;

select f.cpf "CPF", f.nome "Funcionário", 
	count(r.idReserva) "Quantidade de Reservas",
    concat("R$ ", format(sum(h.valorTotal), 2, 'de_DE')) "Faturamento Bruto",
    concat("R$ ", format(sum(h.valorTotal)/count(r.idReserva), 2, 'de_DE')) "Taxa de Efetividade"
		from funcionario f
			inner join reserva r on r.Funcionario_cpf = f.cpf
            inner join hospedagem h on h.Reserva_idReserva = r.idReserva
				where r.`status` like "Confirmada" or
					r.`status` like "Chec%" 
                     group by r.Funcionario_cpf;

select date_format(ocr.dataHoraIni, '%H:%i - %d/%m/%Y') "Data de Início da Ocorrência",
	date_format(ocr.dataHoraFim, '%H:%i - %d/%m/%Y') "Data de Fim da Ocorrência",
    ocr.tipo "Tipo da Ocorrência", ocr.obs "Observação", 
    ocr.Funcionario_cpf "CPF Funcionário", func.nome "Funcionário"
	from ocorrencia ocr
		inner join funcionario func on func.cpf = ocr.Funcionario_cpf;

select func.cpf "CPF", upper(func.nome) "Funcionário",
	fer.periodoAqt "Período Aquisitivo das Férias",
	date_format(fer.dataInicio, '%d/%m/%Y') "Data de Início das Férias",
    date_format(fer.dataFim, '%d/%m/%Y') "Data de Fim das Férias",
    timestampdiff(day, fer.dataInicio, fer.dataFim) "Quantidade de Dias",
    replace(replace(fer.addDecimal, 1, "Sim"), 0, "Não") "Adiantamento de 13º",
    concat("R$ ", format(fer.valor, 2, 'de_DE')) "Valor a ser Pago"
    from ferias fer
		inner join funcionario func on func.cpf = fer.funcionario_cpf
			order by func.nome, fer.periodoAqt desc;
    
select upper(func.nome) as "Funcionário", func.cpf "CPF", 
	date_format(func.dataNasc, '%d/%m/%Y') "Data de Nascimento", 
    case func.genero
		when 'F' then "Feminino"
        when 'M' then "Masculino"
		else "Outro"
    end "Gênero",
    group_concat(distinct tel.numero separator " | ") "Telefone",
	func.email "E-mail", 
	crg.nome "Cargo",
    dep.nome "Departamento",
    concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário",
    ifnull(grt.nome, "Não existente!") "Gerente"
	from funcionario func
		left join telefone tel on tel.Funcionario_cpf = func.cpf
        inner join trabalhar trb on trb.Funcionario_cpf = func.cpf
        inner join cargo crg on crg.cbo = trb.Cargo_cbo
        inner join departamento dep on dep.idDepartamento = trb.Departamento_idDepartamento
        left join funcionario grt on grt.cpf = dep.Gerente_cpf
			where trb.dataFim is null
				group by func.cpf, crg.cbo, dep.idDepartamento
					order by func.nome;

-- hospede, contato, idade, entrar ou não em contato
select nome "Hospede", concat(telefone, " | " ,email) "Contato",
	timestampdiff(year, datanasc, now()) "Idade",
    case when timestampdiff(year, datanasc, now()) between 35 and 45 then "Sim"
		else "Talvez"
	end "Entre em Contato"
	from hospede
		order by nome;

delimiter $$
create function valeTransporte(pCPF varchar(14))
	returns decimal(5,2) deterministic
    begin
		declare valeTransp decimal(5,2) default 0.0;
        declare auxCid varchar(60);
        declare auxSal decimal(7,2);
        select cidade into auxCid from endereco 
			where Funcionario_cpf = pCPF;
		select salario into auxSal from funcionario	
			where cpf = pCPF;
		if auxCid like "Recife" 
			then set valeTransp = 22 * 2 * 4.3;
		else 
			set valeTransp = 22 * 2 * 5.1;
        end if;
        set valeTransp = valeTransp - auxSal * 0.06;
        if valeTransp > 0
			then return valeTransp;
		else
			return 0.0;
		end if;
    end $$
delimiter ;

select upper(f.nome) as "Funcionário", f.cpf "CPF", 
	concat("R$ ", format(f.salario, 2, 'de_DE')) "Salário Bruto",
	concat("R$ ", format(count(d.cpf) * 180, 2, 'de_DE')) "Auxílio Creche",
    concat("R$ ", format(valeTransporte(f.cpf), 'de_DE')) "Vale Transporte"
		from funcionario f
			left join vdepauxcreche d on d.Funcionario_cpf = f.cpf
				group by f.cpf
					order by f.nome;

    
    
    
    



