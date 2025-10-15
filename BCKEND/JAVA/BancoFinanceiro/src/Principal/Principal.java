package Principal;

import java.util.Date;

import Model.Agencia;
import Model.Cliente;
import Model.Endereco;
import Model.ContaCorrente;
import Model.ContaPoupanca;

public class Principal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//System.out.println("Olá mundo!");
		
		Endereco endRenato = new Endereco("PE", "Olinda", 
				"Tamarineira", "Rua Padre São Miguel", "Ap 1301",
				"50070-190", 123);
		Endereco endDaniela = new Endereco("PE", "Recife", 
				"Torre", "Rua Juliano Vitoriano", "Ap 2302",
				"50080-150", 321);
		
		Endereco endAgSuassuna = new Endereco("PE", "Recife", 
				"Santo Amaro", "Rua Suassuna", null,
				"50070-190", 1234);
		
		Cliente renato = new Cliente("Renato Delgado", 
				"123.456.789-00", new Date(1995, 7, 14), 
				1232435, "renato.delga@gmail.com", "(81)909090909"
				, endRenato);
		Cliente daniela = new Cliente("Daniela Lopes", 
				"321.456.789-00", new Date(1985, 11, 12), 
				3212435, "dani.lopes@gmail.com", "(81)909091111"
				, endDaniela);
		
		Agencia  agSuassuna = new Agencia("Suassuna", 1235, 
				"ag.suassuna@banco.senac.br", "(81)21264534", 
				endAgSuassuna);
		
		ContaCorrente contaRenato = new ContaCorrente(renato, 1234, agSuassuna);
		ContaPoupanca contaDani = new ContaPoupanca(daniela, 4321, agSuassuna);
		
		
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
		
		//endRenato.uf = "PE";
		//endRenato.setUf("PE");
		//endRenato.cidade = "Recife";
		//endRenato.setCidade("Recife");
		
		//System.out.println(endRenato);
		
		//System.out.println(renato);
		
		//System.out.println(agSuassuna);
		
		//System.out.println(contaRenato.getTransacoes().toString());
		
		System.out.println(contaRenato.gerarExtrato() + "\n");
		System.out.println(contaDani.gerarExtrato());
		
	}

}
