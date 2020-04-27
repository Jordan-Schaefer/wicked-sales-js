--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
ALTER TABLE ONLY public."cartItems" DROP CONSTRAINT "cartItems_pkey";
ALTER TABLE public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE public."products_productId_seq";
DROP TABLE public.products;
DROP SEQUENCE public."orders_orderId_seq";
DROP TABLE public.orders;
DROP SEQUENCE public."carts_cartId_seq";
DROP TABLE public.carts;
DROP SEQUENCE public."cartItems_cartItemId_seq";
DROP TABLE public."cartItems";
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    name text NOT NULL,
    "creditCard" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text NOT NULL,
    "shortDescription" text NOT NULL,
    "longDescription" text NOT NULL
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price) FROM stdin;
1	21	3	2900
2	22	3	2900
3	23	5	9900
4	24	5	9900
5	25	5	9900
6	26	5	9900
7	27	5	9900
8	28	6	830
9	29	6	830
10	30	5	9900
11	30	5	9900
12	30	5	9900
13	30	2	2595
14	31	1	2999
15	31	1	2999
16	31	1	2999
17	31	1	2999
18	31	1	2999
19	31	1	2999
20	31	1	2999
21	31	1	2999
22	31	1	2999
23	31	1	2999
24	31	1	2999
25	31	1	2999
26	31	1	2999
27	31	1	2999
28	31	1	2999
29	31	1	2999
30	31	1	2999
31	31	1	2999
32	31	1	2999
33	31	1	2999
34	31	1	2999
35	31	1	2999
36	31	1	2999
37	31	1	2999
38	31	1	2999
39	31	1	2999
40	31	1	2999
41	31	1	2999
42	31	1	2999
43	31	1	2999
44	31	1	2999
45	31	1	2999
46	31	1	2999
47	31	1	2999
48	31	1	2999
49	31	1	2999
50	31	1	2999
51	31	1	2999
52	31	1	2999
53	31	1	2999
54	31	1	2999
55	31	1	2999
56	31	1	2999
57	31	1	2999
58	31	1	2999
59	31	1	2999
60	31	1	2999
61	31	1	2999
62	31	1	2999
63	31	1	2999
64	31	1	2999
65	31	1	2999
66	31	1	2999
67	31	1	2999
68	31	1	2999
69	31	1	2999
70	31	1	2999
71	31	1	2999
72	31	1	2999
73	31	1	2999
74	31	1	2999
75	31	1	2999
76	31	1	2999
77	31	1	2999
78	31	1	2999
79	31	1	2999
80	31	1	2999
81	31	1	2999
82	31	1	2999
83	31	1	2999
84	31	1	2999
85	31	1	2999
86	31	1	2999
87	31	1	2999
88	31	1	2999
89	31	1	2999
90	31	1	2999
91	31	1	2999
92	31	1	2999
93	31	1	2999
94	31	1	2999
95	31	1	2999
96	31	1	2999
97	31	1	2999
98	31	1	2999
99	31	1	2999
100	31	1	2999
101	31	1	2999
102	31	1	2999
103	31	1	2999
104	31	1	2999
105	31	1	2999
106	31	1	2999
107	31	1	2999
108	31	1	2999
109	31	1	2999
110	31	1	2999
111	31	1	2999
112	31	1	2999
113	31	1	2999
114	31	1	2999
115	31	1	2999
116	31	1	2999
117	31	1	2999
118	31	1	2999
119	31	1	2999
120	31	1	2999
121	31	1	2999
122	31	1	2999
123	31	1	2999
124	31	1	2999
125	31	1	2999
126	31	1	2999
127	31	1	2999
128	31	1	2999
129	31	1	2999
130	31	1	2999
131	31	1	2999
132	31	1	2999
133	31	1	2999
134	31	1	2999
135	31	1	2999
136	31	1	2999
137	31	1	2999
138	31	1	2999
139	31	1	2999
140	31	1	2999
141	31	1	2999
142	31	1	2999
143	31	1	2999
144	31	1	2999
145	31	1	2999
146	31	1	2999
147	31	1	2999
148	31	1	2999
149	31	1	2999
150	31	1	2999
151	31	1	2999
152	31	1	2999
153	31	1	2999
154	31	1	2999
155	31	1	2999
156	31	1	2999
157	31	1	2999
158	31	1	2999
159	31	1	2999
160	31	1	2999
161	31	1	2999
162	31	1	2999
163	31	1	2999
164	31	1	2999
165	31	1	2999
166	31	1	2999
167	31	1	2999
168	31	1	2999
169	31	1	2999
170	31	1	2999
171	31	1	2999
172	31	1	2999
173	31	1	2999
174	31	1	2999
175	31	1	2999
176	31	1	2999
177	31	1	2999
178	31	1	2999
179	31	1	2999
180	31	1	2999
181	31	1	2999
182	31	1	2999
183	31	1	2999
184	31	1	2999
185	31	1	2999
186	31	1	2999
187	31	1	2999
188	31	1	2999
189	31	1	2999
190	31	1	2999
191	31	1	2999
192	31	1	2999
193	31	1	2999
194	31	1	2999
195	31	1	2999
196	31	1	2999
197	31	1	2999
198	31	1	2999
199	31	1	2999
200	31	1	2999
201	31	1	2999
202	31	1	2999
203	31	1	2999
204	31	1	2999
205	31	1	2999
206	31	1	2999
207	31	1	2999
208	31	1	2999
209	31	1	2999
210	31	1	2999
211	31	1	2999
212	31	1	2999
213	31	1	2999
214	31	1	2999
215	31	1	2999
216	31	1	2999
217	31	1	2999
218	31	1	2999
219	31	1	2999
220	31	1	2999
221	31	1	2999
222	31	1	2999
223	31	1	2999
224	31	1	2999
225	31	1	2999
226	31	1	2999
227	31	1	2999
228	31	1	2999
229	31	1	2999
230	31	1	2999
231	31	1	2999
232	31	1	2999
233	31	1	2999
234	31	1	2999
235	31	1	2999
236	31	1	2999
237	31	1	2999
238	31	1	2999
239	31	1	2999
240	31	1	2999
241	31	1	2999
242	31	1	2999
243	31	1	2999
244	31	1	2999
245	31	1	2999
246	31	1	2999
247	31	1	2999
248	31	1	2999
249	31	1	2999
250	31	1	2999
251	31	1	2999
252	31	1	2999
253	31	1	2999
254	31	1	2999
255	31	1	2999
256	31	1	2999
257	31	1	2999
258	31	1	2999
259	31	1	2999
260	31	1	2999
261	31	1	2999
262	31	1	2999
263	31	1	2999
264	31	1	2999
265	31	1	2999
266	31	1	2999
267	31	1	2999
268	31	1	2999
269	31	1	2999
270	31	1	2999
271	31	1	2999
272	31	1	2999
273	31	1	2999
274	31	1	2999
275	31	1	2999
276	31	1	2999
277	31	1	2999
278	31	1	2999
279	31	1	2999
280	31	1	2999
281	31	1	2999
282	31	1	2999
283	31	1	2999
284	31	1	2999
285	31	1	2999
286	31	1	2999
287	31	1	2999
288	31	1	2999
289	31	1	2999
290	31	1	2999
291	31	1	2999
292	31	1	2999
293	31	1	2999
294	31	1	2999
295	31	1	2999
296	31	1	2999
297	31	1	2999
298	31	1	2999
299	31	1	2999
300	31	1	2999
301	31	1	2999
302	31	1	2999
303	31	1	2999
304	31	1	2999
305	31	1	2999
306	31	1	2999
307	31	1	2999
308	31	1	2999
309	31	1	2999
310	31	1	2999
311	31	1	2999
312	31	1	2999
313	31	1	2999
314	31	1	2999
315	31	1	2999
316	31	1	2999
317	31	1	2999
318	31	1	2999
319	31	1	2999
320	31	1	2999
321	31	1	2999
322	31	1	2999
323	31	1	2999
324	31	1	2999
325	31	1	2999
326	31	1	2999
327	31	1	2999
328	31	1	2999
329	31	1	2999
330	31	1	2999
331	31	1	2999
332	31	1	2999
333	31	1	2999
334	31	1	2999
335	31	1	2999
336	31	1	2999
337	31	1	2999
338	31	1	2999
339	31	1	2999
340	31	1	2999
341	31	1	2999
342	31	1	2999
343	31	1	2999
344	31	1	2999
345	31	1	2999
346	31	1	2999
347	31	1	2999
348	31	1	2999
349	31	1	2999
350	31	1	2999
351	31	1	2999
352	31	1	2999
353	31	1	2999
354	31	1	2999
355	31	1	2999
356	31	1	2999
357	31	1	2999
358	31	1	2999
359	31	1	2999
360	31	1	2999
361	31	1	2999
362	31	1	2999
363	31	1	2999
364	31	1	2999
365	31	1	2999
366	31	1	2999
367	31	1	2999
368	31	1	2999
369	31	1	2999
370	31	1	2999
371	31	1	2999
372	31	1	2999
373	31	1	2999
374	31	1	2999
375	31	1	2999
376	31	1	2999
377	31	1	2999
378	31	1	2999
379	31	1	2999
380	31	1	2999
381	31	1	2999
382	31	1	2999
383	31	1	2999
384	31	1	2999
385	31	1	2999
386	31	1	2999
387	31	1	2999
388	31	1	2999
389	31	1	2999
390	31	1	2999
391	31	1	2999
392	31	1	2999
393	31	1	2999
394	31	1	2999
395	31	1	2999
396	31	1	2999
397	31	1	2999
398	31	1	2999
399	31	1	2999
400	31	1	2999
401	31	1	2999
402	31	1	2999
403	31	1	2999
404	31	1	2999
405	31	1	2999
406	31	1	2999
407	31	1	2999
408	31	1	2999
409	31	1	2999
410	31	1	2999
411	31	1	2999
412	31	1	2999
413	31	1	2999
414	31	1	2999
415	31	1	2999
416	31	1	2999
417	31	1	2999
418	31	1	2999
419	31	1	2999
420	31	1	2999
421	31	1	2999
422	31	1	2999
423	31	1	2999
424	31	1	2999
425	31	1	2999
426	31	1	2999
427	31	1	2999
428	31	1	2999
429	31	1	2999
430	31	1	2999
431	31	1	2999
432	31	1	2999
433	31	1	2999
434	31	1	2999
435	31	1	2999
436	31	1	2999
437	31	1	2999
438	31	1	2999
439	31	1	2999
440	31	1	2999
441	31	1	2999
442	31	1	2999
443	31	1	2999
444	31	1	2999
445	31	1	2999
446	31	1	2999
447	31	1	2999
448	31	1	2999
449	31	1	2999
450	31	1	2999
451	31	1	2999
452	31	1	2999
453	31	1	2999
454	31	1	2999
455	31	1	2999
456	31	1	2999
457	31	1	2999
458	31	1	2999
459	31	1	2999
460	31	1	2999
461	31	1	2999
462	31	1	2999
463	31	1	2999
464	31	1	2999
465	31	1	2999
466	31	1	2999
467	31	1	2999
468	31	1	2999
469	31	1	2999
470	31	1	2999
471	31	1	2999
472	31	1	2999
473	31	1	2999
474	31	1	2999
475	31	1	2999
476	31	1	2999
477	31	1	2999
478	31	1	2999
479	31	1	2999
480	31	1	2999
481	31	1	2999
482	31	1	2999
483	31	1	2999
484	31	1	2999
485	31	1	2999
486	31	1	2999
487	31	1	2999
488	31	1	2999
489	31	1	2999
490	31	1	2999
491	31	1	2999
492	31	1	2999
493	31	1	2999
494	31	1	2999
495	31	1	2999
496	31	1	2999
497	31	1	2999
498	31	1	2999
499	31	1	2999
500	31	1	2999
501	31	1	2999
502	31	1	2999
503	31	1	2999
504	31	1	2999
505	31	1	2999
506	31	1	2999
507	31	1	2999
508	31	1	2999
509	31	1	2999
510	31	1	2999
511	31	1	2999
512	31	1	2999
513	31	1	2999
514	31	1	2999
515	31	1	2999
516	31	1	2999
517	31	1	2999
518	31	1	2999
519	31	1	2999
520	31	1	2999
521	31	1	2999
522	31	1	2999
523	31	1	2999
524	31	1	2999
525	31	1	2999
526	31	1	2999
527	31	1	2999
528	31	1	2999
529	31	1	2999
530	31	1	2999
531	31	1	2999
532	31	1	2999
533	31	1	2999
534	31	1	2999
535	31	1	2999
536	31	1	2999
537	31	1	2999
538	31	1	2999
539	31	1	2999
540	31	1	2999
541	31	1	2999
542	31	1	2999
543	31	1	2999
544	31	1	2999
545	31	1	2999
546	31	1	2999
547	31	1	2999
548	31	1	2999
549	31	1	2999
550	31	1	2999
551	31	1	2999
552	31	1	2999
553	31	1	2999
554	31	1	2999
555	31	1	2999
556	31	1	2999
557	31	1	2999
558	31	1	2999
559	31	1	2999
560	31	1	2999
561	31	1	2999
562	31	1	2999
563	31	1	2999
564	31	1	2999
565	31	1	2999
566	31	1	2999
567	31	1	2999
568	31	1	2999
569	31	1	2999
570	31	1	2999
571	31	1	2999
572	31	1	2999
573	31	1	2999
574	31	1	2999
575	31	1	2999
576	31	1	2999
577	31	1	2999
578	31	1	2999
579	31	1	2999
580	31	1	2999
581	31	1	2999
582	31	1	2999
583	31	1	2999
584	31	1	2999
585	31	1	2999
586	31	1	2999
587	31	1	2999
588	31	1	2999
589	31	1	2999
590	31	1	2999
591	31	1	2999
592	31	1	2999
593	31	1	2999
594	31	1	2999
595	31	1	2999
596	31	1	2999
597	31	1	2999
598	31	1	2999
599	31	1	2999
600	31	1	2999
601	31	1	2999
602	31	1	2999
603	31	1	2999
604	31	1	2999
605	31	1	2999
606	31	1	2999
607	31	1	2999
608	31	1	2999
609	31	1	2999
610	31	1	2999
611	31	1	2999
612	31	1	2999
613	31	1	2999
614	31	1	2999
615	31	1	2999
616	31	1	2999
617	31	1	2999
618	31	1	2999
619	31	1	2999
620	31	1	2999
621	31	1	2999
622	31	1	2999
623	31	1	2999
624	31	1	2999
625	31	1	2999
626	31	1	2999
627	31	1	2999
628	31	1	2999
629	31	1	2999
630	31	1	2999
631	31	1	2999
632	31	1	2999
633	31	1	2999
634	31	1	2999
635	31	1	2999
636	31	1	2999
637	31	1	2999
638	31	1	2999
639	31	1	2999
640	31	1	2999
641	31	1	2999
642	31	1	2999
643	31	1	2999
644	31	1	2999
645	31	1	2999
646	31	1	2999
647	31	1	2999
648	31	1	2999
649	31	1	2999
650	31	1	2999
651	31	1	2999
652	31	1	2999
653	31	1	2999
654	31	1	2999
655	31	1	2999
656	31	1	2999
657	31	1	2999
658	31	1	2999
659	31	1	2999
660	31	1	2999
661	31	1	2999
662	31	1	2999
663	31	1	2999
664	31	1	2999
665	31	1	2999
666	31	1	2999
667	31	1	2999
668	31	1	2999
669	31	1	2999
670	31	1	2999
671	31	1	2999
672	31	1	2999
673	31	1	2999
674	31	1	2999
675	31	1	2999
676	31	1	2999
677	31	1	2999
678	31	1	2999
679	31	1	2999
680	31	1	2999
681	31	1	2999
682	31	1	2999
683	31	1	2999
684	31	1	2999
685	31	1	2999
686	31	1	2999
687	31	1	2999
688	31	1	2999
689	31	1	2999
690	31	1	2999
691	31	1	2999
692	31	1	2999
693	31	1	2999
694	31	1	2999
695	31	1	2999
696	31	1	2999
697	31	1	2999
698	31	1	2999
699	31	1	2999
700	31	1	2999
701	31	1	2999
702	31	1	2999
703	31	1	2999
704	31	1	2999
705	31	1	2999
706	31	1	2999
707	31	1	2999
708	31	1	2999
709	31	1	2999
710	31	1	2999
711	31	1	2999
712	31	1	2999
713	31	1	2999
714	31	1	2999
715	31	1	2999
716	31	1	2999
717	31	1	2999
718	31	1	2999
719	31	1	2999
720	31	1	2999
721	31	1	2999
722	31	1	2999
723	31	1	2999
724	31	1	2999
725	31	1	2999
726	31	1	2999
727	31	1	2999
728	31	1	2999
729	31	1	2999
730	31	1	2999
731	31	1	2999
732	31	1	2999
733	31	1	2999
734	31	1	2999
735	31	1	2999
736	31	1	2999
737	31	1	2999
738	31	1	2999
739	31	1	2999
740	31	1	2999
741	31	1	2999
742	31	1	2999
743	31	1	2999
744	31	1	2999
745	31	1	2999
746	31	1	2999
747	31	1	2999
748	31	1	2999
749	31	1	2999
750	31	1	2999
751	31	1	2999
752	31	1	2999
753	31	1	2999
754	31	1	2999
755	31	1	2999
756	31	1	2999
757	31	1	2999
758	31	1	2999
759	31	1	2999
760	31	1	2999
761	31	1	2999
762	31	1	2999
763	31	1	2999
764	31	1	2999
765	31	1	2999
766	31	1	2999
767	31	1	2999
768	31	1	2999
769	31	1	2999
770	31	1	2999
771	31	1	2999
772	31	1	2999
773	31	1	2999
774	31	1	2999
775	31	1	2999
776	31	1	2999
777	31	1	2999
778	31	1	2999
779	31	1	2999
780	31	1	2999
781	31	1	2999
782	31	1	2999
783	31	1	2999
784	31	1	2999
785	31	1	2999
786	31	1	2999
787	31	1	2999
788	31	1	2999
789	31	1	2999
790	31	1	2999
791	31	1	2999
792	31	1	2999
793	31	1	2999
794	31	1	2999
795	31	1	2999
796	31	1	2999
797	31	1	2999
798	31	1	2999
799	31	1	2999
800	31	2	2595
801	31	2	2595
802	31	2	2595
803	31	2	2595
804	31	2	2595
805	31	2	2595
806	31	2	2595
807	31	2	2595
808	31	2	2595
809	31	2	2595
810	31	2	2595
811	31	2	2595
812	31	2	2595
813	31	2	2595
814	31	2	2595
815	31	2	2595
816	31	2	2595
817	31	2	2595
818	31	2	2595
819	31	2	2595
820	31	2	2595
821	31	2	2595
822	31	2	2595
823	31	2	2595
824	31	2	2595
825	31	2	2595
826	31	2	2595
827	31	2	2595
828	31	2	2595
829	31	2	2595
830	31	2	2595
831	31	2	2595
832	31	2	2595
833	31	2	2595
834	31	2	2595
835	31	2	2595
836	31	2	2595
837	31	2	2595
838	31	2	2595
839	31	2	2595
840	31	2	2595
841	31	2	2595
842	31	2	2595
843	31	2	2595
844	31	2	2595
845	31	2	2595
846	31	2	2595
847	31	2	2595
848	31	2	2595
849	31	2	2595
850	31	2	2595
851	31	2	2595
852	31	2	2595
853	31	2	2595
854	31	2	2595
855	31	2	2595
856	31	2	2595
857	31	2	2595
858	31	2	2595
859	31	2	2595
860	31	2	2595
861	31	2	2595
862	31	2	2595
863	31	2	2595
864	31	2	2595
865	31	2	2595
866	31	2	2595
867	31	2	2595
868	31	2	2595
869	31	2	2595
870	31	2	2595
871	31	2	2595
872	31	2	2595
873	31	2	2595
874	31	2	2595
875	31	2	2595
876	31	2	2595
877	31	2	2595
878	31	2	2595
879	31	2	2595
880	31	2	2595
881	31	2	2595
882	31	2	2595
883	31	2	2595
884	31	2	2595
885	31	2	2595
886	31	2	2595
887	31	2	2595
888	31	2	2595
889	31	2	2595
890	31	2	2595
891	31	2	2595
892	31	2	2595
893	31	2	2595
894	31	2	2595
895	31	2	2595
896	31	2	2595
897	31	2	2595
898	31	2	2595
899	31	2	2595
900	31	2	2595
901	31	2	2595
902	31	2	2595
903	31	2	2595
904	31	2	2595
905	31	2	2595
906	31	2	2595
907	31	2	2595
908	31	2	2595
909	31	2	2595
910	31	2	2595
911	31	2	2595
912	31	2	2595
913	31	2	2595
914	31	2	2595
915	31	2	2595
916	31	2	2595
917	31	2	2595
918	31	2	2595
919	31	2	2595
920	31	2	2595
921	31	2	2595
922	31	2	2595
923	31	2	2595
924	31	2	2595
925	31	2	2595
926	31	2	2595
927	31	2	2595
928	31	2	2595
929	31	2	2595
930	31	2	2595
931	31	2	2595
932	31	2	2595
933	31	2	2595
934	31	2	2595
935	31	2	2595
936	31	2	2595
937	31	2	2595
938	31	2	2595
939	31	2	2595
940	31	2	2595
941	31	2	2595
942	31	2	2595
943	31	2	2595
944	31	2	2595
945	31	2	2595
946	31	2	2595
947	31	2	2595
948	31	2	2595
949	31	2	2595
950	31	2	2595
951	31	2	2595
952	31	2	2595
953	31	2	2595
954	31	2	2595
955	31	2	2595
956	31	2	2595
957	31	2	2595
958	31	2	2595
959	31	2	2595
960	31	2	2595
961	31	2	2595
962	31	2	2595
963	31	2	2595
964	31	2	2595
965	31	2	2595
966	31	2	2595
967	31	2	2595
968	31	2	2595
969	31	2	2595
970	31	2	2595
971	31	2	2595
972	31	2	2595
973	31	2	2595
974	31	2	2595
975	31	2	2595
976	31	2	2595
977	31	2	2595
978	31	2	2595
979	31	2	2595
980	31	2	2595
981	31	2	2595
982	31	2	2595
983	31	2	2595
984	31	2	2595
985	31	2	2595
986	31	2	2595
987	31	2	2595
988	31	2	2595
989	31	2	2595
990	31	2	2595
991	31	2	2595
992	31	2	2595
993	31	2	2595
994	31	2	2595
995	31	2	2595
996	31	2	2595
997	31	2	2595
998	31	2	2595
999	31	2	2595
1000	31	2	2595
1001	31	2	2595
1002	31	2	2595
1003	31	2	2595
1004	31	2	2595
1005	31	2	2595
1006	31	2	2595
1007	31	2	2595
1008	31	2	2595
1009	31	2	2595
1010	31	2	2595
1011	31	2	2595
1012	31	2	2595
1013	31	2	2595
1014	31	2	2595
1015	31	2	2595
1016	31	2	2595
1017	31	2	2595
1018	31	2	2595
1019	31	1	2999
1020	31	2	2595
1021	31	4	999
1022	31	4	999
1023	31	4	999
1024	31	1	2999
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
1	2020-04-24 15:44:20.089132-07
2	2020-04-24 15:45:03.050342-07
3	2020-04-24 15:47:05.216042-07
4	2020-04-24 15:55:45.817601-07
5	2020-04-24 15:57:16.932871-07
6	2020-04-24 15:59:00.759744-07
7	2020-04-24 16:09:30.8043-07
8	2020-04-24 16:14:52.555845-07
9	2020-04-24 16:17:29.20276-07
10	2020-04-24 16:18:02.153312-07
11	2020-04-24 16:21:28.444038-07
12	2020-04-24 16:22:07.29595-07
13	2020-04-24 16:22:49.271653-07
14	2020-04-24 16:23:40.295927-07
15	2020-04-24 16:24:54.886953-07
16	2020-04-24 16:26:25.780309-07
17	2020-04-24 16:31:21.702071-07
18	2020-04-24 16:34:02.513-07
19	2020-04-24 16:44:27.414686-07
20	2020-04-24 16:45:02.452114-07
21	2020-04-24 16:45:56.25403-07
22	2020-04-24 16:47:24.170086-07
23	2020-04-24 16:48:47.048216-07
24	2020-04-24 16:56:11.148311-07
25	2020-04-24 16:57:21.732605-07
26	2020-04-24 16:57:49.122901-07
27	2020-04-24 16:59:22.523663-07
28	2020-04-24 17:00:23.337789-07
29	2020-04-24 17:24:59.39701-07
30	2020-04-24 17:30:44.706743-07
31	2020-04-25 10:06:05.896041-07
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
1	Shake Weight	2999	/images/shake-weight.jpg	Dynamic Inertia technology ignites muscles in arms, shoulders, and chest.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
2	ShamWow	2595	/images/shamwow.jpg	It's like a chamois, towel, and sponge, all in one! Soaks up to 10x it's weight in any liquid!	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
3	Snuggie	2900	/images/snuggie.jpg	Super-Soft Fleece with pockets! One Size fits all Adults! Keeps you Warm & Your Hands-Free!	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
4	Wax Vac	999	/images/wax-vac.jpg	Gentle way to remove ear wax. Safe and hygienic. Reduces the risk of painful infections.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
5	Ostrich Pillow	9900	/images/ostrich-pillow.jpg	Create your own snugly space in the world and feel-good anywhere with the ultimate cocoon pillow.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
6	Tater Mitts	830	/images/tater-mitts.jpg	8 Seconds is all you need with Tater Mitts. Quickly and easily prepare all your favorite potato dishes with Tater Mitts.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock\\n.Aesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 1024, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 31, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 1, false);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

