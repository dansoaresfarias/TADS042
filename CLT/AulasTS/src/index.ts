import { funcionario } from './entidades/funcionario';

//console.log("Hello World! Danilo Farias");

var joao = new funcionario("123.456.789-00", "João Brayner", "M", new Date("2004-08-26"), "joao.b@gmail.com", 2000);

console.log(joao.toString());