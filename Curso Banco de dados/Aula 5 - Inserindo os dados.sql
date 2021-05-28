/*
Aula 05 - Inserindo os dados

use cadastro;

Alguns tipo de inserir registros no banco de dados:

Modelo 1:

INSERT into pessoas (nome, nascimento, sexo, peso, altura, nacionalidade) 
values ('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil')

Modelo 2: 

INSERT into pessoas (id, nome, nascimento, sexo, peso, altura, nacionalidade) 
values (DEFAULT, 'Creuza', '1920-12-30', 'F', '50.2', '1.65', 'Brasil');

Modelo 3:

INSERT into pessoas values 
(DEFAULT, 'Adalgiza', '1930-11-02', 'F', '63.2', '1.75', 'Irlanda');

Modelo 4:

INSERT into pessoas (id, nome, nascimento, sexo, peso, altura, nacionalidade) 
values 
(DEFAULT, 'Ana', '1975-12-22', 'F', '52.3', '1.45', 'EUA'),
(DEFAULT, 'Pedro', '2000-07-15', 'M', '52.3', '1.45', 'Brasil'),
(DEFAULT, 'Janaína', '1999-05-30', 'F', '75.9', '1.70', 'Portugal');

select * from pessoas;
*/