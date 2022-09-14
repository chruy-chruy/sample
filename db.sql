--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id bigint NOT NULL,
    name character varying(255),
    contact bigint,
    address character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    status character varying(100),
    order_id bigint
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery (
    delivery_id bigint NOT NULL,
    supplier_name character varying(255),
    date_received date,
    created_at timestamp without time zone DEFAULT now(),
    status character varying(100)
);


ALTER TABLE public.delivery OWNER TO postgres;

--
-- Name: delivery_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.delivery_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_delivery_id_seq OWNER TO postgres;

--
-- Name: delivery_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.delivery_delivery_id_seq OWNED BY public.delivery.delivery_id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    order_details_id bigint NOT NULL,
    order_id bigint,
    barcode character varying(255),
    product_name character varying(255),
    quantity integer,
    price double precision,
    created_at timestamp without time zone DEFAULT now(),
    status character varying(100),
    total_price double precision
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- Name: order_details_order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_details_order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_order_details_id_seq OWNER TO postgres;

--
-- Name: order_details_order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_details_order_details_id_seq OWNED BY public.order_details.order_details_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id bigint NOT NULL,
    total_price double precision,
    created_at timestamp without time zone DEFAULT now(),
    status character varying(100),
    customer_name character varying
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO postgres;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_name character varying(255),
    barcode character varying(100),
    details character varying(255),
    quantity bigint,
    price double precision,
    status character varying(100),
    created_at timestamp without time zone DEFAULT now(),
    cost_per_unit double precision,
    date_received date,
    date_expire date,
    delivery_id integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_id_seq OWNER TO postgres;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.customer.customer_id;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    supplier_id bigint DEFAULT nextval('public.subjects_id_seq'::regclass) NOT NULL,
    supplier_name character varying(255),
    address character varying(255),
    contact bigint,
    created_at timestamp without time zone DEFAULT now(),
    status character varying(100)
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    status character varying(100),
    date_created timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    first_name character varying(255),
    last_name character varying(255),
    role character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- Name: delivery delivery_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery ALTER COLUMN delivery_id SET DEFAULT nextval('public.delivery_delivery_id_seq'::regclass);


--
-- Name: order_details order_details_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details ALTER COLUMN order_details_id SET DEFAULT nextval('public.order_details_order_details_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, name, contact, address, created_at, status, order_id) FROM stdin;
14	troy	9269824521	Baluan General Santos City2	2022-09-14 14:36:39.879349	active	\N
15	troy	9269824521	Baluan General Santos City2	2022-09-14 14:38:49.949439	active	41
16	troy	9269824521	Baluan General Santos City2	2022-09-14 14:42:04.880359	active	42
\.


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery (delivery_id, supplier_name, date_received, created_at, status) FROM stdin;
31	wew	2022-09-12	2022-09-13 10:08:34.652801	active
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_details (order_details_id, order_id, barcode, product_name, quantity, price, created_at, status, total_price) FROM stdin;
29	40	i3123123	intel i3 	20	1000	2022-09-14 14:36:39.87772	active	20000
30	40	i3123123	intel i5 	20	1000	2022-09-14 14:36:39.878877	active	20000
31	41	i3123123	intel i3 	20	1000	2022-09-14 14:38:49.94508	active	20000
32	41	i3123123	intel i5 	20	1000	2022-09-14 14:38:49.948658	active	20000
33	42	i3123123	intel i3 	20	1000	2022-09-14 14:42:04.876591	active	20000
34	42	i3123123	intel i5 	20	1000	2022-09-14 14:42:04.879645	active	20000
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, total_price, created_at, status, customer_name) FROM stdin;
40	10000	2022-09-14 14:36:39.873531	active	troy
41	10000	2022-09-14 14:38:49.93752	active	troy
42	10000	2022-09-14 14:42:04.869262	active	troy
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, product_name, barcode, details, quantity, price, status, created_at, cost_per_unit, date_received, date_expire, delivery_id) FROM stdin;
244	intel i3 	i3123123	i3 9100f	20	1000	active	2022-09-13 10:08:34.658253	900	2022-09-12	2022-09-25	31
245	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-13 10:08:34.660591	900	2023-09-12	2023-09-25	31
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (supplier_id, supplier_name, address, contact, created_at, status) FROM stdin;
6	troy	baluan	9123452871	2022-09-07 15:47:21.713031	active
7	troy	baluan	9123452871	2022-09-07 15:47:40.591906	active
11	troy shop	baluan General Santos City	91234548234	2022-09-08 09:57:38.279043	active
12	troy shop	baluan General Santos City	91234548234	2022-09-13 10:56:57.533094	active
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, status, date_created, updated_at, first_name, last_name, role) FROM stdin;
52	admin	admin	active	2022-09-02 15:22:51.977637	\N	\N	\N	\N
54	troy2	1234	active	2022-09-02 15:26:58.37791	\N	\N	\N	\N
56	troy1232	1234	active	2022-09-02 15:43:32.02235	\N	\N	\N	\N
57	qeww	qwewq	active	2022-09-02 15:43:41.17673	\N	\N	\N	\N
58	qweqweqw	qwewq	active	2022-09-05 16:38:23.472535	\N	\N	\N	\N
59	merry	merry123	active	2022-09-06 13:20:33.506591	\N	\N	\N	\N
60	thel	thel123	active	2022-09-06 16:44:21.682458	\N	ethel	mahusay	Sales
61	x	x123	active	2022-09-06 17:11:37.746568	\N	rex	qwe	Sales
62	test	123	active	2022-09-07 17:21:07.122542	\N	test	qwwwe	Sales
63	jii	123	active	2022-09-07 17:40:02.938902	\N	jii	guiapal	Staff
55	troy23	admin123	deleted	2022-09-02 15:28:26.968659	2022-09-07 17:41:03.845828	\N	\N	\N
53	admin	admin123	active	2022-09-02 15:25:34.483515	2022-09-14 11:03:32.017804	troy	garidos	Admin
64	asd	123	active	2022-09-14 13:51:11.990443	\N	jii	guiapal	Staff
65	xzcz	123	active	2022-09-14 13:52:52.844965	\N	jii	guiapal	Staff
66	sczxcz	123	active	2022-09-14 13:53:22.516088	\N	jii	guiapal	Staff
\.


--
-- Name: delivery_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.delivery_delivery_id_seq', 31, true);


--
-- Name: order_details_order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_order_details_id_seq', 34, true);


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_order_id_seq', 42, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 245, true);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subjects_id_seq', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 66, true);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: customer subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (customer_id);


--
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();


--
-- PostgreSQL database dump complete
--

