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