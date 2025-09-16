import { Endereco } from "./Model/Endereco";

console.log("Banco Financeiro");

const endRenato: Endereco = new Endereco("PE", "Recife", "Tamarineira", 
    "Rua Padre São Miguel", 123, "50070-190", "Apto 1301");

console.log(endRenato.toString());

console.log(endRenato);