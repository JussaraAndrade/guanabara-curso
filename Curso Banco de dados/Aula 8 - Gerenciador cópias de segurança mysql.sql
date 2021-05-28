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