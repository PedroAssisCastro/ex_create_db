CREATE DATABASE escola_idiomas
CREATE TABLE disciplinas(
	id_disciplina SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL UNIQUE
)
CREATE TABLE professor(
	cpf CHAR(11) PRIMARY KEY,
	nome VARCHAR(80) NOT NULL UNIQUE
)
CREATE TABLE turmas(
	id_turma INTEGER PRIMARY KEY,
	sala VARCHAR(20) NOT NULL,
	cpf CHAR(11) NOT NULL,
	id_disciplina INTEGER NOT NULL,
		CONSTRAINT fk_turmas_professor
			FOREIGN KEY(cpf) REFERENCES professor(cpf),
		CONSTRAINT fk_turmas_disciplinas
			FOREIGN KEY(id_disciplina) REFERENCES disciplinas(id_disciplina),
)
CREATE TABLE alunos(
	matricula INTEGER PRIMARY KEY,
	nome VARCHAR(80) NOT NULL,
	id_turma INTEGER NOT NULL,
		CONSTRAINT fk_alunos_turma
			FOREIGN KEY(id_turma) REFERENCES turmas(id_turma),
)