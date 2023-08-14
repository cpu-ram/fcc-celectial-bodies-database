--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Homebrew)
-- Dumped by pg_dump version 14.9 (Homebrew)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: petrstepanenko
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE universe OWNER TO petrstepanenko;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: petrstepanenko
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mass_in_suns numeric,
    morphology character varying(20),
    galaxy_group_id integer
);


ALTER TABLE public.galaxy OWNER TO petrstepanenko;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: petrstepanenko
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO petrstepanenko;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petrstepanenko
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: petrstepanenko
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    radius_in_miles integer,
    has_known_life boolean,
    reached_by_humankind boolean
);


ALTER TABLE public.moon OWNER TO petrstepanenko;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: petrstepanenko
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO petrstepanenko;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petrstepanenko
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: physical_constant; Type: TABLE; Schema: public; Owner: petrstepanenko
--

CREATE TABLE public.physical_constant (
    physical_constant_id integer NOT NULL,
    name character varying(40) NOT NULL,
    value numeric,
    unit_of_measurement character varying(40)
);


ALTER TABLE public.physical_constant OWNER TO petrstepanenko;

--
-- Name: physical_constant_physical_constant_id_seq; Type: SEQUENCE; Schema: public; Owner: petrstepanenko
--

CREATE SEQUENCE public.physical_constant_physical_constant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.physical_constant_physical_constant_id_seq OWNER TO petrstepanenko;

--
-- Name: physical_constant_physical_constant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petrstepanenko
--

ALTER SEQUENCE public.physical_constant_physical_constant_id_seq OWNED BY public.physical_constant.physical_constant_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: petrstepanenko
--

CREATE TABLE public.planet (
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer,
    radius_in_miles integer,
    has_known_life boolean,
    reached_by_humankind boolean,
    elvis_presley_number numeric(1,0),
    short_description text
);


ALTER TABLE public.planet OWNER TO petrstepanenko;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: petrstepanenko
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO petrstepanenko;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petrstepanenko
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: petrstepanenko
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth integer
);


ALTER TABLE public.spacecraft OWNER TO petrstepanenko;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: petrstepanenko
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO petrstepanenko;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petrstepanenko
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: petrstepanenko
--

CREATE TABLE public.star (
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer,
    mass_in_suns numeric,
    age numeric,
    radius_in_miles integer
);


ALTER TABLE public.star OWNER TO petrstepanenko;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: petrstepanenko
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO petrstepanenko;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petrstepanenko
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: physical_constant physical_constant_id; Type: DEFAULT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.physical_constant ALTER COLUMN physical_constant_id SET DEFAULT nextval('public.physical_constant_physical_constant_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: petrstepanenko
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Draco II', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Tuscana III', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Segue 1', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Hydrus I', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Sagittarius Dwarf Sphr SagDEG', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: petrstepanenko
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Deimos', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Phobos', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Mimas', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Tethys', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Dione', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Rhea', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Titan', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Hyperion', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Iapetus', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Phoebe', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Janus', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Epimetheus', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Helene', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Telesto', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Calypso', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Atlas', NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Prometheus', NULL, NULL, NULL, NULL);


--
-- Data for Name: physical_constant; Type: TABLE DATA; Schema: public; Owner: petrstepanenko
--

INSERT INTO public.physical_constant VALUES (1, 'PI', 3.14, NULL);
INSERT INTO public.physical_constant VALUES (2, 'free fall  acceleration', 9.8, 'm/(s^2)');
INSERT INTO public.physical_constant VALUES (3, 'mass of electron', 0.00000000000000000000000000000091, 'kg');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: petrstepanenko
--

INSERT INTO public.planet VALUES ('Mercury', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Venus', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Mars', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Jupiter', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Uranus', 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Neputne', 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Pluto', 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Saturn', 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Planet Nine', 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('CoRoT-7b', 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Gliese 581', 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('HD 209458b', 12, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: petrstepanenko
--

INSERT INTO public.spacecraft VALUES (1, 'Sputnik', NULL);
INSERT INTO public.spacecraft VALUES (2, 'WIND', NULL);
INSERT INTO public.spacecraft VALUES (3, 'SOHO', NULL);
INSERT INTO public.spacecraft VALUES (4, 'ACE', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: petrstepanenko
--

INSERT INTO public.star VALUES ('Sun', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Sirius', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Betelgeuse', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Arkturus', 4, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Proxima Centauri', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Alpha Centauri', 6, NULL, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petrstepanenko
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petrstepanenko
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: physical_constant_physical_constant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petrstepanenko
--

SELECT pg_catalog.setval('public.physical_constant_physical_constant_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petrstepanenko
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petrstepanenko
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petrstepanenko
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: physical_constant physical_constant_name_key; Type: CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.physical_constant
    ADD CONSTRAINT physical_constant_name_key UNIQUE (name);


--
-- Name: physical_constant physical_constant_pkey; Type: CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.physical_constant
    ADD CONSTRAINT physical_constant_pkey PRIMARY KEY (physical_constant_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon__name; Type: CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon__name UNIQUE (name);


--
-- Name: planet unique_planet__name; Type: CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet__name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: petrstepanenko
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

