

CREATE DATABASE tccBigLearn;
USE tccBigLearn;


CREATE TABLE escola(
	id INT NOT NULL auto_increment, 
    nome VARCHAR(100) NOT NULL,
    endereco TEXT, 
    telefone VARCHAR(15), 
    email VARCHAR(320),
    PRIMARY KEY(id)
);

CREATE TABLE turma(
	id INT NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL,
    ano_letivo YEAR NOT NULL, 
    id_escola INT, 
    PRIMARY KEY(id),
    CONSTRAINT fk_id_escola FOREIGN KEY(id_escola) REFERENCES escola(id)
);
CREATE TABLE pessoa(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100), 
	data_nascimento DATE,
	cpf VARCHAR(14),
	email VARCHAR(320),
	telefone VARCHAR(15), 
	tipo ENUM ('professor', 'aluno'),
    PRIMARY KEY(id)
);


CREATE TABLE professor (
    id INT PRIMARY KEY,
    especializacao VARCHAR(255),
    CONSTRAINT fk_professor_pessoa FOREIGN KEY (id) REFERENCES Pessoa (id) ON DELETE CASCADE
);


CREATE TABLE aluno (
    id INT PRIMARY KEY,
    matricula VARCHAR(50) UNIQUE,
    FOREIGN KEY (id) REFERENCES Pessoa (id) ON DELETE CASCADE
);

CREATE TABLE materia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    turma_id INT,
    professor_id INT,
    CONSTRAINT fk_turma_id FOREIGN KEY (turma_id) REFERENCES turma (id) ON DELETE CASCADE,
    CONSTRAINT fk_professor_id FOREIGN KEY (professor_id) REFERENCES professor (id) ON DELETE SET NULL
);


CREATE TABLE turma_aluno (
    turma_id INT,
    aluno_id INT,
    PRIMARY KEY (turma_id, aluno_id),
	FOREIGN KEY (turma_id) REFERENCES turma (id) ON DELETE CASCADE,
	FOREIGN KEY (aluno_id) REFERENCES aluno (id) ON DELETE CASCADE
);
