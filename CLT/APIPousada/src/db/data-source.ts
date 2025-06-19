import "reflect-metadata"
import { DataSource } from "typeorm"
import { dbConfig, dialect } from "../config/db.config"
import { UH } from "../models/UH"

export const AppDataSource = new DataSource({
    type: dialect,
    host: dbConfig.host,
    port: dbConfig.port,
    username: dbConfig.user,
    password: dbConfig.password,
    database: dbConfig.database,
    entities: [UH],
    synchronize: false,
    logging: false,
})