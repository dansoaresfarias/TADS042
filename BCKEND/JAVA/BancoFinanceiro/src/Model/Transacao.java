package Model;

import java.util.Date;

public class Transacao {
	
	private TipoTransacao tipo;
	private Date data;
	private double valor;
	private Cliente clienteTransferencia;
	private char tipoValor;
	
	public Transacao(TipoTransacao tipo, double valor, Cliente clienteTransferencia, char tipoValor) {
		super();
		this.tipo = tipo;
		this.data = new Date();
		this.valor = valor;
		this.clienteTransferencia = clienteTransferencia;
		this.tipoValor = tipoValor;
	}

	public TipoTransacao getTipo() {
		return tipo;
	}

	public Date getData() {
		return data;
	}

	public double getValor() {
		return valor;
	}

	public Cliente getClienteTransferencia() {
		return clienteTransferencia;
	}

	public char getTipoValor() {
		return tipoValor;
	}

	@Override
	public String toString() {
		if (clienteTransferencia == null) {
			return  data.getDate() + "/" + 	data.getMonth() + "/" + 
					data.getYear() + "\t" + tipo + "\t" + 
					tipoValor + " R$ " + valor;
		} else {
			return  data.getDate() + "/" + 	data.getMonth() + "/" + 
					data.getYear() + "\t" + tipo + ", " + 
					clienteTransferencia.getNome() + "\t" + 
					tipoValor + " R$ " + valor;
		}		
	}	

}
