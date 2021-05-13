-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: "Questão 03 - Felipe Souza Vieira" | type: DATABASE --
-- -- DROP DATABASE IF EXISTS "Questão 03 - Felipe Souza Vieira";
-- CREATE DATABASE "Questão 03 - Felipe Souza Vieira";
-- -- ddl-end --
-- 

-- object: public.imobiliaria | type: TABLE --
-- DROP TABLE IF EXISTS public.imobiliaria CASCADE;
CREATE TABLE public.imobiliaria(
	imo_cnpj varchar(15) NOT NULL,
	CONSTRAINT imobiliaria_pk PRIMARY KEY (imo_cnpj)

);
-- ddl-end --
ALTER TABLE public.imobiliaria OWNER TO postgres;
-- ddl-end --

-- object: public.lote | type: TABLE --
-- DROP TABLE IF EXISTS public.lote CASCADE;
CREATE TABLE public.lote(
	unid_registro integer NOT NULL,
	unid_quadra_neste_loteamento varchar(15),
	unid_area_parcela_disponivel integer,
	unid_area_parcela_non_aedificandi integer,
	unid_azimute_fachada float,
	unit_benfeitorias_disponiveis varchar(30) DEFAULT agua, esgoto, energia, cabo (tv/telefone/internet), pavimentado,
	unid_reservada bool DEFAULT false,
	unid_vendida bool DEFAULT false,
	lot_registro_loteamento integer NOT NULL,
	con_codigo_contrato varchar(10) NOT NULL,
	CONSTRAINT lote_pk PRIMARY KEY (unid_registro)

);
-- ddl-end --
ALTER TABLE public.lote OWNER TO postgres;
-- ddl-end --

-- object: public.loteamento | type: TABLE --
-- DROP TABLE IF EXISTS public.loteamento CASCADE;
CREATE TABLE public.loteamento(
	lot_registro integer NOT NULL,
	lot_nome varchar(30),
	lot_endereco varchar(60),
	lot_cep_regiao varchar(10) DEFAULT 00.000-000,
	"lot_serviços_interesse_arredores" varchar(50),
	CONSTRAINT loteamento_pk PRIMARY KEY (lot_registro)

);
-- ddl-end --
ALTER TABLE public.loteamento OWNER TO postgres;
-- ddl-end --

-- object: public.cliente | type: TABLE --
-- DROP TABLE IF EXISTS public.cliente CASCADE;
CREATE TABLE public.cliente(
	cli_codigo_contrato varchar(10) NOT NULL,
	"cli_numero_CPF" varchar(16) DEFAULT 000.000.000-00,
	cli_nome_completo varchar(50),
	cli_telefone_celular varchar(17) DEFAULT (00) 9 0000-0000,
	cli_endereco_atual varchar(50),
	cli_sociedade boolean DEFAULT false,
	con_codigo_contrato varchar(10) NOT NULL,
	CONSTRAINT cliente_pk PRIMARY KEY (cli_codigo_contrato)

);
-- ddl-end --
ALTER TABLE public.cliente OWNER TO postgres;
-- ddl-end --

-- object: loteamento_fk | type: CONSTRAINT --
-- ALTER TABLE public.lote DROP CONSTRAINT IF EXISTS loteamento_fk CASCADE;
ALTER TABLE public.lote ADD CONSTRAINT loteamento_fk FOREIGN KEY (lot_registro_loteamento)
REFERENCES public.loteamento (lot_registro) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public.corretor | type: TABLE --
-- DROP TABLE IF EXISTS public.corretor CASCADE;
CREATE TABLE public.corretor(
	cor_numero_cpf varchar(16) NOT NULL DEFAULT 000.000.000-00,
	imo_cnpj_imobiliaria varchar(15) NOT NULL,
	CONSTRAINT corretor_pk PRIMARY KEY (cor_numero_cpf)

);
-- ddl-end --
ALTER TABLE public.corretor OWNER TO postgres;
-- ddl-end --

-- object: public.contrato | type: TABLE --
-- DROP TABLE IF EXISTS public.contrato CASCADE;
CREATE TABLE public.contrato(
	con_codigo varchar(10) NOT NULL,
	cor_numero_cpf_corretor varchar(16) NOT NULL,
	CONSTRAINT contrato_pk PRIMARY KEY (con_codigo)

);
-- ddl-end --
ALTER TABLE public.contrato OWNER TO postgres;
-- ddl-end --

-- object: imobiliaria_fk | type: CONSTRAINT --
-- ALTER TABLE public.corretor DROP CONSTRAINT IF EXISTS imobiliaria_fk CASCADE;
ALTER TABLE public.corretor ADD CONSTRAINT imobiliaria_fk FOREIGN KEY (imo_cnpj_imobiliaria)
REFERENCES public.imobiliaria (imo_cnpj) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: corretor_fk | type: CONSTRAINT --
-- ALTER TABLE public.contrato DROP CONSTRAINT IF EXISTS corretor_fk CASCADE;
ALTER TABLE public.contrato ADD CONSTRAINT corretor_fk FOREIGN KEY (cor_numero_cpf_corretor)
REFERENCES public.corretor (cor_numero_cpf) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: contrato_fk | type: CONSTRAINT --
-- ALTER TABLE public.cliente DROP CONSTRAINT IF EXISTS contrato_fk CASCADE;
ALTER TABLE public.cliente ADD CONSTRAINT contrato_fk FOREIGN KEY (con_codigo_contrato)
REFERENCES public.contrato (con_codigo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: contrato_fk | type: CONSTRAINT --
-- ALTER TABLE public.lote DROP CONSTRAINT IF EXISTS contrato_fk CASCADE;
ALTER TABLE public.lote ADD CONSTRAINT contrato_fk FOREIGN KEY (con_codigo_contrato)
REFERENCES public.contrato (con_codigo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: lote_uq | type: CONSTRAINT --
-- ALTER TABLE public.lote DROP CONSTRAINT IF EXISTS lote_uq CASCADE;
ALTER TABLE public.lote ADD CONSTRAINT lote_uq UNIQUE (con_codigo_contrato);
-- ddl-end --


