import { endereco } from './endereco';
import { telefone } from './telefone';

export class funcionario  {

    private cpf: string;
    private nome: string;
    private nomeSocial?: string;
    private genero: string;
    private dataNascimento: Date;
    private email: string;
    private salario: number;
    private status: boolean;
    private fg?: number;
    private endereco: endereco;
    private telefones : telefone[] = [];

    constructor(
        cpf: string,
        nome: string,
        genero: string,
        dataNascimento: Date,
        email: string,
        salario: number,
        endereco: endereco,
        nomeSocial?: string,
        fg?: number
    ) {
        this.cpf = cpf;
        this.nome = nome;
        this.genero = genero;
        this.dataNascimento = dataNascimento;
        this.email = email;
        this.salario = salario;
        this.status = true;
        this.nomeSocial = nomeSocial;
        this.fg = fg;
        this.endereco = endereco;        
    }

    public getCpf(): string {
        return this.cpf;
    }

    public getNome(): string {
        return this.nome;
    }

    public getNomeSocial(): string | undefined {
        return this.nomeSocial;
    }

    public getGenero(): string {
        return this.genero;
    }

    public getDataNascimento(): Date {
        return this.dataNascimento;
    }

    public getEmail(): string {
        return this.email;
    }

    public getSalario(): number {
        return this.salario;
    }

    public getStatus(): boolean {
        return this.status;
    }
    
    public getFg(): number | undefined {
        return this.fg;
    }

    public setCpf(cpf: string): void {
        this.cpf = cpf;
    }

    public setNome(nome: string): void {
        this.nome = nome;
    }

    public setNomeSocial(nomeSocial: string | undefined): void {
        this.nomeSocial = nomeSocial;
    }

    public setGenero(genero: string): void {
        this.genero = genero;
    }

    public setDataNascimento(dataNascimento: Date): void {
        this.dataNascimento = dataNascimento;
    }

    public setEmail(email: string): void {
        this.email = email;
    }

    public setSalario(salario: number): void {
        this.salario = salario;
    }

    public setStatus(status: boolean): void {
        this.status = status;
    }

    public setFg(fg: number | undefined): void {
        this.fg = fg;
    }

    public getEndereco() : endereco {
        return this.endereco;
    }
    
    public setEndereco(endereco: endereco): void {
        this.endereco = endereco;
    }

    public toString(): string {
        return `Funcionario: ${this.nome}, CPF: ${this.cpf}, Email: ${this.email}, Salario: R$${this.salario}, Status: ${this.status}, Telefones: ${this.telefones.map(tel => tel.getNumero()).join(', ')} , ${this.endereco.toString()}`;
    }

    public toJSON(): object {
        return {
            cpf: this.cpf,
            nome: this.nome,
            nomeSocial: this.nomeSocial,
            genero: this.genero,
            dataNascimento: this.dataNascimento.toISOString(),
            email: this.email,
            salario: this.salario,
            status: this.status,
            fg: this.fg,
            endereco: this.endereco.toString()
        };
    }

    public addTelefone(telefone: telefone): void {
        this.telefones.push(telefone);
    }

    public addNumTelefone(numero: string) : void {
        this.telefones.push(new telefone(numero));
    }

    public removerTelefone(telefone: telefone): void {
        const index = this.telefones.indexOf(telefone);
        if (index > -1) {
            this.telefones.splice(index, 1);
        }
    }

    public removerNumTelefone(numero: string): void {
        this.telefones = this.telefones.filter(telefone => telefone.getNumero() !== numero);
    }

}