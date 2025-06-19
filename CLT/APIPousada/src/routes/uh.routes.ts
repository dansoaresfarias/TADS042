import { Router } from "express";
import UHController from "../controllers/uh.controller";


class UHRoutes {
  router = Router();
  controller = new UHController();

  constructor() {
    this.intializeRoutes();
  }

  intializeRoutes() {

    // Criar um novo UH.
    this.router.post("/UH", this.controller.create);

    // Retornar os UHs já cadastrados.
    this.router.get("/UHs", this.controller.findAll);

    // Retorna um UH específico pelo seu id
    this.router.get("/UH/:id", this.controller.findOne);

    // Retorna um UH específico pelo seu nome
    this.router.get("/UH/nome/:nome", this.controller.findName);

    // Atualizar um UH pelo seu id
    this.router.put("/UH/:id", this.controller.update);

    // Deleta um UH pelo seu id
    this.router.delete("/UH/:id", this.controller.delete);

    // Deleta todos os UHs
    this.router.delete("/UHs/", this.controller.deleteAll);
  }
}

export default new UHRoutes().router;