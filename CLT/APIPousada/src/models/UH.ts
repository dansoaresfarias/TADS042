import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("UH", { schema: "apipousada" })
export class UH {
  @PrimaryGeneratedColumn()
  idUH: number;

  @Column({ type: "varchar", length: 45 })
  nome: string;

  @Column({ type: "decimal", precision: 6, scale: 2 })
  valorDiaria: number;

  @Column({ type: "varchar", length: 45 })
  local: string;

  @Column({ type: "int" })
  qtdMaxHospedes: number;

  constructor(idUH: number, nome: string, valorDiaria: number, local: string, qtdMaxHospedes: number) {
    this.idUH = idUH;
    this.nome = nome;
    this.valorDiaria = valorDiaria;
    this.local = local;
    this.qtdMaxHospedes = qtdMaxHospedes;
  }
}
