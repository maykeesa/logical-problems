-- Apagar Tabela
DROP TABLE curso

-- NOT NULL UNIQUE == PRIMARY KEY

CREATE TABLE curso(
    id SERIAL NOT NULL,
    curso VARCHAR(255),
    identificacao INTEGER PRIMARY KEY 
);

INSERT INTO curso(curso, identificacao) VALUES ('HTML', 123);
INSERT INTO curso(curso, identificacao) VALUES ('Java', 321);
INSERT INTO curso(curso, identificacao) VALUES ('Groovy', 313);

SELECT * FROM curso