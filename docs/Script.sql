-- Table: public.categorias

-- DROP TABLE public.categorias;

CREATE TABLE public.categorias
(
    id_categoria bigint NOT NULL DEFAULT nextval('"Categorias_id_categoria_seq"'::regclass),
    nombre_categoria character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Categorias_pkey" PRIMARY KEY (id_categoria),
    CONSTRAINT nombre_categoria_unique UNIQUE (nombre_categoria)

        USING INDEX TABLESPACE ts_restaurante
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.categorias
    OWNER to postgres;
    
insert into categorias (nombre_categoria) values('Tortas');
insert into categorias (nombre_categoria) values('Bebidas');    

    
-- Table: public.empresa

-- DROP TABLE public.empresa;

CREATE TABLE public.empresa
(
    id_empresa bigint NOT NULL DEFAULT nextval('empresa_id_empresa_seq'::regclass),
    nombre_empresa character varying(128) COLLATE pg_catalog."default",
    direccionl1_empresa character varying(128) COLLATE pg_catalog."default",
    direccionl2_empresa character varying(128) COLLATE pg_catalog."default",
    urlimagen_empresa character varying(256) COLLATE pg_catalog."default",
    correo_empresa character varying(128) COLLATE pg_catalog."default",
    telefono1_empresa character varying(15) COLLATE pg_catalog."default",
    telefono2_empresa character varying(15) COLLATE pg_catalog."default",
    facebook_empresa character varying(150) COLLATE pg_catalog."default",
    twitter_empresa character varying(150) COLLATE pg_catalog."default",
    instagram_empresa character varying(150) COLLATE pg_catalog."default",
    linkedin_empresa character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa)
)
WITH (
    OIDS = FALSE
)
TABLESPACE ts_restaurante;

ALTER TABLE public.empresa
    OWNER to postgres;
    
INSERT INTO public.empresa(
	 nombre_empresa, direccionl1_empresa, direccionl2_empresa, urlimagen_empresa, correo_empresa, telefono1_empresa, telefono2_empresa, facebook_empresa, twitter_empresa, instagram_empresa, linkedin_empresa)
	VALUES ('Mega Tortas', 'manzana del secreto, escondido', 'Santa Cruz Xoxolliwood', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRZHfK-cl1f0OMNrKdGF5_6szILy_JiXyLl0xwAuC4p9xL9ins_', 'megatortas1995@gmail.com', '9511310436', '5172038',
			'https://www.facebook.com/housesoft117/', 'https://twitter.com/frozenhouse17', 'https://www.instagram.com/house117/', 'https://www.instagram.com/house117/');


 
    
    
    -- Table: public.pedidos

-- DROP TABLE public.pedidos;

CREATE TABLE public.pedidos
(
    id_pedido bigint NOT NULL DEFAULT nextval('pedidos_id_pedido_seq'::regclass),
    productosycant_pedido character varying(2000) COLLATE pg_catalog."default" NOT NULL,
    detalles_pedido character varying(2000) COLLATE pg_catalog."default",
    fecha_pedido timestamp(6) without time zone,
    usuario_pedido character varying(120) COLLATE pg_catalog."default" NOT NULL,
    estado_pedido character varying(50) COLLATE pg_catalog."default" NOT NULL,
    dir1_pedido character varying(200) COLLATE pg_catalog."default" NOT NULL,
    dir2_pedido character varying(400) COLLATE pg_catalog."default",
    zipcode_pedido character varying(15) COLLATE pg_catalog."default",
    total_pedido double precision NOT NULL,
    iva_pedido double precision NOT NULL,
    CONSTRAINT pedidos_pkey PRIMARY KEY (id_pedido)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.pedidos
    OWNER to postgres;
    
    
 -- Table: public.productos

-- DROP TABLE public.productos;

CREATE TABLE public.productos
(
    id_producto bigint NOT NULL DEFAULT nextval('productos_id_producto_seq'::regclass),
    nombre_producto character varying(256) COLLATE pg_catalog."default" NOT NULL,
    descripcion_producto character varying(256) COLLATE pg_catalog."default" NOT NULL,
    categoria_producto character varying(128) COLLATE pg_catalog."default" NOT NULL,
    urlimagen_producto character varying(256) COLLATE pg_catalog."default",
    cantidad_producto bigint NOT NULL,
    precio_producto numeric,
    CONSTRAINT productos_pkey PRIMARY KEY (id_producto),
    CONSTRAINT id_unique UNIQUE (id_producto)
        INCLUDE(id_producto)
        USING INDEX TABLESPACE ts_restaurante,
    CONSTRAINT pro_name_uniq UNIQUE (nombre_producto)
        INCLUDE(nombre_producto)
        USING INDEX TABLESPACE ts_restaurante
)
WITH (
    OIDS = FALSE
)
TABLESPACE ts_restaurante;

ALTER TABLE public.productos
    OWNER to postgres;
COMMENT ON TABLE public.productos
    IS 'Tabla que contiene los productos del restaurante';

COMMENT ON CONSTRAINT pro_name_uniq ON public.productos
    IS 'constraint para hacer unico el nombre del producto';
    
    
--
-- TOC entry 2842 (class 0 OID 41001)
-- Dependencies: 197
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos ( nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES ( 'Refresco coca-cola lata 355 ml', 'Coca cola de lata 355 ml.', 'Bebidas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSSeZ6NeRbhuXH1rGQhoLQa4HgRWNdlmJ90pr_81Yv5KtnpHB_S', 123, 20);
INSERT INTO public.productos ( nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES ( 'Torta de chorizo con quesillo', ' Chorizo, quesillo, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera', 'Tortas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRU6nh5SszzuCe5pEuFvizJY2SWJ6j3KbOhMAH6Bi8l0yL9VA3Y', 13, 35);
INSERT INTO public.productos ( nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES ( 'Torta de cecina con quesillo', ' Cecina, quesillo, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera', 'Tortas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTOwoECXzln8j_1WfTw_Yj9_EjS4TPDxaImrWbwwsrUpjLWn332', 12, 35);
INSERT INTO public.productos ( nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES ( 'Torta de milanesa doble', 'La misma torta de milanesa, con doble carne y mÃ¡s deliciosa', 'Tortas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ7Z_wDcmyOAG28exQSX89-S0FBg92OcIfxjJMSHSM1cKIi2OHq', 20, 40);
INSERT INTO public.productos ( nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES ( 'Torta de jamÃ³n con quesillo', ' JamÃ³n, quesillo, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera', 'Tortas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvxVMKw-CLP11qqKTQpMUuNW4ezWdC3xCkDvT0G01YnVN-hKfy', 15, 35.0);
INSERT INTO public.productos ( nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES ( 'Torta de chorizo', ' Chorizo, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera.', 'Tortas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTYq6n0OZOYet_nrjQMf5xPEc-Yo95OIrO9Ig2KJbXcYrMct0-G', 13, 30);
INSERT INTO public.productos ( nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES ( 'Torta de jamÃ³n', ' Jamon, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera', 'Tortas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSNbuKhLuoC8hK7qEejhrZIUP5VisUHnctq0SMku3og9p2xzMy2', 15, 30);

    
    
    
    

    
-- Table: public.sucursales

-- DROP TABLE public.sucursales;

CREATE TABLE public.sucursales
(
    id_sucursal bigint NOT NULL DEFAULT nextval('sucursales_id_sucursal_seq'::regclass),
    nombre_sucursal character varying(128) COLLATE pg_catalog."default" NOT NULL,
    direccion_sucursal character varying(256) COLLATE pg_catalog."default" NOT NULL,
    telefono_sucursal character varying(15) COLLATE pg_catalog."default",
    correo_sucursal character varying(100) COLLATE pg_catalog."default",
    latitud_sucursal double precision NOT NULL,
    longitud_sucursal double precision NOT NULL,
    CONSTRAINT sucursales_pkey PRIMARY KEY (id_sucursal),
    CONSTRAINT unique_correo_sucursal UNIQUE (correo_sucursal)

        USING INDEX TABLESPACE ts_restaurante
)
WITH (
    OIDS = FALSE
)
TABLESPACE ts_restaurante;

ALTER TABLE public.sucursales
    OWNER to postgres;

-- Table: public.usuarios

-- DROP TABLE public.usuarios;

CREATE TABLE public.usuarios
(
    id_usuario bigint NOT NULL DEFAULT nextval('usuarios_id_usuario_seq'::regclass),
    nombre_usuario character varying(100) COLLATE pg_catalog."default" NOT NULL,
    correo_usuario character varying(70) COLLATE pg_catalog."default" NOT NULL,
    telefono_usuario character varying(15) COLLATE pg_catalog."default" NOT NULL,
    tipo_usuario character varying(15) COLLATE pg_catalog."default" NOT NULL,
    urlimagen_usuario character varying(256) COLLATE pg_catalog."default",
    contrasena_usuario character varying(128) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario),
    CONSTRAINT unique_email_tusuario UNIQUE (correo_usuario)

        USING INDEX TABLESPACE ts_restaurante,
    CONSTRAINT unique_telefono_tusuario UNIQUE (telefono_usuario)

        USING INDEX TABLESPACE ts_restaurante
)
WITH (
    OIDS = FALSE
)
TABLESPACE ts_restaurante;

ALTER TABLE public.usuarios
    OWNER to postgres;
COMMENT ON TABLE public.usuarios
    IS 'tabla que contiene los datos de usuarios del sistema restaurante';
    
    
 INSERT INTO public.usuarios (nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES ('Juan Rodríguez', 'juan@gmail.com', '9511445674', 'Usuario', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSe0vNwBzCizTViG60psEHv3i3QKHCROKd2aU5VxtpCw7pDKtM2', '123');
INSERT INTO public.usuarios ( nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES ('Sasha Grey', 'sasha@gmail.com', '9511319534', 'Usuario', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQJFV0P-bidU6f4f74wio094wlwIdyWCDYzd0Cui1NvffB5FjTl', '123');
INSERT INTO public.usuarios ( nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES ('David Alejandro Batista Violencia', 'joker@gmail.com', '9511123456', 'Usuario', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/03-the-joker-w1200-h630-1562679871.jpg?crop=0.526xw:1.00xh;0.238xw,0&resize=480:*', '123');
INSERT INTO public.usuarios ( nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES ('Pedro Juan Ramírez', 'pedito@gmail.com', '9511994567', 'Administrador', '', '123');
INSERT INTO public.usuarios ( nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES ('Roberto', 'rob@gmail.com', '123456789', 'Usuario', 'http://www.miimagen.com/imagen', 'abc');
INSERT INTO public.usuarios ( nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES ('Harry Potter', 'harry@gmail.com', '9511995645', 'Usuario', 'https://www.marketingdirecto.com/wp-content/uploads/2014/08/harry-potter-pic-movie-publicity-708841040-2632261.jpeg', '123');
INSERT INTO public.usuarios ( nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES ('José Luis Flores García 2', 'josefloresgarcia17@gmail.com', '9511310436', 'Administrador', 'https://media.licdn.com/dms/image/C4E03AQEcvg4CkWuljQ/profile-displayphoto-shrink_200_200/0?e=1576713600&v=beta&t=uATXHsPkTp-4E_mBNNTkb_TO7BO8ko4xbQefsk_JeUw', '123');
