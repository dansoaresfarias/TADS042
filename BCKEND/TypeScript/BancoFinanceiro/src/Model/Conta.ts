import { Agencia } from "./Agencia";
import { Cliente } from "./Cliente";
import { TipoTransacao } from "./TipoTransacao";
import { Transacao } from "./Transacao";

export class Conta {

    private cliente: Cliente;
    private numero: number;
    private agencia: Agencia;
    private dataCriacao: Date;
    private saldo: number;
    private status: boolean;
    private transacoes: Transacao[];

    constructor(cliente: Cliente, numero: number, agencia: Agencia) {
        this.cliente = cliente;
        this.numero = numero;
        this.agencia = agencia;
        this.dataCriacao = new Date();
        this.saldo = 0;
        this.status = true;
        this.transacoes = [];
    }

    public getCliente(): Cliente {
        return this.cliente;
    }

    public getNumero(): number {
        return this.numero;
    }

    public getAgencia(): Agencia {
        return this.agencia;
    }

    public getDataCriacao(): Date {
        return this.dataCriacao;
    }

    public getSaldo(): number {
        return this.saldo;
    }

    public getStatus(): boolean {
        return this.status;
    }

    public getTransacoes(): Transacao[] {
        return this.transacoes;
    }

    //sacar
    public sacar(valor: number): boolean {
        if(this.status && valor > 0 && this.saldo >= valor) {
            this.saldo -= valor;
            const transacao = new Transacao(TipoTransacao.SAQUE, valor, "-");
            this.transacoes.push(transacao);
            return true;
        }
        console.log("Saque não realizado. Verifique o status da conta, o valor solicitado e o saldo disponível.");
        return false;
    }
	
	//depositar
	public depositar(valor: number): boolean {
        if(this.status && valor > 0) {
            this.saldo += valor;
            const transacao = new Transacao(TipoTransacao.DEPOSITO, valor, "+");
            this.transacoes.push(transacao);
            return true;
        }
        console.log("Depósito não realizado. Verifique o status da conta e o valor solicitado.");
        return false;
    }
	//transferir
	
	//pagar
	
	//imprimir extrato

}