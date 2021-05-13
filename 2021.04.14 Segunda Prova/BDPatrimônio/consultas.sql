
/* GERA TABELAS */
--- TABELA COMPLETA
select * from bem_patrimonio;
---TABELA RENOMEADA
select cpf_responsavel as CPF, nome_responsavel as responsável from responsavel;
---TABELA ORDENADA
select bem_tombo as tombo, bem_descricao as descrição from bem_patrimonio order by bem_tombo desc;
---ITEM DA TABELA
select bem_tombo as tombo, bem_descricao as descrição from bem_patrimonio where bem_tombo = 1;
select bem_tombo as tombo, bem_descricao as descrição from bem_patrimonio where bem_tombo = 2 and bem_descricao like '%Mesa%';
