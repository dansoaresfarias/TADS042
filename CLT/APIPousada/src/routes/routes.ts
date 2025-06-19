import { Application } from "express";
import UHRoutes from "./uh.routes";

export default class Routes {
    constructor(app: Application) {
        app.use("/apipousada",UHRoutes);
    }
}