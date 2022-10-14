-- Table aluno
SELECT * FROM aluno

-- Table curso
SELECT * FROM curso

-- Table alunoCurso
SELECT * FROM aluno_curso

CREATE TABLE aluno(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE curso(
    id SERIAL PRIMARY KEY,
    curso VARCHAR(255) NOT NULL 
);


/* Chave Estrangeira, ela limitou nossa aluno_curso, que é uma tabela
derivada de aluno e curso, a não cadastrar um id de um aluno que não
existe, o mesmo vale pra curso. */

-- ON DELETE/UPDATE RESTRICT = Não permite apagar um aluno, ou um curso, se 
-- estão associados a algo

-- ON DELETE/UPDATE CASCADE = Permite apagar, e identifica se o dado está 
-- associado à algo e apaga

-- obs:
-- Sempre são relacionados à um atributo, e não à uma tabela

DROP TABLE aluno_curso

CREATE TABLE aluno_curso(
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),
    
    FOREIGN KEY(aluno_id)
    REFERENCES aluno(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    FOREIGN KEY(curso_id)
    REFERENCES curso(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
); 

-- Insert em ALUNO
INSERT INTO aluno (nome) VALUES ('Diogo');
INSERT INTO aluno (nome) VALUES ('Vinícius');
INSERT INTO aluno (nome) VALUES ('Mayke');

-- Insert em CURSO
INSERT INTO curso (curso) VALUES ('Java');
INSERT INTO curso (curso) VALUES ('Groovy');
INSERT INTO curso (curso) VALUES ('HTML');
INSERT INTO curso (curso) VALUES ('JavaScript');

-- Insert em ALUNO_CURSO
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 4);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3, 1);

-- Relacionamento de Tabelas
SELECT aluno_curso.aluno_id, aluno.nome, aluno_curso.curso_id ,curso.curso FROM aluno 
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso       ON             curso.id = aluno_curso.curso_id
    
/* Relacionamento de Tabelas
Prioridade nos dados da esquerda, ou seja, a prioridade é nos dados de "aluno"
do que nos dados de "curso" */
SELECT aluno_curso.aluno_id, aluno.nome, aluno_curso.curso_id ,curso.curso FROM aluno 
    LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    LEFT JOIN curso       ON             curso.id = aluno_curso.curso_id
    
/* Relacionamento de Tabelas
Prioridade nos dados da direita, ou seja, a prioridade é nos dados de "curso"
do que nos dados de "aluno" */ 
SELECT aluno_curso.aluno_id, aluno.nome, aluno_curso.curso_id ,curso.curso FROM aluno 
    RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    RIGHT JOIN curso       ON             curso.id = aluno_curso.curso_id
    
/* Relacionamento de Tabelas
Prioridade nos dados, independente da tabela */ 
SELECT aluno_curso.aluno_id, aluno.nome, curso.id ,curso.curso FROM aluno 
    FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    FULL JOIN curso       ON             curso.id = aluno_curso.curso_id   

/* Relacionamento de Tabelas
Mistura todos os alunos à todos os cursos */ 
SELECT aluno.id, aluno.nome, curso.id, curso.curso FROM aluno
    CROSS JOIN curso

-- Teste de UPDATE E DELETE
DELETE FROM aluno WHERE id = 1

UPDATE aluno
    SET id = 10
    WHERE id = 2


