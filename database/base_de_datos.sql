  CREATE DATABASE  IF NOT EXISTS `scriptweb`;
  USE `scriptweb`;

  /*Tabla tipo_user*/

  DROP TABLE IF EXISTS `tipo_user`;

  CREATE TABLE `tipo_user` (
    `cod_tipo_user` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_tipo_user` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_tipo_user` TIMESTAMP NOT NULL,
    `updated_tipo_user` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_tipo_user`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


  /* Tabla `area_formacion`*/

  DROP TABLE IF EXISTS `area_formacion`;

  CREATE TABLE `area_formacion` (
    `cod_area_forma` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_area_forma` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_area_forma` TIMESTAMP NOT NULL,
    `updated_area_forma` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_area_forma`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


  /* Tabla `area_conocimiento`*/

  DROP TABLE IF EXISTS `area_conocimiento`;

  CREATE TABLE `area_conocimiento` (
    `cod_area_conoci` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_area_conoci` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_area_conoci` TIMESTAMP NOT NULL,
    `updated_area_conoci` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_area_conoci`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


  /* tabla `tipo_documento`*/

  DROP TABLE IF EXISTS `tipo_documento`;

  CREATE TABLE `tipo_documento` (
    `cod_tipo_doc` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_tipo_doc` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_tipo_doc` TIMESTAMP NOT NULL,
    `updated_tipo_doc` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_tipo_doc`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


  /*tabla `paises`*/

  DROP TABLE IF EXISTS `paises`;

  CREATE TABLE `paises` (
    `cod_pais` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `name_pais` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
    `postal_pais` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
    `created_pais` TIMESTAMP NOT NULL,
    `updated_pais` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_pais`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `departamentos`*/

  DROP TABLE IF EXISTS `departamentos`;

  CREATE TABLE `departamentos` (
    `cod_depart` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `cod_pais` int(10) unsigned NOT NULL,
    `name_depart` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_depart` TIMESTAMP NOT NULL,
    `updated_depart` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_depart`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /* tabla `ciudades`*/

  DROP TABLE IF EXISTS `ciudades`;
  CREATE TABLE `ciudades` (
    `cod_ciudad` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `cod_depart` int(10) unsigned NOT NULL,
    `name_ciudad` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_ciudad` TIMESTAMP NOT NULL,
    `updated_ciudad` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_ciudad`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


  /*tabla `comunas`*/

  DROP TABLE IF EXISTS `comunas`;

  CREATE TABLE `comunas` (
    `cod_comuna` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `name_comuna` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_comuna` TIMESTAMP NOT NULL,
    `updated_comuna` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_comuna`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


  /*tabla `ciudades_comunas`*/

  DROP TABLE IF EXISTS `ciudades_comunas`;

  CREATE TABLE `ciudades_comunas` (
    `cod_ciudad_comu` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `cod_ciudad` int(10) unsigned NOT NULL,
    `cod_comuna` int(10) unsigned NOT NULL,
    `created_ciudad_comu` TIMESTAMP NOT NULL,
    `updated_ciudad_comu` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_ciudad_comu`),
    KEY `fkcodciudadcc_ciudades_idx` (`cod_ciudad`),
    KEY `fkcodcomunacc_comunas_idx` (`cod_comuna`),
    CONSTRAINT `fkcodciudadcc_ciudades` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudades` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodcomunacc_comunas` FOREIGN KEY (`cod_comuna`) REFERENCES `comunas` (`cod_comuna`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `corregimientos`*/

  DROP TABLE IF EXISTS `corregimientos`;

  CREATE TABLE `corregimientos` (
    `cod_corregimiento` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `cod_ciudad` int(10) unsigned NOT NULL,
    `name_corregimiento` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_corregimiento` TIMESTAMP NOT NULL,
    `updated_corregimiento` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_corregimiento`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `veredas`*/

  DROP TABLE IF EXISTS `veredas`;

  CREATE TABLE `veredas` (
    `cod_vereda` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `cod_corregimiento` int(10) unsigned NOT NULL,
    `name_vereda` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_vereda` TIMESTAMP NOT NULL,
    `updated_vereda` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_vereda`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `barrios`*/

  DROP TABLE IF EXISTS `barrios`;

  CREATE TABLE `barrios` (
    `cod_barrio` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `cod_corregimiento` int(10) unsigned NULL,
    `cod_comuna` int(10) unsigned NULL,
    `name_barrio` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_barrio` TIMESTAMP NOT NULL,
    `updated_barrio` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_barrio`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `users`*/

  DROP TABLE IF EXISTS `users`;

  CREATE TABLE `users` (
    `id_user` int(12) unsigned NOT NULL AUTO_INCREMENT,
    `cod_tipo_user` int(5) unsigned NOT NULL,
    `level_user` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
    `cod_area_forma` int(5) unsigned NULL,
    `cod_area_conoci` int(5) unsigned NULL,
    `nombre_user` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `genero_user` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
    `anio_user` int(4) unsigned NOT NULL,
    `mes_user` int(2) unsigned NOT NULL,
    `dia_user` int(2) unsigned NOT NULL,
    `documento_user` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
    `cod_tipo_doc` int(5) unsigned NOT NULL,
    `correo_user` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
    `pass_user` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
    `confirmar_user` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
    `celular_user` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
    `telefono_user` varchar(10) COLLATE utf8_spanish_ci NULL,
    `cod_pais` int(10) unsigned NOT NULL,
    `cod_depart` int(10) unsigned NOT NULL,
    `cod_ciudad` int(10) unsigned NOT NULL,
    `cod_comuna` int(10) unsigned NULL,
    `cod_corregimiento` int(10) unsigned NULL,
    `cod_vereda` int(10) unsigned NULL,
    `cod_barrio` int(10) unsigned NULL,
    `direccion_user` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `created_user` TIMESTAMP NOT NULL,
    `updated_user` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    
    PRIMARY KEY (`id_user`),
    /*llave primaria*/
    FULLTEXT (`nombre_user`),
    /*indices para realizar busquedas tabla*/
    KEY `ixcorreouser_users` (`correo_user`),
    KEY `ixcelular_users` (`celular_user`),
    KEY `ixdocumento_users` (`documento_user`),


    KEY `fkcodtipouser_tipouser_idx` (`cod_tipo_user`),
    KEY `fkcodtipodoc_tipodocumento_idx` (`cod_tipo_doc`),
    KEY `fkcodpais_paises_idx` (`cod_pais`),
    KEY `fkcoddepart_departamentos_idx` (`cod_depart`),
    KEY `fkcodciudad_ciudades_idx` (`cod_ciudad`),
    KEY `fkcodcomuna_comunas_idx` (`cod_comuna`),
    KEY `fkcodbarrio_barrios_idx` (`cod_barrio`),

    CONSTRAINT users_unique UNIQUE (correo_user, celular_user, documento_user),
    CONSTRAINT `fkcodtipouser_tipouser` FOREIGN KEY (`cod_tipo_user`) REFERENCES `tipo_user` (`cod_tipo_user`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodtipodoc_tipodocumento` FOREIGN KEY (`cod_tipo_doc`) REFERENCES `tipo_documento` (`cod_tipo_doc`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodpais_paises` FOREIGN KEY (`cod_pais`) REFERENCES `paises` (`cod_pais`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcoddepart_departamentos` FOREIGN KEY (`cod_depart`) REFERENCES `departamentos` (`cod_depart`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodciudad_ciudades` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudades` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodcomuna_comunas` FOREIGN KEY (`cod_comuna`) REFERENCES `comunas` (`cod_comuna`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodbarrio_barrios` FOREIGN KEY (`cod_barrio`) REFERENCES `barrios` (`cod_barrio`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `categorias_proyecto`*/

  DROP TABLE IF EXISTS `categorias_proyecto`;

  CREATE TABLE `categorias_proyecto` (
    `cod_cat_proyecto` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_cat_proyecto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `created_cat_proyecto` TIMESTAMP NOT NULL,
    `updated_cat_proyecto` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_cat_proyecto`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `estado_poyecto`*/

  DROP TABLE IF EXISTS `estado_poyecto`;

  CREATE TABLE `estado_poyecto` (
    `cod_estado_pro` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_estado_pro` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `created_estado_pro` TIMESTAMP NOT NULL,
    `updated_estado_pro` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_estado_pro`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `ideas`*/

  DROP TABLE IF EXISTS `ideas`;

  CREATE TABLE `ideas` (
    `cod_idea` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `cod_cat_proyecto` int(5) unsigned NOT NULL,
    `id_user` int(12) unsigned NOT NULL,
    `titulo_idea` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `detalle_idea` text COLLATE utf8_spanish_ci NOT NULL,
    `created_idea` TIMESTAMP NOT NULL,
    `updated_idea` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_idea`),
    KEY `fkcodcatproyectoi_categoriasproyecto_idx` (`cod_cat_proyecto`),
    KEY `fkiduseri_users_idx` (`id_user`),
    CONSTRAINT `fkcodcatproyectoi_categoriasproyecto` FOREIGN KEY (`cod_cat_proyecto`) REFERENCES `categorias_proyecto` (`cod_cat_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkiduseri_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `fases_proyecto`*/

  DROP TABLE IF EXISTS `fases_proyecto`;

  CREATE TABLE `fases_proyecto` (
    `cod_fase_pro` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_fase_pro` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `tiempo_fase_pro` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_fase_pro` TIMESTAMP NOT NULL,
    `updated_fase_pro` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_fase_pro`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `proyectos`*/

  DROP TABLE IF EXISTS `proyectos`;

  CREATE TABLE `proyectos` (
    `cod_proyecto` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_proyecto` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `cod_cat_proyecto` int(5) unsigned NOT NULL,
    `cod_idea` int(5) unsigned NOT NULL,
    `cod_estado_pro` int(5) unsigned NOT NULL,
    `cod_fase_pro` int(5) unsigned NOT NULL,
    `progreso_proyecto` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
    `created_proyecto` TIMESTAMP NOT NULL,
    `updated_proyecto` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_proyecto`),
    KEY `fkcodcatproyecto_categoriasproyecto_idx` (`cod_cat_proyecto`),
    KEY `fkcodidea_ideas_idx` (`cod_idea`),
    KEY `fkcodestadopro_estadoproyecto_idx` (`cod_estado_pro`),
    KEY `fkcodfasepro_fasesproyecto_idx` (`cod_fase_pro`),
    CONSTRAINT `fkcodcatproyecto_categoriasproyecto` FOREIGN KEY (`cod_cat_proyecto`) REFERENCES `categorias_proyecto` (`cod_cat_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodidea_ideas` FOREIGN KEY (`cod_idea`) REFERENCES `ideas` (`cod_idea`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodestadopro_estadoproyecto` FOREIGN KEY (`cod_estado_pro`) REFERENCES `estado_poyecto` (`cod_estado_pro`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodfasepro_fasesproyecto` FOREIGN KEY (`cod_fase_pro`) REFERENCES `fases_proyecto` (`cod_fase_pro`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `categorias_clases`*/

  DROP TABLE IF EXISTS `categorias_clases`;

  CREATE TABLE `categorias_clases` (
    `cod_cat_clase` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_cat_clase` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_cat_clase` TIMESTAMP NOT NULL,
    `updated_cat_clase` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_cat_clase`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `clases`*/

  DROP TABLE IF EXISTS `clases`;

  CREATE TABLE `clases` (
    `cod_clase` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_clase` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `cod_cat_clase` int(5) unsigned NOT NULL,
    `created_clase` TIMESTAMP NOT NULL,
    `updated_clase` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_clase`),
    KEY `fkcodcatclase_categoriasclases_idx` (`cod_cat_clase`),
    CONSTRAINT `fkcodcatclase_categoriasclases` FOREIGN KEY (`cod_cat_clase`) REFERENCES `categorias_clases` (`cod_cat_clase`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `proyecto_clases`*/

  DROP TABLE IF EXISTS `proyecto_clases`;

  CREATE TABLE `proyecto_clases` (
    `cod_proyecto_clase` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `cod_proyecto` int(5) unsigned NOT NULL,
    `cod_clase` int(5) unsigned NOT NULL,
    `created_pc` TIMESTAMP NOT NULL,
    `updated_pc` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_proyecto_clase`),
    KEY `fkcodproyecto_proyectos_idx` (`cod_proyecto`),
    KEY `fkcodclase_clases_idx` (`cod_clase`),
    CONSTRAINT `fkcodproyecto_proyectos` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyectos` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodclase_clases` FOREIGN KEY (`cod_clase`) REFERENCES `clases` (`cod_clase`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `proyectos_users`*/

  DROP TABLE IF EXISTS `proyectos_users`;

  CREATE TABLE `proyectos_users` (
    `cod_proyecto_users` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `cod_proyecto` int(5) unsigned NOT NULL,
    `id_user` int(12) unsigned NOT NULL,
    `created_pu` TIMESTAMP NOT NULL,
    `updated_pu` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_proyecto_users`),
    KEY `fkidproyecto_proyectos_idx` (`cod_proyecto`),
    KEY `fkiduser_users_idx` (`id_user`),
    CONSTRAINT `fkidproyecto_proyectos` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyectos` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkiduser_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `proyecto_descripcion`*/

  DROP TABLE IF EXISTS `proyecto_descripcion`;

  CREATE TABLE `proyecto_descripcion` (
    `cod_pro_des` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `cod_proyecto` int(5) unsigned NOT NULL,
    `texto_pro_des` text COLLATE utf8_spanish_ci NOT NULL,
    `created_pd` TIMESTAMP NOT NULL,
    `updated_pd` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_pro_des`),
    KEY `fkcodproyectod_proyectos_idx` (`cod_proyecto`),
    CONSTRAINT `fkcodproyectod_proyectos` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyectos` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `subdominios`*/

  DROP TABLE IF EXISTS `subdominios`;

  CREATE TABLE `subdominios` (
    `cod_subdominio` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `cod_proyecto` int(5) unsigned NOT NULL,
    `url_subdominio` text COLLATE utf8_spanish_ci NOT NULL,
    `created_subdominio` TIMESTAMP NOT NULL,
    `updated_subdominio` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_subdominio`),
    KEY `fkcodproyectos_proyectos_idx` (`cod_proyecto`),
    CONSTRAINT `fkcodproyectos_proyectos` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyectos` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `categorias_definiciones`*/

  DROP TABLE IF EXISTS `categorias_definiciones`;

  CREATE TABLE `categorias_definiciones` (
    `cod_cat_definicion` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_cat_definicion` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
    `created_cd` TIMESTAMP NOT NULL,
    `updated_cd` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_cat_definicion`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `definiciones`*/

  DROP TABLE IF EXISTS `definiciones`;

  CREATE TABLE `definiciones` (
    `cod_definicion` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `cod_cat_definicion` int(5) unsigned NOT NULL,
    `detalle_definicion` text COLLATE utf8_spanish_ci NOT NULL,
    `created_definicion` TIMESTAMP NOT NULL,
    `updated_definicion` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_definicion`),
    KEY `fkcodcatdefinicion_categoriasdefiniciones_idx` (`cod_cat_definicion`),
    CONSTRAINT `fkcoddefcate_categoriasdefiniciones` FOREIGN KEY (`cod_cat_definicion`) REFERENCES `categorias_definiciones` (`cod_cat_definicion`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `terminos`*/

  DROP TABLE IF EXISTS `terminos`;

  CREATE TABLE `terminos` (
    `cod_termino` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `cod_definicion` int(5) unsigned NOT NULL,
    `name_termino` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
    `created_termino` TIMESTAMP NOT NULL,
    `updated_termino` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_termino`),
    KEY `fkcoddefinicion_definiciones_idx` (`cod_definicion`),
    CONSTRAINT `fkcoddefinicion_definiciones` FOREIGN KEY (`cod_definicion`) REFERENCES `definiciones` (`cod_definicion`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `foro`*/

  DROP TABLE IF EXISTS `foro`;

  CREATE TABLE `foro` (
    `cod_foro` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `cod_proyecto` int(5) unsigned NOT NULL,
    `id_user` int(12) unsigned NOT NULL,
    `name_foro` text COLLATE utf8_spanish_ci NOT NULL,
    `created_foro` TIMESTAMP NOT NULL,
    `updated_foro` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_foro`),
    KEY `fkcodproyectof_proyectos_idx` (`cod_proyecto`),
    KEY `fkiduserf_users_idx` (`id_user`),
    CONSTRAINT `fkcodproyectof_proyectos` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyectos` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkiduserf_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `preguntas_foro`*/

  DROP TABLE IF EXISTS `preguntas_foro`;

  CREATE TABLE `preguntas_foro` (
    `cod_preg_foro` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `cod_foro` int(5) unsigned NOT NULL,
    `id_user` int(12) unsigned NOT NULL,
    `pregunta_preg_foro` text COLLATE utf8_spanish_ci NOT NULL,
    `created_pf` TIMESTAMP NOT NULL,
    `updated_pf` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_preg_foro`),
    KEY `fkcodforo_foro_idx` (`cod_foro`),
    KEY `fkiduserpf_users_idx` (`id_user`),
    CONSTRAINT `fkcodforo_foro` FOREIGN KEY (`cod_foro`) REFERENCES `foro` (`cod_foro`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkiduseropf_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `categorias_imagenes`*/

  DROP TABLE IF EXISTS `categorias_imagenes`;

  CREATE TABLE `categorias_imagenes` (
    `cod_cat_imagen` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_cat_imagen` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
    `created_cat_imagen` TIMESTAMP NOT NULL,
    `updated_cat_imagen` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_cat_imagen`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  /*tabla `imagenes`*/

  DROP TABLE IF EXISTS `imagenes`;

  CREATE TABLE `imagenes` (
    `cod_imagen` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `name_imagen` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `id_user` int(12) unsigned NULL,
    `cod_proyecto` int(5) unsigned NULL,
    `cod_idea` int(5) unsigned NULL,
    `cod_cat_imagen` int(5) unsigned NOT NULL,
    `created_imagen` TIMESTAMP NOT NULL,
    `updated_imagen` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_imagen`),
    KEY `fkcodproyectoima_proyectos_idx` (`cod_proyecto`),
    KEY `fkiduserima_users_idx` (`id_user`),
    KEY `fkcodideaima_ideas_idx` (`cod_idea`),
    KEY `fkcodcatimagen_categoriasimagenes_idx` (`cod_cat_imagen`),
    CONSTRAINT `fkcodproyectoima_proyectos` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyectos` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkiduserima_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodideaima_ideas` FOREIGN KEY (`cod_idea`) REFERENCES `ideas` (`cod_idea`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodcatimagen_categoriasimagenes` FOREIGN KEY (`cod_cat_imagen`) REFERENCES `categorias_imagenes` (`cod_cat_imagen`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

