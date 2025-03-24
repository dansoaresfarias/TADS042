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
        
