-- Exercício 1
CREATE TABLE categoria(
    categoria_id int NOT NULL PRIMARY KEY, 
    descricao VARCHAR(255)
);

CREATE TABLE produto(
    produto_id SERIAL NOT NULL PRIMARY KEY, 
	categoria_id int NOT NULL,
    descricao VARCHAR(255), 
    preco MONEY, 
    frete MONEY, 
	FOREIGN KEY (categoria_id) REFERENCES categoria(categoria_id)
);

-- Exercício 1A
INSERT INTO categoria(descricao, categoria_id)
VALUES ('Sony', 1);
INSERT INTO categoria(descricao, categoria_id)
VALUES ('Microsoft', 2);
INSERT INTO categoria(descricao, categoria_id)
VALUES ('Nintendo', 3);

INSERT INTO produto(descricao, preco, frete, categoria_id)
VALUES ('Playstaion 5', 5000, 0, 1);
INSERT INTO produto(descricao, preco, frete, categoria_id)
VALUES ('Xbox Series X', 6000, 0, 2);
INSERT INTO produto(descricao, preco, frete, categoria_id)
VALUES ('Nintendo Switch', 2300, 50, 3);

-- Exercício 2
CREATE TABLE aluno(
    matricula int NOT NULL PRIMARY KEY, 
    nome VARCHAR(50) NOT NULL,
	data_nascimento DATE NOT NULL,
	email VARCHAR(30)
);

CREATE TABLE turma(
    turma_id int NOT NULL PRIMARY KEY,
	descricao VARCHAR(250),
	professor VARCHAR(50),
	data_inicio DATE,
	data_termino DATE
);

CREATE TABLE turma_aluno(
	matricula int NOT NULL,
	turma_id int NOT NULL,
    FOREIGN KEY (matricula) REFERENCES aluno(matricula),
	FOREIGN KEY (turma_id) REFERENCES turma(turma_id)
);

-- Exercício 2A

INSERT INTO turma(turma_id, descricao, professor, data_inicio)
VALUES (785, 'BootCamp de Dados Itaú', 'Carrasco', '2021-07-05');
INSERT INTO turma(turma_id, descricao, professor, data_inicio)
VALUES (2, 'Turma 2', 'Raimundo', '1999-07-05');
INSERT INTO turma(turma_id, descricao, professor)
VALUES (3, 'Turma do Bairro', 'Malvado')

INSERT INTO aluno(matricula, nome, data_nascimento, email)
VALUES (5678, 'Jão', '1994-08-18', 'jao@gmail.com');
INSERT INTO aluno(matricula, nome, data_nascimento, email)
VALUES (1234, 'Ana Banana', '1994-08-18', 'ana@gmail.com');
INSERT INTO aluno(matricula, nome, data_nascimento, email)
VALUES (987291182, 'Felipe Cruz', '1994-08-18', 'felipe.q.cruz@gmail.com');

INSERT INTO turma_aluno(matricula, turma_id)
VALUES (5678, 2);
INSERT INTO turma_aluno(matricula, turma_id)
VALUES (1234, 785);
INSERT INTO turma_aluno(matricula, turma_id)
VALUES (987291182, 785);
