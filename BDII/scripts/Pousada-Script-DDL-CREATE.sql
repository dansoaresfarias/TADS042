-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TropicanaTADS042
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TropicanaTADS042
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TropicanaTADS042` DEFAULT CHARACTER SET utf8 ;
USE `TropicanaTADS042` ;

-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Funcionario` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `nomeSocial` VARCHAR(45) NULL,
  `genero` CHAR(1) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `salario` DECIMAL(7,2) ZEROFILL UNSIGNED NOT NULL,
  `status` TINYINT NOT NULL,
  `fg` DECIMAL(6,2) UNSIGNED ZEROFILL NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(25) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `Gerente_cpf` VARCHAR(14) NULL,
  PRIMARY KEY (`idDepartamento`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_Departamento_Funcionario1_idx` (`Gerente_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Departamento_Funcionario1`
    FOREIGN KEY (`Gerente_cpf`)
    REFERENCES `TropicanaTADS042`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(15) NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NULL,
  `Departamento_idDepartamento` INT NULL,
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC) VISIBLE,
  INDEX `fk_Telefone_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  PRIMARY KEY (`idTelefone`),
  INDEX `fk_Telefone_Departamento1_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `TropicanaTADS042`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Telefone_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `TropicanaTADS042`.`Departamento` (`idDepartamento`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Endereco` (
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `UF` CHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `comp` VARCHAR(45) NULL,
  `cep` VARCHAR(9) NOT NULL,
  INDEX `fk_Endereco_Funcionario_idx` (`Funcionario_cpf` ASC) VISIBLE,
  PRIMARY KEY (`Funcionario_cpf`),
  CONSTRAINT `fk_Endereco_Funcionario`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `TropicanaTADS042`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Dependente` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `genero` CHAR(1) NOT NULL,
  `parentesco` VARCHAR(15) NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_Dependente_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Dependente_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `TropicanaTADS042`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Ferias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Ferias` (
  `idFerias` INT NOT NULL AUTO_INCREMENT,
  `dataInicio` DATE NOT NULL,
  `dataFim` DATE NOT NULL,
  `addDecimal` TINYINT NOT NULL,
  `valor` DECIMAL(6,2) UNSIGNED ZEROFILL NOT NULL,
  `periodoAqt` INT NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idFerias`),
  INDEX `fk_Ferias_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Ferias_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `TropicanaTADS042`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`RegPonto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`RegPonto` (
  `idRegPonto` INT NOT NULL AUTO_INCREMENT,
  `tipoES` VARCHAR(10) NOT NULL,
  `dataHora` DATETIME NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idRegPonto`),
  INDEX `fk_RegPonto_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_RegPonto_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `TropicanaTADS042`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Ocorrencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Ocorrencia` (
  `idOcorrencia` INT NOT NULL AUTO_INCREMENT,
  `dataHoraIni` DATETIME NOT NULL,
  `dataHoraFim` DATETIME NOT NULL,
  `tipo` VARCHAR(25) NOT NULL,
  `obs` VARCHAR(150) NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idOcorrencia`),
  INDEX `fk_Ocorrencia_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Ocorrencia_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `TropicanaTADS042`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Cargo` (
  `cbo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cbo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Trabalhar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Trabalhar` (
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  `Cargo_cbo` INT NOT NULL,
  `dataInicio` DATETIME NOT NULL,
  `dataFim` DATETIME NULL,
  PRIMARY KEY (`Funcionario_cpf`, `Departamento_idDepartamento`, `Cargo_cbo`),
  INDEX `fk_Funcionario_has_Departamento_Departamento1_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  INDEX `fk_Funcionario_has_Departamento_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  INDEX `fk_Funcionario_has_Departamento_Cargo1_idx` (`Cargo_cbo` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_has_Departamento_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `TropicanaTADS042`.`Funcionario` (`cpf`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Funcionario_has_Departamento_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `TropicanaTADS042`.`Departamento` (`idDepartamento`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Funcionario_has_Departamento_Cargo1`
    FOREIGN KEY (`Cargo_cbo`)
    REFERENCES `TropicanaTADS042`.`Cargo` (`cbo`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Hospede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Hospede` (
  `cpf_passaporte` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `email` VARCHAR(45) NULL,
  `telefone` VARCHAR(15) NULL,
  PRIMARY KEY (`cpf_passaporte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Reserva` (
  `idReserva` INT NOT NULL AUTO_INCREMENT,
  `qtdHospedes` INT NOT NULL,
  `status` VARCHAR(15) NOT NULL,
  `dataEntrada` DATETIME NOT NULL,
  `dataSaída` DATETIME NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `Responsavel_cpf_passaporte` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_Reserva_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  INDEX `fk_Reserva_Hospede1_idx` (`Responsavel_cpf_passaporte` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `TropicanaTADS042`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Reserva_Hospede1`
    FOREIGN KEY (`Responsavel_cpf_passaporte`)
    REFERENCES `TropicanaTADS042`.`Hospede` (`cpf_passaporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`UH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`UH` (
  `idUH` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valorDiaria` DECIMAL(6,2) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `qtdMaxHospedes` INT NOT NULL,
  PRIMARY KEY (`idUH`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Reserva_UH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Reserva_UH` (
  `Reserva_idReserva` INT NOT NULL,
  `UH_idUH` INT NOT NULL,
  PRIMARY KEY (`Reserva_idReserva`, `UH_idUH`),
  INDEX `fk_Reserva_has_UH_UH1_idx` (`UH_idUH` ASC) VISIBLE,
  INDEX `fk_Reserva_has_UH_Reserva1_idx` (`Reserva_idReserva` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_has_UH_Reserva1`
    FOREIGN KEY (`Reserva_idReserva`)
    REFERENCES `TropicanaTADS042`.`Reserva` (`idReserva`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Reserva_has_UH_UH1`
    FOREIGN KEY (`UH_idUH`)
    REFERENCES `TropicanaTADS042`.`UH` (`idUH`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Hospedagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Hospedagem` (
  `Reserva_idReserva` INT NOT NULL,
  `valorTotal` DECIMAL(7,2) UNSIGNED ZEROFILL NOT NULL,
  `checkIn` DATETIME NOT NULL,
  `checkOut` DATETIME NULL,
  PRIMARY KEY (`Reserva_idReserva`),
  CONSTRAINT `fk_Hospedagem_Reserva1`
    FOREIGN KEY (`Reserva_idReserva`)
    REFERENCES `TropicanaTADS042`.`Reserva` (`idReserva`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Hospedar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Hospedar` (
  `Hospedagem_Reserva_idReserva` INT NOT NULL,
  `Hospede_cpf_passaporte` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`Hospedagem_Reserva_idReserva`, `Hospede_cpf_passaporte`),
  INDEX `fk_Hospedagem_has_Hospede_Hospede1_idx` (`Hospede_cpf_passaporte` ASC) VISIBLE,
  INDEX `fk_Hospedagem_has_Hospede_Hospedagem1_idx` (`Hospedagem_Reserva_idReserva` ASC) VISIBLE,
  CONSTRAINT `fk_Hospedagem_has_Hospede_Hospedagem1`
    FOREIGN KEY (`Hospedagem_Reserva_idReserva`)
    REFERENCES `TropicanaTADS042`.`Hospedagem` (`Reserva_idReserva`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Hospedagem_has_Hospede_Hospede1`
    FOREIGN KEY (`Hospede_cpf_passaporte`)
    REFERENCES `TropicanaTADS042`.`Hospede` (`cpf_passaporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TropicanaTADS042`.`Incidente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TropicanaTADS042`.`Incidente` (
  `idIncidente` INT NOT NULL AUTO_INCREMENT,
  `valor` DECIMAL(7,2) ZEROFILL UNSIGNED NOT NULL,
  `momento` DATETIME NOT NULL,
  `descricao` VARCHAR(280) NOT NULL,
  `Hospedagem_Reserva_idReserva` INT NOT NULL,
  PRIMARY KEY (`idIncidente`),
  INDEX `fk_Incidente_Hospedagem1_idx` (`Hospedagem_Reserva_idReserva` ASC) VISIBLE,
  CONSTRAINT `fk_Incidente_Hospedagem1`
    FOREIGN KEY (`Hospedagem_Reserva_idReserva`)
    REFERENCES `TropicanaTADS042`.`Hospedagem` (`Reserva_idReserva`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;