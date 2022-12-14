PGDMP         #                z            lougeh    14.5    14.5 $               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16415    lougeh    DATABASE     j   CREATE DATABASE lougeh WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE lougeh;
                postgres    false            ?            1255    16451    trigger_set_timestamp()    FUNCTION     ?   CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.trigger_set_timestamp();
       public          postgres    false            ?            1259    16443    customer    TABLE     ?   CREATE TABLE public.customer (
    customer_id bigint NOT NULL,
    name character varying(255),
    contact bigint,
    address character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    status character varying(100)
);
    DROP TABLE public.customer;
       public         heap    postgres    false            ?            1259    24660    delivery    TABLE     ?   CREATE TABLE public.delivery (
    delivery_id bigint NOT NULL,
    supplier_name character varying(255),
    date_received date,
    created_at timestamp without time zone DEFAULT now(),
    status character varying(100)
);
    DROP TABLE public.delivery;
       public         heap    postgres    false            ?            1259    24659    delivery_delivery_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.delivery_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.delivery_delivery_id_seq;
       public          postgres    false    217                       0    0    delivery_delivery_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.delivery_delivery_id_seq OWNED BY public.delivery.delivery_id;
          public          postgres    false    216            ?            1259    24643    product    TABLE     ?  CREATE TABLE public.product (
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
    DROP TABLE public.product;
       public         heap    postgres    false            ?            1259    24642    product_product_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.product_product_id_seq;
       public          postgres    false    215                       0    0    product_product_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;
          public          postgres    false    214            ?            1259    16442    subjects_id_seq    SEQUENCE     x   CREATE SEQUENCE public.subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.subjects_id_seq;
       public          postgres    false    212                       0    0    subjects_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.subjects_id_seq OWNED BY public.customer.customer_id;
          public          postgres    false    211            ?            1259    24633    supplier    TABLE     5  CREATE TABLE public.supplier (
    supplier_id bigint DEFAULT nextval('public.subjects_id_seq'::regclass) NOT NULL,
    supplier_name character varying(255),
    address character varying(255),
    contact bigint,
    created_at timestamp without time zone DEFAULT now(),
    status character varying(100)
);
    DROP TABLE public.supplier;
       public         heap    postgres    false    211            ?            1259    16434    users    TABLE     u  CREATE TABLE public.users (
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
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    16433    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    210                        0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    209            r           2604    16446    customer customer_id    DEFAULT     s   ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.subjects_id_seq'::regclass);
 C   ALTER TABLE public.customer ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    212    211    212            x           2604    24663    delivery delivery_id    DEFAULT     |   ALTER TABLE ONLY public.delivery ALTER COLUMN delivery_id SET DEFAULT nextval('public.delivery_delivery_id_seq'::regclass);
 C   ALTER TABLE public.delivery ALTER COLUMN delivery_id DROP DEFAULT;
       public          postgres    false    217    216    217            v           2604    24646    product product_id    DEFAULT     x   ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);
 A   ALTER TABLE public.product ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    214    215    215            p           2604    16437    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210                      0    16443    customer 
   TABLE DATA           [   COPY public.customer (customer_id, name, contact, address, created_at, status) FROM stdin;
    public          postgres    false    212   ,*                 0    24660    delivery 
   TABLE DATA           a   COPY public.delivery (delivery_id, supplier_name, date_received, created_at, status) FROM stdin;
    public          postgres    false    217   ?*                 0    24643    product 
   TABLE DATA           ?   COPY public.product (product_id, product_name, barcode, details, quantity, price, status, created_at, cost_per_unit, date_received, date_expire, delivery_id) FROM stdin;
    public          postgres    false    215   .,                 0    24633    supplier 
   TABLE DATA           d   COPY public.supplier (supplier_id, supplier_name, address, contact, created_at, status) FROM stdin;
    public          postgres    false    213   ,.                 0    16434    users 
   TABLE DATA           v   COPY public.users (id, username, password, status, date_created, updated_at, first_name, last_name, role) FROM stdin;
    public          postgres    false    210   ?.       !           0    0    delivery_delivery_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.delivery_delivery_id_seq', 28, true);
          public          postgres    false    216            "           0    0    product_product_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.product_product_id_seq', 239, true);
          public          postgres    false    214            #           0    0    subjects_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.subjects_id_seq', 11, true);
          public          postgres    false    211            $           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 63, true);
          public          postgres    false    209            ?           2606    24648    product product_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    215            }           2606    16448    customer subjects_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (customer_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT subjects_pkey;
       public            postgres    false    212                       2606    24637    supplier supplier_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public            postgres    false    213            {           2606    16441    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    210            ?           2620    16452    users set_timestamp    TRIGGER     y   CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();
 ,   DROP TRIGGER set_timestamp ON public.users;
       public          postgres    false    218    210               ?   x??̱
?0 ???????r1w?????%C???F?o
???cXZ}??I)??k??R?:?A??ئE羭????٨]H?ɋA&Oʳ????<??׹?2??3?A?7g???/?	??L`"???(?>z~??         \  x???KJ1????)??E?+???q?J?A???i'7)?E??Q????????sad~????'?N?E?[X?????????????f??n?6&@??v7Z?? ?r7V??@i<??3^?̠?JsNT?;0????jc??9MV&:?>a?ژƙ?Q??*`X?7?*??i.6??mGs?clMc-oÉ??,|}$?????s˵?m'n?+!??p"%??m?8??g???"??ǉEL?yb?E?܉?1?}?m?a9??=?m?c??G,T!?I 3Q?DU??WB?
W=??;=?z8?q?!??𪇁h?&??5??A???R=???????K?         ?  x???Mn?0F??)t??????MR???6?"hў??8?R?%?0?e??È?G?????,HL????n?秅`A X???~???<??U??&???mO?C??L??? _??Mu?_v?[eO(9c??D~???????5X_?=?5Kr?Rd??3??1??O????&y????{2?c???}|Y??????m??9H+x?I
\9|~|?s?8????8???=W?Fn?zʝ8v?G???É??6?2??8x'݀? <??}0?m?0?Y?C?Y??6?8?g`?????x????E?9VS????Ϙ?9?1(???c?????u=???8Xq?`?H?ң`%?S!i?6?SM?L?`?n??a=?9!hq??Á?p?????????T?أ??{???L?`@??H&??
%9?hw}406?@V?k?ҩz0??G\???	l j۽SOM?@?M?9???>??L??R?n???S: ???         ?   x??̱? ????(?;?Ǳ:? ?.hHl?P?R???ƴqu????U??M???????@?Qu ???<'B??????6????W6
?Ǌ?}????;`Υ?9???k?sڶ?>~?S?I????X??C?Z??Ѥ5         N  x?}??n?0???S?D??ib?\?F'??RVx??????I?????3B?9??????P#.u?Ը0U?8X??^?????`???{E"?yD]F?m)??E?H4????c?̢?(#N?????????? O[?p?m{c???wCu R?Ow?]??0C?`m@??G??&.f?P?N???j??3p??L		?%ֱ?%?x???]<v??G?(??<g7}?????Y??~d??Ć'(5?J?g~??཮?uY4??|???!??TW_?V]????Q?]?&?c7Sm?b?J??G?.izR>m?]?ZE?_ȳ     