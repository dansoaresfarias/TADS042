package Model;

import java.util.Date;

public class ContaPoupanca extends Conta {

	private static final double taxaInterna = 0.02;

	private double taxaRendimento;

	public ContaPoupanca(Cliente cliente, int numero, Agencia ag, Date dataCriacao, double saldo) {
		super(cliente, numero, ag, dataCriacao, saldo);
		// TODO Auto-generated constructor stub
		this.taxaRendimento = taxaInterna;
	}

	public ContaPoupanca(Cliente cliente, int numero, Agencia ag) {
		super(cliente, numero, ag);
		// TODO Auto-generated constructor stub
		this.taxaRendimento = taxaInterna;
	}

	public double getTaxaRendimento() {
		return taxaRendimento;
	}

	public void setTaxaRendimento(double taxaRendimento) {
		this.taxaRendimento = taxaRendimento;
	}

	public boolean depositar(double valor) {
		return super.depositar(valor + valor * this.taxaRendimento);
	}

}
