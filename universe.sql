--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    known_from_year integer,
    likes integer,
    is_confirmed boolean,
    is_blue boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    known_from_year integer,
    likes integer,
    is_confirmed boolean,
    is_blue boolean,
    description text,
    area_in_km numeric(10,2),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    known_from_year integer,
    likes integer,
    is_confirmed boolean,
    is_blue boolean,
    description text,
    area_in_km numeric(10,2),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: rocket; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rocket (
    rocket_id integer NOT NULL,
    name character varying(30) NOT NULL,
    known_from_year integer,
    likes integer,
    is_confirmed boolean,
    is_blue boolean,
    description text
);


ALTER TABLE public.rocket OWNER TO freecodecamp;

--
-- Name: rocket_rocket_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rocket_rocket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rocket_rocket_id_seq OWNER TO freecodecamp;

--
-- Name: rocket_rocket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rocket_rocket_id_seq OWNED BY public.rocket.rocket_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    known_from_year integer,
    likes integer,
    is_confirmed boolean,
    is_blue boolean,
    description text,
    area_in_km numeric(10,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: rocket rocket_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket ALTER COLUMN rocket_id SET DEFAULT nextval('public.rocket_rocket_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'A', 1960, 10, true, false);
INSERT INTO public.galaxy VALUES (2, 'B', 1800, 136, true, true);
INSERT INTO public.galaxy VALUES (3, 'C', 2002, 336, false, false);
INSERT INTO public.galaxy VALUES (4, 'D', 1960, 10, true, false);
INSERT INTO public.galaxy VALUES (5, 'E', 1200, 130, true, true);
INSERT INTO public.galaxy VALUES (6, 'F', 2000, 3, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'K1', NULL, 10, NULL, NULL, 'ksiezyc 1', NULL, 3);
INSERT INTO public.moon VALUES (2, 'K2', NULL, 15, NULL, NULL, 'ksiezyc 2', NULL, 2);
INSERT INTO public.moon VALUES (3, 'K3', NULL, 25, NULL, NULL, 'ksiezyc 3', NULL, 1);
INSERT INTO public.moon VALUES (24, 'K04', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (25, 'K05', NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (26, 'K06', NULL, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (27, 'K07', NULL, NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (28, 'K08', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (29, 'K09', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (30, 'K10', NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (31, 'K11', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (32, 'K12', NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (33, 'K13', NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (34, 'K14', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (35, 'K15', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (36, 'K16', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (37, 'K17', NULL, NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO public.moon VALUES (38, 'K18', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (39, 'K19', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (40, 'K20', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (41, 'K21', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (42, 'K22', NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (43, 'K23', NULL, NULL, NULL, NULL, NULL, NULL, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mars', 1000, 120, true, false, 'opis 1', 30000.00, 1);
INSERT INTO public.planet VALUES (2, 'Jowisz', 1200, 340, true, false, 'opis 2', 17000.00, 3);
INSERT INTO public.planet VALUES (3, 'Saturn', 1901, 3, true, false, 'opis 3', 663000.00, 2);
INSERT INTO public.planet VALUES (4, 'P4', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'P5', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (6, 'P6', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (7, 'P7', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'P8', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (9, 'P9', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (10, 'P10', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (11, 'P11', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (12, 'P12', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (13, 'P13', NULL, NULL, NULL, NULL, NULL, NULL, 1);


--
-- Data for Name: rocket; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rocket VALUES (1, 'rakieta 1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.rocket VALUES (2, 'rakieta 2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.rocket VALUES (3, 'rakieta 3', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'S1', 2003, 300, true, false, 'czerwona gwiazda', 30.40, 1);
INSERT INTO public.star VALUES (2, 'S2', 2010, 200, true, true, 'fioletowy olbrzym', 7777.90, 2);
INSERT INTO public.star VALUES (3, 'S3', 1986, 123, false, false, 'piaszczysta', 899.12, 3);
INSERT INTO public.star VALUES (4, 'S4', 603, 30, true, false, 'opis 4', 30.40, 3);
INSERT INTO public.star VALUES (5, 'S5', 110, 1900, true, true, 'opis 5', 7777.90, 3);
INSERT INTO public.star VALUES (6, 'S6', 6, 12, false, false, 'opis 6', 899.12, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 43, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: rocket_rocket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rocket_rocket_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: rocket rocket_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket
    ADD CONSTRAINT rocket_name_key UNIQUE (name);


--
-- Name: rocket rocket_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket
    ADD CONSTRAINT rocket_pkey PRIMARY KEY (rocket_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

