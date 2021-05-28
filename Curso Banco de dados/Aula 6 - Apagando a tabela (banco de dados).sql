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