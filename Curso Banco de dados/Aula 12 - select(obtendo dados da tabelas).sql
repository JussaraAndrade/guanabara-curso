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