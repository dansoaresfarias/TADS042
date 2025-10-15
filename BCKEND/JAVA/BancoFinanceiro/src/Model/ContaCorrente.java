package Model;

import java.util.Date;

public class ContaCorrente extends Conta {

	private double taxaManutencao;

	// Polimorfismo sobrecarga
	public ContaCorrente(Cliente cliente, int numero, Agencia ag, Date dataCriacao, double saldo) {
		super(cliente, numero, ag, dataCriacao, saldo);
		// TODO Auto-generated constructor stub
		this.taxaManutencao = 0.01;
	}

	// Polimorfismo sobrecarga
	public ContaCorrente(Cliente cliente, int numero, Agencia ag) {
		super(cliente, numero, ag);
		// TODO Auto-generated constructor stub
		this.taxaManutencao = 0.01;
	}

	public double getTaxaManutencao() {
		return taxaManutencao;
	}

	public void setTaxaManutencao(double taxaManutencao) {
		this.taxaManutencao = taxaManutencao;
	}

	// Polimorfismo de sobrescriva
	@Override
	public boolean sacar(double valor) {
		return super.sacar(valor + valor * this.taxaManutencao);
	}

}
