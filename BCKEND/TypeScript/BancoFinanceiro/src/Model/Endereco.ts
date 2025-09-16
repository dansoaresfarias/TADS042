export class Endereco{

    private uf: string;
    private cidade: string;
    private bairro: string;
    private rua: string;
    private numero: number;
    private complemento?: string;
    private cep: string;

    constructor(uf: string, cidade: string, bairro: string, rua: string, numero: number, cep: string, complemento?: string){
        this.uf = uf;
        this.cidade = cidade;
        this.bairro = bairro;
        this.rua = rua;
        this.numero = numero;
        this.cep = cep;
        this.complemento = complemento ? complemento : "";
    }

    public getUF(): string{
        return this.uf;
    }

    public getCidade(): string{
        return this.cidade;
    }

    public getBairro(): string{
        return this.bairro;
    }

    public getRua(): string{
        return this.rua;
    }

    public getNumero(): number{
        return this.numero;
    }

    public getComplemento(): string | undefined{
        return this.complemento;
    }

    public getCep(): string{
        return this.cep;
    }

    public setUF(uf: string): void{
        this.uf = uf;
    }

    public setCidade(cidade: string): void{
        this.cidade = cidade;
    }

    public setBairro(bairro: string): void{
        this.bairro = bairro;
    }

    public setRua(rua: string): void{
        this.rua = rua;
    }

    public setNumero(numero: number): void{
        this.numero = numero;
    }

    public setComplemento(complemento: string): void{
        this.complemento = complemento;
    }
    
    public setCep(cep: string): void{
        this.cep = cep;
    }

    public toString(): string{
        return `${this.rua}, ${this.numero} - ${this.bairro}, ${this.cidade} - ${this.uf}, CEP: ${this.cep}` + (this.complemento ? `, Complemento: ${this.complemento}` : '');
    }

}