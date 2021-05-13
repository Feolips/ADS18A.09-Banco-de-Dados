/************************************************************************
Consultas	
************************************************************************/
-- Quais os corretores que trabalham para a empresa?
select * from corretor order by cor_nome;

select cor_nome as Corretor,cor_telefone as Contato from corretor order by cor_nome;

-- Quais os loteamentos com lotes à venda?
select loteamento.ltm_nome,quadra.qua_numero,lote.lot_numero 
    from lote, loteamento, quadra
	where lote.lot_situacao = 'À venda' and
		  (lote.ltm_codigo = quadra.ltm_codigo and lote.qua_numero = quadra.qua_numero)
		  and quadra.ltm_codigo = loteamento.ltm_codigo
	order by loteamento.ltm_nome,quadra.qua_numero,lote.lot_numero;

-- RENOMEANDO TABELAS
select lt.ltm_nome,q.qua_numero,l.lot_numero 
    from lote as l, loteamento as lt, quadra as q
	where l.lot_situacao = 'À venda' and
		  (l.ltm_codigo = q.ltm_codigo and l.qua_numero = q.qua_numero)
		  and q.ltm_codigo = lt.ltm_codigo
	order by lt.ltm_nome,q.qua_numero,l.lot_numero;


-- Quais as benfeitorias oferecidas pela empresa?
select ben_descricao as benfeitoria from benfeitoria;

-- Quais as benfeitorias existentes nos loteamentos da empresa?
select loteamento.ltm_nome,benfeitoria.ben_descricao
	from benfeitorias,loteamento, benfeitoria
	where benfeitorias.ben_codigo = benfeitoria.ben_codigo
		and benfeitorias.ltm_codigo = loteamento.ltm_codigo
	order by loteamento.ltm_nome;

-- Quais os lotes vendidos em cada um dos loteamentos?
select * from loteamento;

update lote set lot_situacao='Vendido'
	where ltm_codigo=2 and qua_numero=1 and lot_numero=12;
	
update lote set lot_situacao='Vendido'
	where ltm_codigo=2 and qua_numero=1 and lot_numero=7
		or  ltm_codigo=4 and qua_numero=4 and lot_numero=5	
		or  ltm_codigo=3 and qua_numero=1 and lot_numero=9;

select lt.ltm_nome,q.qua_numero,l.lot_numero, l.lot_situacao 
    from lote as l, loteamento as lt, quadra as q
	where l.lot_situacao = 'Vendido' and
		  (l.ltm_codigo = q.ltm_codigo and l.qua_numero = q.qua_numero)
		  and q.ltm_codigo = lt.ltm_codigo
	order by lt.ltm_nome,q.qua_numero,l.lot_numero;

-- Quais os cliente que compraram lotes da empresa?
update lote set cli_cpf='12345678901',
			cor_creci=12345   
	where ltm_codigo=2 and qua_numero=1 and lot_numero=7;
			
update lote set cli_cpf='32456720948',
			cor_creci=12345
		where ltm_codigo=4 and qua_numero=4 and lot_numero=5;

update lote set cli_cpf='84552012356',
			cor_creci=25412
		where ltm_codigo=3 and qua_numero=1 and lot_numero=9;
		
update lote set cli_cpf='84552012356',
			cor_creci=12345
		where ltm_codigo=2 and qua_numero=1 and lot_numero=12;

select lt.ltm_nome,q.qua_numero,l.lot_numero, l.lot_situacao, c.cor_nome, cl.cli_nome 
    from lote as l, loteamento as lt, quadra as q, corretor as c, cliente as cl
	where l.lot_situacao = 'Vendido' 
	      and (l.ltm_codigo = q.ltm_codigo and l.qua_numero = q.qua_numero)
		  and q.ltm_codigo = lt.ltm_codigo
		  and l.cor_creci = c.cor_creci
		  and l.cli_cpf = cl.cli_cpf
	order by lt.ltm_nome,q.qua_numero,l.lot_numero;
	
-- EXCLUINDO NO LOTEAMENTO 1 A QUADRA 3
delete from lote where ltm_codigo = 1
					and qua_numero = 3;
					
select * from lote 
	where ltm_codigo = 1
		and qua_numero = 3;

select * from lote;

-- ADICIONANDO UM CAMPO EM LOTE

alter table lote add column sit_codigo integer default 0;


alter table quadra alter column qua_localizacao type varchar(6);
	
select * from quadra;