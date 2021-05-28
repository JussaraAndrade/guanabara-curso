/*create database cadastro
default character set utf8
default collate utf8_general_ci;*/

/*
	drop cadastro - Deleta o banco de dados
    describe pessoas; - Descreve o tipo da tabela de cada campo
*/

/*
use cadastro;

create table pessoas(
	id int not null auto_increment,
    nome varchar(30) not null,
    nascimento date, 
    sexo enum('M', 'F'),
    peso decimal(5,2),
    altura decimal(3,2),
    nacionalidade varchar(20) DEFAULT 'Brasil',
    PRIMARY KEY (id)
) DEFAULT CHARSET = utf8;

*/

/*
  DDL - Linguagem de definição de linguagem
	CREATE DATABASE
	CREATE TABLE
	ALTER TABLE
	DROP TABLE - Apaga os dados e a tabela
	
  DML - Linguagem de manipulação de dados
	INSERT INTO
	UPDATE 
	DELETE
	TRUNCATE - Apaga os dados e não a tabela
	SELECT
	
  DQL - Linguagem para pergunta/questionamento
	SELECT
	
*/

==============================================================================

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

=========================================================================
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

=============================================================================
/*
Aula 06: 
Apagando a tabela/banco de dados
*/

use test;
select * from test;
create table if not exists test(
	id int,
    nome varchar(10),
    idade int
);

insert into test value
('1', 'Pedro', '22'),
('2', 'Maria', '12'),
('3', 'Maricota', '77');

/*
	Comandos deletar:
	 - drop table; deleta a tabela
     - drop database; deleta o banco de dados
*/
drop table if exists test;

==========================================================================
/*
  Aula 07 - Manipulando Linhas (UPDATE, DELETE e TRUNCATE):
	- Manipular Registros
	Obs: outros nomes (Manipulando linhas ou manipulando truplas)
  
	- Linhas/Truplas; Registro (tudo que estiver em linha é registro)
	- Coluna/Campos/Atributos; Campo (tudo que estiver na coluna são os campos)
*/

INSERT into cursos values 
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Programação', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
('4', 'PHP', 'Curso de PHP para iniciantes', '40', '20', '2015'),
('5', 'Java', 'Introdução à Linguagem Java', '10', '29', '2015'),
('6', 'MySQL', 'Bancos de Dados MySQL', '30', '15', '2016'),
('7', 'Word', 'Curso completo de Word', '40', '30', '2016');

/*Alterar os registro na coluna nome
	-UPDATE; atualize
    -SET; configure
    -WHERE; onde é igual a 1
    '' - aspas simples
    -LIMIT; altera apenas um registro
*/
/*Modelo 1 (altera apenas um registro): */
UPDATE cursos 
SET nome = 'HTML5'
WHERE idcurso = 1;

/*Modelo 2 (altera dois registro):*/
UPDATE cursos 
SET nome = 'PHP', ano = '2015'
WHERE idcurso = 4;

/*Modelo 3 (altera três dados ao mesmo tempo):*/
UPDATE cursos 
SET nome = 'Java', carga = '40', ano = '2015'
WHERE idcurso = 5
LIMIT 1;

/*
Modelo 4 (altera os dados que tem aquele valor igual)
 - Esse modelo é muito perigoso, pois pode alterar dados que não pode alterar

Permitir alterar - tirar a opção selecionada:
Edit > Preferences > SQL Editor > opção (Safe Updates - "rejects UPDATEs and DELETEs with no restrictions")

Em outros casos poderá usar em outras situações, o recomendavel é que ele esteja selecionado.
*/
UPDATE cursos 
SET ano = '2018', carga = '0'
WHERE ano = '2050'
limit 1;

UPDATE cursos 
SET ano = '2018', carga = '0'
WHERE ano = '2050'
limit 1;

/*DELETE - remover os registro sem necessidade
	- DELETE; deleta
    - FROM; da tabela cursos (origem)
    - WHERE; onde
*/
/* Modelo 1 - Afeta apenas uma linha*/
DELETE FROM cursos
where idcurso = '8';

/*Modelo 2 - Afeta as linhas que contém aquele registro
	- limit 3; informando quantidade da linha que será afetada
*/
DELETE FROM cursos
where ano = '2050'
limit 2;

/*Removendo todos os registro da tabela
	- Cuidado com esse comando ele remove todos os registros da tabela
*/
TRUNCATE cursos;

========================================================================================
/*
Aula 08 - Gerenciado Cópias de Segurança Mysql

 Gerar cópia de segurança - backup
 Server > Data Export > selecione o banco de dados em "Tables to Export"

 - O que estiver de objeto dentro do schemas deixa selecionado, caso não queira selecionar todos apenas que é importante você seleciona.
 
 Opções:
 
 - Dump Struture and Data: Estrutura e dados (Banco de dados inteiro)
 - Dump Data Only: Dados únicos
 - Dump Struture Only: Estrutura única  
 
 *Export to Self-Contained File - Irá gerar um arquivo dentro da pasta dumps (Opção selecionada)
 
 Marque a opção - Include Create Schema (essa opção permite criar o banco de dados sem a necessidade de digitar o comando de criar)
 
 Exportando o banco de dados de volta:
 
 Server > Data Import > caso estiver selecionado a opção "Import from Self-Contained File" deixa nessa opção.
 - Depois clica em três pontinhos e escolha o arquivo.
 - Por último clica em "Start Import"
*/
===========================================================================================
/*
Aula 11 - SELECT
*/

/*Selecione todos os campos da tabela "Cursos"*/
select * from cursos
ORDER BY nome;

select * from cursos
/*Ordenação Crescente pelo "nome"*/
ORDER BY nome ASC;

/*Ordenação de baixo para cima.*/
select * from cursos
/*Ordenação Decrescente pelo "nome"*/
ORDER BY nome DESC;

/*Selecionar somente as colunas nome, cargo e ano tabela "Cursos"*/
select nome, carga, ano FROM cursos order by nome;
select ano, nome, carga FROM cursos order by ano, nome;

/*Selecionar linhas
Modelo 1:
*/
select nome, carga from cursos 
where ano = '2016'
order by nome;

/*Modelo 2:*/
select * from cursos 
where ano = '2016'
order by nome;

/*Modelo 3:*/
select nome, descricao, carga from cursos 
where ano = '2016'
order by ano, nome;

/*Modelo 4:*/
/*
  Query - é uma solicitação: 
- Operadores relacionais: 
 1 - == (Igual)
 2 - !=, <> (Diferente)
 3 - < (Menor)
 4 - > (Maior)
 5 - <= (Menor ou igual)
 6 - >= (Maior ou igual)
*/
select nome, descricao, ano from cursos 
where ano != 2016
order by ano;

/*Selecionando Intervalos
- between; entre alguma coisa e outra
*/
select nome, ano from cursos 
where ano between 2014 AND 2016
order by ano desc, nome;

/*Selecionando Valores

- IN; valores especificos 
- BETWEEN; faixa de valores
*/
select nome, descricao, ano from cursos
where ano in (2014, 2016, 2020)
order by ano;

/*Combinando Testes*/
select nome, carga, totaulas from cursos
where carga > 35 and totaulas < 30;

select nome, carga, totaulas from cursos
where carga > 35 or totaulas < 30;

=======================================================================================
/*
Aula 12 - SELECT (Obtendo Dados das Tabelas)
*/

/*Seleção por nome*/
select * from cursos
where nome = 'PHP';

/*Usando o Operador LIKE
 Busca os dados com a primeira letra P
 - LIKE; significa parecido
 - %; é um caracter coringa que substitui nenhum ou vários caracteres.
*/
select * from cursos
where nome like 'P%';

select * from cursos
where nome like 'p%';

select * from cursos
where nome like 'a%';

/*Wildcards - Modelo 1:
 - %A; o resultado da busca é a letra final da palavra do campo "nome".
 Ex:
 - javA
 - segurançA 
 - joomlA
*/
select * from cursos
where nome like '%A';

/*Wildcards - Modelo 2:
- %A%; significa que vai ter qualquer coisa na frente, qualquer coisa atrás.
Ex:
- javA
- Algoritmos
*/
select * from cursos
where nome like '%A%';

/*Wildcards - Modelo 3:
- not like %A%; busca os dados que não contém a letra "A"
*/
select * from cursos
where nome not like '%A%';

select * from cursos
where nome like 'ph%p%';

select * from cursos
where nome like 'ph%p_';

select * from cursos
where nome like 'p_p%';

select * from cursos
where nome like 'p__t%';

/*Busca os sobrenome que começa com silva, caso tenha algum nome que complementa um nome ele irá busca:
Ex:
Allan Silva
Silvana Albuquerque
*/
select * from gafanhotos
where nome like '%silva%';

/*Busca apenas o sobrenome "Silva"*/
select * from gafanhotos
where nome like '%_silva%';

/*Busca silva*/
select * from gafanhotos
where nome like '%silva';

/*Busca Silvana*/
select * from gafanhotos
where nome like 'silva%';

/*Distinguindo*/

/*Busca a carga sem repetição*/
select distinct carga from cursos;

/*Busca nacionalidade não repetidas em ordem alfabetica*/
select distinct nacionalidade from gafanhotos
order by nacionalidade;

select distinct carga from cursos
order by carga;

/*Funções de Agregação*/
/*Mostra quantos cursos cadastrados*/
select count(*) from cursos;

/*Conta quantas vezes o 60 parece na busca*/
select count(*) from cursos where carga > 40;

/*
 - Mostra qual é a maior carga do curso*/
select max(carga) from cursos;

/*O máximo total de aula que teve naquele período*/
select max(totaulas) from cursos where ano = '2016';

/*O minimo total de aula que teve naquele período*/
select min(totaulas) from cursos where ano = '2016';

/*Busca o total minimo junto com o nome do curso*/
select nome, min(totaulas) from cursos where ano = '2016';

/*Soma o total de aula de todos os cursos*/
select sum(totaulas) from cursos;

/*Soma o total de aula do ano 2016*/
select sum(totaulas) from cursos where ano = '2016';

/*Tira a média:
- AVG; vai somar todos os cursos e vai dividir pela quantidade de curso cadastrado
*/
select avg(totaulas) from cursos;
select avg(totaulas) from cursos where ano = '2016';

/*
Lista com os Exercícios:

1) Uma lista com o nome de todos os gafanhotos Mulheres.
2) Uma lista com os dados de todos aqueles que nasceram entre 1/Jan/2000 e 31/Dez/2015.
3) Uma lista com o nome de todos os homens que trabalham como programadores.
4) Uma lista com os dados de todas as mulheres que nasceram no Brasil e que têm seu nome iniciando com a letra J.
5) Uma lista com o nome e nacionalidade de todos os homens que têm Silva no nome, não nasceram no Brasil e pesam menos de 100 Kg.
6) Qual é a maior altura entre gafanhotos Homens que moram no Brasil?
7) Qual é a média de peso dos gafanhotos cadastrados?
8) Qual é o menor peso entre os gafanhotos Mulheres que nasceram fora do Brasil e entre 01/Jan/1990 e 31/Dez/2000?
9) Quantas gafanhotos Mulheres tem mais de 1.90cm de altura?

*/

/*1 - Exercicio*/
select nome from gafanhotos where sexo = 'F';

/*2 - Exercicio (incompleto)*/
select * from gafanhotos where nascimento between '2000-01-01' and '2015-12-31';

/*3 - Exercicio*/
select nome from gafanhotos where sexo = 'M' and profissao = 'Programador';

/*4 - Exercicio*/
select nome from gafanhotos where sexo = 'F' and nacionalidade = 'Brasil' and nome like 'J%' order by nome;

/*5 - Exercicio*/
select nome, nacionalidade from gafanhotos where  sexo = 'M' and nome like '%SILVA%' and nacionalidade <> 'Brasil' and peso < '100.00';

/*6 - Exercicio*/
select max(altura) from gafanhotos where sexo = 'M' and nacionalidade = 'Brasil';

/*7 - Exercicio*/
select avg(peso) from gafanhotos;

/*8 - Exercicio (incompleto)*/
select min(peso) from gafanhotos where sexo = 'F' and nacionalidade <> 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

/*9 - Exercicio*/
select count(nome) from gafanhotos where sexo = 'F' and altura > 1.90;

==============================================================================================
/*Aula 13 - SELECT */

/*Agrupando registros
- GROUP BY; agrupado por "carga"
*/
select carga from cursos
group by carga;

/*Agrupando & Agregando*/
select carga, count(nome) from cursos
group by carga;

/*Contar quantos registro tem dentro de cada agrupamento*/
select totaulas, count(*) from cursos
group by totaulas
order by totaulas;

select * from cursos where totaulas = 30;
select * from cursos where totaulas = 12;
select * from cursos where totaulas > 20;

/*Modelo 1: */
select carga, count(*) from cursos where totaulas = 30 
group by carga;

select carga, count(nome) from cursos where totaulas = 30 
group by carga;

/*Modelo 2: */
select ano, count(*) from cursos 
group by ano
order by count(*) desc;

select ano, count(*) from cursos 
group by ano
having count(ano) >= 5
order by count(*) desc;

select ano, count(*) from cursos
where totaulas > 30 
group by ano
having ano > 2013
order by count(*) desc;

select carga, count(*) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);

/*
Script prontos
*/
/*Busca os dados em ordem de criação*/
use desafio_zup;
SELECT distinct tb_pessoa.email, tb_loteria.numero, tb_loteria.data_aposta FROM tb_pessoa
INNER JOIN tb_loteria
ON tb_pessoa.id = tb_loteria.id
order by data_aposta asc;

/*
Lista com os Exercícios:

1) uma lista com as profissoes dos gafanhatos e seus respectivos quantitativos.
2) Quantos gafanhotos homens e mulheres nasceram após 01/jan/2005 ?
3)Lista com gafanhotos que nasceram fora do BRASIL, mostrando o país de origem
e o total de pessoas nascidas lá. Só nos interessam os países que tiveram mais de 3
gafanhotos com essa nacionalidade.
4)uma lista agrupada pela altura dos gafanhotos ,mostrando quantas pessoas 
pesam mais de 100kg e que estao acima da media da altura de todos os gafanhotoso.
*/

/*1 - Exercicio*/
select profissao, count(*) FROM gafanhotos
GROUP BY profissao
ORDER BY count(*);

/*2 - Exercicio*/
select sexo, count(*) from gafanhotos
where nascimento > '2005-01-01'
group by sexo;

/*3 - Exercicio*/
select nacionalidade, count(*)from gafanhotos 
where nacionalidade <> 'brasil'
group by nacionalidade
having count(nacionalidade ) >'3';

/*4 - Exercicio*/
select altura, count(*) from gafanhotos
where peso > '100'
group by altura
having altura > (select avg(altura)from gafanhotos);

====================================================================================
/*
Aula 15 – Chaves Estrangeiras e JOIN
	-Explicação da aula N(alunos) pra muitos - 1(cursos) um
*/

/*
InnoDB e XtraDB; suportam ACID (as 4 principais regras de uma boa transação)
ACID:
	A - Atomicidade (Ou tudo acontece ou nada - não pode ser divida em sub tarefa)
    C - Consistência 
    I - Isolamento
    D - Durabilidade (Durar o tempo que for necessário)
*/

use cadastro;
describe gafanhotos;

alter table gafanhotos
add column cursopreferido int;

alter table gafanhotos
add foreign key (cursopreferido)
references cursos(idcurso);

select * from gafanhotos;
select * from cursos;

update gafanhotos set cursopreferido = '6' where id = '1';
delete from cursos where idcurso = '28';

select nome, cursopreferido from gafanhotos;

/*
join - uma junção (inner join )
Relação nas duas tabelas

*/

/*Modelo 1: (join)*/
select gafanhotos.nome, cursos.nome, cursos.ano
from gafanhotos join cursos
on cursos.idcurso = gafanhotos.cursopreferido;

/*Modelo 2: (inner join)
Apelidar colunas usando: as
 */
select g.nome, c.nome, c.ano
from gafanhotos as g inner join cursos as c
on c.idcurso = g.cursopreferido
order by g.nome;

/*Prefência a tabela a esquerda (Cursos)
Dois jeitos:
left outer join
left join
*/
select g.nome, c.nome, c.ano
from gafanhotos as g left outer join cursos as c
on c.idcurso = g.cursopreferido;

select g.nome, c.nome, c.ano
from gafanhotos as g left join cursos as c
on c.idcurso = g.cursopreferido;

/*Prefência a tabela a direta (Alunos gafanhotos)
Dois jeitos:

right outer join
right join
*/
select g.nome, c.nome, c.ano
from gafanhotos as g right outer join cursos as c
on c.idcurso = g.cursopreferido;

select g.nome, c.nome, c.ano
from gafanhotos as g right join cursos as c
on c.idcurso = g.cursopreferido;

==========================================================================
/*
Aula 16 – INNER JOIN com várias tabelas

- Relacionando as tabelas
- voltar o assunto de relacionamento entre tabelas
- a chave estrangeira vai para o lado N que são muitos
- relacionamentos muitos para muitos (cardinalidade)
*/
use cadastro;

create table gafanhoto_assiste_curso(
	id int not null auto_increment,
    data date,
    idgafanhoto int,
    idcurso int,
    primary key (id),
    foreign key (idgafanhoto) references gafanhotos(id),
    foreign key (idcurso) references cursos(idcurso)
) DEFAULT CHARSET = utf8;

/*Inserindo os registros*/
insert into gafanhoto_assiste_curso values
(default, '2014-03-01', '1', '2');

select * from gafanhoto_assiste_curso;

/*Junções*/
select * from gafanhotos g
join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto;

select g.id, g.nome, a.idgafanhoto, idcurso from gafanhotos g
join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto;

select g.nome, idcurso from gafanhotos g
join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto
/*ordem alfabetica pelo nome*/
order by g.nome;

/*Modelo 1: usando mais um join na terceira tabela*/
select g.nome, c.nome from gafanhotos g
/*tabela gafanhoto_assiste_curso*/
join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto
/*tabela cursos*/
join cursos c 
on c.idcurso = a.idcurso
order by g.nome;




