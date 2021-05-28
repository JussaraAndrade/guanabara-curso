/*
Aula 06 Alterar e Deletar:

- Acresentar na tabela
- Adiciona um campo na tabela que no caso é coluna*/
ALTER TABLE pessoas
ADD COLUMN profissao varchar(10);

/*Remover uma coluna da tabela*/
ALTER TABLE pessoas
DROP COLUMN profissao;

/*
Modelo 1:
- Adiciona a coluna em outra posição
- AFTER; siginifica adicionar a coluna depois do "nome"
*/
ALTER TABLE pessoas
ADD COLUMN profissao varchar(10) AFTER nome;

/*Modelo 2:
	- Adiciona a coluna em outra posição
    - FIRST; significa adicionar a coluna na primeira posição 
*/
ALTER TABLE pessoas
ADD COLUMN codigo int FIRST;

/*  - Aumentar o tamanho do campo e o tipo da coluna
	- Aumentar estrutura da definição
*/
ALTER TABLE pessoas
MODIFY COLUMN profissao varchar(20);

/*Renomeando coluna*/
ALTER TABLE pessoas
CHANGE COLUMN profissao prof varchar(20);

/*Renomear o nome da tabela inteira*/
ALTER TABLE pessoas
RENAME TO gafanhotos;

/*
	Criando uma nova tabela com uma condição:
    - Se não existir uma tabela com nome curso, cria uma nova tabela chamada curso.
    
     constraint: 
     - not null; não nulo (O campo não pode tá nulo)
     - unique; único (O campo não pode ter o mesmo nome ou o mesmo número). Ex: CPF, nome de cursos... 
     - unsigned; sem sinal. Ex: -5, - 10, etc...
*/
CREATE TABLE IF NOT EXISTS cursos (
	nome varchar(30) not null unique,
    descricao text,
    carga int unsigned,
    totalaulas int unsigned,
    ano year DEFAULT '2020'
) DEFAULT CHARSET = utf8;

/*Adicionando uma coluna id na tabela curso*/
ALTER TABLE cursos
ADD COLUMN idcurso int FIRST;

/*Adicionando chave primária*/
ALTER TABLE cursos
ADD PRIMARY KEY(idcurso);
