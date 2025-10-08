import { Cliente } from "./Cliente";
import { TipoTransacao } from "./TipoTransacao";

export class Transacao {
    private tipo: TipoTransacao;
    private valor: number;
    private data: Date;
    private clienteTransferencia?: Cliente;
    private infoPagamento?: string;
    private tipoValor: string;

    constructor(tipo: TipoTransacao, valor: number, tipoValor: string, 
        clienteTransferencia?: Cliente, infoPagamento?: string) {
        this.tipo = tipo;
        this.valor = valor;
        this.data = new Date();
        if(clienteTransferencia) this.clienteTransferencia = clienteTransferencia;
        if(infoPagamento) this.infoPagamento = infoPagamento;
        this.tipoValor = tipoValor;
    }

    public getTipo(): TipoTransacao {
        return this.tipo;
    }

    public getValor(): number {
        return this.valor;
    }

    public getData(): Date {
        return this.data;
    }

    public getClienteTransferencia(): Cliente | undefined {
        return this.clienteTransferencia;
    }

    public getInfoPagamento(): string | undefined {
        return this.infoPagamento;
    }

    public getTipoValor(): string {
        return this.tipoValor;
    }

    public toString(): string {
        let info = `${this.data.toLocaleString()} \t ${this.tipo} \t ${this.tipoValor} R$ ${this.valor.toFixed(2)}`;
        if(this.clienteTransferencia) {
            info += `\tCliente de Transferência: ${this.clienteTransferencia.getNome()}`;
        }
        if(this.infoPagamento) {
            info += `\tInformações do Pagamento: ${this.infoPagamento}`;
        }
        return info;
    }
}