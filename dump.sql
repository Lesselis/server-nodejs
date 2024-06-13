--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE tsslesselis;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:i3DZi+o+3yEZSTRa0EUteA==$0zlXBF1c95Ak+Urk2Zd/237szoA0Qq0i6s0prt4ddxk=:ow0lj50gZddKFz88pLh0BJPaZX3sJIl/3GrfwvyMC0g=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: classificacao_tematica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classificacao_tematica (
    id_classificacao integer NOT NULL,
    id_livro integer NOT NULL,
    assunto_principal character varying(255) NOT NULL,
    subtema character varying(255),
    palavra_chave character varying(255),
    codigo_classificacao character varying(50),
    genero_literario character varying(50) NOT NULL
);


ALTER TABLE public.classificacao_tematica OWNER TO postgres;

--
-- Name: classificacao_tematica_id_classificacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classificacao_tematica_id_classificacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classificacao_tematica_id_classificacao_seq OWNER TO postgres;

--
-- Name: classificacao_tematica_id_classificacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classificacao_tematica_id_classificacao_seq OWNED BY public.classificacao_tematica.id_classificacao;


--
-- Name: conteudo_textual; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conteudo_textual (
    id_conteudo integer NOT NULL,
    id_livro integer NOT NULL,
    estrutura text,
    narrativa text,
    personagens text,
    temas text,
    linguagem text
);


ALTER TABLE public.conteudo_textual OWNER TO postgres;

--
-- Name: conteudo_textual_id_conteudo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conteudo_textual_id_conteudo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.conteudo_textual_id_conteudo_seq OWNER TO postgres;

--
-- Name: conteudo_textual_id_conteudo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conteudo_textual_id_conteudo_seq OWNED BY public.conteudo_textual.id_conteudo;


--
-- Name: livro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livro (
    id_livro integer NOT NULL,
    titulo character varying(255) NOT NULL,
    autor character varying(255) NOT NULL,
    edicao smallint NOT NULL,
    data_publicacao date NOT NULL,
    editora character varying(255) NOT NULL,
    local_publicacao character varying(255) NOT NULL,
    idioma character varying(255) NOT NULL,
    isbn character varying(13) NOT NULL,
    paginas smallint NOT NULL,
    formato character varying(50) NOT NULL,
    tipo_encadernacao character varying(50) NOT NULL,
    material character varying(50) NOT NULL,
    ilustracoes boolean NOT NULL
);


ALTER TABLE public.livro OWNER TO postgres;

--
-- Name: livro_id_livro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.livro_id_livro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.livro_id_livro_seq OWNER TO postgres;

--
-- Name: livro_id_livro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.livro_id_livro_seq OWNED BY public.livro.id_livro;


--
-- Name: classificacao_tematica id_classificacao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classificacao_tematica ALTER COLUMN id_classificacao SET DEFAULT nextval('public.classificacao_tematica_id_classificacao_seq'::regclass);


--
-- Name: conteudo_textual id_conteudo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conteudo_textual ALTER COLUMN id_conteudo SET DEFAULT nextval('public.conteudo_textual_id_conteudo_seq'::regclass);


--
-- Name: livro id_livro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livro ALTER COLUMN id_livro SET DEFAULT nextval('public.livro_id_livro_seq'::regclass);


--
-- Data for Name: classificacao_tematica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classificacao_tematica (id_classificacao, id_livro, assunto_principal, subtema, palavra_chave, codigo_classificacao, genero_literario) FROM stdin;
\.


--
-- Data for Name: conteudo_textual; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conteudo_textual (id_conteudo, id_livro, estrutura, narrativa, personagens, temas, linguagem) FROM stdin;
\.


--
-- Data for Name: livro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.livro (id_livro, titulo, autor, edicao, data_publicacao, editora, local_publicacao, idioma, isbn, paginas, formato, tipo_encadernacao, material, ilustracoes) FROM stdin;
\.


--
-- Name: classificacao_tematica_id_classificacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classificacao_tematica_id_classificacao_seq', 1, false);


--
-- Name: conteudo_textual_id_conteudo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conteudo_textual_id_conteudo_seq', 1, false);


--
-- Name: livro_id_livro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.livro_id_livro_seq', 1, false);


--
-- Name: classificacao_tematica classificacao_tematica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classificacao_tematica
    ADD CONSTRAINT classificacao_tematica_pkey PRIMARY KEY (id_classificacao);


--
-- Name: conteudo_textual conteudo_textual_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conteudo_textual
    ADD CONSTRAINT conteudo_textual_pkey PRIMARY KEY (id_conteudo);


--
-- Name: livro livro_isbn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_isbn_key UNIQUE (isbn);


--
-- Name: livro livro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_pkey PRIMARY KEY (id_livro);


--
-- Name: classificacao_tematica classificacao_tematica_id_livro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classificacao_tematica
    ADD CONSTRAINT classificacao_tematica_id_livro_fkey FOREIGN KEY (id_livro) REFERENCES public.livro(id_livro);


--
-- Name: conteudo_textual conteudo_textual_id_livro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conteudo_textual
    ADD CONSTRAINT conteudo_textual_id_livro_fkey FOREIGN KEY (id_livro) REFERENCES public.livro(id_livro);


--
-- PostgreSQL database dump complete
--

--
-- Database "tsslesselis" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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

--
-- Name: tsslesselis; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE tsslesselis WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE tsslesselis OWNER TO postgres;

\connect tsslesselis

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autores (
    autor_id integer NOT NULL,
    nome character varying(255) NOT NULL,
    nacionalidade character varying(255) NOT NULL,
    biografia text
);


ALTER TABLE public.autores OWNER TO postgres;

--
-- Name: autores_autor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autores_autor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.autores_autor_id_seq OWNER TO postgres;

--
-- Name: autores_autor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autores_autor_id_seq OWNED BY public.autores.autor_id;


--
-- Name: enredo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enredo (
    enredo_id integer NOT NULL,
    obra_id integer NOT NULL,
    descricao text
);


ALTER TABLE public.enredo OWNER TO postgres;

--
-- Name: enredo_enredo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enredo_enredo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enredo_enredo_id_seq OWNER TO postgres;

--
-- Name: enredo_enredo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enredo_enredo_id_seq OWNED BY public.enredo.enredo_id;


--
-- Name: estilo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estilo (
    estilo_id integer NOT NULL,
    obra_id integer NOT NULL,
    descricao text
);


ALTER TABLE public.estilo OWNER TO postgres;

--
-- Name: estilo_estilo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estilo_estilo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estilo_estilo_id_seq OWNER TO postgres;

--
-- Name: estilo_estilo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estilo_estilo_id_seq OWNED BY public.estilo.estilo_id;


--
-- Name: linguagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.linguagem (
    linguagem_id integer NOT NULL,
    obra_id integer NOT NULL,
    descricao text
);


ALTER TABLE public.linguagem OWNER TO postgres;

--
-- Name: linguagem_linguagem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.linguagem_linguagem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.linguagem_linguagem_id_seq OWNER TO postgres;

--
-- Name: linguagem_linguagem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.linguagem_linguagem_id_seq OWNED BY public.linguagem.linguagem_id;


--
-- Name: obras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obras (
    obra_id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    autor_id integer NOT NULL,
    ano_publicacao integer NOT NULL,
    genero character varying(255) NOT NULL,
    idioma character varying(255) NOT NULL,
    resumo text
);


ALTER TABLE public.obras OWNER TO postgres;

--
-- Name: obras_obra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.obras_obra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.obras_obra_id_seq OWNER TO postgres;

--
-- Name: obras_obra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.obras_obra_id_seq OWNED BY public.obras.obra_id;


--
-- Name: palavras_chave; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.palavras_chave (
    palavra_chave_id integer NOT NULL,
    obra_id integer NOT NULL,
    palavra_chave character varying(255) NOT NULL
);


ALTER TABLE public.palavras_chave OWNER TO postgres;

--
-- Name: palavras_chave_palavra_chave_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.palavras_chave_palavra_chave_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.palavras_chave_palavra_chave_id_seq OWNER TO postgres;

--
-- Name: palavras_chave_palavra_chave_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.palavras_chave_palavra_chave_id_seq OWNED BY public.palavras_chave.palavra_chave_id;


--
-- Name: personagens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personagens (
    personagem_id integer NOT NULL,
    nome character varying(255) NOT NULL,
    obra_id integer NOT NULL,
    descricao text
);


ALTER TABLE public.personagens OWNER TO postgres;

--
-- Name: personagens_personagem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personagens_personagem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personagens_personagem_id_seq OWNER TO postgres;

--
-- Name: personagens_personagem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personagens_personagem_id_seq OWNED BY public.personagens.personagem_id;


--
-- Name: temas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temas (
    tema_id integer NOT NULL,
    obra_id integer NOT NULL,
    descricao text
);


ALTER TABLE public.temas OWNER TO postgres;

--
-- Name: temas_tema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temas_tema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temas_tema_id_seq OWNER TO postgres;

--
-- Name: temas_tema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temas_tema_id_seq OWNED BY public.temas.tema_id;


--
-- Name: autores autor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores ALTER COLUMN autor_id SET DEFAULT nextval('public.autores_autor_id_seq'::regclass);


--
-- Name: enredo enredo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enredo ALTER COLUMN enredo_id SET DEFAULT nextval('public.enredo_enredo_id_seq'::regclass);


--
-- Name: estilo estilo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilo ALTER COLUMN estilo_id SET DEFAULT nextval('public.estilo_estilo_id_seq'::regclass);


--
-- Name: linguagem linguagem_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.linguagem ALTER COLUMN linguagem_id SET DEFAULT nextval('public.linguagem_linguagem_id_seq'::regclass);


--
-- Name: obras obra_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obras ALTER COLUMN obra_id SET DEFAULT nextval('public.obras_obra_id_seq'::regclass);


--
-- Name: palavras_chave palavra_chave_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palavras_chave ALTER COLUMN palavra_chave_id SET DEFAULT nextval('public.palavras_chave_palavra_chave_id_seq'::regclass);


--
-- Name: personagens personagem_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagens ALTER COLUMN personagem_id SET DEFAULT nextval('public.personagens_personagem_id_seq'::regclass);


--
-- Name: temas tema_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas ALTER COLUMN tema_id SET DEFAULT nextval('public.temas_tema_id_seq'::regclass);


--
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autores (autor_id, nome, nacionalidade, biografia) FROM stdin;
\.


--
-- Data for Name: enredo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enredo (enredo_id, obra_id, descricao) FROM stdin;
\.


--
-- Data for Name: estilo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estilo (estilo_id, obra_id, descricao) FROM stdin;
\.


--
-- Data for Name: linguagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.linguagem (linguagem_id, obra_id, descricao) FROM stdin;
\.


--
-- Data for Name: obras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.obras (obra_id, titulo, autor_id, ano_publicacao, genero, idioma, resumo) FROM stdin;
\.


--
-- Data for Name: palavras_chave; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.palavras_chave (palavra_chave_id, obra_id, palavra_chave) FROM stdin;
\.


--
-- Data for Name: personagens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personagens (personagem_id, nome, obra_id, descricao) FROM stdin;
\.


--
-- Data for Name: temas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temas (tema_id, obra_id, descricao) FROM stdin;
\.


--
-- Name: autores_autor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autores_autor_id_seq', 1, false);


--
-- Name: enredo_enredo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enredo_enredo_id_seq', 1, false);


--
-- Name: estilo_estilo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estilo_estilo_id_seq', 1, false);


--
-- Name: linguagem_linguagem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.linguagem_linguagem_id_seq', 1, false);


--
-- Name: obras_obra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.obras_obra_id_seq', 1, false);


--
-- Name: palavras_chave_palavra_chave_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.palavras_chave_palavra_chave_id_seq', 1, false);


--
-- Name: personagens_personagem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personagens_personagem_id_seq', 1, false);


--
-- Name: temas_tema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temas_tema_id_seq', 1, false);


--
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (autor_id);


--
-- Name: enredo enredo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enredo
    ADD CONSTRAINT enredo_pkey PRIMARY KEY (enredo_id);


--
-- Name: estilo estilo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilo
    ADD CONSTRAINT estilo_pkey PRIMARY KEY (estilo_id);


--
-- Name: linguagem linguagem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.linguagem
    ADD CONSTRAINT linguagem_pkey PRIMARY KEY (linguagem_id);


--
-- Name: obras obras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obras
    ADD CONSTRAINT obras_pkey PRIMARY KEY (obra_id);


--
-- Name: palavras_chave palavras_chave_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palavras_chave
    ADD CONSTRAINT palavras_chave_pkey PRIMARY KEY (palavra_chave_id);


--
-- Name: personagens personagens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagens
    ADD CONSTRAINT personagens_pkey PRIMARY KEY (personagem_id);


--
-- Name: temas temas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas
    ADD CONSTRAINT temas_pkey PRIMARY KEY (tema_id);


--
-- Name: enredo enredo_obra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enredo
    ADD CONSTRAINT enredo_obra_id_fkey FOREIGN KEY (obra_id) REFERENCES public.obras(obra_id);


--
-- Name: estilo estilo_obra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilo
    ADD CONSTRAINT estilo_obra_id_fkey FOREIGN KEY (obra_id) REFERENCES public.obras(obra_id);


--
-- Name: linguagem linguagem_obra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.linguagem
    ADD CONSTRAINT linguagem_obra_id_fkey FOREIGN KEY (obra_id) REFERENCES public.obras(obra_id);


--
-- Name: obras obras_autor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obras
    ADD CONSTRAINT obras_autor_id_fkey FOREIGN KEY (autor_id) REFERENCES public.autores(autor_id);


--
-- Name: palavras_chave palavras_chave_obra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palavras_chave
    ADD CONSTRAINT palavras_chave_obra_id_fkey FOREIGN KEY (obra_id) REFERENCES public.obras(obra_id);


--
-- Name: personagens personagens_obra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagens
    ADD CONSTRAINT personagens_obra_id_fkey FOREIGN KEY (obra_id) REFERENCES public.obras(obra_id);


--
-- Name: temas temas_obra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas
    ADD CONSTRAINT temas_obra_id_fkey FOREIGN KEY (obra_id) REFERENCES public.obras(obra_id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

