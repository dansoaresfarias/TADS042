import { AppDataSource } from "./db/data-source";
import { UH } from "./models/UH";
import UHRepository from "./repositories/UHRepository";

AppDataSource.initialize()
    .then(() => {
        // here you can start to work with your database
        console.log(`Database is running.`);    
        const quarto101 = new UH(2, "Quarto 101", 150.00, "Bloco A, 1º andar", 2);
        const quarto102 = new UH(3, "Quarto 102", 150.00, "Bloco A, 1º andar", 2);
        const quarto103 = new UH(4, "Quarto 103", 150.00, "Bloco A, 1º andar", 2);
        const quarto104 = new UH(5, "Quarto 104", 150.00, "Bloco A, 1º andar", 2);
        const quarto02 = new UH(6, "Quarto 02", 700.00, "Frente Mar", 6);
        UHRepository.save(quarto101);
        UHRepository.save(quarto102);
        UHRepository.save(quarto103);
        UHRepository.save(quarto104);
        UHRepository.save(quarto02);
        UHRepository.retrieveAll();
        UHRepository.retrieveByID(2);
        UHRepository.retrieveByNome("Quarto 02");
        quarto104.valorDiaria = 200.00;
        UHRepository.update(quarto104);
        UHRepository.delete(3);        
    })
    .catch((error) => console.log(error));

// console.log("Olá mundo! João mamão!");