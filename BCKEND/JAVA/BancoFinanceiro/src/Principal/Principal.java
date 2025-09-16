package Principal;

import Model.Endereco;

public class Principal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Olá mundo!");
		
		Endereco endRenato = new Endereco("PE", "Olinda", 
				"Tamarineira", "Rua Padre São Miguel", "Ap 1301",
				"50070-190", 123);
		
		//endRenato.uf = "PE";
		endRenato.setUf("PE");
		//endRenato.cidade = "Recife";
		endRenato.setCidade("Recife");
		
		System.out.println(endRenato);
		
	}

}
