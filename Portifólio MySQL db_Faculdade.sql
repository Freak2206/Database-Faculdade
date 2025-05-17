CREATE DATABASE db_faculdade;
USE db_faculdade;

-- Tabela de alunos
CREATE TABLE tbl_alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nascimento DATE NOT NULL,
    email VARCHAR(300) NOT NULL,
    RA VARCHAR(20) UNIQUE NOT NULL,
    telefone VARCHAR(13),
    sexo enum('M', 'F', 'N/A'),
    nacionalidade VARCHAR(50) DEFAULT('brasileiro')
);


-- Tabela de endereço dos alunos
CREATE TABLE tbl_endereco_al (
    id INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(80),
    cep VARCHAR(13),
    complemento INT,
    bairro VARCHAR(50),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    pais VARCHAR(45),
    aluno_id INT,
FOREIGN KEY (aluno_id) REFERENCES tbl_alunos(id)
);


-- Tabela de professores
CREATE TABLE tbl_professores(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(300) NOT NULL,
	nascimento DATE NOT NULL,
    sexo enum('M', 'F', 'N/A'),
    nacionalidade VARCHAR(50) DEFAULT('brasileiro')
);

-- Tabela de endereço dos professores
CREATE TABLE tbl_endereco_prof (
    id INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(80),
    cep VARCHAR(13),
    complemento INT,
    bairro VARCHAR(50),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    pais VARCHAR(45),
   professor_id INT,
   FOREIGN KEY (professor_id) REFERENCES tbl_professores(id)
   );

-- Tabela de cursos
CREATE TABLE tbl_cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    carga_horaria VARCHAR(45) NOT NULL
);

-- Tabela de disciplinas
CREATE TABLE tbl_disciplinas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    alunos_id INT,
    professores_id INT,
    cursos_id INT,
    FOREIGN KEY (alunos_id) REFERENCES tbl_alunos(id),
    FOREIGN KEY (professores_id) REFERENCES tbl_professores(id),
    FOREIGN KEY (cursos_id) REFERENCES tbl_cursos(id)
);

-- Tabela de notas
CREATE TABLE tbl_notas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nota DECIMAL(2,1) NOT NULL,
    disciplinas_id INT,
    alunos_id INT,
    FOREIGN KEY (disciplinas_id) REFERENCES tbl_disciplinas(id),
    FOREIGN KEY (alunos_id) REFERENCES tbl_alunos(id)
);
