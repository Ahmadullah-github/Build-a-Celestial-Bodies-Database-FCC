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
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    volume numeric(2,2)
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
-- Name: in_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.in_galaxy (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(50),
    in_galaxy_id integer NOT NULL
);


ALTER TABLE public.in_galaxy OWNER TO freecodecamp;

--
-- Name: in_galaxy_in_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.in_galaxy_in_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.in_galaxy_in_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: in_galaxy_in_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.in_galaxy_in_galaxy_id_seq OWNED BY public.in_galaxy.in_galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    volume numeric(2,2),
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    volume numeric(2,2),
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    volume numeric(2,2),
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
-- Name: in_galaxy in_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.in_galaxy ALTER COLUMN in_galaxy_id SET DEFAULT nextval('public.in_galaxy_in_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral galaxy nearest to Milky Way', 10000, 2537000, false, 0.24);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Our home galaxy with spiral structure', 13600, 0, true, 0.67);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in Local Group', 8500, 3200000, false, 0.92);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Peculiar elliptical galaxy with dark dust lane', 12000, 13700000, false, 0.45);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Classic spiral galaxy with prominent arms', 9200, 23160000, false, 0.78);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral galaxy with bright nucleus and dust lane', 13250, 29350000, false, 0.33);


--
-- Data for Name: in_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.in_galaxy VALUES (1, 3, 'first', 1);
INSERT INTO public.in_galaxy VALUES (2, 2, 'second', 2);
INSERT INTO public.in_galaxy VALUES (1, 1, 'third', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earths natural satellite', 4500, 384400, false, 0.21, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A small moon of Mars', 4500, 9376, false, 0.01, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'A small outer moon of Mars', 4500, 23460, false, 0.02, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanically active moon of Jupiter', 4500, 628000, false, 0.25, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon of Jupiter, potential for life', 4500, 670900, false, 0.12, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the solar system', 4500, 1070400, false, 0.45, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon of Jupiter', 4500, 1882700, false, 0.34, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn largest moon with an atmosphere', 4500, 1221850, false, 0.56, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Second-largest moon of Saturn', 4500, 527040, false, 0.22, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'A moon with a two-tone coloration', 4500, 3561300, false, 0.18, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'An icy moon of Saturn', 4500, 377400, false, 0.07, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 'A heavily cratered moon of Saturn', 4500, 294660, false, 0.06, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'An icy moon with water plumes', 4500, 238040, false, 0.05, 6);
INSERT INTO public.moon VALUES (14, 'Oberon', 'An outer moon of Uranus', 4500, 5840000, false, 0.03, 7);
INSERT INTO public.moon VALUES (15, 'Titania', 'Largest moon of Uranus', 4500, 4363000, false, 0.03, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'A dark moon of Uranus', 4500, 2660000, false, 0.02, 7);
INSERT INTO public.moon VALUES (17, 'Miranda', 'An unusual moon of Uranus', 4500, 1293900, false, 0.01, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 'Largest moon of Neptune', 4500, 3548000, false, 0.22, 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 'An irregularly shaped moon of Neptune', 4500, 5514000, false, 0.03, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 'Largest moon of Pluto', 4500, 19640000, false, 0.01, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet with diverse ecosystems', 4543, 0, true, 0.95, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Red planet with polar ice caps', 4603, 225, false, 0.15, 1);
INSERT INTO public.planet VALUES (3, 'Kepler-186f', 'Rocky super-Earth in habitable zone', 4000, 582, false, 0.45, 2);
INSERT INTO public.planet VALUES (4, 'Proxima b', 'Potentially habitable exoplanet', 4850, 4, false, 0.31, 4);
INSERT INTO public.planet VALUES (5, 'TRAPPIST-1e', 'Earth-sized planet in TRAPPIST system', 7600, 39, false, 0.92, 3);
INSERT INTO public.planet VALUES (6, 'HD 40307g', 'Super-Earth with potential atmosphere', 4200, 42, false, 0.78, 5);
INSERT INTO public.planet VALUES (7, 'Kepler-442b', 'Super-Earth in habitable zone', 2800, 1206, false, 0.56, 6);
INSERT INTO public.planet VALUES (8, 'M31-P1', 'Gas giant in Andromeda', 3500, 2537080, false, 0.89, 2);
INSERT INTO public.planet VALUES (9, 'Centauri-P2', 'Rocky planet in Alpha Centauri', 5900, 4, false, 0.23, 3);
INSERT INTO public.planet VALUES (10, 'Whirl-Ex1', 'Exotic ice planet in M51', 8200, 23160200, false, 0.67, 5);
INSERT INTO public.planet VALUES (11, 'Sombrero-G1', 'Gas giant with ring system', 11500, 29350200, false, 0.84, 6);
INSERT INTO public.planet VALUES (12, 'Tri-P3', 'Desert planet in Triangulum', 2900, 3200150, false, 0.44, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Brightest star in Earth night sky', 242, 9, false, 0.45, 2);
INSERT INTO public.star VALUES (2, 'M31-V1', 'Variable star in Andromeda', 150, 2537050, false, 0.78, 1);
INSERT INTO public.star VALUES (3, 'Triangulum-X1', 'Luminous blue variable in M33', 3200, 3200100, false, 0.92, 3);
INSERT INTO public.star VALUES (4, 'Centaurus-B2', 'Binary star system in Centaurus A', 5600, 13700200, false, 0.55, 4);
INSERT INTO public.star VALUES (5, 'Whirlpool-S3', 'Supergiant in M51', 8900, 23160100, false, 0.67, 5);
INSERT INTO public.star VALUES (6, 'Sombrero-N1', 'Neutron star in Sombrero galaxy', 12500, 29350150, false, 0.34, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: in_galaxy_in_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.in_galaxy_in_galaxy_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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
-- Name: in_galaxy in_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.in_galaxy
    ADD CONSTRAINT in_galaxy_name_key UNIQUE (name);


--
-- Name: in_galaxy in_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.in_galaxy
    ADD CONSTRAINT in_galaxy_pkey PRIMARY KEY (in_galaxy_id);


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

