export class telefone {

    private numero: string;

    constructor(numero: string) {
        this.numero = numero;
    }

    public getNumero() : string{
        return this.numero;
    }

    public setNumero(numero : string) : void {
        this.numero = numero;
    }
}