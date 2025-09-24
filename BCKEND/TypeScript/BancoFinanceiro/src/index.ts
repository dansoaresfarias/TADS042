import { Cliente } from "./Model/Cliente";
import { Endereco } from "./Model/Endereco";
import { Agencia } from "./Model/Agencia";
import { Conta } from "./Model/Conta";

console.log("Banco Financeiro");

const endRenato: Endereco = new Endereco("PE", "Recife", "Tamarineira", 
    "Rua Padre São Miguel", 123, "50070-190", "Apto 1301");

const endAgSuassuna: Endereco = new Endereco("PE", "Recife", "Santo Amaro", 
    "Rua Suassuna", 1235, "50070-740");

const renato: Cliente = new Cliente("Renato Delgado", "123.456.789-00", 
    new Date("1995-08-14"), "SSD-PE 345.678.90", "renato.delgado@gmail.com", 
    "(81) 91234-5678", endRenato);

const agSuassuna: Agencia = new Agencia("Agência Suassuna", 1234, "(81) 3344-5566",
    "ag.suassuna@banco.senac.br", endAgSuassuna);

const contaRenato: Conta = new Conta(renato, 123456, agSuassuna);

contaRenato.depositar(1000);
contaRenato.sacar(500);
contaRenato.sacar(600);

//console.log(endRenato.toString());

//console.log(renato.toString());

//console.log(agSuassuna.toString());

console.log(contaRenato.getTransacoes.toString());