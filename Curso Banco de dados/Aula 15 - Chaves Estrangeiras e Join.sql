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