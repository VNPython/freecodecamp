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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_asterism boolean,
    has_pattern boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    g_desc character varying(150),
    g_lightyears_from_earth integer,
    g_age_in_billion numeric(4,2),
    constellation_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    m_desc character varying(150) NOT NULL,
    m_age_in_million integer,
    m_lightyears_from_earth integer,
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
    name character varying(50) NOT NULL,
    p_desc character varying(150),
    p_age_in_million integer NOT NULL,
    p_lightyears_from_earth integer NOT NULL,
    has_moon boolean NOT NULL,
    num_of_moon integer NOT NULL,
    planet_type character varying(50),
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    p_observation text
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
    name character varying(50) NOT NULL,
    s_desc character varying(150),
    s_age_in_billion numeric(4,2),
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Ursa Major', NULL, NULL);
INSERT INTO public.constellation VALUES (2, 'Coma Berenices', NULL, NULL);
INSERT INTO public.constellation VALUES (3, 'Sagittarius', NULL, NULL);
INSERT INTO public.constellation VALUES (4, 'Centaurus', NULL, NULL);
INSERT INTO public.constellation VALUES (5, 'Virgo', NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 'Appearance is similar to a Cigar', 120000000, 13.30, 1);
INSERT INTO public.galaxy VALUES (3, 'Mice Galaxy', 'Appearance is similar to a mouse', 300000000, 13.00, 2);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Galaxy that contains our Earth', 100000, 13.61, 3);
INSERT INTO public.galaxy VALUES (5, 'Backward Galaxy', 'It appear to rotate backward', NULL, NULL, 4);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', 'It appear like eye being punched or like evil eye', NULL, NULL, 2);
INSERT INTO public.galaxy VALUES (7, 'Butterfly Galaxy', 'It has shape like a butterfly', NULL, NULL, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Traditional Moon', 'Earths Moon', NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Dying Moon', NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Uranus', 'Ice Moon', NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, 'Ariel', 'Moon from Uranus', NULL, NULL, 2);
INSERT INTO public.moon VALUES (5, 'Titania', 'Moon from Uranus', NULL, NULL, 2);
INSERT INTO public.moon VALUES (6, 'Miranda', 'Moon from Uranus', NULL, NULL, 2);
INSERT INTO public.moon VALUES (7, 'Deimos', 'small Moon from Mars', NULL, NULL, 3);
INSERT INTO public.moon VALUES (8, 'Io', 'Moon from Jupiter', NULL, NULL, 4);
INSERT INTO public.moon VALUES (9, 'Europa', 'Moon from Jupiter', NULL, NULL, 4);
INSERT INTO public.moon VALUES (10, 'Ganymede', 'Moon from Jupiter', NULL, NULL, 4);
INSERT INTO public.moon VALUES (11, 'Mimas', 'Moon from Saturn', NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Enceladus', 'Moon from Saturn', NULL, NULL, 7);
INSERT INTO public.moon VALUES (13, 'Tethys', 'Moon from Saturn', NULL, NULL, 7);
INSERT INTO public.moon VALUES (14, 'Triton', 'Moon from Neptune', NULL, NULL, 8);
INSERT INTO public.moon VALUES (15, 'Nereid', 'Moon from Neptune', NULL, NULL, 8);
INSERT INTO public.moon VALUES (16, 'Naiad', 'Moon from Neptune', NULL, NULL, 8);
INSERT INTO public.moon VALUES (17, 'Charon', 'Moon from Pluto', NULL, NULL, 9);
INSERT INTO public.moon VALUES (18, 'Nix', 'Moon from Pluto', NULL, NULL, 9);
INSERT INTO public.moon VALUES (19, 'Hydra', 'Moon from Pluto', NULL, NULL, 9);
INSERT INTO public.moon VALUES (20, 'Dysnomia', 'Moon from Eris', NULL, NULL, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our planet', 1, 0, true, 1, NULL, 1, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Uranus', 'Ice Planet', 1, 0, true, 1, NULL, 1, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Gas Giant', 1, 0, true, 9, NULL, 1, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Saturn', 'Gas Giant', 1, 0, true, 9, NULL, 1, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 1, 0, true, 9, NULL, 1, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Drawf Planet', 1, 0, true, 9, NULL, 1, 1, NULL);
INSERT INTO public.planet VALUES (12, 'Eris', 'Mystery Type', 1, 0, true, 9, NULL, 1, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Mars', 'Sand Planet', 1, 0, false, 0, NULL, 1, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Mercury', 'Terrestrial Type', 1, 0, false, 0, NULL, 1, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Venus', 'Terrestrial Type', 1, 0, false, 0, NULL, 1, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Planet X', 'Planet 9', 1, 0, false, 0, NULL, 1, 1, NULL);
INSERT INTO public.planet VALUES (11, 'Ceres', 'Mini Planet', 1, 0, false, 0, NULL, 1, 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Messier 1', 'Crab Nebula', 0.10, 4);
INSERT INTO public.star VALUES (5, 'M104', 'Object from Mice galaxy', 0.20, 3);
INSERT INTO public.star VALUES (1, 'Sun', 'Earth light source', 4.60, 1);
INSERT INTO public.star VALUES (6, 'Death Star', 'Star discovered to be from star wars', 1.00, 6);
INSERT INTO public.star VALUES (7, 'Dark Star', 'Seem to discovered by accdient by some humans', 1.24, 5);
INSERT INTO public.star VALUES (8, 'Heaven', 'Heaven from Xtian NT', 0.20, 7);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation c_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT c_name UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy g_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT g_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon m_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT m_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet p_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT p_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star s_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT s_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

