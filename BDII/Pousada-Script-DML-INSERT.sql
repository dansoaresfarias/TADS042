-- SQL: DML-INSERT

insert into funcionario 
	(cpf, nome, genero, dataNasc, email, salario, `status`)
    value ("147.471.771-41", "Thiago Mariano", 'M', 
    '2002-01-01', "donzelo@gmail.com", 1890.00, 1);
    
insert into funcionario 
	(cpf, nome, genero, dataNasc, email, salario, `status`)
    values ("074.740.774-00", "Saulo Melo", 'M', 
    '1999-02-21', "saulom@gmail.com", 3500.00, 1),
		("055.550.000-55", "Daniela Lopes", 'F', 
    '1985-12-23', "daniela.lopes@gmail.com", 2800.00, 1),
		("126.621.666-11", "João Victor Brayner", 'M', 
    '2004-08-26', "joaoVicBrayner@gmail.com", 1890.00, 1);
    
INSERT INTO Funcionario 
    (cpf, nome, genero, dataNasc, email, salario, `status`)
VALUES 
    ("123.456.789-01", "Carlos Alberto Souza", 'M', '1988-05-14', "carlos.souza@gmail.com", 4200.00, 1),
    ("234.567.890-12", "Mariana Castro Lima", 'F', '1992-09-30', "mariana.castro@gmail.com", 3900.00, 1),
    ("345.678.901-23", "Fernando Oliveira", 'M', '1985-03-25', "fernando.oliveira@gmail.com", 4500.00, 1),
    ("456.789.012-34", "Beatriz Santos", 'F', '1990-07-12', "beatriz.santos@gmail.com", 3800.00, 1),
    ("567.890.123-45", "Lucas Mendes", 'M', '1997-11-08', "lucas.mendes@gmail.com", 3100.00, 1),
    ("678.901.234-56", "Ana Paula Fernandes", 'F', '1983-06-17', "ana.fernandes@gmail.com", 4700.00, 1),
    ("789.012.345-67", "Rafael Martins", 'M', '1995-04-05', "rafael.martins@gmail.com", 3600.00, 1),
    ("890.123.456-78", "Juliana Ferreira", 'F', '1998-02-19', "juliana.ferreira@gmail.com", 3200.00, 1),
    ("901.234.567-89", "Thiago Almeida", 'M', '1991-12-01', "thiago.almeida@gmail.com", 4100.00, 1),
    ("012.345.678-90", "Camila Rocha", 'F', '1989-10-22', "camila.rocha@gmail.com", 3700.00, 1),
    ("112.233.344-55", "Gustavo Nogueira", 'M', '1993-03-14', "gustavo.nogueira@gmail.com", 4000.00, 1),
    ("223.344.455-66", "Sofia Ribeiro", 'F', '1994-07-09', "sofia.ribeiro@gmail.com", 3500.00, 1),
    ("334.455.566-77", "André Luiz Barbosa", 'M', '1986-01-29', "andre.barbosa@gmail.com", 4800.00, 1),
    ("445.566.677-88", "Larissa Costa", 'F', '2000-05-06', "larissa.costa@gmail.com", 2900.00, 1),
    ("556.677.788-99", "Ricardo Lima", 'M', '1996-09-12', "ricardo.lima@gmail.com", 3300.00, 1),
    ("667.788.899-00", "Fernanda Oliveira", 'F', '1987-08-20', "fernanda.oliveira@gmail.com", 4600.00, 1),
    ("778.899.900-11", "Bruno Carvalho", 'M', '1999-04-03', "bruno.carvalho@gmail.com", 3400.00, 1),
    ("889.900.011-22", "Patrícia Mendes", 'F', '1984-11-15', "patricia.mendes@gmail.com", 4900.00, 1),
    ("990.011.122-33", "Eduardo Santana", 'M', '1990-06-25', "eduardo.santana@gmail.com", 3700.00, 1),
    ("101.112.223-44", "Tatiane Araújo", 'F', '1995-02-07', "tatiane.araujo@gmail.com", 3600.00, 1);    

INSERT INTO endereco 
    (funcionario_cpf, rua, numero, comp, bairro, cidade, uf, cep)
VALUES
    ("012.345.678-90", "Rua da Aurora", 145, "Apto 302", "Boa Vista", "Recife", "PE", "50050-000"),
    ("055.550.000-55", "Avenida Getúlio Vargas", 200, NULL, "Bairro Novo", "Olinda", "PE", "53120-000"),
    ("074.740.774-00", "Rua Imperial", 512, "Casa", "São José", "Recife", "PE", "50090-000"),
    ("101.112.223-44", "Rua do Sol", 78, "Bloco B, Apto 102", "Carmo", "Olinda", "PE", "53010-200"),
    ("112.233.344-55", "Avenida Boa Viagem", 3120, "Apto 901", "Boa Viagem", "Recife", "PE", "51011-000"),
    ("123.456.789-01", "Rua do Imperador", 100, NULL, "Santo Antônio", "Recife", "PE", "50010-240"),
    ("126.621.666-11", "Rua Prudente de Morais", 310, "Casa 2", "Casa Caiada", "Olinda", "PE", "53030-090"),
    ("147.471.771-41", "Avenida Bernardo Vieira de Melo", 1500, "Apto 604", "Piedade", "Jaboatão dos Guararapes", "PE", "54400-000"),
    ("223.344.455-66", "Rua das Flores", 45, NULL, "Graças", "Recife", "PE", "52011-290"),
    ("234.567.890-12", "Rua do Amparo", 88, "Casa", "Amparo", "Olinda", "PE", "53025-080"),
    ("334.455.566-77", "Avenida Norte", 4002, "Bloco A, Apto 403", "Rosarinho", "Recife", "PE", "52041-000"),
    ("345.678.901-23", "Rua de São Bento", 300, NULL, "Varadouro", "Olinda", "PE", "53020-080"),
    ("445.566.677-88", "Rua Sete de Setembro", 210, "Casa 1", "Centro", "Jaboatão dos Guararapes", "PE", "54100-200"),
    ("456.789.012-34", "Rua das Crianças", 57, NULL, "Espinheiro", "Recife", "PE", "52020-000"),
    ("556.677.788-99", "Rua da Praia", 98, "Apto 405", "Rio Doce", "Olinda", "PE", "53080-000"),
    ("567.890.123-45", "Avenida Ayrton Senna", 222, "Casa", "Candeias", "Jaboatão dos Guararapes", "PE", "54430-000"),
    ("667.788.899-00", "Rua Conselheiro Portela", 675, NULL, "Tamarineira", "Recife", "PE", "52050-020"),
    ("678.901.234-56", "Rua XV de Novembro", 180, "Bloco C, Apto 703", "Bairro Novo", "Olinda", "PE", "53120-310"),
    ("778.899.900-11", "Rua Aníbal Falcão", 150, NULL, "Madalena", "Recife", "PE", "50710-050"),
    ("789.012.345-67", "Avenida Maria Irene", 88, "Casa", "Prazeres", "Jaboatão dos Guararapes", "PE", "54330-000"),
    ("889.900.011-22", "Rua Benfica", 289, "Bloco D, Apto 504", "Madalena", "Recife", "PE", "50720-000"),
    ("890.123.456-78", "Rua Alto da Sé", 34, NULL, "Cidade Alta", "Olinda", "PE", "53020-160"),
    ("901.234.567-89", "Rua Dr. João Suassuna", 105, "Apto 302", "Cordeiro", "Recife", "PE", "50610-290"),
    ("990.011.122-33", "Rua Visconde de Suassuna", 590, NULL, "Boa Vista", "Recife", "PE", "50050-540");

insert into 



