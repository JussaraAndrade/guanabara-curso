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

