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