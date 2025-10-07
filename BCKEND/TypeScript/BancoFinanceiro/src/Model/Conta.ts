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

    //pagar
    public realizarPagamento(valor: number, infoPagamento: string): boolean {
        if(this.status && infoPagamento && valor > 0 && this.saldo >= valor) {
            this.saldo -= valor;
            const transacao = new Transacao(TipoTransacao.PAGAMENTO, valor, "-", undefined, infoPagamento);
            this.transacoes.push(transacao);
            return true;
        }
        console.log("Pagamento não realizado. Verifique o status da conta, o valor solicitado e o saldo disponível.");
        return false;
    }

	//transferir
    public transferir(valor: number, contaDestino: Conta): boolean {
        if(this.status && contaDestino.getStatus() && valor > 0 && this.saldo >= valor) {
            this.saldo -= valor;
            contaDestino.saldo += valor;
            const transacaoSaida = new Transacao(TipoTransacao.TRANSFERENCIA, valor, "-", contaDestino.getCliente());
            const transacaoEntrada = new Transacao(TipoTransacao.TRANSFERENCIA, valor, "+", this.cliente);
            this.transacoes.push(transacaoSaida);
            contaDestino.transacoes.push(transacaoEntrada);
            return true;
        }
        console.log("Transferência não realizada. Verifique o status das contas, o valor solicitado e o saldo disponível.");
        return false;
    }

	//imprimir extrato
    public imprimirExtrato(): void {
        console.log(`\n--- Extrato da Conta ---`);
        console.log(`Cliente: ${this.cliente.getNome()}`);
        console.log(`Número da Conta: ${this.numero}`);
        console.log(`Agência: ${this.agencia.getNumero()}`);        
        if(this.transacoes.length === 0) {
            console.log("Nenhuma transação realizada.");
        } else {
            this.transacoes.forEach((transacao, index) => {
                console.log(`\nTransação ${index + 1}:\n${transacao.toString()}`);
            });
        }
        console.log(`Saldo Atual: R$ ${this.saldo.toFixed(2)}\n`);
    }

}