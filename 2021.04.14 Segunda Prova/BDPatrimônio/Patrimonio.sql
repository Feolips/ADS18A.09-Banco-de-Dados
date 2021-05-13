---drop table bem_patrimonio,responsavel,termo, setor
/* TABELA DO BEM TOMBADO */
create table bem_patrimonio(
	bem_tombo integer not null,
	bem_descricao varchar(50) not null,
	bem_valor_inicial real not null,
	bem_data_entrada not null,
	constraint pk_bem_patrimonio primary key (bem_tombo)
);

/* TABELA DO USUÁRIO RESPONSÁVEL */
create table responsavel(
	cpf_responsavel varchar(11) not null,
	nome_responsavel varchar(50) not null,
	fk_sigla_setor varchar(10) not null,
	constraint pk_responsavel primary key (cpf_responsavel)
);

/* TABELA SETORES */
create table setor(
	sigla_setor varchar(10) not null,
	nome_setor varchar(20) not null,
	constraint 
	constraint pk_setor primary key (sigla_setor)
);

/* TABELA DO TERMO DE RESPONSABILIDADE */
create table termo(
	numero_termo varchar(4) not null,
	
	setor_destino varchar(20) not null,
	data_termo date not null,
	fk_sigla_termo varchar
	constraint pk_termo primary key (numero_termo)
);



       1  2 14 15 16

/* TABELA MOVIMENTAÇÕES */
create table movimentacao(
	cod_movimentacao int not null
	sigla_setor varchar(10) not null, --
	nome_setor varchar(20) not null,  --Se refere ao setor de destino
	constraint fk_sigla_setor	  --Se refere ao setor de destino
	constraint pk_setor primary key (sigla_setor)
);

---drop table setor


