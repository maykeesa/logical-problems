DROP TABLE funcionarios

CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
    
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');

-- Ordenações e Manipulações de dados

/* DESC = Decrescente
   ASC = Crescente
   Da pra escolher por coluna também! 
   
   LIMIT = Quantidade da amostra 
   OFFSET = Quantidade de amostra para pular 
   
   COUNT = Retorna a quantidade de registros
   SUM = Retorna a soma dos reistros
   MAX = Retorna o maior valor dos regitros
   MIN = Retorna o menor valor dos registoros
   AVG = Retorna a média dos registros
   
   DISTINCT = Agrupa algo, nome, id, Quando não se tem uma função de agregação
   GROUP BY = Agrupa igual o DISTINCT, mas quando tem uma função de agregação
   */

-- Ordenação por nome em ordem "decrescente"
SELECT * FROM funcionarios
    ORDER BY nome DESC
    
-- Ordenação por nome e matrícula    
SELECT * FROM funcionarios
    ORDER BY 3, 2
    
-- Ordenação por matrícula, porém limita a amostra e podemos pular com o OFFSET
SELECT * FROM funcionarios
    ORDER BY matricula
    LIMIT 5
    OFFSET 0

-- Funções de agregação
SELECT 
    COUNT(id),
    SUM(id),
    MAX(id),
    MIN(id),
    ROUND (AVG(id), 2)
FROM funcionarios

-- Traz os nomes distintos, caso há ja dados iguais em nome 
SELECT DISTINCT
    nome
FROM funcionarios
ORDER BY nome

SELECT
    nome,
    sobrenome,
    MIN(id)
FROM funcionarios
GROUP BY nome, sobrenome
ORDER BY nome

-- Traz a quantidade de alunos cadastrados por curso
SELECT curso.curso, COUNT(aluno.id) FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON aluno_curso.curso_id = curso.id
GROUP BY curso
ORDER BY curso


SELECT curso.curso, COUNT(aluno.id) FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno_curso.aluno_id = aluno.id
GROUP BY curso
    HAVING COUNT(aluno.id) > 0
ORDER BY curso
    
SELECT nome, COUNT(id) FROM funcionarios
    GROUP BY nome
    HAVING COUNT(id) > 1
