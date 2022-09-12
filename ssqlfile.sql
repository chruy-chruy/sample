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
1	troy	2022-09-09	2022-09-09 11:16:34.687581	active
2	troy	2022-09-12	2022-09-12 09:32:20.938106	active
3	troy	2022-09-12	2022-09-12 09:32:53.114295	active
4	troy	2022-09-12	2022-09-12 09:33:59.307003	active
5	troy	2022-09-12	2022-09-12 09:34:39.195212	active
6	troy	2022-09-12	2022-09-12 09:35:22.412413	active
7	troy	2022-09-12	2022-09-12 09:36:17.209342	active
8	troy	2022-09-12	2022-09-12 09:36:52.797292	active
9	troy	2022-09-12	2022-09-12 09:37:12.776262	active
10	troy	2022-09-12	2022-09-12 09:38:36.529924	active
11	troy	2022-09-12	2022-09-12 09:40:44.075942	active
12	troy	2022-09-12	2022-09-12 09:41:05.956351	active
13	troy	2022-09-12	2022-09-12 11:18:08.088474	active
14	troy	2022-09-12	2022-09-12 11:18:21.557613	active
15	troy	2022-09-12	2022-09-12 11:18:27.862891	active
16	troy	2022-09-12	2022-09-12 11:18:32.283912	active
17	troy	2022-09-12	2022-09-12 11:18:41.754123	active
18	troy	2022-09-12	2022-09-12 11:18:55.369834	active
19	troy	2022-09-12	2022-09-12 11:19:24.600907	active
20	troy	2022-09-12	2022-09-12 11:22:11.82291	active
21	troy	2022-09-12	2022-09-12 11:22:23.956591	active
22	troy	2022-09-12	2022-09-12 11:26:11.666771	active
23	troy	2022-09-12	2022-09-12 11:39:13.099048	active
24	troy	2022-09-12	2022-09-12 11:39:43.82025	active
25	troy	2022-09-12	2022-09-12 11:40:44.326148	active
26	troy	2022-09-12	2022-09-12 11:41:07.930017	active
27	troy	2022-09-12	2022-09-12 11:41:14.044768	active
28	troy	2022-09-12	2022-09-12 11:42:39.94696	active
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, product_name, barcode, details, quantity, price, status, created_at, cost_per_unit, date_received, date_expire, delivery_id) FROM stdin;
204	ram4	123213we	ram 8gb	20	1000	active	2022-09-09 18:02:03.68458	900	2022-09-09	2022-09-25	2
205	ram4	123213we	ram 8gb	20	1000	active	2022-09-09 18:02:03.689293	900	2022-09-09	2022-09-25	2
206	ram4	123213we	ram 8gb	20	1000	active	2022-09-09 18:02:03.689866	900	2022-09-09	2022-09-25	2
207	ram4	123213we	ram 8gb	20	1000	active	2022-09-09 18:08:39.145517	900	2022-09-09	2022-09-25	2
208	ram4	123213we	ram 8gb	20	1000	active	2022-09-09 18:08:39.150683	900	2022-09-09	2022-09-25	2
209	ram4	123213we	ram 8gb	20	1000	active	2022-09-09 18:08:39.151238	900	2022-09-09	2022-09-25	2
210	ram4	123213we	ram 8gb	20	1000	active	2022-09-09 18:10:54.901774	900	2022-09-09	2022-09-25	2
211	ram4	123213we	ram 8gb	20	1000	active	2022-09-09 18:10:54.909111	900	2022-09-09	2022-09-25	2
212	ram4	123213we	ram 8gb	20	1000	active	2022-09-09 18:11:36.215531	900	2022-09-09	2022-09-25	2
213	ram4	123213we	ram 8gb	20	1000	active	2022-09-09 18:11:36.220552	900	2022-09-09	2022-09-25	2
214	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 09:43:20.472802	900	2023-09-12	2023-09-25	2
215	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 09:43:20.481638	900	2023-09-12	2023-09-25	2
216	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 10:55:24.082982	900	2023-09-12	2023-09-25	2
217	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 10:55:24.082982	900	2023-09-12	2023-09-25	2
218	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 10:55:24.090557	900	2023-09-12	2023-09-25	2
219	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 10:55:24.090557	900	2023-09-12	2023-09-25	2
220	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 10:56:03.324436	900	2023-09-12	2023-09-25	2
221	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 10:56:03.324436	900	2023-09-12	2023-09-25	2
222	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 10:56:03.33043	900	2023-09-12	2023-09-25	2
223	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 10:56:03.33043	900	2023-09-12	2023-09-25	2
224	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 10:57:39.917754	900	2023-09-12	2023-09-25	2
225	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 10:57:39.922988	900	2023-09-12	2023-09-25	2
226	ryzen 3	ryzen 3 2200g	ram 8gb	20	1000	active	2022-09-12 10:58:41.20901	900	2022-09-12	2022-09-25	2
227	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 10:58:41.214615	900	2023-09-12	2023-09-25	2
228	intel i3 	i3123123	i3 9100f	20	1000	active	2022-09-12 11:26:11.674123	900	2022-09-12	2022-09-25	22
229	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 11:26:11.677463	900	2023-09-12	2023-09-25	22
230	intel i3 	i3123123	i3 9100f	20	1000	active	2022-09-12 11:39:13.106799	900	2022-09-12	2022-09-25	23
231	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 11:39:13.110372	900	2023-09-12	2023-09-25	23
232	intel i3 	i3123123	i3 9100f	20	1000	active	2022-09-12 11:40:44.332945	900	2022-09-12	2022-09-25	25
233	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 11:40:44.338005	900	2023-09-12	2023-09-25	25
234	intel i3 	i3123123	i3 9100f	20	1000	active	2022-09-12 11:41:07.936469	900	2022-09-12	2022-09-25	26
235	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 11:41:07.938764	900	2023-09-12	2023-09-25	26
236	intel i3 	i3123123	i3 9100f	20	1000	active	2022-09-12 11:41:14.050559	900	2022-09-12	2022-09-25	27
237	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 11:41:14.052228	900	2023-09-12	2023-09-25	27
238	intel i3 	i3123123	i3 9100f	20	1000	active	2022-09-12 11:42:39.952163	900	2022-09-12	2022-09-25	28
239	ryzen 5	123213we	ryzen 5 2600	20	1000	active	2022-09-12 11:42:39.956695	900	2023-09-12	2023-09-25	28
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

SELECT pg_catalog.setval('public.delivery_delivery_id_seq', 28, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 239, true);


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

