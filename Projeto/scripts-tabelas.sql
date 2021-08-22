 -- Table PTAF.USER_PROFILE

CREATE TABLE "PTAF"."USER_PROFILE"
(
    id serial NOT NULL,
	primeiro_nomme varchar(200) NOT NULL,
	sobrenome varchar(200) NOT NULL,
	login varchar(200) NOT NULL,
	ptafsenha varchar(200) NOT NULL,
	id_image integer,
	id_endereco integer,
	telefone varchar(15),
	id_instituicao integer,
	cpf varchar(11) NOT NULL,
	email varchar(200) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_image) REFERENCES "PTAF"."IMAGENS" (id),
	FOREIGN KEY (id_endereco) REFERENCES "PTAF"."ENDERECOS" (id),
	FOREIGN KEY (id_instituicao) REFERENCES "PTAF"."INSTITUICOES" (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."USER_PROFILE"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."USER_PROFILE" TO postgres;

GRANT ALL ON TABLE "PTAF"."USER_PROFILE" TO ptaf;




  -- Table PTAF.IMAGENS

CREATE TABLE "PTAF"."IMAGENS"
(
    id serial NOT NULL,
	filename varchar(200) NOT NULL,
	mimetype varchar(200) NOT NULL,
	file BYTEA,
	url_file varchar(200) NOT NULL,
	CONSTRAINT pk_id_imagem PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."IMAGENS"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."IMAGENS" TO postgres;

GRANT ALL ON TABLE "PTAF"."IMAGENS" TO ptaf;
 
 -- Table PTAF.INSTITUICAO

CREATE TABLE "PTAF"."INSTITUICAO"
(
    id serial NOT NULL,
	nome varchar(400) NOT NULL,
	id_tipo_instituicao integer NOT NULL,
	id_endereco integer,
	cnpj varchar(14) NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_tipo_instituicao) REFERENCES "PTAF"."TIPO_INSTITUICAO" (id),
	FOREIGN KEY (id_endereco) REFERENCES "PTAF"."ENDERECOS" (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."INSTITUICAO"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."INSTITUICAO" TO postgres;

GRANT ALL ON TABLE "PTAF"."INSTITUICAO" TO ptaf;


-- Table: PTAF.ENDERECOS

CREATE TABLE "PTAF"."ENDERECOS"
(
    id serial NOT NULL,
	rua varchar(400) NOT NULL,
	numero varchar(100) NOT NULL,
	complemento varchar(400),
	cep varchar(9),
	bairro varchar(400),
	id_cidade integer NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_cidade) REFERENCES "PTAF"."CIDADES" (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."ENDERECOS"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."ENDERECOS" TO postgres;

GRANT ALL ON TABLE "PTAF"."ENDERECOS" TO ptaf;


 -- Table PTAF.CIDADES

CREATE TABLE "PTAF"."CIDADES"
(
    id serial NOT NULL,
	nome varchar(400) NOT NULL,
	id_estado integer NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_estado) REFERENCES "PTAF"."ESTADOS" (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."CIDADES"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."CIDADES" TO postgres;

GRANT ALL ON TABLE "PTAF"."CIDADES" TO ptaf;


 -- Table PTAF.ESTADOS

CREATE TABLE "PTAF"."ESTADOS"
(
    id serial NOT NULL,
	nome varchar(400) NOT NULL,
	sigla varchar(2) NOT NULL,
	PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."ESTADOS"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."ESTADOS" TO postgres;

GRANT ALL ON TABLE "PTAF"."ESTADOS" TO ptaf;


 -- Table PTAF.TIPO_INSTITUICAO 

CREATE TABLE "PTAF"."TIPO_INSTITUICAO"
(
    id serial NOT NULL,
	descricao varchar(400) NOT NULL,
	PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."TIPO_INSTITUICAO"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."TIPO_INSTITUICAO" TO postgres;

GRANT ALL ON TABLE "PTAF"."TIPO_INSTITUICAO" TO ptaf;