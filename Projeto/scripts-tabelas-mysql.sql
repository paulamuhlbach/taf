 -- Tablel PTAF.PAGE_CONTENT_FILES 

CREATE TABLE `ptaf`.`page_content_files` (
  `id` INT NOT NULL,
  `id_page_content` INT NOT NULL,
  `filename` VARCHAR(45) NOT NULL,
  `mimetype` VARCHAR(45) NOT NULL,
  `file` BLOB NOT NULL,
  `url_file` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_page_content_pc_files_fk_idx` (`id_page_content` ASC) VISIBLE,
  CONSTRAINT `id_page_content_pc_files_fk`
    FOREIGN KEY (`id_page_content`)
    REFERENCES `ptaf`.`page_content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



 -- Tablel PTAF.PAGE_CONTENT 

CREATE TABLE `ptaf`.`page_content` (
  `id` INT NOT NULL,
  `id_page` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(45) NOT NULL,
  `id_user_created` INT NOT NULL,
  `id_user_modify` INT NULL,
  `created_in` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify` DATETIME NULL,
  `approved` CHAR(1) NOT NULL DEFAULT 'N',
  `id_user_approved` INT NOT NULL DEFAULT 0,
  `date_approved` DATETIME NULL,
  `public` CHAR(1) NULL DEFAULT 'N',
  `id_user_publish` INT NULL,
  `date_publish` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_page_page_content_fk_idx` (`id_page` ASC) VISIBLE,
  INDEX `id_user_created_content_fk_idx` (`id_user_created` ASC) VISIBLE,
  INDEX `id_user_modify_idx` (`id_user_modify` ASC) VISIBLE,
  INDEX `id_user_approved_content_fk_idx` (`id_user_approved` ASC) VISIBLE,
  INDEX `id_user_publish_content_fk_idx` (`id_user_publish` ASC) VISIBLE,
  CONSTRAINT `id_page_page_content_fk`
    FOREIGN KEY (`id_page`)
    REFERENCES `ptaf`.`pages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_user_created_content_fk`
    FOREIGN KEY (`id_user_created`)
    REFERENCES `ptaf`.`user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_user_modify_content_fk`
    FOREIGN KEY (`id_user_modify`)
    REFERENCES `ptaf`.`user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_user_approved_content_fk`
    FOREIGN KEY (`id_user_approved`)
    REFERENCES `ptaf`.`user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_user_publish_content_fk`
    FOREIGN KEY (`id_user_publish`)
    REFERENCES `ptaf`.`user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



 
 -- Tablel PTAF.PAGES 

CREATE TABLE `ptaf`.`pages` (
  `id` INT NOT NULL,
  `id_page_type` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  `id_menu` INT NOT NULL DEFAULT 0,
  `description` VARCHAR(200) NULL,
  `id_user_created` INT NOT NULL,
  `id_user_modify` INT NULL,
  `created_in` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify` DATETIME NULL,
  `active` CHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `slug_UNIQUE` (`slug` ASC) VISIBLE,
  UNIQUE INDEX `url_UNIQUE` (`url` ASC) VISIBLE,
  INDEX `id_page_type_page_fk_idx` (`id_page_type` ASC) VISIBLE,
  INDEX `id_menu_idx` (`id_menu` ASC) VISIBLE,
  INDEX `id_user_created_idx` (`id_user_created` ASC) VISIBLE,
  INDEX `id_user_modify_idx` (`id_user_modify` ASC) VISIBLE,
  CONSTRAINT `id_page_type_page_fk`
    FOREIGN KEY (`id_page_type`)
    REFERENCES `ptaf`.`page_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_menu`
    FOREIGN KEY (`id_menu`)
    REFERENCES `ptaf`.`menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_user_created`
    FOREIGN KEY (`id_user_created`)
    REFERENCES `ptaf`.`user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_user_modify`
    FOREIGN KEY (`id_user_modify`)
    REFERENCES `ptaf`.`user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


 -- Tablel PTAF.PAGE_TYPES 

CREATE TABLE `PTAF`.`PAGE_TYPES`
(
    `id` INT NOT NULL,
	`description` VARCHAR(200),
	`id_user_created` INT NOT NULL,
	`id_user_modify` INT,
	`created_in` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`last_modify` DATETIME,
	`active` CHAR(1) NOT NULL DEFAULT 'S',
	PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
	INDEX `id_user_created_page_types_fk_idx` (`id_user_created` ASC) VISIBLE,
	INDEX `id_user_modify_page_types_fk_idx` (`id_user_modify` ASC) VISIBLE,
	CONSTRAINT `id_user_created_page_types_fk`
		FOREIGN KEY (`id_user_created`)
		REFERENCES `ptaf`.`user_profile` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `id_user_modify_page_types_fk`
		FOREIGN KEY (`id_user_modify`)
		REFERENCES `ptaf`.`user_profile` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION);






 -- Tablel PTAF.MENU 

CREATE TABLE `PTAF`.`MENU`
(
    `id` INT NOT NULL,
	`id_menu_group` INT NOT NULL,
	`description` VARCHAR(400) NOT NULL,
	`level` INT NOT NULL DEFAULT 0,
	`id_user_created` INT NOT NULL,
	`id_user_modify` INT,
	`created_in` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`last_modify` DATETIME,
	`active` CHAR(1) NOT NULL DEFAULT 'S',
	PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
	INDEX `id_menu_group_menu_fk_idx` (`id_menu_group` ASC) VISIBLE,
	INDEX `id_user_created_menu_group_menu_fk_idx` (`id_user_created` ASC) VISIBLE,
	INDEX `id_user_modify_menu_group_menu_fk_idx` (`id_user_modify` ASC) VISIBLE,
	CONSTRAINT `id_menu_group_menu_fk`
		FOREIGN KEY (`id_menu_group`)
		REFERENCES `ptaf`.`menu_group` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `id_user_created_menu_group_menu_fk`
		FOREIGN KEY (`id_user_created`)
		REFERENCES `ptaf`.`user_profile` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `id_user_modify_menu_group_menu_fk`
		FOREIGN KEY (`id_user_modify`)
		REFERENCES `ptaf`.`user_profile` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION);






 -- Tablel PTAF.MENU_GROUP 

CREATE TABLE `PTAF`.`MENU_GROUP`
(
    `id` INT NOT NULL,
	`group_name` VARCHAR(50) NOT NULL,
	`description` VARCHAR(200),
	`level` INT NOT NULL DEFAULT 0,
	`id_submenu_group` INT,
	`id_user_created` INT NOT NULL,
	`id_user_modify` INT,
	`created_in` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`last_modif` DATETIME,
	`active` CHAR(1) NOT NULL DEFAULT 'S',
	PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
	INDEX `id_submenu_group_fk_idx` (`id_submenu_group` ASC) VISIBLE,
	INDEX `id_user_created_menu_group_fk_idx` (`id_user_created` ASC) VISIBLE,
	INDEX `id_user_modify_menu_group_fk_idx` (`id_user_modify` ASC) VISIBLE,
	CONSTRAINT `id_submenu_group_fk`
		FOREIGN KEY (`id_submenu_group`)
		REFERENCES `ptaf`.`menu_group` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `id_user_created_menu_group_fk`
		FOREIGN KEY (`id_user_created`)
		REFERENCES `ptaf`.`user_profile` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `id_user_modify_menu_group_fk`
		FOREIGN KEY (`id_user_modify`)
		REFERENCES `ptaf`.`user_profile` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION);



 -- Tablel PTAF.CONTENT_USER 

CREATE TABLE `ptaf`.`content_user` (
  `id` INT NOT NULL,
  `id_content_user_role` INT NOT NULL,
  `id_user_profile` INT NOT NULL,
  `created_in` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify` DATETIME NULL,
  `active` CHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_content_user_role_content_user_fk_idx` (`id_content_user_role` ASC) VISIBLE,
  INDEX `id_user_profile_content_user_fk_idx` (`id_user_profile` ASC) VISIBLE,
  CONSTRAINT `id_content_user_role_content_user_fk`
    FOREIGN KEY (`id_content_user_role`)
    REFERENCES `ptaf`.`content_user_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_user_profile_content_user_fk`
    FOREIGN KEY (`id_user_profile`)
    REFERENCES `ptaf`.`user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



 
  -- Tablel PTAF.CONTENT_USER_ROLE 

CREATE TABLE PTAF.CONTENT_USER_ROLE
(
    id INT NOT NULL,
	description VARCHAR(400) NOT NULL,
	active CHAR(1) NOT NULL DEFAULT 'S',
	PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);


 -- Table PTAF.USER_PROFILE

CREATE TABLE PTAF.USER_PROFILE
(
    id INT NOT NULL,
	primeiro_nome VARCHAR(200) NOT NULL,
	sobrenome VARCHAR(200) NOT NULL,
	login VARCHAR(200) NOT NULL,
	ptafsenha VARCHAR(20) NOT NULL,
	id_image INT,
	id_endereco INT,
	telefone VARCHAR(15),
	id_instituicao INT,
	cpf VARCHAR(11) NOT NULL,
	email VARCHAR(200) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
	INDEX `id_image_user_fk_idx` (`id_image` ASC) VISIBLE,
	INDEX `id_endereco_user_fk_idx` (`id_endereco` ASC) VISIBLE,
	INDEX `id_instituicao_user_fk_idx` (`id_instituicao` ASC) VISIBLE,
	CONSTRAINT `id_image_user_fk`
		FOREIGN KEY (`id_image`)
		REFERENCES `ptaf`.`imagens` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `id_endereco_user_fk`
		FOREIGN KEY (`id_endereco`)
		REFERENCES `ptaf`.`enderecos` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `id_instituicao_user_fk`
		FOREIGN KEY (`id_instituicao`)
		REFERENCES `ptaf`.`instituicao` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION);




  -- Table PTAF.IMAGENS

CREATE TABLE `ptaf`.`imagens` (
  `id` INT NOT NULL,
  `filename` VARCHAR(45) NOT NULL,
  `mimetype` VARCHAR(45) NOT NULL,
  `file` BLOB NOT NULL,
  `url_file` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);



 
 -- Table PTAF.INSTITUICAO

CREATE TABLE `ptaf`.`instituicao` (
  `id` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `id_tipo_instituicao` INT NOT NULL,
  `id_endereco` INT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_tipo_instituicao_instituicao_fk_idx` (`id_tipo_instituicao` ASC) VISIBLE,
  INDEX `id_endereco_instituicao_fk_idx` (`id_endereco` ASC) VISIBLE,
  CONSTRAINT `id_tipo_instituicao_instituicao_fk`
    FOREIGN KEY (`id_tipo_instituicao`)
    REFERENCES `ptaf`.`tipo_instituicao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_endereco_instituicao_fk`
    FOREIGN KEY (`id_endereco`)
    REFERENCES `ptaf`.`enderecos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Table: PTAF.ENDERECOS

CREATE TABLE `ptaf`.`enderecos` (
  `id` INT NOT NULL,
  `rua` VARCHAR(100) NOT NULL,
  `numero` VARCHAR(5) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `cep` VARCHAR(9) NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `id_cidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_cidade_enderecos_fk_idx` (`id_cidade` ASC) VISIBLE,
  CONSTRAINT `id_cidade_enderecos_fk`
    FOREIGN KEY (`id_cidade`)
    REFERENCES `ptaf`.`cidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



 -- Table PTAF.CIDADES

CREATE TABLE `ptaf`.`cidades` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_estado_fk_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `id_estado_fk`
    FOREIGN KEY (`id_estado`)
    REFERENCES `ptaf`.`estados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



 -- Table PTAF.ESTADOS

CREATE TABLE PTAF.ESTADOS
(
    id INT NOT NULL,
	nome varchar(400) NOT NULL,
	sigla varchar(2) NOT NULL,
	PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);



 -- Table PTAF.TIPO_INSTITUICAO 

CREATE TABLE `ptaf`.`tipo_instituicao` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);