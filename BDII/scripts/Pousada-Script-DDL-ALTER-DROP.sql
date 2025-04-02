create schema malibu;

use malibu;

create table malibu.funcionario (
	cpf varchar(14) primary key not null,
    nome varchar(80) not null,
    nomeSocial varchar(45) null,
    genero char(1) not null,
    dataNasc date not null,
    email varchar(45) unique not null,
    salario decimal(7,2) unsigned zerofill not null,
    `status` tinyint not null,
    fg decimal(6,2)
);

create table malibu.endereco (
	Funcionario_cpf varchar(14) primary key not null,
    UF char(2) not null,
    cidade varchar(45) not null,
    bairro varchar(45) not null,
    rua varchar(45) not null,
    numero int not null,
    comp varchar(45) null,
    cep varchar(9) not null,
    foreign key (Funcionario_cpf) references malibu.funcionario (cpf)
		on update cascade
        on delete cascade
);

desc malibu.endereco;

rename table endereco to endereço;

alter table malibu.funcionario 
	add column comissao decimal(6,2) null;
    
alter table malibu.funcionario
	add column RG varchar(15) unique not null after cpf;
    
alter table malibu.funcionario
	change column fg funcaoGrat decimal(5,2) null;

alter table malibu.funcionario
	change column funcaoGrat funcaoGrat decimal(6,2) unsigned zerofill null;

alter table malibu.funcionario
	drop column comissao;

drop table malibu.funcionario;

drop table malibu.endereço;

drop schema malibu;
