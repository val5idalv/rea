--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2023-04-27 00:11:06

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
-- TOC entry 210 (class 1259 OID 16783)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16782)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 212 (class 1259 OID 16790)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16789)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 214 (class 1259 OID 16797)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16796)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 216 (class 1259 OID 16804)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16803)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 218 (class 1259 OID 16813)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16823)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16822)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- TOC entry 217 (class 1259 OID 16812)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 217
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 3189 (class 2604 OID 16786)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16793)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 16800)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3192 (class 2604 OID 16807)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 16816)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 16826)
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- TOC entry 3356 (class 0 OID 16783)
-- Dependencies: 210
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (3, 'Акссесуары');
INSERT INTO public.category (id, name) VALUES (1, 'Приставки');
INSERT INTO public.category (id, name) VALUES (2, 'Игры');


--
-- TOC entry 3358 (class 0 OID 16790)
-- Dependencies: 212
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (6, '4c172e1d-8526-42fa-80d5-e433e2967d2c.1.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, 'f95895de-794f-41a2-807b-1b52c09d3952.2.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, '97071259-3849-4008-bc46-308088a65979.3.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, '15395452-41bb-481f-8322-d8b866e49779.4.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, '57a681b3-5041-4428-a31e-a0f7d5763d7b.5.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, '20e3003a-cd2c-449b-ac35-d3725af474cd.1.png', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, 'f2a566d7-a3a2-4abe-9bf6-eae29de0624f.2.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, '9b831b09-f37b-421a-91e5-88a2f010c90b.3.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, 'da868c97-af4b-465c-8256-a07d145edc81.4.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, '8a519d02-cbfc-437a-8df1-ffa1faa5a4ce.5.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, 'ccf07058-f6b7-48e8-93c2-4676b78fa445.1.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, 'e4b3227d-d21d-447a-baee-e8de70e469b1.2.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, 'f7672412-1f7b-4bb2-8833-7174f288e127.3.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, '148e62d6-2a12-4974-b8eb-2d9b2a3f0f75.4.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, '6a76e036-b38e-459e-8bc2-57af85273259.5.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, '87783465-51bb-4e0c-914e-740d43ee3a9f.1.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, '1ae3af0d-5fee-4e5b-a508-bbdd0eb81b97.2.gif', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '6e108a43-ff1b-4d72-a1da-9494d0f88b1f.3.gif', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '3281bd61-8e89-41e0-b44b-5680d906ac1c.4.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '6748645e-8e2e-44a1-a2de-e7a5daffae19.5.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, 'd4ea2618-31fc-4fc6-88d0-d58f8166885d.1.JPG', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '9491a8d1-b13f-4cae-ba8e-123b65c5b5b8.2.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '73e89cd8-b215-41a2-a6d0-b7e04f42fc43.3.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, '688311f7-7799-4a37-828b-60d24d1dd06c.4.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '40c2d204-9de9-42f6-a450-58d92aafe382.5.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, 'c452abc2-f322-417c-832f-51da3f9059ea.1.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, 'b40237c6-3742-47ef-8852-a5a4867d33c5.2.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, 'ca31c762-8390-4b15-9160-05db25554b36.3.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, '9e8ff973-bc63-406c-99b9-b7f9de40671e.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '34bac7f1-e693-4ff3-8c71-d0a61ca6f324.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, '4281dd4b-a111-4f97-b6b2-7f6d797fa644.1.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, 'a2a188d3-14f1-4433-a31b-0ca0ac7b4b79.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '03363281-fa7b-4d8b-a347-99e57b0bab12.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, '67dfd891-6b1b-4fc4-9fb8-6c4cacdf5e99.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, '9837a6d2-e451-4e75-9bd7-06653a3209ee.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, '000469c5-41ce-4392-8755-5e6ac86cf494.1.JPG', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, '06e8bed6-48dd-4670-b7b1-6ae2cbb3b49d.2.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, '4b5ac480-2cb3-4ad1-bc15-a93951a347a7.3.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, '5ea166c7-55dd-46ce-8f2f-51fe1dc5d09d.4.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, 'a417f602-ebbf-4c58-8cd2-65973095d9dd.5.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, '27a578f8-d88e-4f62-8f24-53eeb99bbe71.1.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, '3ec07688-fcd9-4f4f-9a8a-5308f2db8cba.2.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, '0abb40db-cc99-4776-8d96-99993a7be61c.3.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, 'c8ceaa14-e046-442e-841b-8bc6f9be90a2.4.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, '0e22d350-db2e-4dac-b15b-76af1567bde4.5.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (51, 'aad070e4-1b3d-4b2a-a56d-feb90c3ff156.1.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (52, '2077450c-64f0-410b-b582-a189a3987ca2.2.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (53, '9c451173-d2e8-4bec-a67d-b8b2bb72522c.3.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (54, '468c5a5b-5ed4-4bab-b805-ed606d4b9d88.4.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (55, '2012953d-a281-4728-9060-8c82ed517d84.5.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (56, '4d42ca92-583c-4065-baff-f4a0dc7452b8.1.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (57, '1596fe5c-5a1a-4c9b-8f2f-c7a5f8890b66.', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (58, 'fb1174e8-1cbb-431f-bf05-6a5c6a2481ad.', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (59, '35f95c11-675d-4409-9db7-5662051a3857.', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (60, '10d81be0-c298-46b0-8529-b481c2b9f06b.', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (61, '3ebf91a1-9e5f-4c69-b290-92a4d21fb107.4.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (62, 'c0447c6f-346a-4931-8066-39df53cc9267.', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (63, 'd94aeb84-cb20-49a3-b2d5-6aa7273e6ff3.', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (64, '6a36f351-bed5-42df-a304-07937d3826e3.', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (65, '04bbd461-418a-4c3e-89b0-09a3ec05dd9b.', 13);


--
-- TOC entry 3360 (class 0 OID 16797)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2023-04-26 22:03:30.826061', '5ebfcece-0cb6-47e9-b499-c69fceede144', 8400, 1, 1, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2023-04-26 23:37:49.547261', '2032e9e4-43a7-4ab2-8f3f-15c2db38be4d', 980, 1, 4, 10);


--
-- TOC entry 3362 (class 0 OID 16804)
-- Dependencies: 216
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (1, 'Vladislav', '$2a$10$VzARFnzVEu9w3P3pi8wlku8.7fTc77DPlE7dn3W7E8buPqv7qGI9.', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (2, 'admin', '$2a$10$vi11U4YjxTJpICzdDp1JcerZ1FMkg34c5sFwBliPIEL/LT3z3lmDy', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (3, 'User1', '$2a$10$toc6J8YhoYDivtizgH03QuL1kCZW2oIvISuDDKQTKtclBmtV/xKC.', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (4, 'User01', '$2a$10$ijVCs4mbj819z8fkbYJ9oO.WxAbEkvZADTFcywf73umnbGphxL3aC', 'ROLE_USER');


--
-- TOC entry 3364 (class 0 OID 16813)
-- Dependencies: 218
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (3, '2023-04-26 20:26:50.079708', 'Игровая приставка 16 bit Sega Mega Drive Mini + 42 встроенных игр + 2 геймпада (Черная) Asia Оригинал для Sega (Сега) c доставкой или забрать ее из нашего магазина. Заказать SEGA диск для сега можно через сайт нашего интернет магазина', 8400, 'NextGame', 'Компактная игровая приставка Sega Mega Drive Mini азиатская версия ', 'Центральный', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (4, '2023-04-26 20:30:55.253562', 'Почти 25 лет назад мир увидел оригинальную консоль PlayStation. Разработанная компанией Sony Computer Entertainment, она стала первой домашней игровой компьютерной системой в истории видеоигр, которая разошлась по всему миру тиражом 100 миллионов устройств и впервые познакомила пользователей с 3D-графикой, обрабатывающейся в режиме реального времени. 

Сегодня мы рады объявить о выпуске PlayStation Classic — переиздании оригинальной консоли PlayStation в миниатюре!

Эта мини-консоль приблизительно на 45% меньше оригинальной PlayStation. В комплекте идут два контроллера оригинального дизайна, и даже внешний вид упаковки максимально приближен к исходному, что правдиво воссоздает образ и впечатления от оригинального продукта. 

Преданные поклонники оценят возможность заново погрузиться в мир легендарных видеоигр, а новичкам в мире PlayStation будет интересно познакомиться с первой консолью, преобразившей игровую индустрию, и испытать те самые ощущения. Все предварительно установленные игры будут воспроизводиться в оригинальном формате. 

В комплекте с каждым устройством будет идти кабель HDMI для подключения к телевизору и два контроллера для игры в локальном многопользовательском режиме, если он поддерживается игрой. 

В комплекте игровой приставки PlayStation Classic входит :

    Консоль PlayStation Classic
    2 проводных геймпада (1.5м)
    Кабель USB (1.5м)
    Кабель HDMI (2м)
    Печатные материалы (1 комплект)
    Внимание !!! Для использования данной консоли требуется совместимый USB-адаптер переменного тока (приобретается отдельно)
', 10940, 'NextGame', 'PlayStation Classic', 'Северо-Запад (Спб)', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (5, '2023-04-26 20:37:57.810303', 'Игра в духе НИНДЗЯ ГАЙДЕН, только вот главный герой тут не ниндзя, а крутой парень с хорошо прокаченными кулаками. Неплохая игрушка по всем показателям.

Внимание! Внешний вид обложки может отличаться от изображённого на картинке.', 750, '8-bit Games', 'Картридж Брюс Ли 2 (Bruce Lee 2) (8 bit) для Денди', 'Центральный', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (6, '2023-04-26 20:42:12.418043', 'Jurassic Park — видеоигра в жанре экшн, разработанная и выпущенная компанией Ocean в 1993 году. Сюжет игры приблизительно соответствует кинофильму «Парк юрского периода», хотя некоторые эпизоды заимствованы из одноимённого романа Майкла Крайтона. Главный герой — доктор Алан Грант. На каждом уровне он должен собрать определённое число яиц динозавров и выполнить ряд дополнительных заданий. Уровни разделены на части; собрав яйца в одной части, Грант получает пропуск в другую, ранее недоступную (здание, вольер). Сбор яиц затруднён тем, что некоторые яйца, как и некоторые другие предметы и бонусы, спрятаны за деревьями, и игрок не может их увидеть. Единственное оружие Гранта — базука, для которой существуют четыре вида снарядов. После уничтожения каждого динозавра на его месте остаётся то количество простых снарядов, которое необходимо для его убийства; таким образом, при точной стрельбе и постоянном сборе появляющихся снарядов боезапас становится практически бесконечным.', 750, 'retroGames.net', 'Картридж Парк Юрского периода (The Lost World) (Jurassic Park) (8 bit) для Денди', 'Южный (Сочи)', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (2, NULL, 'Все для игры и подключения к телевизору входит в комплект. 
В комплект 8-битной приставки 8 bit Junior  входит:
    Игровая консоль 8-Бит (системный блок 5V) 
    Два игровых геймпада (1,5м) (узкий разъём - 9 Pin)
    Блок питания (сетевой адаптер 220V) 
    Телевизионный AV кабель (1,5м) (2 RCA - 2 RCA)  
    Световой пистолет (1,5м) (Внимание: световой пистолет работает только на ЭЛТ (кинескопных) телевизорах, на ЖК и плазменных , пистолет работать не будет!)
    Инструкция по эксплуатации на русском языке 
    Гарантийный талон
    400 встроенных игр', 3660, 'NextGame', 'Игровая классическая приставка 8 bit Junior ', 'Центральный', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (7, '2023-04-26 21:34:53.988733', 'Контроллер игровой беспроводной 2,4ГГЦ для игровых приставок Retro Genesis. Работает на 2-х ААА батарейках. 

Совместимость:
-Retro Genesis 8 Bit Wireless,
-Retro Genesis 8 Bit HD Wireless.

Переключение между джойстиками P1 и P2 невозможно', 900, 'NextGame', 'еймпад беспроводной Retro Genesis Controller P1 (8 bit) 8 bit', 'Северо-Запад (Спб)', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (8, NULL, 'Контроллер игровой усовершенствованный для игровых приставок Retro Genesis. Имеет увеличенную форму как самого джойстика, так и основных элементов. Кнопки увеличенного размера позволяют более точно и быстро совершать нажатия. В крестовину D-Pad вкручивается стик управления. Он позволяет более быстро совершать действия в игре.

Совместимость:
-Retro Genesis HD Ultra, 
-Retro Genesis HD Ultra 2, 
-Retro Genesis Modern Wireless, 
-Retro Genesis Modern, 
-Retro Genesis Mix, 
-Retro Genesis Mix Wireless, 
-Retro Genesis Remix, 
-Retro Genesis Remix Wireless. 

Длина провода: 160см.
Комплектуется надежной D-Pad крестовиной, кнопкой Start, 6-ю кнопками действия.

Имеет классический 9-пиновый разъем, подходит ко всем Sega-подобным устройствам, оснащенных подобным разъемом.  ', 730, '16-bit', 'Геймпад проводной Arcade Max Retro Genesis Controller (16 bit)', 'Центральный', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (9, '2023-04-26 21:46:58.447928', 'Mickey Mania – игра для 16-битной приставки Сега о приключения Микки Мауса и основанная на сюжете прошлых мультфильмов о мышонке начиная с первого чёрно-белого мультфильма «Пароход Вилли» 1928-го и заканчивая мультфильмом «Принц и нищий», вышедшим в 1990-м году. Игрок как бы проходит вместе с героем игры по всем его мультикам и проносится сквозь время от начала 20-го века до наших дней. Над игрой работали аниматоры и художники из Disney и именно поэтому анимация персонажей в игре красивая и плавная, а графика достойна высших похвал.

Каждый из семи уровней игры основан на одном из легендарных мультфильмов о Микки Маусе: Пароход Вилли (1928), Безумный доктор (1933), Концерт Группы (1935), Охотники на американских лосей (1937), Одинокие призраки (1937), Микки и Beanstalk (1947), Принц и нищий (1990). Микки предстоит посетить каждый из мультфильмов и помочь самому себе решить множество логических загадок и одолеть врагов встречающихся на пути. ', 900, 'NextGame', 'Картридж Микки Мания (Mickey Mania) Русская Версия (16 bit) для Сеги', 'Центральный', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (10, '2023-04-26 21:50:21.327598', ' Старейшая игра в жанре "файтинг", изначально сделанная для игровых автоматов и позже перенесённая на консоли 8 bit и Sega. Street Fighter 2 разработана известной японской компанией Capcom, создающей шедевры компьютерных игр. Перед вами будет 12 бойцов, из разных стран. Каждый из них по-своему уникален и обладает своими приёмами ведения боя. Вам нужно выбрав одного из бойцов, победить всех остальных и в конце встретиться с боссом, военным диктатором и главой преступной группировки, зовут которого M.Bison.
', 980, 'NextGame', 'Картридж Уличный Боец 2 (Street Fighter 2: Special Champion Edition) (16 bit) для Сеги', 'Северо-Запад (Спб)', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (11, '2023-04-26 21:53:00.412766', 'Очередная серия «Червяка Джима» существенно повысила его и без того высокий рейтинг. Графика улучшилась несравненно. Звук также на уровне — тем более, что создатели украсили игру классическими произведениями, например, «Лунной сонатой» Бетховена. А мелодию на заставке дополняет хоровое пение! Неслучайно список функций секретного меню пополнила музыкальная шкатулка.

Появились новые объекты, прикалываться по поводу которых можно долго и весело — сам Джим в игре-предшественнице и прочие ее персонажи (в основном, буренки). А «летучие» этапы имеются такие, каких еще свет не видывал!', 1200, '8-bit', 'Картридж Червяк Джим 2 (Earthworm Jim 2) Русская версия (16 bit) для Сеги', 'Центральный', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (12, '2023-04-26 22:00:29.754959', 'указывающее устройство для компьютеров и телевизионных игровых приставок. Данное устройство позволяет «стрелять» в экран телевизора, с соответствующей реакцией «попал-промахнулся». ', 2500, 'RetroArch', 'Световой пистолет - 8 bit', 'Южный (Сочи)', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (13, '2023-04-26 23:29:33.637752', 'Адаптер AC для игровой приставки Nintendo DS Lite ', 1100, 'NextGame', 'Адаптер сетевой (Зарядное устройство / Блок питания) AC Adaptor 220v для Nintendo DS Lite (DSL)', 'Центральный', 3);


--
-- TOC entry 3366 (class 0 OID 16823)
-- Dependencies: 220
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 9, true);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 65, true);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 2, true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 4, true);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 4, true);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 217
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 13, true);


--
-- TOC entry 3197 (class 2606 OID 16788)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 16795)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 16802)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 16811)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 16828)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3205 (class 2606 OID 16821)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 16830)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3211 (class 2606 OID 16836)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3213 (class 2606 OID 16846)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3212 (class 2606 OID 16841)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3210 (class 2606 OID 16831)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3215 (class 2606 OID 16856)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3214 (class 2606 OID 16851)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2023-04-27 00:11:07

--
-- PostgreSQL database dump complete
--

