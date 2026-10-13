--
-- PostgreSQL database dump
--

\restrict teVb251guo0C9kmG3xaWtff1sMyTsmZ7Mh3SoJinLD2rvM4mSekLL7OEIv9uVjX

-- Dumped from database version 16.15 (Debian 16.15-1.pgdg13+2)
-- Dumped by pg_dump version 16.15 (Debian 16.15-1.pgdg13+2)

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
-- Name: bookings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bookings (
    booking_ref character varying(20) NOT NULL,
    passenger_name character varying(100),
    route character varying(100),
    travel_date date,
    status character varying(20) DEFAULT 'confirmed'::character varying,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: inquiry_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inquiry_log (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    booking_ref text,
    route text,
    original_date text,
    new_date text,
    requested_change text,
    intent text,
    urgency text,
    branch text,
    reply_text text,
    raw_message text
);


--
-- Name: inquiry_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inquiry_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inquiry_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.inquiry_log_id_seq OWNED BY public.inquiry_log.id;


--
-- Name: inquiry_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inquiry_log ALTER COLUMN id SET DEFAULT nextval('public.inquiry_log_id_seq'::regclass);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_ref);


--
-- Name: inquiry_log inquiry_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inquiry_log
    ADD CONSTRAINT inquiry_log_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict teVb251guo0C9kmG3xaWtff1sMyTsmZ7Mh3SoJinLD2rvM4mSekLL7OEIv9uVjX

