 -- Tablel PTAF.PAGE_CONTENT_FILES 

CREATE TABLE "PTAF"."PAGE_CONTENT_FILES"
(
    id serial NOT NULL,
	id_page integer NOT NULL,
	filename varchar(200) NOT NULL,
	mimetype varchar(200) NOT NULL,
	file BYTEA,
	url_file varchar(50),
	PRIMARY KEY (id),
	FOREIGN KEY (id_page) REFERENCES "PTAF"."PAGE_CONTENT" (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."PAGE_CONTENT_FILES"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."PAGE_CONTENT_FILES" TO postgres;

GRANT ALL ON TABLE "PTAF"."PAGE_CONTENT_FILES" TO ptaf;


 -- Tablel PTAF.PAGE_CONTENT 

CREATE TABLE "PTAF"."PAGE_CONTENT"
(
    id serial NOT NULL,
	id_page integer NOT NULL,
	title varchar(50) NOT NULL,
	content text NOT NULL,
	id_user_created integer NOT NULL,
	id_user_modify integer,
	created_in date NOT NULL DEFAULT CURRENT_TIMESTAMP,
	last_modify date,
	approved char(1) DEFAULT 'N',
	id_user_approved integer DEFAULT 0,
	date_approved date,
	public char(1) DEFAULT 'N',
	id_user_publish integer, 
	date_publish date,
	PRIMARY KEY (id),
	FOREIGN KEY (id_page) REFERENCES "PTAF"."PAGES" (id),
	FOREIGN KEY (id_user_created) REFERENCES "PTAF"."USER_PROFILE" (id),
	FOREIGN KEY (id_user_modify) REFERENCES "PTAF"."USER_PROFILE" (id),
	FOREIGN KEY (id_user_approved) REFERENCES "PTAF"."USER_PROFILE" (id),
	FOREIGN KEY (id_user_publish) REFERENCES "PTAF"."USER_PROFILE" (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."PAGE_CONTENT"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."PAGE_CONTENT" TO postgres;

GRANT ALL ON TABLE "PTAF"."PAGE_CONTENT" TO ptaf; 


 
 -- Tablel PTAF.PAGES 

CREATE TABLE "PTAF"."PAGES"
(
    id serial NOT NULL,
	id_page_type integer NOT NULL,
	title varchar(50) NOT NULL,
	slug varchar(50) NOT NULL,
	url varchar(100) NOT NULL,
	id_menu integer NOT NULL DEFAULT 0,
	description varchar(200),
	id_user_created integer NOT NULL,
	id_user_modify integer,
	created_in date NOT NULL DEFAULT CURRENT_TIMESTAMP,
	last_modify date,
	active char(1) DEFAULT 'N',
	PRIMARY KEY (id),
	FOREIGN KEY (id_page_type) REFERENCES "PTAF"."PAGE_TYPES" (id),
	FOREIGN KEY (id_menu) REFERENCES "PTAF"."MENU" (id),
	FOREIGN KEY (id_user_created) REFERENCES "PTAF"."USER_PROFILE" (id),
	FOREIGN KEY (id_user_modify) REFERENCES "PTAF"."USER_PROFILE" (id)
	
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."PAGES"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."PAGES" TO postgres;

GRANT ALL ON TABLE "PTAF"."PAGES" TO ptaf; 


 -- Tablel PTAF.PAGE_TYPES 

CREATE TABLE "PTAF"."PAGE_TYPES"
(
    id serial NOT NULL,
	description varchar(200),
	id_user_created integer NOT NULL,
	id_user_modify integer,
	created_in date NOT NULL DEFAULT CURRENT_TIMESTAMP,
	last_modify date,
	active char(1) DEFAULT 'N',
	PRIMARY KEY (id),
	FOREIGN KEY (id_user_created) REFERENCES "PTAF"."USER_PROFILE" (id),
	FOREIGN KEY (id_user_modify) REFERENCES "PTAF"."USER_PROFILE" (id)
	
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."PAGE_TYPES"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."PAGE_TYPES" TO postgres;

GRANT ALL ON TABLE "PTAF"."PAGE_TYPES" TO ptaf;  
 

 -- Tablel PTAF.MENU 

CREATE TABLE "PTAF"."MENU"
(
    id serial NOT NULL,
	id_menu_group integer NOT NULL,
	description varchar(400) NOT NULL,
	level integer NOT NULL DEFAULT 0,
	id_user_created integer NOT NULL,
	id_user_modify integer,
	created_in date NOT NULL DEFAULT CURRENT_TIMESTAMP,
	last_modify date,
	active char(1) NOT NULL DEFAULT 'S',
	PRIMARY KEY (id),
	FOREIGN KEY (id_menu_group) REFERENCES "PTAF"."MENU_GROUP" (id),
	FOREIGN KEY (id_user_created) REFERENCES "PTAF"."USER_PROFILE" (id),
	FOREIGN KEY (id_user_modify) REFERENCES "PTAF"."USER_PROFILE" (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."MENU"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."MENU" TO postgres;

GRANT ALL ON TABLE "PTAF"."MENU" TO ptaf;


 -- Tablel PTAF.MENU_GROUP 

CREATE TABLE "PTAF"."MENU_GROUP"
(
    id serial NOT NULL,
	group_name varchar(50) NOT NULL,
	description varchar(200),
	level integer NOT NULL DEFAULT 0,
	id_submenu_group integer,
	id_user_created integer NOT NULL,
	id_user_modify integer,
	created_in date NOT NULL DEFAULT CURRENT_TIMESTAMP,
	last_modify date,
	active char(1) NOT NULL DEFAULT 'S',
	PRIMARY KEY (id),
	FOREIGN KEY (id_submenu_group) REFERENCES "PTAF"."MENU_GROUP" (id),
	FOREIGN KEY (id_user_created) REFERENCES "PTAF"."USER_PROFILE" (id),
	FOREIGN KEY (id_user_modify) REFERENCES "PTAF"."USER_PROFILE" (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."MENU_GROUP"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."MENU_GROUP" TO postgres;

GRANT ALL ON TABLE "PTAF"."MENU_GROUP" TO ptaf;


 -- Tablel PTAF.CONTENT_USER 

CREATE TABLE "PTAF"."CONTENT_USER"
(
    id serial NOT NULL,
	id_content_user_role integer NOT NULL,
	id_user_profile integer NOT NULL,
	created_in date NOT NULL DEFAULT CURRENT_TIMESTAMP,
	last_modify date,
	active char(1) NOT NULL DEFAULT 'S',
	PRIMARY KEY (id),
	FOREIGN KEY (id_content_user_role) REFERENCES "PTAF"."CONTENT_USER_ROLE" (id),
	FOREIGN KEY (id_user_profile) REFERENCES "PTAF"."USER_PROFILE" (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."CONTENT_USER"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."CONTENT_USER" TO postgres;

GRANT ALL ON TABLE "PTAF"."CONTENT_USER" TO ptaf;

 
  -- Tablel PTAF.CONTENT_USER_ROLE 

CREATE TABLE "PTAF"."CONTENT_USER_ROLE"
(
    id serial NOT NULL,
	description varchar(400) NOT NULL,
	active char(1) NOT NULL DEFAULT 'S',
	PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "PTAF"."CONTENT_USER_ROLE"
    OWNER to postgres;

GRANT ALL ON TABLE "PTAF"."CONTENT_USER_ROLE" TO postgres;

GRANT ALL ON TABLE "PTAF"."CONTENT_USER_ROLE" TO ptaf;
 

 -- Table PTAF.USER_PROFILE

CREATE TABLE "PTAF"."USER_PROFILE"
(
    id serial NOT NULL,
	primeiro_nome varchar(200) NOT NULL,
	sobrenome varchar(200) NOT NULL,
	login varchar(200) NOT NULL,
	ptafsenha varchar(20) NOT NULL,
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