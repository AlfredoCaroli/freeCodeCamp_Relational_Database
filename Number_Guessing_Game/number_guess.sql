--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    number_of_guesses integer,
    secret_number integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 35, 522, 521);
INSERT INTO public.games VALUES (2, 35, 19, 18);
INSERT INTO public.games VALUES (3, 36, 354, 353);
INSERT INTO public.games VALUES (4, 36, 320, 319);
INSERT INTO public.games VALUES (5, 35, 794, 791);
INSERT INTO public.games VALUES (6, 35, 51, 49);
INSERT INTO public.games VALUES (7, 35, 923, 922);
INSERT INTO public.games VALUES (8, 37, 674, 673);
INSERT INTO public.games VALUES (9, 37, 228, 227);
INSERT INTO public.games VALUES (10, 38, 854, 853);
INSERT INTO public.games VALUES (11, 38, 221, 220);
INSERT INTO public.games VALUES (12, 37, 951, 948);
INSERT INTO public.games VALUES (13, 37, 284, 282);
INSERT INTO public.games VALUES (14, 37, 516, 515);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (16, 'user_1721996774559');
INSERT INTO public.users VALUES (17, 'user_1721996774558');
INSERT INTO public.users VALUES (18, 'user_1721996776876');
INSERT INTO public.users VALUES (19, 'user_1721996776875');
INSERT INTO public.users VALUES (20, 'user_1721996779331');
INSERT INTO public.users VALUES (21, 'user_1721996779330');
INSERT INTO public.users VALUES (22, 'user_1721996828852');
INSERT INTO public.users VALUES (23, 'user_1721996828851');
INSERT INTO public.users VALUES (24, 'user_1721996841963');
INSERT INTO public.users VALUES (25, 'user_1721996841962');
INSERT INTO public.users VALUES (26, 'user_1721996843950');
INSERT INTO public.users VALUES (27, 'user_1721996843949');
INSERT INTO public.users VALUES (28, 'user_1721996863054');
INSERT INTO public.users VALUES (29, 'user_1721996863053');
INSERT INTO public.users VALUES (30, 'user_1721996880850');
INSERT INTO public.users VALUES (31, 'user_1721996880849');
INSERT INTO public.users VALUES (32, 'user_1721996898690');
INSERT INTO public.users VALUES (33, 'user_1721996898689');
INSERT INTO public.users VALUES (34, 'alfredo');
INSERT INTO public.users VALUES (35, 'user_1721997026440');
INSERT INTO public.users VALUES (36, 'user_1721997026439');
INSERT INTO public.users VALUES (37, 'user_1721997065331');
INSERT INTO public.users VALUES (38, 'user_1721997065330');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 14, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 38, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

