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
    name character varying(40) NOT NULL,
    constellation character varying(60) NOT NULL,
    description text,
    galaxy_type character varying(25)
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
    planet_id integer NOT NULL,
    name character varying(25) NOT NULL,
    orbital_period_in_days numeric(10,3),
    diameter_in_km integer,
    is_spherical boolean
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
    star_id integer NOT NULL,
    name character varying(25) NOT NULL,
    diameter_in_km integer,
    orbital_period_in_days numeric(10,4),
    in_habitable_zone boolean,
    planet_type_id integer NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(25) NOT NULL,
    constellation character varying(25),
    distance_in_ly numeric(15,8)
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda', 'One of the few galaxies visible to the unaided eye, it looks like a milky blur from Earth', 'barred spiral');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf Galaxy', 'Canis Major', 'This supposed small galaxy contains a relatively high percentage of red giants and is thought to contain an estimated one billion stars in all.', 'dwarf irregular');
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 'Cygnus', 'One of the strongest radio sources in the sky, images of the radio portion of the electromagnetic spectrum show two jets protruding in opposite directions from this galaxy''s center.', 'radio');
INSERT INTO public.galaxy VALUES (4, 'Maffei 1', 'Cassiopeia', 'It has a boxy shape and is made mainly of old metal-rich stars. It has a tiny blue nucleus in which stars continue to form. Like all large ellipticals it contains a significant population of globular clusters.', 'massive elliptical');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud(LMC)', 'Dorado/Mensa', 'LMC is visible as a faint "cloud" from the southern hemisphere of the Earth and from as far north as 20° N.', 'dwarf');
INSERT INTO public.galaxy VALUES (6, 'Milky Way Galaxy', 'Sagittarius', 'Estimated to contain 100–400 billion stars, it looks like a hazy band of light from Earth', 'barred spiral');
INSERT INTO public.galaxy VALUES (7, 'Messier 87(M87)', 'Virgo', 'One of the largest and most massive galaxies in the local universe, it has a large population of globular clusters', 'supergiant elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 29.500, 3474, true);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 0.319, NULL, false);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 1.263, NULL, false);
INSERT INTO public.moon VALUES (4, 5, 'Europa', 3.551, 3100, true);
INSERT INTO public.moon VALUES (5, 5, 'Ganymede', 7.155, 5270, true);
INSERT INTO public.moon VALUES (6, 5, 'Callisto', 16.689, 4821, true);
INSERT INTO public.moon VALUES (7, 5, 'lo', 1.769, 3474, true);
INSERT INTO public.moon VALUES (8, 6, 'Enceladus', 1.370, 500, true);
INSERT INTO public.moon VALUES (9, 6, 'Titan', 15.945, 5150, true);
INSERT INTO public.moon VALUES (10, 6, 'Rhea', 4.518, 1528, true);
INSERT INTO public.moon VALUES (11, 6, 'Dione', 2.737, 1122, true);
INSERT INTO public.moon VALUES (12, 6, 'Epimetheus', 0.694, NULL, false);
INSERT INTO public.moon VALUES (13, 6, 'Prometheus', 0.613, NULL, false);
INSERT INTO public.moon VALUES (14, 6, 'Mimas', 0.942, 396, true);
INSERT INTO public.moon VALUES (15, 6, 'Janus', 0.695, NULL, false);
INSERT INTO public.moon VALUES (16, 6, 'Tethys', 1.888, 1066, true);
INSERT INTO public.moon VALUES (17, 7, 'Titania', 8.706, 1578, true);
INSERT INTO public.moon VALUES (18, 7, 'Oberon', 13.463, 1523, true);
INSERT INTO public.moon VALUES (19, 7, 'Ariel', 2.520, 1160, true);
INSERT INTO public.moon VALUES (20, 7, 'Umbriel', 4.144, 210, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 4880, 87.9700, false, 1);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 12104, 224.7000, false, 1);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 12756, 365.2500, true, 1);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 6779, 686.9800, true, 1);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 142984, 398.8800, false, 2);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 120536, 379.0800, false, 2);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 25362, 369.6600, false, 3);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 49528, 367.4900, false, 3);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', 2370, 366.7300, false, 4);
INSERT INTO public.planet VALUES (10, 2, 'Kepler-452b', NULL, 385.0000, true, 5);
INSERT INTO public.planet VALUES (11, 6, 'Kepler-442b', NULL, 112.3053, true, 5);
INSERT INTO public.planet VALUES (12, 5, 'TOI-715 b', NULL, 19.3000, true, 5);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'terrestrial', 'a rocky planet that is composed primarily of silicate, rocks or metals');
INSERT INTO public.planet_type VALUES (2, 'gas giant', 'a giant planet composed mainly of hydrogen and helium');
INSERT INTO public.planet_type VALUES (3, 'ice giant', 'a giant planet composed mainly of elements heavier than hydrogen and helium, such as oxygen, carbon, nitrogen, and sulfur');
INSERT INTO public.planet_type VALUES (4, 'dwarf', 'a small planetary-mass object that is in direct orbit around the Sun, massive enough to be gravitationally rounded, but insufficient to achieve orbital dominance');
INSERT INTO public.planet_type VALUES (5, 'super-Earth exoplanet', 'a planet outside the Solar System with a mass higher than Earth but substantially lower than the Solar System''s ice giants');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 6, 'Sun', NULL, 0.00001582);
INSERT INTO public.star VALUES (2, 6, 'Kepler-452', 'Cygnus', 1810.00000000);
INSERT INTO public.star VALUES (3, 6, 'TRAPPIST-1', 'Aquarius', 40.66000000);
INSERT INTO public.star VALUES (4, 6, 'HD 10180', 'Hydrus', 127.00000000);
INSERT INTO public.star VALUES (5, 6, 'TOI-1136', 'Draco', 276.00000000);
INSERT INTO public.star VALUES (6, 6, 'HD 219134', 'Cassiopeia', 21.00000000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 5, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

