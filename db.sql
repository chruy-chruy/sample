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
    status character varying(100)
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
    customer_name character varying(255),
    total_price double precision,
    created_at timestamp without time zone DEFAULT now(),
    status character varying(100)
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

COPY public.customer (customer_id, name, contact, address, created_at, status) FROM stdin;
8	steb	9269824521	KCC General Santos City	2022-09-07 15:48:39.284341	active
9	troy	9269824521	Baluan General Santos City	2022-09-07 15:48:51.96984	active
10	troy2	9269824521	Baluan General Santos City2	2022-09-07 17:25:44.583578	active
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
1	26	i3123123	intel i3 	20	1000	2022-09-13 09:42:18.685479	active	\N
2	26	i3123123	intel i5 	20	1000	2022-09-13 09:42:18.687989	active	\N
3	27	i3123123	intel i3 	20	1000	2022-09-13 09:42:39.670769	active	20000
4	27	i3123123	intel i5 	20	1000	2022-09-13 09:42:39.675694	active	20000
5	28	i3123123	intel i3 	20	1000	2022-09-13 09:44:01.613362	active	20000
6	28	i3123123	intel i5 	20	1000	2022-09-13 09:44:01.615076	active	20000
7	29	i3123123	intel i3 	20	1000	2022-09-13 09:44:32.287834	active	20000
8	29	i3123123	intel i5 	20	1000	2022-09-13 09:44:32.291611	active	20000
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_name, total_price, created_at, status) FROM stdin;
1	qwe	123	2022-09-13 09:09:12.946659	qwe
2	wew	10000	2022-09-13 09:09:54.877152	active
3	qwe	123	2022-09-13 09:10:02.976468	qwe
4	wew	10000	2022-09-13 09:10:46.89983	active
5	wew	10000	2022-09-13 09:21:52.083973	active
6	wew	10000	2022-09-13 09:22:47.558042	active
7	wew	10000	2022-09-13 09:23:30.589629	active
8	wew	10000	2022-09-13 09:24:04.522311	active
9	wew	10000	2022-09-13 09:24:22.269841	active
10	wew	10000	2022-09-13 09:25:31.155723	active
11	wew	10000	2022-09-13 09:25:39.599149	active
12	wew	10000	2022-09-13 09:26:11.401597	active
13	wew	10000	2022-09-13 09:26:34.196336	active
14	wew	10000	2022-09-13 09:26:55.212486	active
15	wew	10000	2022-09-13 09:29:18.825934	active
16	wew	10000	2022-09-13 09:29:56.480915	active
17	wew	10000	2022-09-13 09:31:47.548838	active
18	wew	10000	2022-09-13 09:31:59.741395	active
19	wew	10000	2022-09-13 09:32:33.500586	active
20	wew	10000	2022-09-13 09:37:16.744102	active
21	wew	10000	2022-09-13 09:37:33.912314	active
22	wew	10000	2022-09-13 09:38:11.903608	active
23	wew	10000	2022-09-13 09:39:02.839778	active
24	wew	10000	2022-09-13 09:39:14.234583	active
25	wew	10000	2022-09-13 09:40:25.595962	active
26	wew	10000	2022-09-13 09:42:18.675724	active
27	wew	10000	2022-09-13 09:42:39.660427	active
28	wew	10000	2022-09-13 09:44:01.603288	active
29	wew	10000	2022-09-13 09:44:32.275573	active
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
53	troy	admin123	active	2022-09-02 15:25:34.483515	2022-09-07 17:37:28.704761	\N	\N	\N
63	jii	123	active	2022-09-07 17:40:02.938902	\N	jii	guiapal	Staff
55	troy23	admin123	deleted	2022-09-02 15:28:26.968659	2022-09-07 17:41:03.845828	\N	\N	\N
\.


--
-- Name: delivery_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.delivery_delivery_id_seq', 31, true);


--
-- Name: order_details_order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_order_details_id_seq', 8, true);


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_order_id_seq', 29, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 245, true);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subjects_id_seq', 11, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 63, true);


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

