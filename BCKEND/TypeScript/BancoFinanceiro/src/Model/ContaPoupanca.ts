import { Agencia } from "./Agencia";
import { Cliente } from "./Cliente";
import { Conta } from "./Conta";

export class ContaPoupanca extends Conta {

    private taxaRendimento: number;

    constructor(cliente: Cliente, numero: number, agencia: Agencia) {
        super(cliente, numero, agencia);
        this.taxaRendimento = 0.02; // 0.5% de rendimento mensal
    }

    public getTaxaRendimento(): number {
        return this.taxaRendimento;
    }

    public setTaxaRendimento(taxaRendimento: number): void {
        this.taxaRendimento = taxaRendimento;
    }

    public depositar(valor: number): boolean {
        return super.depositar(valor + valor * this.taxaRendimento);
    }
}