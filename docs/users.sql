--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-12-02 20:39:29

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
-- TOC entry 199 (class 1259 OID 41016)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: ts_restaurante
--

CREATE TABLE public.usuarios (
    id_usuario bigint NOT NULL,
    nombre_usuario character varying(100) NOT NULL,
    correo_usuario character varying(70) NOT NULL,
    telefono_usuario character varying(15) NOT NULL,
    tipo_usuario character varying(15) NOT NULL,
    urlimagen_usuario character varying(256),
    contrasena_usuario character varying(128) NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE usuarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.usuarios IS 'tabla que contiene los datos de usuarios del sistema restaurante';


--
-- TOC entry 198 (class 1259 OID 41014)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 198
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 2714 (class 2604 OID 41019)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 2843 (class 0 OID 41016)
-- Dependencies: 199
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios (id_usuario, nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES (4, 'Juan Rodríguez', 'juan@gmail.com', '9511445674', 'Usuario', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSe0vNwBzCizTViG60psEHv3i3QKHCROKd2aU5VxtpCw7pDKtM2', '123');
INSERT INTO public.usuarios (id_usuario, nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES (5, 'Sasha Grey', 'sasha@gmail.com', '9511319534', 'Usuario', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQJFV0P-bidU6f4f74wio094wlwIdyWCDYzd0Cui1NvffB5FjTl', '123');
INSERT INTO public.usuarios (id_usuario, nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES (2, 'David Alejandro Batista Violencia', 'joker@gmail.com', '9511123456', 'Usuario', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/03-the-joker-w1200-h630-1562679871.jpg?crop=0.526xw:1.00xh;0.238xw,0&resize=480:*', '123');
INSERT INTO public.usuarios (id_usuario, nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES (10, 'Pedro Juan Ramírez', 'pedito@gmail.com', '9511994567', 'Administrador', '', '123');
INSERT INTO public.usuarios (id_usuario, nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES (11, 'Roberto', 'rob@gmail.com', '123456789', 'Usuario', 'http://www.miimagen.com/imagen', 'abc');
INSERT INTO public.usuarios (id_usuario, nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES (12, 'Harry Potter', 'harry@gmail.com', '9511995645', 'Usuario', 'https://www.marketingdirecto.com/wp-content/uploads/2014/08/harry-potter-pic-movie-publicity-708841040-2632261.jpeg', '123');
INSERT INTO public.usuarios (id_usuario, nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES (1, 'José Luis Flores García 2', 'josefloresgarcia17@gmail.com', '9511310436', 'Administrador', 'https://media.licdn.com/dms/image/C4E03AQEcvg4CkWuljQ/profile-displayphoto-shrink_200_200/0?e=1576713600&v=beta&t=uATXHsPkTp-4E_mBNNTkb_TO7BO8ko4xbQefsk_JeUw', '123');


--
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 198
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 12, true);


--
-- TOC entry 2716 (class 2606 OID 41023)
-- Name: usuarios unique_email_tusuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: ts_restaurante
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT unique_email_tusuario UNIQUE (correo_usuario);


--
-- TOC entry 2718 (class 2606 OID 41025)
-- Name: usuarios unique_telefono_tusuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: ts_restaurante
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT unique_telefono_tusuario UNIQUE (telefono_usuario);


SET default_tablespace = '';

--
-- TOC entry 2720 (class 2606 OID 41021)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


-- Completed on 2019-12-02 20:39:29

--
-- PostgreSQL database dump complete
--

