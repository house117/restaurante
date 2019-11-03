CREATE DATABASE db_restaurante
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE db_restaurante
    IS 'Base de datos para el sistema de restaurante';

CREATE SEQUENCE productos_id_producto_seq;
CREATE TABLE public.productos
(
    id_producto bigint NOT NULL DEFAULT nextval('productos_id_producto_seq'::regclass),
    nombre_producto character varying(256) COLLATE pg_catalog."default" NOT NULL,
    descripcion_producto character varying(256) COLLATE pg_catalog."default" NOT NULL,
    categoria_producto character varying(128) COLLATE pg_catalog."default" NOT NULL,
	urlimagen_producto character varying(256) COLLATE pg_catalog."default",
    cantidad_producto bigint NOT NULL,
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
    
    
 --INSERTAR DATOS DE PRUEBA  
 INSERT into productos (nombre_producto, descripcion_producto, categoria_producto, cantidad_producto) VALUES('Torta de jamón', ' Jamón, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera','Tortas',15);
 INSERT into productos (nombre_producto, descripcion_producto, categoria_producto, cantidad_producto) VALUES('Torta de cecina', ' Cecina, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera','Tortas',15);
INSERT into productos (nombre_producto, descripcion_producto, categoria_producto, cantidad_producto) VALUES('Torta de chorizo', ' Chorizo, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera','Tortas',15);
 INSERT into productos (nombre_producto, descripcion_producto, categoria_producto, cantidad_producto) VALUES('Torta de jamón con quesillo', ' Jamón, quesillo, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera','Tortas',15);
 INSERT into productos (nombre_producto, descripcion_producto, categoria_producto, cantidad_producto) VALUES('Torta de cecina con quesillo', ' Cecina, quesillo, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera','Tortas',15);
INSERT into productos (nombre_producto, descripcion_producto, categoria_producto, cantidad_producto) VALUES('Torta de chorizo con quesillo', ' Chorizo, quesillo, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera','Tortas',15);