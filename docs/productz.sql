--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-12-02 20:38:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = ts_restaurante;

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 41001)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: ts_restaurante
--

CREATE TABLE public.productos (
    id_producto bigint DEFAULT nextval('public.productos_id_producto_seq'::regclass) NOT NULL,
    nombre_producto character varying(256) NOT NULL,
    descripcion_producto character varying(256) NOT NULL,
    categoria_producto character varying(128) NOT NULL,
    urlimagen_producto character varying(256),
    cantidad_producto bigint NOT NULL,
    precio_producto numeric
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE productos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.productos IS 'Tabla que contiene los productos del restaurante';


--
-- TOC entry 2842 (class 0 OID 41001)
-- Dependencies: 197
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos (id_producto, nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES (16, 'Refresco coca-cola lata 355 ml', 'Coca cola de lata 355 ml.', 'Bebidas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSSeZ6NeRbhuXH1rGQhoLQa4HgRWNdlmJ90pr_81Yv5KtnpHB_S', 123, 20);
INSERT INTO public.productos (id_producto, nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES (12, 'Torta de chorizo con quesillo', ' Chorizo, quesillo, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera', 'Tortas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRU6nh5SszzuCe5pEuFvizJY2SWJ6j3KbOhMAH6Bi8l0yL9VA3Y', 13, 35);
INSERT INTO public.productos (id_producto, nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES (11, 'Torta de cecina con quesillo', ' Cecina, quesillo, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera', 'Tortas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTOwoECXzln8j_1WfTw_Yj9_EjS4TPDxaImrWbwwsrUpjLWn332', 12, 35);
INSERT INTO public.productos (id_producto, nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES (25, 'Torta de milanesa doble', 'La misma torta de milanesa, con doble carne y más deliciosa', 'Tortas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ7Z_wDcmyOAG28exQSX89-S0FBg92OcIfxjJMSHSM1cKIi2OHq', 20, 40);
INSERT INTO public.productos (id_producto, nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES (10, 'Torta de jamón con quesillo', ' Jamón, quesillo, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera', 'Tortas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvxVMKw-CLP11qqKTQpMUuNW4ezWdC3xCkDvT0G01YnVN-hKfy', 15, 35.0);
INSERT INTO public.productos (id_producto, nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES (9, 'Torta de chorizo', ' Chorizo, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera.', 'Tortas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTYq6n0OZOYet_nrjQMf5xPEc-Yo95OIrO9Ig2KJbXcYrMct0-G', 13, 30);
INSERT INTO public.productos (id_producto, nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto, precio_producto) VALUES (7, 'Torta de jamón', ' Jamon, mayonesa, lechuga, tomate, aguacate entre dos panes tipo telera', 'Tortas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSNbuKhLuoC8hK7qEejhrZIUP5VisUHnctq0SMku3og9p2xzMy2', 15, 30);


--
-- TOC entry 2716 (class 2606 OID 41011)
-- Name: productos id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: ts_restaurante
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT id_unique UNIQUE (id_producto) INCLUDE (id_producto);


--
-- TOC entry 2718 (class 2606 OID 41013)
-- Name: productos pro_name_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: ts_restaurante
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT pro_name_uniq UNIQUE (nombre_producto) INCLUDE (nombre_producto);


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 2718
-- Name: CONSTRAINT pro_name_uniq ON productos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pro_name_uniq ON public.productos IS 'constraint para hacer unico el nombre del producto';


SET default_tablespace = '';

--
-- TOC entry 2720 (class 2606 OID 41009)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);


-- Completed on 2019-12-02 20:38:32

--
-- PostgreSQL database dump complete
--

