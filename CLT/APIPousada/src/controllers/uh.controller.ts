import { Request, Response } from "express";
import { UH } from "../models/UH";
import UHRepository from "../repositories/UHRepository";

export default class UHController {

    async create(req: Request, res: Response) {
        if (!req.body.nome) {
            res.status(400).send({
                message: "Não pode ser vazio a Unidade Habitacional (UH) a ser cadastrada!"
            });
            return;
        }

        try {
            const uh: UH = req.body;
            const savedUH = await UHRepository.save(uh);
            res.status(201).send(savedUH);
        } catch (err) {
            res.status(500).send({
                message: "Erro ao tentar salvar uma Unidade Habitacional (UH)."
            });
        }
    }

    async findAll(req: Request, res: Response) {
        try {
            const uhs = await UHRepository.retrieveAll();
            res.status(200).send(uhs);
        } catch (err) {
            res.status(500).send({
                message: "Erro encontrado quando estava se fazendo a busca por todos as Unidades Habitacionais (UHs)."
            });
        }
    }

    async findOne(req: Request, res: Response) {
        const idUH: number = parseInt(req.params.id);

        try {
            const uh = await UHRepository.retrieveByID(idUH);
            if (uh) res.status(200).send(uh);
            else
                res.status(404).send({
                    message: `Não foi encontrado nenhum Unidade Habitacional (UH) com esse id=${idUH}.`
                });
        } catch (err) {
            res.status(500).send({
                message: `Error não foi possível retornar a Unidade Habitacional (UH) com id=${idUH}.`
            });
        }
    }

    async findName(req: Request, res: Response) {
        const nome: string = req.params.nome;

        try {
            const uh = await UHRepository.retrieveByNome(nome);
            if (uh) res.status(200).send(uh);
            else
                res.status(404).send({
                    message: `Não foi encontrado nenhum Unidade Habitacional (UH) com esse nome=${nome}.`
                });
        } catch (err) {
            res.status(500).send({
                message: `Error não foi possível retornar a Unidade Habitacional (UH) com nome=${nome}.`
            });
        }
    }

    async update(req: Request, res: Response) {
        let uh: UH = req.body;
        uh.idUH = parseInt(req.params.id);        
        try {
            await UHRepository.update(uh);
            res.send({
                message: `Unidade Habitacional (UH) ${uh.nome} atulizado com sucesso!`
            });
        } catch (err) {
            res.status(500).send({
                message: `Error ao atualizar a Unidade Habitacional (UH) com id=${uh.idUH}.`
            });
        }
    }

    async delete(req: Request, res: Response) {
        const idUH: number = parseInt(req.params.id);

        try {
            const num = await UHRepository.delete(idUH);

            if (num == 1) {
                res.send({
                    message: "Unidade Habitacional (UH) deletada com sucesso!"
                });
            } else {
                res.send({
                    message: `Não foi possível deletar a Unidade Habitacional (UH) com id=${idUH}. A UH não tenha sido encontrado.`,
                });
            }
        } catch (err) {
            res.status(500).send({
                message: `A Unidade Habitacional (UH) com id==${idUH}, não pode ser deletado.`
            });
        }
    }

    async deleteAll(req: Request, res: Response) {
        try {
            const num = await UHRepository.deleteAll();

            res.send({ message: `${num} Unidades Habitacionais (UHs) foram deletadas com sucesso!` });
        } catch (err) {
            res.status(500).send({
                message: "Algum erro ocorreu enquato deletava todos as Unidades Habitacionais (UHs)."
            });
        }
    }

}