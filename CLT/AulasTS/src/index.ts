import { funcionario } from './Model/funcionario';
import { endereco } from './Model/endereco';

//console.log("Hello World! Danilo Farias");

const enderecoJoao = new endereco('PE', 'Olinda', 'Carmo',
    "Rua do Amparo", 321, "50080-090");

enderecoJoao.setComplemento("Casa B");

const joao = new funcionario("123.456.789-00", "João Brayner", "M", new Date("2004-08-26"), "joao.b@gmail.com", 2000, enderecoJoao);

const enderecoEdu = new endereco('PE', 'Recife', 'Boa Vista',
    "Rua do Hospício", 1023, "50080-090");

const eduardo = new funcionario("098.765.432-11", "Eduardo Melo", "M", new Date("1991-12-10"), "eduardo.melo@gmail.com", 3000, enderecoEdu);

joao.addNumTelefone("(81)98494-9090");
joao.addNumTelefone("(81)99898-8888");

eduardo.addNumTelefone("(81)99898-7777");
eduardo.addNumTelefone("(81)99898-2222");
eduardo.addNumTelefone("(81)99898-1111");

console.log(joao.toString());

console.log(eduardo);