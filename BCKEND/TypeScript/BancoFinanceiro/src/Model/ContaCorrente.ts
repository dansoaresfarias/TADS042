import { Conta } from "./Conta";
import { Agencia } from "./Agencia";
import { Cliente } from "./Cliente";

export class ContaCorrente extends Conta {

    private taxaManutencao: number;

    constructor(cliente: Cliente, numero: number, agencia: Agencia) {
        super(cliente, numero, agencia);
        this.taxaManutencao = 0.01; // 1% de taxa de manutenção 
    }

    public getTaxaManutencao(): number {
        return this.taxaManutencao;
    }

    public setTaxaManutencao(taxaManutencao: number): void {
        this.taxaManutencao = taxaManutencao;
    }

    public sacar(valor: number): boolean {
        return super.sacar(valor + valor * this.taxaManutencao);
    }

}