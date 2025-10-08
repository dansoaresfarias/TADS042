package Model;

import java.util.Date;

public class Transacao {
	
	private TipoTransacao tipo;
	private Date data;
	private double valor;
	private Cliente clienteTransferencia;
	private String infoPagamento;
	private char tipoValor;
	
	public Transacao(TipoTransacao tipo, double valor, char tipoValor) {
		super();
		this.tipo = tipo;
		this.data = new Date();
		this.valor = valor;
		this.clienteTransferencia = null;
		this.infoPagamento = null;
		this.tipoValor = tipoValor;
	}
	
	public Transacao(TipoTransacao tipo, double valor, Cliente clienteTransferencia, char tipoValor) {
		super();
		this.tipo = tipo;
		this.data = new Date();
		this.valor = valor;
		this.clienteTransferencia = clienteTransferencia;
		this.infoPagamento = null;
		this.tipoValor = tipoValor;
	}
	
	public Transacao(TipoTransacao tipo, double valor, String infoPagamento, char tipoValor) {
		super();
		this.tipo = tipo;
		this.data = new Date();
		this.valor = valor;
		this.clienteTransferencia = null;
		this.infoPagamento = infoPagamento;
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
	
	public String getInfoPagamento() {
		return infoPagamento;
	}

	@Override
	public String toString() {
		if (clienteTransferencia != null) {
			return  data.getDate() + "/" + 	(data.getMonth()+1) + "/" + 
					(data.getYear()+1900) + "\t" + tipo + ", " + 
					clienteTransferencia.getNome() + "\t" + 
					tipoValor + " R$ " + valor;
		} else if(infoPagamento != null) {
			return  data.getDate() + "/" + 	(data.getMonth()+1) + "/" + 
					(data.getYear()+1900) + "\t" + tipo + ", " + 
					infoPagamento + "\t" + 
					tipoValor + " R$ " + valor;
		} else {
			return  data.getDate() + "/" + 	(data.getMonth()+1) + "/" + 
					(data.getYear()+1900) + "\t" + tipo + ", " +
					tipoValor + " R$ " + valor;
		}		
	}	

}
