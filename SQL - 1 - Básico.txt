-- Criação da tabela com o nome da coluna e seu tipo
CREATE TABLE aluno(
	id SERIAL,
	nome VARCHAR(255),
	data_nascimento DATE,
	cpf CHAR(11),
	idade INTEGER,
	altura REAL ,
	saldo NUMERIC(15,2),
	ativo BOOLEAN,
	hora_aula TIME,
	matricula_data TIMESTAMP,
	observacao TEXT
);

-- Como inserir valores na tabela
INSERT INTO aluno (
	nome,
	data_nascimento,
	cpf,
	idade,
	altura,
	ativo,
	matricula_data,
	saldo,
	hora_aula,
	observacao
)

-- Aluno 1
VALUES(
	'Mayke',
	'2003-03-16',
	'11122233344',
	19,
	1.78,
	TRUE,
	'2022-05-08 12:12:03',
	100.50,
	'15:20:02',
	'Olá meu nome é Mayke e estou estudando PostgreSQL!'
);

-- Aluno 2
VALUES(
	'Erick Andrade',
	'2003-05-16',
	'11122233344',
	17,
	1.70,
	TRUE,
	'2022-05-04 09:50:24',
	230.82,
	'15:20:02',
	'Olá meu nome é Erick e estou estudando PostgreSQL!'
);

-- Atualização do Cadastro Aluno id = 1
UPDATE aluno
	SET
	nome = 'Mayke Erick',
	ativo = FALSE
WHERE id = 1;

-- Atualização do Cadastro Aluno id = 2
UPDATE aluno
	SET
	altura = 1.71
WHERE id = 2;

-- Deletar um aluno
DELETE FROM aluno
	WHERE nome = 'Erick Andrade';

-- Buscar Aluno por célula de sua coluna
SELECT * FROM aluno
	WHERE id = 1;

-- Buscar por colunas específicas de uma tabela
SELECT
	nome as "Nome",
	idade as "Idade",
	ativo as "Status de Atividade"
FROM aluno;

-- Adicionando mais Alunos

INSERT INTO aluno (nome) VALUES ('Gabriel Soares');
INSERT INTO aluno (nome) VALUES ('Devinho Novaes');
INSERT INTO aluno (nome) VALUES ('Gustavo Front');
INSERT INTO aluno (nome) VALUES ('André Chefe');
INSERT INTO aluno (nome) VALUES ('Diego');
INSERT INTO aluno (nome) VALUES ('Diogo');

-- Filtros

SELECT * FROM aluno
    WHERE nome LIKE 'Di_go'
    
SELECT * FROM aluno
    WHERE nome NOT LIKE 'Di_go'
    
SELECT * FROM aluno
    WHERE nome LIKE 'D%'

SELECT * FROM aluno
    WHERE nome LIKE '%s'

SELECT * FROM aluno
    WHERE nome LIKE '% %'
    
SELECT * FROM aluno
    WHERE nome LIKE '%i%o'
    
SELECT * FROM aluno
    WHERE cpf is null

SELECT * FROM aluno
    WHERE cpf IS NOT null
    
SELECT * FROM aluno
    WHERE idade >= 19
    
SELECT * FROM aluno
    WHERE idade BETWEEN 18 AND 20

-- Chamar a Table aluno
SELECT * FROM aluno;