-- SQL: DML-UPDATE

update funcionario
	set salario = 6800.00
		where cpf = '055.550.000-55';
        
update funcionario
	set salario = salario * 1.1
		where genero = 'F';
	
SET SQL_SAFE_UPDATES = 0;

update funcionario
	set cpf = "012.345.678-97"
		where cpf = "012.345.678-90";

update funcionario
	set salario = salario + 500 
		where salario <= 2000;
        
update funcionario
	set salario = salario * 1.5;

update funcionario
	set cpf = "126.621.666-22"
		where cpf = "126.621.666-11";

-- SQL: DML-DELETE
delete from funcionario
	where cpf = "147.471.771-41";

delete from funcionario
	where cpf in (select Funcionario_cpf from endereco
	where cidade = "Olinda");

start transaction;
    
delete from funcionario;

rollback;

commit;

