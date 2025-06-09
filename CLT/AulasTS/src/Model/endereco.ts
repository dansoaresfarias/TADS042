export class endereco {
    private uf: string;
    private cidade: string;
    private bairro: string;
    private rua: string;
    private numero: number;
    private complemento?: string;
    private cep: string;

    constructor(
        uf: string,
        cidade: string,
        bairro: string,
        rua: string,
        numero: number,
        cep: string,
        complemento?: string
    ) {
        this.uf = uf;
        this.cidade = cidade;
        this.bairro = bairro;
        this.rua = rua;
        this.numero = numero;
        this.cep = cep;
        this.complemento = complemento;
    }

    public getUf(): string {
        return this.uf;
    }

    public getCidade(): string {
        return this.cidade;
    }

    public getBairro(): string {
        return this.bairro;
    }

    public getRua(): string {
        return this.rua;
    }

    public getNumero(): number {
        return this.numero;
    }

    public getComplemento(): string | undefined {
        return this.complemento;
    }

    public getCep(): string {
        return this.cep;
    }

    public setComplemento(comp : string) : void {
        this.complemento = comp;
    }

    public toString() : string{
        return `Endereço: ${this.cidade}-${this.uf}, ${this.rua}, Nº${this.numero}, ${this.complemento ? this.complemento + ", " : ""} ${this.cep}`;
    }

}