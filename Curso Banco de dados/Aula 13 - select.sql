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