import { AppDataSource } from "../db/data-source";
import { UH } from "../models/UH";

class repUH {
    private repUH = AppDataSource.getRepository(UH);

    async save(uh: UH): Promise<UH> {
        try {
            return await this.repUH.save(uh);
        } catch (error) {
            throw new Error(`Error ao salvar a UH: ${error}`);
        }
    }

    async retrieveAll(): Promise<Array<UH>> {
        try {
            return await this.repUH.find();
        } catch (error) {
            throw new Error("Falha ao retornar os UHs!");
        }
    }

    async retrieveByID(id: number): Promise<UH | null> {
        try {
            return await this.repUH.findOneBy({
                idUH: id,
            });
        } catch (error) {
            throw new Error("Falha ao buscar o UH!");
        }
    }

    async retrieveByNome(nome: string): Promise<UH | null> {
        try {
            return await this.repUH.findOneBy({
                nome: nome,
            });
        } catch (error) {
            throw new Error("Falha ao buscar o UH!");
        }
    }

    async update(UH: UH) {
        const { idUH, nome, valorDiaria, local, qtdMaxHospedes } = UH;
        try {
             await this.repUH.save(UH);
        } catch (error) {
            throw new Error("Falha ao atualizar o UH!");
        }
    }

    async delete(id: number): Promise<number> {
        try {
            const UHEncontrado = await this.repUH.findOneBy({
                idUH: id,
            });
            if (UHEncontrado) {
                this.repUH.delete(UHEncontrado);
                return 1;
            }
            return 0;
        } catch (error) {
            throw new Error("Falha ao deletar o UH!");
        }
    }

    async deleteAll(): Promise<number> {
        try {
            let num = this.repUH.query("select count(idUH) from UH;");
            await this.repUH.query("delete from UH;");
            return num;
        } catch (error) {
            throw new Error("Falha ao deletar todos os UHs!");
        }
    }
}

export default new repUH();