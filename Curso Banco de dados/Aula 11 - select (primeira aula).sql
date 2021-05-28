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