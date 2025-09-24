package Model;

public class Agencia {

	private String nome;
	private int numero;
	private String email;
	private String telefone;
	private Endereco endereco;

	public Agencia(String nome, int numero, String email, String telefone, Endereco endereco) {
		super();
		this.nome = nome;
		this.numero = numero;
		this.email = email;
		this.telefone = telefone;
		this.endereco = endereco;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public int getNumero() {
		return numero;
	}

	@Override
	public String toString() {
		return "Agência " + nome + ", Nº " + numero + 
				", E-mail: " + email + ", Telefone: " + telefone
				+ ", localizado em " + endereco;
	}
	

}
