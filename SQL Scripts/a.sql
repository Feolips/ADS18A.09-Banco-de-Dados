/********************
  TABELA BENFEITORIA
*********************/

create table benfeitoria(
	benfeitoria_codigo not null,
	benfeitoria_descricao varchar(50) not null,
	constraint pk_benfeitoria primary key (benfeitoria_codigo)
)

insert into benfeitoria (benfeitoria_codigo, benfeitoria_descricao) values
	(1,'Calçamento intertravado')
	
-- Quais loteamentos com lotes à venda?
select lote.lot_numero, loteamento.ltm_nome, quadra.qua_numero
	from lote, loteamento, quadra
	where lote.lot.situacao = 'À venda' and
		  lote.qua_numero = quadra.qua_numero and
		  (quadra.ltm_codigo = loteamento.ltm_codigo and 
		order by loteamento.ltm_nome, quadra.qua_numero, lote.lot_numero;
	 

select * from benfeitoria,

select benfeitoria_codigo from benfeitoria,