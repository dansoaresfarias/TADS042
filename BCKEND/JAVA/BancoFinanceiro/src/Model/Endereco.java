package Model;

public class Endereco {

	private String uf;
	private String cidade;
	private String bairro, rua, comp, cep;
	private int numero;

	public Endereco(String uf, String cidade, String bairro, String rua, String comp, String cep, int numero) {
		super();
		this.uf = uf;
		this.cidade = cidade;
		this.bairro = bairro;
		this.rua = rua;
		this.comp = comp;
		this.cep = cep;
		this.numero = numero;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getComp() {
		return comp;
	}

	public void setComp(String comp) {
		this.comp = comp;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	@Override
	public String toString() {
		return "Endereco: \nUF= " + uf + "\nCidade= " + cidade + 
				"\nBairro= " + bairro + "\nRua= " + rua + 
				"\nNumero= " + numero +
				"\nComplemento= " + comp
				+ "\nCEP= " + cep ;
	}

}
