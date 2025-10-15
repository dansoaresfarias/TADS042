import { Cliente } from "./Model/Cliente";
import { Endereco } from "./Model/Endereco";
import { Agencia } from "./Model/Agencia";
import { ContaPoupanca } from "./Model/ContaPoupanca";
import { ContaCorrente } from "./Model/ContaCorrente";

console.log("Banco Financeiro");

const endRenato: Endereco = new Endereco("PE", "Recife", "Tamarineira",
    "Rua Padre São Miguel", 123, "50070-190", "Apto 1301");

const endDaniela: Endereco = new Endereco("PE", "Recife", "Torre",
    "Rua José Ricardo", 3214, "50070-180", "Apto 2301");

const endAgSuassuna: Endereco = new Endereco("PE", "Recife", "Santo Amaro",
    "Rua Suassuna", 1235, "50070-740");

const renato: Cliente = new Cliente("Renato Delgado", "123.456.789-00",
    new Date("1995-08-14"), "SSD-PE 345.678.90", "renato.delgado@gmail.com",
    "(81) 91234-5678", endRenato);

const daniela: Cliente = new Cliente("Daniela Lopes", "321.456.789-00",
    new Date("1985-12-23"), "SSD-PE 111.648.90", "dani.lopes@gmail.com",
    "(81) 91234-5611", endDaniela);

const agSuassuna: Agencia = new Agencia("Agência Suassuna", 1234, "(81) 3344-5566",
    "ag.suassuna@banco.senac.br", endAgSuassuna);

const contaRenato: ContaCorrente = new ContaCorrente(renato, 123456, agSuassuna);
const contaDani: ContaPoupanca = new ContaPoupanca(daniela, 645456, agSuassuna);

contaRenato.depositar(3500);
contaRenato.pagar(580, "Faculdade SENAC");
contaRenato.pagar(120, "Academia");
contaRenato.pagar(150, "Vivo");
contaRenato.pagar(380, "NeoEnergia");
contaRenato.pagar(1600, "Cartão Nubank");
contaRenato.sacar(200);

contaDani.depositar(8500);
contaDani.pagar(580, "Faculdade SENAC");
contaDani.pagar(580, "Academia");
contaDani.pagar(150, "Vivo");
contaDani.pagar(450, "NeoEnergia");
contaDani.pagar(5000, "Cartão Nubank");
contaDani.transferir(400, contaRenato);

//console.log(endRenato.toString());

//console.log(renato.toString());

//console.log(agSuassuna.toString());

console.log(contaRenato.imprimirExtrato() + "\n");
console.log(contaDani.imprimirExtrato());