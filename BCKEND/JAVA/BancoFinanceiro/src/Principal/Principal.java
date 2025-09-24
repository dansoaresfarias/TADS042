package Principal;

import java.util.Date;

import Model.Agencia;
import Model.Cliente;
import Model.Endereco;
import Model.Conta;

public class Principal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//System.out.println("Olá mundo!");
		
		Endereco endRenato = new Endereco("PE", "Olinda", 
				"Tamarineira", "Rua Padre São Miguel", "Ap 1301",
				"50070-190", 123);
		
		Endereco endAgSuassuna = new Endereco("PE", "Recife", 
				"Santo Amaro", "Rua Suassuna", null,
				"50070-190", 1234);
		
		Cliente renato = new Cliente("Renato Delgado", 
				"123.456.789-00", new Date(1995, 7, 14), 
				1232435, "renato.delga@gmail.com", "(81)909090909"
				, endRenato);
		
		Agencia  agSuassuna = new Agencia("Suassuna", 1235, 
				"ag.suassuna@banco.senac.br", "(81)21264534", 
				endAgSuassuna);
		
		Conta contaRenato = new Conta(renato, 1234, agSuassuna);
		
		contaRenato.depositar(1000);
		contaRenato.sacar(500);
		contaRenato.sacar(600);
		
		//endRenato.uf = "PE";
		endRenato.setUf("PE");
		//endRenato.cidade = "Recife";
		endRenato.setCidade("Recife");
		
		//System.out.println(endRenato);
		
		//System.out.println(renato);
		
		//System.out.println(agSuassuna);
		
		System.out.println(contaRenato.getTransacoes().toString());
		
	}

}
