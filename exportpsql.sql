--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ability_names; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE ability_names (
    ability_id integer,
    local_language_id integer,
    name text
);


ALTER TABLE ability_names OWNER TO cano;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO cano;

--
-- Name: item_names; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE item_names (
    item_id integer,
    local_language_id integer,
    name text
);


ALTER TABLE item_names OWNER TO cano;

--
-- Name: move_names; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE move_names (
    move_id integer,
    local_language_id integer,
    name text
);


ALTER TABLE move_names OWNER TO cano;

--
-- Name: nature_names; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE nature_names (
    nature_id integer,
    local_language_id integer,
    name text
);


ALTER TABLE nature_names OWNER TO cano;

--
-- Name: players; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE players (
    id integer NOT NULL,
    name character varying,
    nickname character varying,
    country character varying,
    facebook character varying,
    twitter character varying,
    youtube character varying,
    blog character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE players OWNER TO cano;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: cano
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_id_seq OWNER TO cano;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cano
--

ALTER SEQUENCE players_id_seq OWNED BY players.id;


--
-- Name: pokemon_species_names; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE pokemon_species_names (
    pokemon_species_id integer,
    local_language_id integer,
    name text,
    genus text
);


ALTER TABLE pokemon_species_names OWNER TO cano;

--
-- Name: pokemon_stats; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE pokemon_stats (
    pokemon_id integer,
    stat_id integer,
    base_stat integer,
    effort integer
);


ALTER TABLE pokemon_stats OWNER TO cano;

--
-- Name: pokemonsets; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE pokemonsets (
    id integer NOT NULL,
    title character varying,
    specie integer,
    hp integer,
    atk integer,
    defe integer,
    spatk integer,
    spdef integer,
    spd integer,
    item integer,
    nature integer,
    ability integer,
    move1 integer,
    move2 integer,
    move3 integer,
    move4 integer,
    comment text,
    active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    cached_votes_total integer DEFAULT 0,
    cached_votes_score integer DEFAULT 0,
    cached_votes_up integer DEFAULT 0,
    cached_votes_down integer DEFAULT 0,
    cached_weighted_score integer DEFAULT 0,
    cached_weighted_total integer DEFAULT 0,
    cached_weighted_average double precision DEFAULT 0.0,
    creator integer,
    lang integer DEFAULT 1,
    formato character varying DEFAULT 'VGC15'::character varying
);


ALTER TABLE pokemonsets OWNER TO cano;

--
-- Name: pokemonsets_id_seq; Type: SEQUENCE; Schema: public; Owner: cano
--

CREATE SEQUENCE pokemonsets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemonsets_id_seq OWNER TO cano;

--
-- Name: pokemonsets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cano
--

ALTER SEQUENCE pokemonsets_id_seq OWNED BY pokemonsets.id;


--
-- Name: recursos; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE recursos (
    id integer NOT NULL,
    team_id integer,
    url character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    descripcion character varying
);


ALTER TABLE recursos OWNER TO cano;

--
-- Name: recursos_id_seq; Type: SEQUENCE; Schema: public; Owner: cano
--

CREATE SEQUENCE recursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recursos_id_seq OWNER TO cano;

--
-- Name: recursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cano
--

ALTER SEQUENCE recursos_id_seq OWNED BY recursos.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO cano;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE teams (
    id integer NOT NULL,
    player_id integer,
    pokemon1_id integer,
    pokemon2_id integer,
    pokemon3_id integer,
    pokemon4_id integer,
    pokemon5_id integer,
    pokemon6_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "desc" character varying
);


ALTER TABLE teams OWNER TO cano;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: cano
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teams_id_seq OWNER TO cano;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cano
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: tops; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE tops (
    id integer NOT NULL,
    team1_id integer,
    team2_id integer,
    team3_id integer,
    team4_id integer,
    team5_id integer,
    team6_id integer,
    team7_id integer,
    team8_id integer,
    nombre_torneo character varying,
    tipo_torneo character varying,
    country character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    formato character varying,
    fecha date
);


ALTER TABLE tops OWNER TO cano;

--
-- Name: tops_id_seq; Type: SEQUENCE; Schema: public; Owner: cano
--

CREATE SEQUENCE tops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tops_id_seq OWNER TO cano;

--
-- Name: tops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cano
--

ALTER SEQUENCE tops_id_seq OWNED BY tops.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE users (
    id integer NOT NULL,
    provider character varying,
    uid character varying,
    name character varying,
    image character varying,
    token character varying,
    expires_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    banned boolean,
    admin boolean,
    mod boolean DEFAULT false
);


ALTER TABLE users OWNER TO cano;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: cano
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO cano;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cano
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: cano
--

CREATE TABLE votes (
    id integer NOT NULL,
    votable_type character varying,
    votable_id integer,
    voter_type character varying,
    voter_id integer,
    vote_flag boolean,
    vote_scope character varying,
    vote_weight integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE votes OWNER TO cano;

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: cano
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE votes_id_seq OWNER TO cano;

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cano
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cano
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cano
--

ALTER TABLE ONLY pokemonsets ALTER COLUMN id SET DEFAULT nextval('pokemonsets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cano
--

ALTER TABLE ONLY recursos ALTER COLUMN id SET DEFAULT nextval('recursos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cano
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cano
--

ALTER TABLE ONLY tops ALTER COLUMN id SET DEFAULT nextval('tops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cano
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cano
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Data for Name: ability_names; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY ability_names (ability_id, local_language_id, name) FROM stdin;
1	7	Hedor
1	9	Stench
2	7	Llovizna
2	9	Drizzle
3	7	Impulso
3	9	Speed Boost
4	7	Armadura Batalla
4	9	Battle Armor
5	7	Robustez
5	9	Sturdy
6	7	Humedad
6	9	Damp
7	7	Flexibilidad
7	9	Limber
8	7	Velo Arena
8	9	Sand Veil
9	7	Elec. Estática
9	9	Static
10	7	Absorbe Elec
10	9	Volt Absorb
11	7	Absorbe Agua
11	9	Water Absorb
12	7	Despiste
12	9	Oblivious
13	7	Aclimatación
13	9	Cloud Nine
14	7	Ojo Compuesto
14	9	Compound Eyes
15	7	Insomnio
15	9	Insomnia
16	7	Cambio Color
16	9	Color Change
17	7	Inmunidad
17	9	Immunity
18	7	Absorbe Fuego
18	9	Flash Fire
19	7	Polvo Escudo
19	9	Shield Dust
20	7	Ritmo Propio
20	9	Own Tempo
21	7	Ventosas
21	9	Suction Cups
22	7	Intimidación
22	9	Intimidate
23	7	Sombra Trampa
23	9	Shadow Tag
24	7	Piel Tosca
24	9	Rough Skin
25	7	Superguarda
25	9	Wonder Guard
26	7	Levitación
26	9	Levitate
27	7	Efecto Espora
27	9	Effect Spore
28	7	Sincronía
28	9	Synchronize
29	7	Cuerpo Puro
29	9	Clear Body
30	7	Cura Natural
30	9	Natural Cure
31	7	Pararrayos
31	9	Lightning Rod
32	7	Dicha
32	9	Serene Grace
33	7	Nado Rápido
33	9	Swift Swim
34	7	Clorofila
34	9	Chlorophyll
35	7	Iluminación
35	9	Illuminate
36	7	Rastro
36	9	Trace
37	7	Potencia
37	9	Huge Power
38	7	Punto Tóxico
38	9	Poison Point
39	7	Foco Interno
39	9	Inner Focus
40	7	Escudo Magma
40	9	Magma Armor
41	7	Velo Agua
41	9	Water Veil
42	7	Imán
42	9	Magnet Pull
43	7	Insonorizar
43	9	Soundproof
44	7	Cura Lluvia
44	9	Rain Dish
45	7	Chorro Arena
45	9	Sand Stream
46	7	Presión
46	9	Pressure
47	7	Sebo
47	9	Thick Fat
48	7	Madrugar
48	9	Early Bird
49	7	Cuerpo Llama
49	9	Flame Body
50	7	Fuga
50	9	Run Away
51	7	Vista Lince
51	9	Keen Eye
52	7	Corte Fuerte
52	9	Hyper Cutter
53	7	Recogida
53	9	Pickup
54	7	Ausente
54	9	Truant
55	7	Entusiasmo
55	9	Hustle
56	7	Gran Encanto
56	9	Cute Charm
57	7	Más
57	9	Plus
58	7	Menos
58	9	Minus
59	7	Predicción
59	9	Forecast
60	7	Viscosidad
60	9	Sticky Hold
61	7	Mudar
61	9	Shed Skin
62	7	Agallas
62	9	Guts
63	7	Escama Especial
63	9	Marvel Scale
64	7	Lodo Líquido
64	9	Liquid Ooze
65	7	Espesura
65	9	Overgrow
66	7	Mar Llamas
66	9	Blaze
67	7	Torrente
67	9	Torrent
68	7	Enjambre
68	9	Swarm
69	7	Cabeza Roca
69	9	Rock Head
70	7	Sequía
70	9	Drought
71	7	Trampa Arena
71	9	Arena Trap
72	7	Espíritu Vital
72	9	Vital Spirit
73	7	Humo Blanco
73	9	White Smoke
74	7	Energía Pura
74	9	Pure Power
75	7	Caparazón
75	9	Shell Armor
76	7	Bucle Aire
76	9	Air Lock
77	7	Tumbos
77	9	Tangled Feet
78	7	Electromotor
78	9	Motor Drive
79	7	Rivalidad
79	9	Rivalry
80	7	Impasible
80	9	Steadfast
81	7	Manto Níveo
81	9	Snow Cloak
82	7	Gula
82	9	Gluttony
83	7	Irascible
83	9	Anger Point
84	7	Liviano
84	9	Unburden
85	7	Ignífugo
85	9	Heatproof
86	7	Simple
86	9	Simple
87	7	Piel Seca
87	9	Dry Skin
88	7	Descarga
88	9	Download
89	7	Puño Férreo
89	9	Iron Fist
90	7	Antídoto
90	9	Poison Heal
91	7	Adaptable
91	9	Adaptability
92	7	Encadenado
92	9	Skill Link
93	7	Hidratación
93	9	Hydration
94	7	Poder Solar
94	9	Solar Power
95	7	Pies Rápidos
95	9	Quick Feet
96	7	Normalidad
96	9	Normalize
97	7	Francotirador
97	9	Sniper
98	7	Muro Mágico
98	9	Magic Guard
99	7	Indefenso
99	9	No Guard
100	7	Rezagado
100	9	Stall
101	7	Experto
101	9	Technician
102	7	Defensa Hoja
102	9	Leaf Guard
103	7	Zoquete
103	9	Klutz
104	7	Rompemoldes
104	9	Mold Breaker
105	7	Afortunado
105	9	Super Luck
106	7	Resquicio
106	9	Aftermath
107	7	Anticipación
107	9	Anticipation
108	7	Alerta
108	9	Forewarn
109	7	Ignorante
109	9	Unaware
110	7	Cromolente
110	9	Tinted Lens
111	7	Filtro
111	9	Filter
112	7	Inicio Lento
112	9	Slow Start
113	7	Intrépido
113	9	Scrappy
114	7	Colector
114	9	Storm Drain
115	7	Gélido
115	9	Ice Body
116	7	Roca Sólida
116	9	Solid Rock
117	7	Nevada
117	9	Snow Warning
118	7	Recogemiel
118	9	Honey Gather
119	7	Cacheo
119	9	Frisk
120	7	Audaz
120	9	Reckless
121	7	Multitipo
121	9	Multitype
122	7	Don Floral
122	9	Flower Gift
123	7	Mal Sueño
123	9	Bad Dreams
124	7	Hurto
124	9	Pickpocket
125	7	Potencia Bruta
125	9	Sheer Force
126	7	Respondón
126	9	Contrary
127	7	Nerviosismo
127	9	Unnerve
128	7	Competitivo
128	9	Defiant
129	7	Flaqueza
129	9	Defeatist
130	7	Cuerpo Maldito
130	9	Cursed Body
131	7	Alma Cura
131	9	Healer
132	7	Compiescolta
132	9	Friend Guard
133	7	Armadura Frágil
133	9	Weak Armor
134	7	Metal Pesado
134	9	Heavy Metal
135	7	Metal Liviano
135	9	Light Metal
136	7	Compensación
136	9	Multiscale
137	7	Ímpetu Tóxico
137	9	Toxic Boost
138	7	Ímpetu Ardiente
138	9	Flare Boost
139	7	Cosecha
139	9	Harvest
140	7	Telepatía
140	9	Telepathy
141	7	Veleta
141	9	Moody
142	7	Funda
142	9	Overcoat
143	7	Toque Tóxico
143	9	Poison Touch
144	7	Regeneración
144	9	Regenerator
145	7	Sacapecho
145	9	Big Pecks
146	7	Ímpetu Arena
146	9	Sand Rush
147	7	Piel Milagro
147	9	Wonder Skin
148	7	Cálculo Final
148	9	Analytic
149	7	Ilusión
149	9	Illusion
150	7	Impostor
150	9	Imposter
151	7	Allanamiento
151	9	Infiltrator
152	7	Momia
152	9	Mummy
153	7	Autoestima
153	9	Moxie
154	7	Justiciero
154	9	Justified
155	7	Cobardía
155	9	Rattled
156	7	Espejo Mágico
156	9	Magic Bounce
157	7	Herbívoro
157	9	Sap Sipper
158	7	Bromista
158	9	Prankster
159	7	Poder Arena
159	9	Sand Force
160	7	Punta Acero
160	9	Iron Barbs
161	7	Modo Daruma
161	9	Zen Mode
162	7	Tinovictoria
162	9	Victory Star
163	7	Turbollama
163	9	Turboblaze
164	7	Terravoltaje
164	9	Teravolt
165	7	Velo Aroma
165	9	Aroma Veil
166	7	Velo Flor
166	9	Flower Veil
167	7	Carrillo
167	9	Cheek Pouch
168	7	Mutatipo
168	9	Protean
169	7	Pelaje Recio
169	9	Fur Coat
170	7	Prestidigitador
170	9	Magician
171	7	Antibalas
171	9	Bulletproof
172	7	Tenacidad
172	9	Competitive
173	7	Mandíbula Fuerte
173	9	Strong Jaw
174	7	Piel Helada
174	9	Refrigerate
175	7	Velo Dulce
175	9	Sweet Veil
176	7	Cambio Táctico
176	9	Stance Change
177	7	Alas Vendaval
177	9	Gale Wings
178	7	Megadisparador
178	9	Mega Launcher
179	7	Manto Frondoso
179	9	Grass Pelt
180	7	Simbiosis
180	9	Symbiosis
181	7	Garra Dura
181	9	Tough Claws
182	7	Piel Feérica
182	9	Pixilate
183	7	Baba
183	9	Gooey
184	7	Piel Celeste
184	9	Aerilate
185	7	Amor Filial
185	9	Parental Bond
186	7	Aura Oscura
186	9	Dark Aura
187	7	Aura Feérica
187	9	Fairy Aura
188	7	Rompeaura
188	9	Aura Break
57	10	Plus
68	10	Rojení
37	10	Obrovská síla
42	10	Magnetismus
61	10	Svlékání kůže
66	10	Žár
73	10	Bílý kouř
53	10	Sbírání
58	10	Minus
11	10	Pohlcení vody
69	10	Kamenná hlava
16	10	Změna barvy
74	10	Ryzí síla
3	10	Zrychlení
6	10	Vlhkost
8	10	Pískový plášť
27	10	Výtrusy
32	10	Ušlechtilost
7	10	Pružnost
1	10	Smrad
12	10	Nevšímavost
19	10	Štítový ptrach
22	10	Zastrašení
24	10	Drsná kůže
4	10	Bojové brnění
43	10	Hluchota
14	10	Složené oči
48	10	Ranní ptáče
23	10	Znamení temna
17	10	Imunita
28	10	Synchronizace
35	10	Osvětlení
38	10	Jedovatý roh
40	10	Lávové brnění
15	10	Nespavost
2	10	Mrholení
9	10	Statika
20	10	Vlastní tempo
59	10	Předpověď
30	10	Přírodní lék
64	10	Hnusný sliz
39	10	Soustředění
33	10	Hbitá plavba
44	10	Dešťová miska
51	10	Bystré oko
54	10	Ulejvání
13	10	Sedmé nebe
56	10	Roztomilost
31	10	Hromosvod
18	10	Náhlý požár
25	10	Zázračný štít
36	10	Kopírování
75	10	Lasturoštít
46	10	Tlak
5	10	Robustnost
55	10	Čilost
10	10	Nabíjení
49	10	Ohnivé tělo
60	10	Ulepené ruce
67	10	Záplava
70	10	Vyprahlost
29	10	Průsvitnost
72	10	Neposednost
47	10	Tlustý tuk
34	10	Chlorofyl
41	10	Vodní rouška
52	10	Hyperřezač
62	10	Kuráž
21	10	Přísavky
71	10	Past
26	10	Levitace
65	10	Přerůstání
76	10	Vzdušný zámek
45	10	Proud písku
63	10	Zázračná šupina
50	10	Útěk
189	7	Beast Boost
189	9	Beast Boost
190	7	Berserk
190	9	Berserk
191	7	Comatose
191	9	Comatose
192	7	Corrosion
192	9	Corrosion
193	7	Dancer
193	9	Dancer
194	7	Dazzling
194	9	Dazzling
195	7	Disguise
195	9	Disguise
196	7	Electric Surge
196	9	Electric Surge
197	7	Emergency Exit
197	9	Emergency Exit
198	7	Fluffy
198	9	Fluffy
199	7	Full Metal Body
199	9	Full Metal Body
200	7	Galvanize
200	9	Galvanize
201	7	Grassy Surge
201	9	Grassy Surge
202	7	Innards Out
202	9	Innards Out
203	7	Liquid Voice
203	9	Liquid Voice
204	7	Long Reach
204	9	Long Reach
205	7	Merciless
205	9	Merciless
206	7	Misty Surge
206	9	Misty Surge
207	7	Power of Alchemy
207	9	Power of Alchemy
208	7	Prism Armor
208	9	Prism Armor
209	7	Psychic Surge
209	9	Psychic Surge
210	7	Queenly Majesty
210	9	Queenly Majesty
211	7	Receiver
211	9	Receiver
212	7	RKS System
212	9	RKS System
213	7	Schooling
213	9	Schooling
214	7	Shadow Shield
214	9	Shadow Shield
215	7	Shields Down
215	9	Shields Down
216	7	Slush Rush
216	9	Slush Rush
217	7	Soul Heart
217	9	Soul Heart
218	7	Stakeout
218	9	Stakeout
219	7	Stamina
219	9	Stamina
220	7	Steelworker
220	9	Steelworker
221	7	Surge Surfer
221	9	Surge Surfer
222	7	Tangling Hair
222	9	Tangling Hair
223	7	Triage
223	9	Triage
224	7	Water Bubble
224	9	Water Bubble
225	7	Water Compaction
225	9	Water Compaction
226	7	Wimp Out
226	9	Wimp Out
1	7	Hedor
1	9	Stench
2	7	Llovizna
2	9	Drizzle
3	7	Impulso
3	9	Speed Boost
4	7	Armadura Batalla
4	9	Battle Armor
5	7	Robustez
5	9	Sturdy
6	7	Humedad
6	9	Damp
7	7	Flexibilidad
7	9	Limber
8	7	Velo Arena
8	9	Sand Veil
9	7	Elec. Estática
9	9	Static
10	7	Absorbe Elec
10	9	Volt Absorb
11	7	Absorbe Agua
11	9	Water Absorb
12	7	Despiste
12	9	Oblivious
13	7	Aclimatación
13	9	Cloud Nine
14	7	Ojo Compuesto
14	9	Compound Eyes
15	7	Insomnio
15	9	Insomnia
16	7	Cambio Color
16	9	Color Change
17	7	Inmunidad
17	9	Immunity
18	7	Absorbe Fuego
18	9	Flash Fire
19	7	Polvo Escudo
19	9	Shield Dust
20	7	Ritmo Propio
20	9	Own Tempo
21	7	Ventosas
21	9	Suction Cups
22	7	Intimidación
22	9	Intimidate
23	7	Sombra Trampa
23	9	Shadow Tag
24	7	Piel Tosca
24	9	Rough Skin
25	7	Superguarda
25	9	Wonder Guard
26	7	Levitación
26	9	Levitate
27	7	Efecto Espora
27	9	Effect Spore
28	7	Sincronía
28	9	Synchronize
29	7	Cuerpo Puro
29	9	Clear Body
30	7	Cura Natural
30	9	Natural Cure
31	7	Pararrayos
31	9	Lightning Rod
32	7	Dicha
32	9	Serene Grace
33	7	Nado Rápido
33	9	Swift Swim
34	7	Clorofila
34	9	Chlorophyll
35	7	Iluminación
35	9	Illuminate
36	7	Rastro
36	9	Trace
37	7	Potencia
37	9	Huge Power
38	7	Punto Tóxico
38	9	Poison Point
39	7	Foco Interno
39	9	Inner Focus
40	7	Escudo Magma
40	9	Magma Armor
41	7	Velo Agua
41	9	Water Veil
42	7	Imán
42	9	Magnet Pull
43	7	Insonorizar
43	9	Soundproof
44	7	Cura Lluvia
44	9	Rain Dish
45	7	Chorro Arena
45	9	Sand Stream
46	7	Presión
46	9	Pressure
47	7	Sebo
47	9	Thick Fat
48	7	Madrugar
48	9	Early Bird
49	7	Cuerpo Llama
49	9	Flame Body
50	7	Fuga
50	9	Run Away
51	7	Vista Lince
51	9	Keen Eye
52	7	Corte Fuerte
52	9	Hyper Cutter
53	7	Recogida
53	9	Pickup
54	7	Ausente
54	9	Truant
55	7	Entusiasmo
55	9	Hustle
56	7	Gran Encanto
56	9	Cute Charm
57	7	Más
57	9	Plus
58	7	Menos
58	9	Minus
59	7	Predicción
59	9	Forecast
60	7	Viscosidad
60	9	Sticky Hold
61	7	Mudar
61	9	Shed Skin
62	7	Agallas
62	9	Guts
63	7	Escama Especial
63	9	Marvel Scale
64	7	Lodo Líquido
64	9	Liquid Ooze
65	7	Espesura
65	9	Overgrow
66	7	Mar Llamas
66	9	Blaze
67	7	Torrente
67	9	Torrent
68	7	Enjambre
68	9	Swarm
69	7	Cabeza Roca
69	9	Rock Head
70	7	Sequía
70	9	Drought
71	7	Trampa Arena
71	9	Arena Trap
72	7	Espíritu Vital
72	9	Vital Spirit
73	7	Humo Blanco
73	9	White Smoke
74	7	Energía Pura
74	9	Pure Power
75	7	Caparazón
75	9	Shell Armor
76	7	Bucle Aire
76	9	Air Lock
77	7	Tumbos
77	9	Tangled Feet
78	7	Electromotor
78	9	Motor Drive
79	7	Rivalidad
79	9	Rivalry
80	7	Impasible
80	9	Steadfast
81	7	Manto Níveo
81	9	Snow Cloak
82	7	Gula
82	9	Gluttony
83	7	Irascible
83	9	Anger Point
84	7	Liviano
84	9	Unburden
85	7	Ignífugo
85	9	Heatproof
86	7	Simple
86	9	Simple
87	7	Piel Seca
87	9	Dry Skin
88	7	Descarga
88	9	Download
89	7	Puño Férreo
89	9	Iron Fist
90	7	Antídoto
90	9	Poison Heal
91	7	Adaptable
91	9	Adaptability
92	7	Encadenado
92	9	Skill Link
93	7	Hidratación
93	9	Hydration
94	7	Poder Solar
94	9	Solar Power
95	7	Pies Rápidos
95	9	Quick Feet
96	7	Normalidad
96	9	Normalize
97	7	Francotirador
97	9	Sniper
98	7	Muro Mágico
98	9	Magic Guard
99	7	Indefenso
99	9	No Guard
100	7	Rezagado
100	9	Stall
101	7	Experto
101	9	Technician
102	7	Defensa Hoja
102	9	Leaf Guard
103	7	Zoquete
103	9	Klutz
104	7	Rompemoldes
104	9	Mold Breaker
105	7	Afortunado
105	9	Super Luck
106	7	Resquicio
106	9	Aftermath
107	7	Anticipación
107	9	Anticipation
108	7	Alerta
108	9	Forewarn
109	7	Ignorante
109	9	Unaware
110	7	Cromolente
110	9	Tinted Lens
111	7	Filtro
111	9	Filter
112	7	Inicio Lento
112	9	Slow Start
113	7	Intrépido
113	9	Scrappy
114	7	Colector
114	9	Storm Drain
115	7	Gélido
115	9	Ice Body
116	7	Roca Sólida
116	9	Solid Rock
117	7	Nevada
117	9	Snow Warning
118	7	Recogemiel
118	9	Honey Gather
119	7	Cacheo
119	9	Frisk
120	7	Audaz
120	9	Reckless
121	7	Multitipo
121	9	Multitype
122	7	Don Floral
122	9	Flower Gift
123	7	Mal Sueño
123	9	Bad Dreams
124	7	Hurto
124	9	Pickpocket
125	7	Potencia Bruta
125	9	Sheer Force
126	7	Respondón
126	9	Contrary
127	7	Nerviosismo
127	9	Unnerve
128	7	Competitivo
128	9	Defiant
129	7	Flaqueza
129	9	Defeatist
130	7	Cuerpo Maldito
130	9	Cursed Body
131	7	Alma Cura
131	9	Healer
132	7	Compiescolta
132	9	Friend Guard
133	7	Armadura Frágil
133	9	Weak Armor
134	7	Metal Pesado
134	9	Heavy Metal
135	7	Metal Liviano
135	9	Light Metal
136	7	Compensación
136	9	Multiscale
137	7	Ímpetu Tóxico
137	9	Toxic Boost
138	7	Ímpetu Ardiente
138	9	Flare Boost
139	7	Cosecha
139	9	Harvest
140	7	Telepatía
140	9	Telepathy
141	7	Veleta
141	9	Moody
142	7	Funda
142	9	Overcoat
143	7	Toque Tóxico
143	9	Poison Touch
144	7	Regeneración
144	9	Regenerator
145	7	Sacapecho
145	9	Big Pecks
146	7	Ímpetu Arena
146	9	Sand Rush
147	7	Piel Milagro
147	9	Wonder Skin
148	7	Cálculo Final
148	9	Analytic
149	7	Ilusión
149	9	Illusion
150	7	Impostor
150	9	Imposter
151	7	Allanamiento
151	9	Infiltrator
152	7	Momia
152	9	Mummy
153	7	Autoestima
153	9	Moxie
154	7	Justiciero
154	9	Justified
155	7	Cobardía
155	9	Rattled
156	7	Espejo Mágico
156	9	Magic Bounce
157	7	Herbívoro
157	9	Sap Sipper
158	7	Bromista
158	9	Prankster
159	7	Poder Arena
159	9	Sand Force
160	7	Punta Acero
160	9	Iron Barbs
161	7	Modo Daruma
161	9	Zen Mode
162	7	Tinovictoria
162	9	Victory Star
163	7	Turbollama
163	9	Turboblaze
164	7	Terravoltaje
164	9	Teravolt
165	7	Velo Aroma
165	9	Aroma Veil
166	7	Velo Flor
166	9	Flower Veil
167	7	Carrillo
167	9	Cheek Pouch
168	7	Mutatipo
168	9	Protean
169	7	Pelaje Recio
169	9	Fur Coat
170	7	Prestidigitador
170	9	Magician
171	7	Antibalas
171	9	Bulletproof
172	7	Tenacidad
172	9	Competitive
173	7	Mandíbula Fuerte
173	9	Strong Jaw
174	7	Piel Helada
174	9	Refrigerate
175	7	Velo Dulce
175	9	Sweet Veil
176	7	Cambio Táctico
176	9	Stance Change
177	7	Alas Vendaval
177	9	Gale Wings
178	7	Megadisparador
178	9	Mega Launcher
179	7	Manto Frondoso
179	9	Grass Pelt
180	7	Simbiosis
180	9	Symbiosis
181	7	Garra Dura
181	9	Tough Claws
182	7	Piel Feérica
182	9	Pixilate
183	7	Baba
183	9	Gooey
184	7	Piel Celeste
184	9	Aerilate
185	7	Amor Filial
185	9	Parental Bond
186	7	Aura Oscura
186	9	Dark Aura
187	7	Aura Feérica
187	9	Fairy Aura
188	7	Rompeaura
188	9	Aura Break
57	10	Plus
68	10	Rojení
37	10	Obrovská síla
42	10	Magnetismus
61	10	Svlékání kůže
66	10	Žár
73	10	Bílý kouř
53	10	Sbírání
58	10	Minus
11	10	Pohlcení vody
69	10	Kamenná hlava
16	10	Změna barvy
74	10	Ryzí síla
3	10	Zrychlení
6	10	Vlhkost
8	10	Pískový plášť
27	10	Výtrusy
32	10	Ušlechtilost
7	10	Pružnost
1	10	Smrad
12	10	Nevšímavost
19	10	Štítový ptrach
22	10	Zastrašení
24	10	Drsná kůže
4	10	Bojové brnění
43	10	Hluchota
14	10	Složené oči
48	10	Ranní ptáče
23	10	Znamení temna
17	10	Imunita
28	10	Synchronizace
35	10	Osvětlení
38	10	Jedovatý roh
40	10	Lávové brnění
15	10	Nespavost
2	10	Mrholení
9	10	Statika
20	10	Vlastní tempo
59	10	Předpověď
30	10	Přírodní lék
64	10	Hnusný sliz
39	10	Soustředění
33	10	Hbitá plavba
44	10	Dešťová miska
51	10	Bystré oko
54	10	Ulejvání
13	10	Sedmé nebe
56	10	Roztomilost
31	10	Hromosvod
18	10	Náhlý požár
25	10	Zázračný štít
36	10	Kopírování
75	10	Lasturoštít
46	10	Tlak
5	10	Robustnost
55	10	Čilost
10	10	Nabíjení
49	10	Ohnivé tělo
60	10	Ulepené ruce
67	10	Záplava
70	10	Vyprahlost
29	10	Průsvitnost
72	10	Neposednost
47	10	Tlustý tuk
34	10	Chlorofyl
41	10	Vodní rouška
52	10	Hyperřezač
62	10	Kuráž
21	10	Přísavky
71	10	Past
26	10	Levitace
65	10	Přerůstání
76	10	Vzdušný zámek
45	10	Proud písku
63	10	Zázračná šupina
50	10	Útěk
189	7	Beast Boost
189	9	Beast Boost
190	7	Berserk
190	9	Berserk
191	7	Comatose
191	9	Comatose
192	7	Corrosion
192	9	Corrosion
193	7	Dancer
193	9	Dancer
194	7	Dazzling
194	9	Dazzling
195	7	Disguise
195	9	Disguise
196	7	Electric Surge
196	9	Electric Surge
197	7	Emergency Exit
197	9	Emergency Exit
198	7	Fluffy
198	9	Fluffy
199	7	Full Metal Body
199	9	Full Metal Body
200	7	Galvanize
200	9	Galvanize
201	7	Grassy Surge
201	9	Grassy Surge
202	7	Innards Out
202	9	Innards Out
203	7	Liquid Voice
203	9	Liquid Voice
204	7	Long Reach
204	9	Long Reach
205	7	Merciless
205	9	Merciless
206	7	Misty Surge
206	9	Misty Surge
207	7	Power of Alchemy
207	9	Power of Alchemy
208	7	Prism Armor
208	9	Prism Armor
209	7	Psychic Surge
209	9	Psychic Surge
210	7	Queenly Majesty
210	9	Queenly Majesty
211	7	Receiver
211	9	Receiver
212	7	RKS System
212	9	RKS System
213	7	Schooling
213	9	Schooling
214	7	Shadow Shield
214	9	Shadow Shield
215	7	Shields Down
215	9	Shields Down
216	7	Slush Rush
216	9	Slush Rush
217	7	Soul Heart
217	9	Soul Heart
218	7	Stakeout
218	9	Stakeout
219	7	Stamina
219	9	Stamina
220	7	Steelworker
220	9	Steelworker
221	7	Surge Surfer
221	9	Surge Surfer
222	7	Tangling Hair
222	9	Tangling Hair
223	7	Triage
223	9	Triage
224	7	Water Bubble
224	9	Water Bubble
225	7	Water Compaction
225	9	Water Compaction
226	7	Wimp Out
226	9	Wimp Out
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-09-22 01:44:01.550506	2017-09-22 01:44:01.550506
\.


--
-- Data for Name: item_names; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY item_names (item_id, local_language_id, name) FROM stdin;
112	7	Diamansfera
112	9	Adamant Orb
113	7	Lustresfera
113	9	Lustrous Orb
114	7	Carta Hierba
114	9	Grass Mail
115	7	Carta Fuego
115	9	Flame Mail
116	7	Carta Pompas
116	9	Bubble Mail
117	7	Carta Flores
117	9	Bloom Mail
118	7	Carta Mina
118	9	Tunnel Mail
119	7	Carta Acero
119	9	Steel Mail
120	7	Car. Corazón
120	9	Heart Mail
121	7	Carta Nieve
121	9	Snow Mail
122	7	Car. Sideral
122	9	Space Mail
123	7	Carta Aérea
123	9	Air Mail
124	7	Car. Mosaico
124	9	Mosaic Mail
125	7	Carta Pared
125	9	Brick Mail
126	7	Baya Zreza
126	9	Cheri Berry
127	7	Baya Atania
127	9	Chesto Berry
128	7	Baya Meloc
128	9	Pecha Berry
129	7	Baya Safre
129	9	Rawst Berry
130	7	Baya Perasi
130	9	Aspear Berry
131	7	Baya Zanama
131	9	Leppa Berry
132	7	Baya Aranja
132	9	Oran Berry
133	7	Baya Caquic
133	9	Persim Berry
134	7	Baya Ziuela
134	9	Lum Berry
135	7	Baya Zidra
135	9	Sitrus Berry
136	7	Baya Higog
136	9	Figy Berry
137	7	Baya Wiki
137	9	Wiki Berry
138	7	Baya Ango
138	9	Mago Berry
139	7	Baya Guaya
139	9	Aguav Berry
140	7	Baya Pabaya
140	9	Iapapa Berry
141	7	Baya Frambu
141	9	Razz Berry
142	7	Baya Oram
142	9	Bluk Berry
143	7	Baya Latano
143	9	Nanab Berry
144	7	Baya Peragu
144	9	Wepear Berry
145	7	Baya Pinia
145	9	Pinap Berry
146	7	Baya Grana
146	9	Pomeg Berry
147	7	Baya Algama
147	9	Kelpsy Berry
148	7	Baya Ispero
148	9	Qualot Berry
149	7	Baya Meluce
149	9	Hondew Berry
150	7	Baya Uvav
150	9	Grepa Berry
151	7	Baya Tamate
151	9	Tamato Berry
152	7	Baya Mais
152	9	Cornn Berry
153	7	Baya Aostan
153	9	Magost Berry
154	7	Baya Rautan
154	9	Rabuta Berry
155	7	Baya Monli
155	9	Nomel Berry
156	7	Baya Wikano
156	9	Spelon Berry
157	7	Baya Plama
157	9	Pamtre Berry
158	7	Baya Sambia
158	9	Watmel Berry
159	7	Baya Rudion
159	9	Durin Berry
160	7	Baya Andano
160	9	Belue Berry
161	7	Baya Caoca
161	9	Occa Berry
162	7	Baya Pasio
162	9	Passho Berry
163	7	Baya Gualot
163	9	Wacan Berry
164	7	Baya Tamar
164	9	Rindo Berry
165	7	Baya Rimoya
165	9	Yache Berry
166	7	Baya Pomaro
166	9	Chople Berry
167	7	Baya Kebia
167	9	Kebia Berry
168	7	Baya Acardo
168	9	Shuca Berry
169	7	Baya Kouba
169	9	Coba Berry
170	7	Baya Payapa
170	9	Payapa Berry
171	7	Baya Yecana
171	9	Tanga Berry
172	7	Baya Alcho
172	9	Charti Berry
173	7	Baya Drasi
173	9	Kasib Berry
174	7	Baya Anjiro
174	9	Haban Berry
175	7	Baya Dillo
175	9	Colbur Berry
176	7	Baya Baribá
176	9	Babiri Berry
177	7	Baya Chilan
177	9	Chilan Berry
178	7	Baya Lichi
178	9	Liechi Berry
179	7	Baya Gonlan
179	9	Ganlon Berry
180	7	Baya Aslac
180	9	Salac Berry
181	7	Baya Yapati
181	9	Petaya Berry
182	7	Baya Aricoc
182	9	Apicot Berry
183	7	Baya Zonlan
183	9	Lansat Berry
184	7	Baya Arabol
184	9	Starf Berry
185	7	Baya Enigma
185	9	Enigma Berry
186	7	Baya Lagro
186	9	Micle Berry
187	7	Baya Chiri
187	9	Custap Berry
188	7	Baya Jaboca
188	9	Jaboca Berry
189	7	Baya Magua
189	9	Rowap Berry
190	7	Polvo Brillo
190	9	Bright Powder
191	7	Hierba Blanca
191	9	White Herb
192	7	Brazal Firme
192	9	Macho Brace
193	7	Repartir Exp
193	9	Exp. Share
194	7	Garra Rápida
194	9	Quick Claw
195	7	Campana Alivio
195	9	Soothe Bell
196	7	Hierba Mental
196	9	Mental Herb
197	7	Cinta Elegida
197	9	Choice Band
198	7	Roca del Rey
198	9	King's Rock
199	7	Polvo Plata
199	9	Silver Powder
200	7	Moneda Amuleto
200	9	Amulet Coin
201	7	Amuleto
201	9	Cleanse Tag
202	7	Rocío Bondad
202	9	Soul Dew
203	7	Diente Marino
203	9	Deep Sea Tooth
204	7	Escama Marina
204	9	Deep Sea Scale
205	7	Bola Humo
205	9	Smoke Ball
206	7	Piedra Eterna
206	9	Everstone
207	7	Cinta Focus
207	9	Focus Band
208	7	Huevo Suerte
208	9	Lucky Egg
209	7	Periscopio
209	9	Scope Lens
210	7	Revest. Metálico
210	9	Metal Coat
211	7	Restos
211	9	Leftovers
212	7	Escamadragón
212	9	Dragon Scale
213	7	Bolaluminosa
213	9	Light Ball
214	7	Arena Fina
214	9	Soft Sand
215	7	Piedra Dura
215	9	Hard Stone
216	7	Semilla Milagro
216	9	Miracle Seed
217	7	Gafas de Sol
217	9	Black Glasses
218	7	Cinturón Negro
218	9	Black Belt
219	7	Imán
219	9	Magnet
220	7	Agua Mística
220	9	Mystic Water
221	7	Pico Afilado
221	9	Sharp Beak
222	7	Flecha Venenosa
222	9	Poison Barb
223	7	Antiderretir
223	9	Never-Melt Ice
224	7	Hechizo
224	9	Spell Tag
225	7	Cuchara Torcida
225	9	Twisted Spoon
226	7	Carbón
226	9	Charcoal
227	7	Colmillo Dragón
227	9	Dragon Fang
228	7	Pañuelo Seda
228	9	Silk Scarf
229	7	Mejora
229	9	Up-Grade
230	7	Campana Concha
230	9	Shell Bell
231	7	Incienso Marino
231	9	Sea Incense
232	7	Incienso Suave
232	9	Lax Incense
233	7	Puño Suerte
233	9	Lucky Punch
234	7	Polvo Metálico
234	9	Metal Powder
235	7	Hueso Grueso
235	9	Thick Club
236	7	Palo
236	9	Stick
237	7	Pañuelo Rojo
237	9	Red Scarf
238	7	Pañuelo Azul
238	9	Blue Scarf
239	7	Pañuelo Rosa
239	9	Pink Scarf
240	7	Pañuelo Verde
240	9	Green Scarf
241	7	Pañuelo Amarillo
241	9	Yellow Scarf
242	7	Lupa
242	9	Wide Lens
243	7	Cinta Fuerte
243	9	Muscle Band
244	7	Gafas Especiales
244	9	Wise Glasses
245	7	Cinta Experto
245	9	Expert Belt
246	7	Refleluz
246	9	Light Clay
247	7	Vidasfera
247	9	Life Orb
248	7	Hierba Única
248	9	Power Herb
249	7	Toxisfera
249	9	Toxic Orb
250	7	Llamasfera
250	9	Flame Orb
251	7	Polvo Veloz
251	9	Quick Powder
252	7	Banda Focus
252	9	Focus Sash
253	7	Telescopio
253	9	Zoom Lens
254	7	Metrónomo
254	9	Metronome
255	7	Bola Férrea
255	9	Iron Ball
256	7	Cola Plúmbea
256	9	Lagging Tail
257	7	Lazo Destino
257	9	Destiny Knot
258	7	Lodo Negro
258	9	Black Sludge
259	7	Roca Helada
259	9	Icy Rock
260	7	Roca Suave
260	9	Smooth Rock
261	7	Roca Calor
261	9	Heat Rock
262	7	Roca Lluvia
262	9	Damp Rock
263	7	Garra Garfio
263	9	Grip Claw
264	7	Pañuelo Elegido
264	9	Choice Scarf
265	7	Toxiestrella
265	9	Sticky Barb
266	7	Brazal Recio
266	9	Power Bracer
267	7	Cinto Recio
267	9	Power Belt
268	7	Lente Recia
268	9	Power Lens
269	7	Banda Recia
269	9	Power Band
270	7	Franja Recia
270	9	Power Anklet
271	7	Pesa Recia
271	9	Power Weight
272	7	Muda Concha
272	9	Shed Shell
273	7	Raíz Grande
273	9	Big Root
274	7	Gafas Elegidas
274	9	Choice Specs
275	7	Tabla Llama
275	9	Flame Plate
276	7	Tabla Linfa
276	9	Splash Plate
277	7	Tabla Trueno
277	9	Zap Plate
278	7	Tabla Pradal
278	9	Meadow Plate
279	7	Tabla Helada
279	9	Icicle Plate
280	7	Tabla Fuerte
280	9	Fist Plate
281	7	Tabla Tóxica
281	9	Toxic Plate
282	7	Tabla Terrax
282	9	Earth Plate
283	7	Tabla Cielo
283	9	Sky Plate
284	7	Tabla Mental
284	9	Mind Plate
285	7	Tabla Bicho
285	9	Insect Plate
286	7	Tabla Pétrea
286	9	Stone Plate
287	7	Tabla Terror
287	9	Spooky Plate
288	7	Tabla Draco
288	9	Draco Plate
289	7	Tabla Oscura
289	9	Dread Plate
290	7	Tabla Acero
290	9	Iron Plate
291	7	Incienso Raro
291	9	Odd Incense
292	7	Incienso Roca
292	9	Rock Incense
293	7	Incienso Lento
293	9	Full Incense
294	7	Incienso Aqua
294	9	Wave Incense
295	7	Incienso Floral
295	9	Rose Incense
296	7	Incienso Duplo
296	9	Luck Incense
297	7	Incienso Puro
297	9	Pure Incense
298	7	Protector
298	9	Protector
299	7	Electrizador
299	9	Electirizer
300	7	Magmatizador
300	9	Magmarizer
301	7	Disco Extraño
301	9	Dubious Disc
302	7	Tela Terrible
302	9	Reaper Cloth
303	7	Garra Afilada
303	9	Razor Claw
304	7	Colmillo Agudo
304	9	Razor Fang
563	7	HidroROM
563	9	Douse Drive
564	7	FulgoROM
564	9	Shock Drive
565	7	PiroROM
565	9	Burn Drive
566	7	CrioROM
566	9	Chill Drive
567	7	Corazón Dulce
567	9	Sweet Heart
568	7	Carta Inicial
568	9	Greet Mail
569	7	Carta Favoritos
569	9	Favored Mail
570	7	Carta Invitar
570	9	RSVP Mail
571	7	Carta Gracias
571	9	Thanks Mail
572	7	Carta Pregunta
572	9	Inquiry Mail
573	7	Carta Gustos
573	9	Like Mail
574	7	Carta Respuesta
574	9	Reply Mail
575	7	Carta Puente S
575	9	Bridge Mail S
576	7	Carta Puente F
576	9	Bridge Mail D
577	7	Carta Puente A
577	9	Bridge Mail T
578	7	Carta Puente V
578	9	Bridge Mail V
579	7	Carta Puente P
579	9	Bridge Mail M
580	7	Escama Bella
580	9	Prism Scale
581	7	Mineral Evol
581	9	Eviolite
582	7	Piedra Pómez
582	9	Float Stone
583	7	Casco Dentado
583	9	Rocky Helmet
584	7	Globo Helio
584	9	Air Balloon
585	7	Tarjeta Roja
585	9	Red Card
586	7	Blanco
586	9	Ring Target
587	7	Banda Atadura
587	9	Binding Band
588	7	Tubérculo
588	9	Absorb Bulb
589	7	Pila
589	9	Cell Battery
590	7	Botón Escape
590	9	Eject Button
591	7	Gema Fuego
591	9	Fire Gem
592	7	Gema Agua
592	9	Water Gem
593	7	Gema Eléctrica
593	9	Electric Gem
594	7	Gema Planta
594	9	Grass Gem
595	7	Gema Hielo
595	9	Ice Gem
596	7	Gema Lucha
596	9	Fighting Gem
597	7	Gema Veneno
597	9	Poison Gem
598	7	Gema Tierra
598	9	Ground Gem
599	7	Gema Voladora
599	9	Flying Gem
600	7	Gema Psíquica
600	9	Psychic Gem
601	7	Gema Bicho
601	9	Bug Gem
602	7	Gema Roca
602	9	Rock Gem
603	7	Gema Fantasma
603	9	Ghost Gem
604	7	Gema Siniestra
604	9	Dark Gem
605	7	Gema Acero
605	9	Steel Gem
668	7	Gema Dragón
668	9	Dragon Gem
669	7	Gema Normal
669	9	Normal Gem
670	7	Caja Insignias
670	9	Medal Box
671	7	Punta ADN
671	9	DNA Splicers
673	7	Pase
673	9	Permit
674	7	Amuleto Oval
674	9	Oval Charm
675	7	Amuleto Iris
675	9	Shiny Charm
676	7	Tarjeta Plasma
676	9	Plasma Card
677	7	Pañuelo Sucio
677	9	Grubby Hanky
678	7	Acromáquina
678	9	Colress Machine
679	7	Objeto Perdido
679	9	Dropped Item
681	7	Espejo Veraz
681	9	Reveal Glass
682	7	Seguro Debilidad
682	9	Weakness Policy
683	7	Chaleco Asalto
683	9	Assault Vest
684	7	Tabla Duende
684	9	Pixie Plate
685	7	Cáps. Habilidad
685	9	Ability Capsule
686	7	Dulce de Nata
686	9	Whipped Dream
687	7	Saquito Fragante
687	9	Sachet
688	7	Musgo Brillante
688	9	Luminous Moss
689	7	Bola de Nieve
689	9	Snowball
690	7	Gafa Protectora
690	9	Safety Goggles
691	7	Abono Fértil
691	9	Rich Mulch
692	7	Abono Sorpresa
692	9	Surprise Mulch
693	7	Abono Fructífero
693	9	Boost Mulch
694	7	Abono Insólito
694	9	Amaze Mulch
695	7	Gengarita
695	9	Gengarite
696	7	Gardevoirita
696	9	Gardevoirite
697	7	Ampharosita
697	9	Ampharosite
698	7	Venusaurita
698	9	Venusaurite
699	7	Charizardita X
699	9	Charizardite X
700	7	Blastoisita
700	9	Blastoisinite
701	7	Mewtwoita X
701	9	Mewtwonite X
702	7	Mewtwoita Y
702	9	Mewtwonite Y
703	7	Blazikenita
703	9	Blazikenite
704	7	Medichamita
704	9	Medichamite
705	7	Houndoomita
705	9	Houndoominite
706	7	Aggronita
706	9	Aggronite
707	7	Banettita
707	9	Banettite
708	7	Tyranitarita
708	9	Tyranitarite
709	7	Scizorita
709	9	Scizorite
710	7	Pinsirita
710	9	Pinsirite
711	7	Aerodactylita
711	9	Aerodactylite
712	7	Lucarita
712	9	Lucarionite
713	7	Abomasnowita
713	9	Abomasite
714	7	Kangaskhanita
714	9	Kangaskhanite
715	7	Gyaradosita
715	9	Gyaradosite
716	7	Absolita
716	9	Absolite
717	7	Charizardita Y
717	9	Charizardite Y
718	7	Alakazamita
718	9	Alakazite
719	7	Heracrossita
719	9	Heracronite
720	7	Mawilita
720	9	Mawilite
721	7	Manectricita
721	9	Manectite
722	7	Garchompita
722	9	Garchompite
723	7	Baya Hibis
723	9	Roseli Berry
724	7	Baya Biglia
724	9	Kee Berry
725	7	Baya Maranga
725	9	Maranga Berry
726	7	Vale Descuento
726	9	Discount Coupon
727	7	Estatuilla Rara
727	9	Strange Souvenir
728	7	Crêpe Luminalia
728	9	Lumiose Galette
729	7	Fósil Mandíbula
729	9	Jaw Fossil
730	7	Fósil Aleta
730	9	Sail Fossil
731	7	Gema Hada
731	9	Fairy Gem
732	7	Guía de Máximas
732	9	Adventure Rules
733	7	Llave Ascensor
733	9	Elevator Key
734	7	Holomisor
734	9	Holo Caster
735	7	Emblema Kalos
735	9	Honor of Kalos
736	7	Piedra Insólita
736	9	Intriguing Stone
737	7	Portalentillas
737	9	Lens Case
738	7	Boleto Handsome
738	9	Looker Ticket
739	7	Mega-Aro
739	9	Mega Ring
740	7	Pase Central
740	9	Power Plant Pass
741	7	Carta Profesor
741	9	Prof's Letter
742	7	Patines
742	9	Roller Skates
743	7	Lotadgadera
743	9	Sprinklotad
744	9	Swampertite
745	9	Sceptilite
746	9	Sablenite
747	9	Altarianite
748	9	Galladite
749	9	Audinite
750	9	Metagrossite
751	9	Sharpedonite
752	9	Slowbronite
753	9	Steelixite
754	9	Pidgeotite
755	9	Glalitite
756	9	Diancite
757	9	Cameruptite
758	9	Lopunnite
759	9	Salamencite
760	9	Beedrillite
744	7	Swampertita
745	7	Sceptilita
746	7	Sableynita
747	7	Altarianita
748	7	Galladita
749	7	Audinita
750	7	Metagrossita
751	7	Sharpedonita
752	7	Slowbronita
753	7	Steelixita
754	7	Pidgeotita
755	7	Glalita
756	7	Diancita
757	7	Cameruptita
758	7	Lopunnita
759	7	Salamencita
760	7	Beedrillita
761	9	Red Orb
761	7	Prisma Roja
762	9	Blue Orb
762	7	Prisma Azul
763	7	Normalium Z
763	9	Normalium Z
764	7	Firium Z
764	9	Firium Z
765	7	Waterium Z
765	9	Waterium Z
766	7	Electrium Z
766	9	Electrium Z
767	7	Grassium Z
767	9	Grassium Z
768	7	Icium Z
768	9	Icium Z
769	7	Fightinium Z
769	9	Fightinium Z
770	7	Poisonium Z
770	9	Poisonium Z
771	7	Groundium Z
771	9	Groundium Z
772	7	Flyinium Z
772	9	Flyinium Z
773	7	Psychium Z
773	9	Psychium Z
774	7	Buginium Z
774	9	Buginium Z
775	7	Rockium Z
775	9	Rockium Z
776	7	Ghostium Z
776	9	Ghostium Z
777	7	Dragonium Z
777	9	Dragonium Z
778	7	Darkinium Z
778	9	Darkinium Z
779	7	Steelium Z
779	9	Steelium Z
780	7	Fairium Z
780	9	Fairium Z
781	7	Pikanium Z
781	9	Pikanium Z
782	7	Bottle Cap
782	9	Bottle Cap
783	7	Gold Bottle Cap
783	9	Gold Bottle Cap
784	7	Decidium Z
784	9	Decidium Z
785	7	Incinium Z
785	9	Incinium Z
786	7	Primarium Z
786	9	Primarium Z
787	7	Tapunium Z
787	9	Tapunium Z
788	7	Aloraichium Z
788	9	Aloraichium Z
789	7	Snorlium Z
789	9	Snorlium Z
790	7	Eevium Z
790	9	Eevium Z
791	7	Festival Ticket
791	9	Festival Ticket
792	7	Adrenaline Orb
792	9	Adrenaline Orb
793	7	Ice Stone
793	9	Ice Stone
794	7	Beast Ball
794	9	Beast Ball
795	7	Big Malasada
795	9	Big Malasada
796	7	Red Nectar
796	9	Red Nectar
797	7	Yellow Nectar
797	9	Yellow Nectar
798	7	Pink Nectar
798	9	Pink Nectar
799	7	Purple Nectar
799	9	Purple Nectar
800	7	Terrain Extender
800	9	Terrain Extender
801	7	Protective Pads
801	9	Protective Pads
802	7	Electric Seed
802	9	Electric Seed
803	7	Psychic Seed
803	9	Psychic Seed
804	7	Misty Seed
804	9	Misty Seed
805	7	Grassy Seed
805	9	Grassy Seed
806	7	Fighting Memory
806	9	Fighting Memory
807	7	Flying Memory
807	9	Flying Memory
808	7	Poison Memory
808	9	Poison Memory
809	7	Ground Memory
809	9	Ground Memory
810	7	Rock Memory
810	9	Rock Memory
811	7	Bug Memory
811	9	Bug Memory
812	7	Ghost Memory
812	9	Ghost Memory
813	7	Steel Memory
813	9	Steel Memory
814	7	Fire Memory
814	9	Fire Memory
815	7	Water Memory
815	9	Water Memory
816	7	Grass Memory
816	9	Grass Memory
817	7	Electric Memory
817	9	Electric Memory
818	7	Psychic Memory
818	9	Psychic Memory
819	7	Ice Memory
819	9	Ice Memory
820	7	Dragon Memory
820	9	Dragon Memory
821	7	Dark Memory
821	9	Dark Memory
822	7	Fairy Memory
822	9	Fairy Memory
112	7	Diamansfera
112	9	Adamant Orb
113	7	Lustresfera
113	9	Lustrous Orb
114	7	Carta Hierba
114	9	Grass Mail
115	7	Carta Fuego
115	9	Flame Mail
116	7	Carta Pompas
116	9	Bubble Mail
117	7	Carta Flores
117	9	Bloom Mail
118	7	Carta Mina
118	9	Tunnel Mail
119	7	Carta Acero
119	9	Steel Mail
120	7	Car. Corazón
120	9	Heart Mail
121	7	Carta Nieve
121	9	Snow Mail
122	7	Car. Sideral
122	9	Space Mail
123	7	Carta Aérea
123	9	Air Mail
124	7	Car. Mosaico
124	9	Mosaic Mail
125	7	Carta Pared
125	9	Brick Mail
126	7	Baya Zreza
126	9	Cheri Berry
127	7	Baya Atania
127	9	Chesto Berry
128	7	Baya Meloc
128	9	Pecha Berry
129	7	Baya Safre
129	9	Rawst Berry
130	7	Baya Perasi
130	9	Aspear Berry
131	7	Baya Zanama
131	9	Leppa Berry
132	7	Baya Aranja
132	9	Oran Berry
133	7	Baya Caquic
133	9	Persim Berry
134	7	Baya Ziuela
134	9	Lum Berry
135	7	Baya Zidra
135	9	Sitrus Berry
136	7	Baya Higog
136	9	Figy Berry
137	7	Baya Wiki
137	9	Wiki Berry
138	7	Baya Ango
138	9	Mago Berry
139	7	Baya Guaya
139	9	Aguav Berry
140	7	Baya Pabaya
140	9	Iapapa Berry
141	7	Baya Frambu
141	9	Razz Berry
142	7	Baya Oram
142	9	Bluk Berry
143	7	Baya Latano
143	9	Nanab Berry
144	7	Baya Peragu
144	9	Wepear Berry
145	7	Baya Pinia
145	9	Pinap Berry
146	7	Baya Grana
146	9	Pomeg Berry
147	7	Baya Algama
147	9	Kelpsy Berry
148	7	Baya Ispero
148	9	Qualot Berry
149	7	Baya Meluce
149	9	Hondew Berry
150	7	Baya Uvav
150	9	Grepa Berry
151	7	Baya Tamate
151	9	Tamato Berry
152	7	Baya Mais
152	9	Cornn Berry
153	7	Baya Aostan
153	9	Magost Berry
154	7	Baya Rautan
154	9	Rabuta Berry
155	7	Baya Monli
155	9	Nomel Berry
156	7	Baya Wikano
156	9	Spelon Berry
157	7	Baya Plama
157	9	Pamtre Berry
158	7	Baya Sambia
158	9	Watmel Berry
159	7	Baya Rudion
159	9	Durin Berry
160	7	Baya Andano
160	9	Belue Berry
161	7	Baya Caoca
161	9	Occa Berry
162	7	Baya Pasio
162	9	Passho Berry
163	7	Baya Gualot
163	9	Wacan Berry
164	7	Baya Tamar
164	9	Rindo Berry
165	7	Baya Rimoya
165	9	Yache Berry
166	7	Baya Pomaro
166	9	Chople Berry
167	7	Baya Kebia
167	9	Kebia Berry
168	7	Baya Acardo
168	9	Shuca Berry
169	7	Baya Kouba
169	9	Coba Berry
170	7	Baya Payapa
170	9	Payapa Berry
171	7	Baya Yecana
171	9	Tanga Berry
172	7	Baya Alcho
172	9	Charti Berry
173	7	Baya Drasi
173	9	Kasib Berry
174	7	Baya Anjiro
174	9	Haban Berry
175	7	Baya Dillo
175	9	Colbur Berry
176	7	Baya Baribá
176	9	Babiri Berry
177	7	Baya Chilan
177	9	Chilan Berry
178	7	Baya Lichi
178	9	Liechi Berry
179	7	Baya Gonlan
179	9	Ganlon Berry
180	7	Baya Aslac
180	9	Salac Berry
181	7	Baya Yapati
181	9	Petaya Berry
182	7	Baya Aricoc
182	9	Apicot Berry
183	7	Baya Zonlan
183	9	Lansat Berry
184	7	Baya Arabol
184	9	Starf Berry
185	7	Baya Enigma
185	9	Enigma Berry
186	7	Baya Lagro
186	9	Micle Berry
187	7	Baya Chiri
187	9	Custap Berry
188	7	Baya Jaboca
188	9	Jaboca Berry
189	7	Baya Magua
189	9	Rowap Berry
190	7	Polvo Brillo
190	9	Bright Powder
191	7	Hierba Blanca
191	9	White Herb
192	7	Brazal Firme
192	9	Macho Brace
193	7	Repartir Exp
193	9	Exp. Share
194	7	Garra Rápida
194	9	Quick Claw
195	7	Campana Alivio
195	9	Soothe Bell
196	7	Hierba Mental
196	9	Mental Herb
197	7	Cinta Elegida
197	9	Choice Band
198	7	Roca del Rey
198	9	King's Rock
199	7	Polvo Plata
199	9	Silver Powder
200	7	Moneda Amuleto
200	9	Amulet Coin
201	7	Amuleto
201	9	Cleanse Tag
202	7	Rocío Bondad
202	9	Soul Dew
203	7	Diente Marino
203	9	Deep Sea Tooth
204	7	Escama Marina
204	9	Deep Sea Scale
205	7	Bola Humo
205	9	Smoke Ball
206	7	Piedra Eterna
206	9	Everstone
207	7	Cinta Focus
207	9	Focus Band
208	7	Huevo Suerte
208	9	Lucky Egg
209	7	Periscopio
209	9	Scope Lens
210	7	Revest. Metálico
210	9	Metal Coat
211	7	Restos
211	9	Leftovers
212	7	Escamadragón
212	9	Dragon Scale
213	7	Bolaluminosa
213	9	Light Ball
214	7	Arena Fina
214	9	Soft Sand
215	7	Piedra Dura
215	9	Hard Stone
216	7	Semilla Milagro
216	9	Miracle Seed
217	7	Gafas de Sol
217	9	Black Glasses
218	7	Cinturón Negro
218	9	Black Belt
219	7	Imán
219	9	Magnet
220	7	Agua Mística
220	9	Mystic Water
221	7	Pico Afilado
221	9	Sharp Beak
222	7	Flecha Venenosa
222	9	Poison Barb
223	7	Antiderretir
223	9	Never-Melt Ice
224	7	Hechizo
224	9	Spell Tag
225	7	Cuchara Torcida
225	9	Twisted Spoon
226	7	Carbón
226	9	Charcoal
227	7	Colmillo Dragón
227	9	Dragon Fang
228	7	Pañuelo Seda
228	9	Silk Scarf
229	7	Mejora
229	9	Up-Grade
230	7	Campana Concha
230	9	Shell Bell
231	7	Incienso Marino
231	9	Sea Incense
232	7	Incienso Suave
232	9	Lax Incense
233	7	Puño Suerte
233	9	Lucky Punch
234	7	Polvo Metálico
234	9	Metal Powder
235	7	Hueso Grueso
235	9	Thick Club
236	7	Palo
236	9	Stick
237	7	Pañuelo Rojo
237	9	Red Scarf
238	7	Pañuelo Azul
238	9	Blue Scarf
239	7	Pañuelo Rosa
239	9	Pink Scarf
240	7	Pañuelo Verde
240	9	Green Scarf
241	7	Pañuelo Amarillo
241	9	Yellow Scarf
242	7	Lupa
242	9	Wide Lens
243	7	Cinta Fuerte
243	9	Muscle Band
244	7	Gafas Especiales
244	9	Wise Glasses
245	7	Cinta Experto
245	9	Expert Belt
246	7	Refleluz
246	9	Light Clay
247	7	Vidasfera
247	9	Life Orb
248	7	Hierba Única
248	9	Power Herb
249	7	Toxisfera
249	9	Toxic Orb
250	7	Llamasfera
250	9	Flame Orb
251	7	Polvo Veloz
251	9	Quick Powder
252	7	Banda Focus
252	9	Focus Sash
253	7	Telescopio
253	9	Zoom Lens
254	7	Metrónomo
254	9	Metronome
255	7	Bola Férrea
255	9	Iron Ball
256	7	Cola Plúmbea
256	9	Lagging Tail
257	7	Lazo Destino
257	9	Destiny Knot
258	7	Lodo Negro
258	9	Black Sludge
259	7	Roca Helada
259	9	Icy Rock
260	7	Roca Suave
260	9	Smooth Rock
261	7	Roca Calor
261	9	Heat Rock
262	7	Roca Lluvia
262	9	Damp Rock
263	7	Garra Garfio
263	9	Grip Claw
264	7	Pañuelo Elegido
264	9	Choice Scarf
265	7	Toxiestrella
265	9	Sticky Barb
266	7	Brazal Recio
266	9	Power Bracer
267	7	Cinto Recio
267	9	Power Belt
268	7	Lente Recia
268	9	Power Lens
269	7	Banda Recia
269	9	Power Band
270	7	Franja Recia
270	9	Power Anklet
271	7	Pesa Recia
271	9	Power Weight
272	7	Muda Concha
272	9	Shed Shell
273	7	Raíz Grande
273	9	Big Root
274	7	Gafas Elegidas
274	9	Choice Specs
275	7	Tabla Llama
275	9	Flame Plate
276	7	Tabla Linfa
276	9	Splash Plate
277	7	Tabla Trueno
277	9	Zap Plate
278	7	Tabla Pradal
278	9	Meadow Plate
279	7	Tabla Helada
279	9	Icicle Plate
280	7	Tabla Fuerte
280	9	Fist Plate
281	7	Tabla Tóxica
281	9	Toxic Plate
282	7	Tabla Terrax
282	9	Earth Plate
283	7	Tabla Cielo
283	9	Sky Plate
284	7	Tabla Mental
284	9	Mind Plate
285	7	Tabla Bicho
285	9	Insect Plate
286	7	Tabla Pétrea
286	9	Stone Plate
287	7	Tabla Terror
287	9	Spooky Plate
288	7	Tabla Draco
288	9	Draco Plate
289	7	Tabla Oscura
289	9	Dread Plate
290	7	Tabla Acero
290	9	Iron Plate
291	7	Incienso Raro
291	9	Odd Incense
292	7	Incienso Roca
292	9	Rock Incense
293	7	Incienso Lento
293	9	Full Incense
294	7	Incienso Aqua
294	9	Wave Incense
295	7	Incienso Floral
295	9	Rose Incense
296	7	Incienso Duplo
296	9	Luck Incense
297	7	Incienso Puro
297	9	Pure Incense
298	7	Protector
298	9	Protector
299	7	Electrizador
299	9	Electirizer
300	7	Magmatizador
300	9	Magmarizer
301	7	Disco Extraño
301	9	Dubious Disc
302	7	Tela Terrible
302	9	Reaper Cloth
303	7	Garra Afilada
303	9	Razor Claw
304	7	Colmillo Agudo
304	9	Razor Fang
563	7	HidroROM
563	9	Douse Drive
564	7	FulgoROM
564	9	Shock Drive
565	7	PiroROM
565	9	Burn Drive
566	7	CrioROM
566	9	Chill Drive
567	7	Corazón Dulce
567	9	Sweet Heart
568	7	Carta Inicial
568	9	Greet Mail
569	7	Carta Favoritos
569	9	Favored Mail
570	7	Carta Invitar
570	9	RSVP Mail
571	7	Carta Gracias
571	9	Thanks Mail
572	7	Carta Pregunta
572	9	Inquiry Mail
573	7	Carta Gustos
573	9	Like Mail
574	7	Carta Respuesta
574	9	Reply Mail
575	7	Carta Puente S
575	9	Bridge Mail S
576	7	Carta Puente F
576	9	Bridge Mail D
577	7	Carta Puente A
577	9	Bridge Mail T
578	7	Carta Puente V
578	9	Bridge Mail V
579	7	Carta Puente P
579	9	Bridge Mail M
580	7	Escama Bella
580	9	Prism Scale
581	7	Mineral Evol
581	9	Eviolite
582	7	Piedra Pómez
582	9	Float Stone
583	7	Casco Dentado
583	9	Rocky Helmet
584	7	Globo Helio
584	9	Air Balloon
585	7	Tarjeta Roja
585	9	Red Card
586	7	Blanco
586	9	Ring Target
587	7	Banda Atadura
587	9	Binding Band
588	7	Tubérculo
588	9	Absorb Bulb
589	7	Pila
589	9	Cell Battery
590	7	Botón Escape
590	9	Eject Button
591	7	Gema Fuego
591	9	Fire Gem
592	7	Gema Agua
592	9	Water Gem
593	7	Gema Eléctrica
593	9	Electric Gem
594	7	Gema Planta
594	9	Grass Gem
595	7	Gema Hielo
595	9	Ice Gem
596	7	Gema Lucha
596	9	Fighting Gem
597	7	Gema Veneno
597	9	Poison Gem
598	7	Gema Tierra
598	9	Ground Gem
599	7	Gema Voladora
599	9	Flying Gem
600	7	Gema Psíquica
600	9	Psychic Gem
601	7	Gema Bicho
601	9	Bug Gem
602	7	Gema Roca
602	9	Rock Gem
603	7	Gema Fantasma
603	9	Ghost Gem
604	7	Gema Siniestra
604	9	Dark Gem
605	7	Gema Acero
605	9	Steel Gem
668	7	Gema Dragón
668	9	Dragon Gem
669	7	Gema Normal
669	9	Normal Gem
670	7	Caja Insignias
670	9	Medal Box
671	7	Punta ADN
671	9	DNA Splicers
673	7	Pase
673	9	Permit
674	7	Amuleto Oval
674	9	Oval Charm
675	7	Amuleto Iris
675	9	Shiny Charm
676	7	Tarjeta Plasma
676	9	Plasma Card
677	7	Pañuelo Sucio
677	9	Grubby Hanky
678	7	Acromáquina
678	9	Colress Machine
679	7	Objeto Perdido
679	9	Dropped Item
681	7	Espejo Veraz
681	9	Reveal Glass
682	7	Seguro Debilidad
682	9	Weakness Policy
683	7	Chaleco Asalto
683	9	Assault Vest
684	7	Tabla Duende
684	9	Pixie Plate
685	7	Cáps. Habilidad
685	9	Ability Capsule
686	7	Dulce de Nata
686	9	Whipped Dream
687	7	Saquito Fragante
687	9	Sachet
688	7	Musgo Brillante
688	9	Luminous Moss
689	7	Bola de Nieve
689	9	Snowball
690	7	Gafa Protectora
690	9	Safety Goggles
691	7	Abono Fértil
691	9	Rich Mulch
692	7	Abono Sorpresa
692	9	Surprise Mulch
693	7	Abono Fructífero
693	9	Boost Mulch
694	7	Abono Insólito
694	9	Amaze Mulch
695	7	Gengarita
695	9	Gengarite
696	7	Gardevoirita
696	9	Gardevoirite
697	7	Ampharosita
697	9	Ampharosite
698	7	Venusaurita
698	9	Venusaurite
699	7	Charizardita X
699	9	Charizardite X
700	7	Blastoisita
700	9	Blastoisinite
701	7	Mewtwoita X
701	9	Mewtwonite X
702	7	Mewtwoita Y
702	9	Mewtwonite Y
703	7	Blazikenita
703	9	Blazikenite
704	7	Medichamita
704	9	Medichamite
705	7	Houndoomita
705	9	Houndoominite
706	7	Aggronita
706	9	Aggronite
707	7	Banettita
707	9	Banettite
708	7	Tyranitarita
708	9	Tyranitarite
709	7	Scizorita
709	9	Scizorite
710	7	Pinsirita
710	9	Pinsirite
711	7	Aerodactylita
711	9	Aerodactylite
712	7	Lucarita
712	9	Lucarionite
713	7	Abomasnowita
713	9	Abomasite
714	7	Kangaskhanita
714	9	Kangaskhanite
715	7	Gyaradosita
715	9	Gyaradosite
716	7	Absolita
716	9	Absolite
717	7	Charizardita Y
717	9	Charizardite Y
718	7	Alakazamita
718	9	Alakazite
719	7	Heracrossita
719	9	Heracronite
720	7	Mawilita
720	9	Mawilite
721	7	Manectricita
721	9	Manectite
722	7	Garchompita
722	9	Garchompite
723	7	Baya Hibis
723	9	Roseli Berry
724	7	Baya Biglia
724	9	Kee Berry
725	7	Baya Maranga
725	9	Maranga Berry
726	7	Vale Descuento
726	9	Discount Coupon
727	7	Estatuilla Rara
727	9	Strange Souvenir
728	7	Crêpe Luminalia
728	9	Lumiose Galette
729	7	Fósil Mandíbula
729	9	Jaw Fossil
730	7	Fósil Aleta
730	9	Sail Fossil
731	7	Gema Hada
731	9	Fairy Gem
732	7	Guía de Máximas
732	9	Adventure Rules
733	7	Llave Ascensor
733	9	Elevator Key
734	7	Holomisor
734	9	Holo Caster
735	7	Emblema Kalos
735	9	Honor of Kalos
736	7	Piedra Insólita
736	9	Intriguing Stone
737	7	Portalentillas
737	9	Lens Case
738	7	Boleto Handsome
738	9	Looker Ticket
739	7	Mega-Aro
739	9	Mega Ring
740	7	Pase Central
740	9	Power Plant Pass
741	7	Carta Profesor
741	9	Prof's Letter
742	7	Patines
742	9	Roller Skates
743	7	Lotadgadera
743	9	Sprinklotad
744	9	Swampertite
745	9	Sceptilite
746	9	Sablenite
747	9	Altarianite
748	9	Galladite
749	9	Audinite
750	9	Metagrossite
751	9	Sharpedonite
752	9	Slowbronite
753	9	Steelixite
754	9	Pidgeotite
755	9	Glalitite
756	9	Diancite
757	9	Cameruptite
758	9	Lopunnite
759	9	Salamencite
760	9	Beedrillite
744	7	Swampertita
745	7	Sceptilita
746	7	Sableynita
747	7	Altarianita
748	7	Galladita
749	7	Audinita
750	7	Metagrossita
751	7	Sharpedonita
752	7	Slowbronita
753	7	Steelixita
754	7	Pidgeotita
755	7	Glalita
756	7	Diancita
757	7	Cameruptita
758	7	Lopunnita
759	7	Salamencita
760	7	Beedrillita
761	9	Red Orb
761	7	Prisma Roja
762	9	Blue Orb
762	7	Prisma Azul
763	7	Normalium Z
763	9	Normalium Z
764	7	Firium Z
764	9	Firium Z
765	7	Waterium Z
765	9	Waterium Z
766	7	Electrium Z
766	9	Electrium Z
767	7	Grassium Z
767	9	Grassium Z
768	7	Icium Z
768	9	Icium Z
769	7	Fightinium Z
769	9	Fightinium Z
770	7	Poisonium Z
770	9	Poisonium Z
771	7	Groundium Z
771	9	Groundium Z
772	7	Flyinium Z
772	9	Flyinium Z
773	7	Psychium Z
773	9	Psychium Z
774	7	Buginium Z
774	9	Buginium Z
775	7	Rockium Z
775	9	Rockium Z
776	7	Ghostium Z
776	9	Ghostium Z
777	7	Dragonium Z
777	9	Dragonium Z
778	7	Darkinium Z
778	9	Darkinium Z
779	7	Steelium Z
779	9	Steelium Z
780	7	Fairium Z
780	9	Fairium Z
781	7	Pikanium Z
781	9	Pikanium Z
782	7	Bottle Cap
782	9	Bottle Cap
783	7	Gold Bottle Cap
783	9	Gold Bottle Cap
784	7	Decidium Z
784	9	Decidium Z
785	7	Incinium Z
785	9	Incinium Z
786	7	Primarium Z
786	9	Primarium Z
787	7	Tapunium Z
787	9	Tapunium Z
788	7	Aloraichium Z
788	9	Aloraichium Z
789	7	Snorlium Z
789	9	Snorlium Z
790	7	Eevium Z
790	9	Eevium Z
791	7	Festival Ticket
791	9	Festival Ticket
792	7	Adrenaline Orb
792	9	Adrenaline Orb
793	7	Ice Stone
793	9	Ice Stone
794	7	Beast Ball
794	9	Beast Ball
795	7	Big Malasada
795	9	Big Malasada
796	7	Red Nectar
796	9	Red Nectar
797	7	Yellow Nectar
797	9	Yellow Nectar
798	7	Pink Nectar
798	9	Pink Nectar
799	7	Purple Nectar
799	9	Purple Nectar
800	7	Terrain Extender
800	9	Terrain Extender
801	7	Protective Pads
801	9	Protective Pads
802	7	Electric Seed
802	9	Electric Seed
803	7	Psychic Seed
803	9	Psychic Seed
804	7	Misty Seed
804	9	Misty Seed
805	7	Grassy Seed
805	9	Grassy Seed
806	7	Fighting Memory
806	9	Fighting Memory
807	7	Flying Memory
807	9	Flying Memory
808	7	Poison Memory
808	9	Poison Memory
809	7	Ground Memory
809	9	Ground Memory
810	7	Rock Memory
810	9	Rock Memory
811	7	Bug Memory
811	9	Bug Memory
812	7	Ghost Memory
812	9	Ghost Memory
813	7	Steel Memory
813	9	Steel Memory
814	7	Fire Memory
814	9	Fire Memory
815	7	Water Memory
815	9	Water Memory
816	7	Grass Memory
816	9	Grass Memory
817	7	Electric Memory
817	9	Electric Memory
818	7	Psychic Memory
818	9	Psychic Memory
819	7	Ice Memory
819	9	Ice Memory
820	7	Dragon Memory
820	9	Dragon Memory
821	7	Dark Memory
821	9	Dark Memory
822	7	Fairy Memory
822	9	Fairy Memory
\.


--
-- Data for Name: move_names; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY move_names (move_id, local_language_id, name) FROM stdin;
1	7	Destructor
1	9	Pound
2	7	Golpe Kárate
2	9	Karate Chop
3	7	Doble Bofetón
3	9	Double Slap
4	7	Puño Cometa
4	9	Comet Punch
5	7	Megapuño
5	9	Mega Punch
6	7	Día de Pago
6	9	Pay Day
7	7	Puño Fuego
7	9	Fire Punch
8	7	Puño Hielo
8	9	Ice Punch
9	7	Puño Trueno
9	9	Thunder Punch
10	7	Arañazo
10	9	Scratch
11	7	Agarre
11	9	Vice Grip
12	7	Guillotina
12	9	Guillotine
13	7	Viento Cortante
13	9	Razor Wind
14	7	Danza Espada
14	9	Swords Dance
15	7	Corte
15	9	Cut
16	7	Tornado
16	9	Gust
17	7	Ataque Ala
17	9	Wing Attack
18	7	Remolino
18	9	Whirlwind
19	7	Vuelo
19	9	Fly
20	7	Atadura
20	9	Bind
21	7	Atizar
21	9	Slam
22	7	Látigo Cepa
22	9	Vine Whip
23	7	Pisotón
23	9	Stomp
24	7	Doble Patada
24	9	Double Kick
25	7	Megapatada
25	9	Mega Kick
26	7	Patada Salto
26	9	Jump Kick
27	7	Patada Giro
27	9	Rolling Kick
28	7	Ataque Arena
28	9	Sand Attack
29	7	Golpe Cabeza
29	9	Headbutt
30	7	Cornada
30	9	Horn Attack
31	7	Ataque Furia
31	9	Fury Attack
32	7	Perforador
32	9	Horn Drill
33	7	Placaje
33	9	Tackle
34	7	Golpe Cuerpo
34	9	Body Slam
35	7	Constricción
35	9	Wrap
36	7	Derribo
36	9	Take Down
37	7	Golpe
37	9	Thrash
38	7	Doble Filo
38	9	Double-Edge
39	7	Látigo
39	9	Tail Whip
40	7	Picotazo Ven
40	9	Poison Sting
41	7	Doble Ataque
41	9	Twineedle
42	7	Pin Misil
42	9	Pin Missile
43	7	Malicioso
43	9	Leer
44	7	Mordisco
44	9	Bite
45	7	Gruñido
45	9	Growl
46	7	Rugido
46	9	Roar
47	7	Canto
47	9	Sing
48	7	Supersónico
48	9	Supersonic
49	7	Bomba Sónica
49	9	Sonic Boom
50	7	Anulación
50	9	Disable
51	7	Ácido
51	9	Acid
52	7	Ascuas
52	9	Ember
53	7	Lanzallamas
53	9	Flamethrower
54	7	Neblina
54	9	Mist
55	7	Pistola Agua
55	9	Water Gun
56	7	Hidrobomba
56	9	Hydro Pump
57	7	Surf
57	9	Surf
58	7	Rayo Hielo
58	9	Ice Beam
59	7	Ventisca
59	9	Blizzard
60	7	Psicorrayo
60	9	Psybeam
61	7	Rayo Burbuja
61	9	Bubble Beam
62	7	Rayo Aurora
62	9	Aurora Beam
63	7	Hiperrayo
63	9	Hyper Beam
64	7	Picotazo
64	9	Peck
65	7	Pico Taladro
65	9	Drill Peck
66	7	Sumisión
66	9	Submission
67	7	Patada Baja
67	9	Low Kick
68	7	Contraataque
68	9	Counter
69	7	Mov. Sísmico
69	9	Seismic Toss
70	7	Fuerza
70	9	Strength
71	7	Absorber
71	9	Absorb
72	7	Megaagotar
72	9	Mega Drain
73	7	Drenadoras
73	9	Leech Seed
74	7	Desarrollo
74	9	Growth
75	7	Hoja Afilada
75	9	Razor Leaf
76	7	Rayo Solar
76	9	Solar Beam
77	7	Polvo Veneno
77	9	Poison Powder
78	7	Paralizador
78	9	Stun Spore
79	7	Somnífero
79	9	Sleep Powder
80	7	Danza Pétalo
80	9	Petal Dance
81	7	Disparo Demora
81	9	String Shot
82	7	Furia Dragón
82	9	Dragon Rage
83	7	Giro Fuego
83	9	Fire Spin
84	7	Impactrueno
84	9	Thunder Shock
85	7	Rayo
85	9	Thunderbolt
86	7	Onda Trueno
86	9	Thunder Wave
87	7	Trueno
87	9	Thunder
88	7	Lanzarrocas
88	9	Rock Throw
89	7	Terremoto
89	9	Earthquake
90	7	Fisura
90	9	Fissure
91	7	Excavar
91	9	Dig
92	7	Tóxico
92	9	Toxic
93	7	Confusión
93	9	Confusion
94	7	Psíquico
94	9	Psychic
95	7	Hipnosis
95	9	Hypnosis
96	7	Meditación
96	9	Meditate
97	7	Agilidad
97	9	Agility
98	7	Ataque Rápido
98	9	Quick Attack
99	7	Furia
99	9	Rage
100	7	Teletransporte
100	9	Teleport
101	7	Tinieblas
101	9	Night Shade
102	7	Mimético
102	9	Mimic
103	7	Chirrido
103	9	Screech
104	7	Doble Equipo
104	9	Double Team
105	7	Recuperación
105	9	Recover
106	7	Fortaleza
106	9	Harden
107	7	Reducción
107	9	Minimize
108	7	Pantalla de Humo
108	9	Smokescreen
109	7	Rayo Confuso
109	9	Confuse Ray
110	7	Refugio
110	9	Withdraw
111	7	Rizo Defensa
111	9	Defense Curl
112	7	Barrera
112	9	Barrier
113	7	Pantalla de Luz
113	9	Light Screen
114	7	Niebla
114	9	Haze
115	7	Reflejo
115	9	Reflect
116	7	Foco Energía
116	9	Focus Energy
117	7	Venganza
117	9	Bide
118	7	Metrónomo
118	9	Metronome
119	7	Mov. Espejo
119	9	Mirror Move
120	7	Autodestrucción
120	9	Self-Destruct
121	7	Bomba Huevo
121	9	Egg Bomb
122	7	Lengüetazo
122	9	Lick
123	7	Polución
123	9	Smog
124	7	Residuos
124	9	Sludge
125	7	Hueso Palo
125	9	Bone Club
126	7	Llamarada
126	9	Fire Blast
127	7	Cascada
127	9	Waterfall
128	7	Tenaza
128	9	Clamp
129	7	Rapidez
129	9	Swift
130	7	Cabezazo
130	9	Skull Bash
131	7	Clavo Cañón
131	9	Spike Cannon
132	7	Restricción
132	9	Constrict
133	7	Amnesia
133	9	Amnesia
134	7	Kinético
134	9	Kinesis
135	7	Amortiguador
135	9	Soft-Boiled
136	7	Pat. Salto Alta
136	9	High Jump Kick
137	7	Deslumbrar
137	9	Glare
138	7	Come Sueños
138	9	Dream Eater
139	7	Gas Venenoso
139	9	Poison Gas
140	7	Presa
140	9	Barrage
141	7	Chupavidas
141	9	Leech Life
142	7	Beso Amoroso
142	9	Lovely Kiss
143	7	Ataque Aéreo
143	9	Sky Attack
144	7	Transformación
144	9	Transform
145	7	Burbuja
145	9	Bubble
146	7	Puño Mareo
146	9	Dizzy Punch
147	7	Espora
147	9	Spore
148	7	Destello
148	9	Flash
149	7	Psicoonda
149	9	Psywave
150	7	Salpicadura
150	9	Splash
151	7	Armadura Ácida
151	9	Acid Armor
152	7	Martillazo
152	9	Crabhammer
153	7	Explosión
153	9	Explosion
154	7	Golpes Furia
154	9	Fury Swipes
155	7	Huesomerang
155	9	Bonemerang
156	7	Descanso
156	9	Rest
157	7	Avalancha
157	9	Rock Slide
158	7	Hipercolmillo
158	9	Hyper Fang
159	7	Afilar
159	9	Sharpen
160	7	Conversión
160	9	Conversion
161	7	Triataque
161	9	Tri Attack
162	7	Superdiente
162	9	Super Fang
163	7	Cuchillada
163	9	Slash
164	7	Sustituto
164	9	Substitute
165	7	Combate
165	9	Struggle
166	7	Esquema
166	9	Sketch
167	7	Triple Patada
167	9	Triple Kick
168	7	Ladrón
168	9	Thief
169	7	Telaraña
169	9	Spider Web
170	7	Telépata
170	9	Mind Reader
171	7	Pesadilla
171	9	Nightmare
172	7	Rueda Fuego
172	9	Flame Wheel
173	7	Ronquido
173	9	Snore
174	7	Maldición
174	9	Curse
175	7	Azote
175	9	Flail
176	7	Conversión2
176	9	Conversion 2
177	7	Aerochorro
177	9	Aeroblast
178	7	Esporagodón
178	9	Cotton Spore
179	7	Inversión
179	9	Reversal
180	7	Rencor
180	9	Spite
181	7	Nieve Polvo
181	9	Powder Snow
182	7	Protección
182	9	Protect
183	7	Ultrapuño
183	9	Mach Punch
184	7	Cara Susto
184	9	Scary Face
185	7	Finta
185	9	Feint Attack
186	7	Beso Dulce
186	9	Sweet Kiss
187	7	Tambor
187	9	Belly Drum
188	7	Bomba Lodo
188	9	Sludge Bomb
189	7	Bofetón Lodo
189	9	Mud-Slap
190	7	Pulpocañón
190	9	Octazooka
191	7	Púas
191	9	Spikes
192	7	Electrocañón
192	9	Zap Cannon
193	7	Profecía
193	9	Foresight
194	7	Mismo Destino
194	9	Destiny Bond
195	7	Canto Mortal
195	9	Perish Song
196	7	Viento Hielo
196	9	Icy Wind
197	7	Detección
197	9	Detect
198	7	Ataque Óseo
198	9	Bone Rush
199	7	Fijar Blanco
199	9	Lock-On
200	7	Enfado
200	9	Outrage
201	7	Tormenta Arena
201	9	Sandstorm
202	7	Gigadrenado
202	9	Giga Drain
203	7	Aguante
203	9	Endure
204	7	Encanto
204	9	Charm
205	7	Desenrollar
205	9	Rollout
206	7	Falsotortazo
206	9	False Swipe
207	7	Contoneo
207	9	Swagger
208	7	Batido
208	9	Milk Drink
209	7	Chispa
209	9	Spark
210	7	Corte Furia
210	9	Fury Cutter
211	7	Ala de Acero
211	9	Steel Wing
212	7	Mal de Ojo
212	9	Mean Look
213	7	Atracción
213	9	Attract
214	7	Sonámbulo
214	9	Sleep Talk
215	7	Campana Cura
215	9	Heal Bell
216	7	Retribución
216	9	Return
217	7	Presente
217	9	Present
218	7	Frustración
218	9	Frustration
219	7	Velo Sagrado
219	9	Safeguard
220	7	Divide Dolor
220	9	Pain Split
221	7	Fuego Sagrado
221	9	Sacred Fire
222	7	Magnitud
222	9	Magnitude
223	7	Puño Dinámico
223	9	Dynamic Punch
224	7	Megacuerno
224	9	Megahorn
225	7	Dragoaliento
225	9	Dragon Breath
226	7	Relevo
226	9	Baton Pass
227	7	Otra Vez
227	9	Encore
228	7	Persecución
228	9	Pursuit
229	7	Giro Rápido
229	9	Rapid Spin
230	7	Dulce Aroma
230	9	Sweet Scent
231	7	Cola Férrea
231	9	Iron Tail
232	7	Garra Metal
232	9	Metal Claw
233	7	Tiro Vital
233	9	Vital Throw
234	7	Sol Matinal
234	9	Morning Sun
235	7	Síntesis
235	9	Synthesis
236	7	Luz Lunar
236	9	Moonlight
237	7	Poder Oculto
237	9	Hidden Power
238	7	Tajo Cruzado
238	9	Cross Chop
239	7	Ciclón
239	9	Twister
240	7	Danza Lluvia
240	9	Rain Dance
241	7	Día Soleado
241	9	Sunny Day
242	7	Triturar
242	9	Crunch
243	7	Manto Espejo
243	9	Mirror Coat
244	7	Más Psique
244	9	Psych Up
245	7	Veloc. Extrema
245	9	Extreme Speed
246	7	Poder Pasado
246	9	Ancient Power
247	7	Bola Sombra
247	9	Shadow Ball
248	7	Premonición
248	9	Future Sight
249	7	Golpe Roca
249	9	Rock Smash
250	7	Torbellino
250	9	Whirlpool
251	7	Paliza
251	9	Beat Up
252	7	Sorpresa
252	9	Fake Out
253	7	Alboroto
253	9	Uproar
254	7	Reserva
254	9	Stockpile
255	7	Escupir
255	9	Spit Up
256	7	Tragar
256	9	Swallow
257	7	Onda Ígnea
257	9	Heat Wave
258	7	Granizo
258	9	Hail
259	7	Tormento
259	9	Torment
260	7	Camelo
260	9	Flatter
261	7	Fuego Fatuo
261	9	Will-O-Wisp
262	7	Legado
262	9	Memento
263	7	Imagen
263	9	Facade
264	7	Puño Certero
264	9	Focus Punch
265	7	Estímulo
265	9	Smelling Salts
266	7	Señuelo
266	9	Follow Me
267	7	Adaptación
267	9	Nature Power
268	7	Carga
268	9	Charge
269	7	Mofa
269	9	Taunt
270	7	Refuerzo
270	9	Helping Hand
271	7	Truco
271	9	Trick
272	7	Imitación
272	9	Role Play
273	7	Deseo
273	9	Wish
274	7	Ayuda
274	9	Assist
275	7	Arraigo
275	9	Ingrain
276	7	Fuerza Bruta
276	9	Superpower
277	7	Capa Mágica
277	9	Magic Coat
278	7	Reciclaje
278	9	Recycle
279	7	Desquite
279	9	Revenge
280	7	Demolición
280	9	Brick Break
281	7	Bostezo
281	9	Yawn
282	7	Desarme
282	9	Knock Off
283	7	Esfuerzo
283	9	Endeavor
284	7	Estallido
284	9	Eruption
285	7	Intercambio
285	9	Skill Swap
286	7	Cerca
286	9	Imprison
287	7	Alivio
287	9	Refresh
288	7	Rabia
288	9	Grudge
289	7	Robo
289	9	Snatch
290	7	Daño Secreto
290	9	Secret Power
291	7	Buceo
291	9	Dive
292	7	Empujón
292	9	Arm Thrust
293	7	Camuflaje
293	9	Camouflage
294	7	Ráfaga
294	9	Tail Glow
295	7	Resplandor
295	9	Luster Purge
296	7	Bola Neblina
296	9	Mist Ball
297	7	Danza Pluma
297	9	Feather Dance
298	7	Danza Caos
298	9	Teeter Dance
299	7	Patada Ígnea
299	9	Blaze Kick
300	7	Chapoteo Lodo
300	9	Mud Sport
301	7	Bola Hielo
301	9	Ice Ball
302	7	Brazo Pincho
302	9	Needle Arm
303	7	Relajo
303	9	Slack Off
304	7	Vozarrón
304	9	Hyper Voice
305	7	Colmillo Ven
305	9	Poison Fang
306	7	Garra Brutal
306	9	Crush Claw
307	7	Anillo Ígneo
307	9	Blast Burn
308	7	Hidrocañón
308	9	Hydro Cannon
309	7	Puño Meteoro
309	9	Meteor Mash
310	7	Impresionar
310	9	Astonish
311	7	Meteorobola
311	9	Weather Ball
312	7	Aromaterapia
312	9	Aromatherapy
313	7	Llanto Falso
313	9	Fake Tears
314	7	Aire Afilado
314	9	Air Cutter
315	7	Sofoco
315	9	Overheat
316	7	Rastreo
316	9	Odor Sleuth
317	7	Tumba Rocas
317	9	Rock Tomb
318	7	Viento Plata
318	9	Silver Wind
319	7	Eco Metálico
319	9	Metal Sound
320	7	Silbato
320	9	Grass Whistle
321	7	Cosquillas
321	9	Tickle
322	7	Masa Cósmica
322	9	Cosmic Power
323	7	Salpicar
323	9	Water Spout
324	7	Doble Rayo
324	9	Signal Beam
325	7	Puño Sombra
325	9	Shadow Punch
326	7	Paranormal
326	9	Extrasensory
327	7	Gancho Alto
327	9	Sky Uppercut
328	7	Bucle Arena
328	9	Sand Tomb
329	7	Frío Polar
329	9	Sheer Cold
330	7	Agua Lodosa
330	9	Muddy Water
331	7	Recurrente
331	9	Bullet Seed
332	7	Golpe Aéreo
332	9	Aerial Ace
333	7	Carámbano
333	9	Icicle Spear
334	7	Defensa Férrea
334	9	Iron Defense
335	7	Bloqueo
335	9	Block
336	7	Aullido
336	9	Howl
337	7	Garra Dragón
337	9	Dragon Claw
338	7	Planta Feroz
338	9	Frenzy Plant
339	7	Corpulencia
339	9	Bulk Up
340	7	Bote
340	9	Bounce
341	7	Disparo Lodo
341	9	Mud Shot
342	7	Cola Veneno
342	9	Poison Tail
343	7	Antojo
343	9	Covet
344	7	Placaje Eléc
344	9	Volt Tackle
345	7	Hoja Mágica
345	9	Magical Leaf
346	7	Hidrochorro
346	9	Water Sport
347	7	Paz Mental
347	9	Calm Mind
348	7	Hoja Aguda
348	9	Leaf Blade
349	7	Danza Dragón
349	9	Dragon Dance
350	7	Pedrada
350	9	Rock Blast
351	7	Onda Voltio
351	9	Shock Wave
352	7	Hidropulso
352	9	Water Pulse
353	7	Deseo Oculto
353	9	Doom Desire
354	7	Psicoataque
354	9	Psycho Boost
355	7	Respiro
355	9	Roost
356	7	Gravedad
356	9	Gravity
357	7	Gran Ojo
357	9	Miracle Eye
358	7	Espabila
358	9	Wake-Up Slap
359	7	Machada
359	9	Hammer Arm
360	7	Giro Bola
360	9	Gyro Ball
361	7	Deseo Cura
361	9	Healing Wish
362	7	Salmuera
362	9	Brine
363	7	Don Natural
363	9	Natural Gift
364	7	Amago
364	9	Feint
365	7	Picoteo
365	9	Pluck
366	7	Viento Afín
366	9	Tailwind
367	7	Acupresión
367	9	Acupressure
368	7	Represión Metal
368	9	Metal Burst
369	7	Ida y Vuelta
369	9	U-turn
370	7	A Bocajarro
370	9	Close Combat
371	7	Vendetta
371	9	Payback
372	7	Buena Baza
372	9	Assurance
373	7	Embargo
373	9	Embargo
374	7	Lanzamiento
374	9	Fling
375	7	Psicocambio
375	9	Psycho Shift
376	7	As Oculto
376	9	Trump Card
377	7	Anticura
377	9	Heal Block
378	7	Estrujón
378	9	Wring Out
379	7	Truco Fuerza
379	9	Power Trick
380	7	Bilis
380	9	Gastro Acid
381	7	Conjuro
381	9	Lucky Chant
382	7	Yo Primero
382	9	Me First
383	7	Copión
383	9	Copycat
384	7	Cambia Fuerza
384	9	Power Swap
385	7	Cambia Defensa
385	9	Guard Swap
386	7	Castigo
386	9	Punishment
387	7	Última Baza
387	9	Last Resort
388	7	Abatidoras
388	9	Worry Seed
389	7	Golpe Bajo
389	9	Sucker Punch
390	7	Púas Tóxicas
390	9	Toxic Spikes
391	7	Cambia Almas
391	9	Heart Swap
392	7	Acua Aro
392	9	Aqua Ring
393	7	Levitón
393	9	Magnet Rise
394	7	Envite Ígneo
394	9	Flare Blitz
395	7	Palmeo
395	9	Force Palm
396	7	Esfera Aural
396	9	Aura Sphere
397	7	Pulimento
397	9	Rock Polish
398	7	Puya Nociva
398	9	Poison Jab
399	7	Pulso Umbrío
399	9	Dark Pulse
400	7	Tajo Umbrío
400	9	Night Slash
401	7	Acua Cola
401	9	Aqua Tail
402	7	Bomba Germen
402	9	Seed Bomb
403	7	Tajo Aéreo
403	9	Air Slash
404	7	Tijera X
404	9	X-Scissor
405	7	Zumbido
405	9	Bug Buzz
406	7	Pulso Dragón
406	9	Dragon Pulse
407	7	Carga Dragón
407	9	Dragon Rush
408	7	Joya de Luz
408	9	Power Gem
409	7	Puño Drenaje
409	9	Drain Punch
410	7	Onda Vacío
410	9	Vacuum Wave
411	7	Onda Certera
411	9	Focus Blast
412	7	Energibola
412	9	Energy Ball
413	7	Pájaro Osado
413	9	Brave Bird
414	7	Tierra Viva
414	9	Earth Power
415	7	Trapicheo
415	9	Switcheroo
416	7	Giga Impacto
416	9	Giga Impact
417	7	Maquinación
417	9	Nasty Plot
418	7	Puño Bala
418	9	Bullet Punch
419	7	Alud
419	9	Avalanche
420	7	Canto Helado
420	9	Ice Shard
421	7	Garra Umbría
421	9	Shadow Claw
422	7	Colmillo Rayo
422	9	Thunder Fang
423	7	Colmillo Hielo
423	9	Ice Fang
424	7	Colmillo Ígneo
424	9	Fire Fang
425	7	Sombra Vil
425	9	Shadow Sneak
426	7	Bomba Fango
426	9	Mud Bomb
427	7	Psicocorte
427	9	Psycho Cut
428	7	Cabezazo Zen
428	9	Zen Headbutt
429	7	Disparo Espejo
429	9	Mirror Shot
430	7	Foco Resplandor
430	9	Flash Cannon
431	7	Treparrocas
431	9	Rock Climb
432	7	Despejar
432	9	Defog
433	7	Espacio Raro
433	9	Trick Room
434	7	Cometa Draco
434	9	Draco Meteor
435	7	Chispazo
435	9	Discharge
436	7	Humareda
436	9	Lava Plume
437	7	Lluevehojas
437	9	Leaf Storm
438	7	Latigazo
438	9	Power Whip
439	7	Romperrocas
439	9	Rock Wrecker
440	7	Veneno X
440	9	Cross Poison
441	7	Lanza Mugre
441	9	Gunk Shot
442	7	Cabeza de Hierro
442	9	Iron Head
443	7	Bomba Imán
443	9	Magnet Bomb
444	7	Roca Afilada
444	9	Stone Edge
445	7	Seducción
445	9	Captivate
446	7	Trampa Rocas
446	9	Stealth Rock
447	7	Hierba Lazo
447	9	Grass Knot
448	7	Cháchara
448	9	Chatter
449	7	Sentencia
449	9	Judgment
450	7	Picadura
450	9	Bug Bite
451	7	Rayo Carga
451	9	Charge Beam
452	7	Mazazo
452	9	Wood Hammer
453	7	Acua Jet
453	9	Aqua Jet
454	7	Al Ataque
454	9	Attack Order
455	7	A Defender
455	9	Defend Order
456	7	Auxilio
456	9	Heal Order
457	7	Testarazo
457	9	Head Smash
458	7	Doble Golpe
458	9	Double Hit
459	7	Distorsión
459	9	Roar of Time
460	7	Corte Vacío
460	9	Spacial Rend
461	7	Danza Lunar
461	9	Lunar Dance
462	7	Agarrón
462	9	Crush Grip
463	7	Lluvia Ígnea
463	9	Magma Storm
464	7	Brecha Negra
464	9	Dark Void
465	7	Fogonazo
465	9	Seed Flare
466	7	Viento Aciago
466	9	Ominous Wind
467	7	Golpe Umbrío
467	9	Shadow Force
468	7	Afilagarras
468	9	Hone Claws
469	7	Vastaguardia
469	9	Wide Guard
470	7	Isoguardia
470	9	Guard Split
471	7	Isofuerza
471	9	Power Split
472	7	Zona Extraña
472	9	Wonder Room
473	7	Psicocarga
473	9	Psyshock
474	7	Carga Tóxica
474	9	Venoshock
475	7	Aligerar
475	9	Autotomize
476	7	Polvo Ira
476	9	Rage Powder
477	7	Telequinesis
477	9	Telekinesis
478	7	Zona Mágica
478	9	Magic Room
479	7	Antiaéreo
479	9	Smack Down
480	7	Llave Corsé
480	9	Storm Throw
481	7	Pirotecnia
481	9	Flame Burst
482	7	Onda Tóxica
482	9	Sludge Wave
483	7	Danza Aleteo
483	9	Quiver Dance
484	7	Cuerpo Pesado
484	9	Heavy Slam
485	7	Sincrorruido
485	9	Synchronoise
486	7	Bola Voltio
486	9	Electro Ball
487	7	Anegar
487	9	Soak
488	7	Nitrocarga
488	9	Flame Charge
489	7	Enrosque
489	9	Coil
490	7	Puntapié
490	9	Low Sweep
491	7	Bomba Ácida
491	9	Acid Spray
492	7	Juego Sucio
492	9	Foul Play
493	7	Onda Simple
493	9	Simple Beam
494	7	Danza Amiga
494	9	Entrainment
495	7	Cede Paso
495	9	After You
496	7	Canon
496	9	Round
497	7	Eco Voz
497	9	Echoed Voice
498	7	Guardia Baja
498	9	Chip Away
499	7	Niebla Clara
499	9	Clear Smog
500	7	Poder Reserva
500	9	Stored Power
501	7	Anticipo
501	9	Quick Guard
502	7	Cambio Banda
502	9	Ally Switch
503	7	Escaldar
503	9	Scald
504	7	Rompecoraza
504	9	Shell Smash
505	7	Pulso Cura
505	9	Heal Pulse
506	7	Infortunio
506	9	Hex
507	7	Caída Libre
507	9	Sky Drop
508	7	Cambio de Marcha
508	9	Shift Gear
509	7	Llave Giro
509	9	Circle Throw
510	7	Calcinación
510	9	Incinerate
511	7	Último Lugar
511	9	Quash
512	7	Acróbata
512	9	Acrobatics
513	7	Clonatipo
513	9	Reflect Type
514	7	Represalia
514	9	Retaliate
515	7	Sacrificio
515	9	Final Gambit
516	7	Ofrenda
516	9	Bestow
517	7	Infierno
517	9	Inferno
518	7	Voto Agua
518	9	Water Pledge
519	7	Voto Fuego
519	9	Fire Pledge
520	7	Voto Planta
520	9	Grass Pledge
521	7	Voltiocambio
521	9	Volt Switch
522	7	Estoicismo
522	9	Struggle Bug
523	7	Terratemblor
523	9	Bulldoze
524	7	Vaho Gélido
524	9	Frost Breath
525	7	Cola Dragón
525	9	Dragon Tail
526	7	Avivar
526	9	Work Up
527	7	Electrotela
527	9	Electroweb
528	7	Voltio Cruel
528	9	Wild Charge
529	7	Taladradora
529	9	Drill Run
530	7	Golpe Bis
530	9	Dual Chop
531	7	Arrumaco
531	9	Heart Stamp
532	7	Asta Drenaje
532	9	Horn Leech
533	7	Espada Santa
533	9	Sacred Sword
534	7	Concha Filo
534	9	Razor Shell
535	7	Golpe Calor
535	9	Heat Crash
536	7	Ciclón de Hojas
536	9	Leaf Tornado
537	7	Rodillo de Púas
537	9	Steamroller
538	7	Rizo Algodón
538	9	Cotton Guard
539	7	Pulso Noche
539	9	Night Daze
540	7	Onda Mental
540	9	Psystrike
541	7	Plumerazo
541	9	Tail Slap
542	7	Vendaval
542	9	Hurricane
543	7	Ariete
543	9	Head Charge
544	7	Rueda Doble
544	9	Gear Grind
545	7	Bomba Ígnea
545	9	Searing Shot
546	7	Tecno Shock
546	9	Techno Blast
547	7	Canto Arcaico
547	9	Relic Song
548	7	Sable Místico
548	9	Secret Sword
549	7	Mundo Gélido
549	9	Glaciate
550	7	Ataque Fulgor
550	9	Bolt Strike
551	7	Llama Azul
551	9	Blue Flare
552	7	Danza Llama
552	9	Fiery Dance
553	7	Rayo Gélido
553	9	Freeze Shock
554	7	Llama Gélida
554	9	Ice Burn
555	7	Alarido
555	9	Snarl
556	7	Chuzos
556	9	Icicle Crash
557	7	V de Fuego
557	9	V-create
558	7	Llama Fusión
558	9	Fusion Flare
559	7	Rayo Fusión
559	9	Fusion Bolt
560	7	Plancha Voladora
560	9	Flying Press
561	7	Escudo Tatami
561	9	Mat Block
562	7	Eructo
562	9	Belch
563	7	Fertilizante
563	9	Rototiller
564	7	Red Viscosa
564	9	Sticky Web
565	7	Aguijón Letal
565	9	Fell Stinger
566	7	Golpe Fantasma
566	9	Phantom Force
567	7	Halloween
567	9	Trick-or-Treat
568	7	Rugido de Guerra
568	9	Noble Roar
569	7	Cortina Plasma
569	9	Ion Deluge
570	7	Carga Parábola
570	9	Parabolic Charge
571	7	Condena Silvana
571	9	Forest's Curse
572	7	Tormenta Floral
572	9	Petal Blizzard
573	7	Liofilización
573	9	Freeze-Dry
574	7	Voz Cautivadora
574	9	Disarming Voice
575	7	Última Palabra
575	9	Parting Shot
576	7	Reversión
576	9	Topsy-Turvy
577	7	Beso Drenaje
577	9	Draining Kiss
578	7	Truco Defensa
578	9	Crafty Shield
579	7	Defensa Floral
579	9	Flower Shield
580	7	Campo de Hierba
580	9	Grassy Terrain
581	7	Campo de Niebla
581	9	Misty Terrain
582	7	Electrificación
582	9	Electrify
583	7	Carantoña
583	9	Play Rough
584	7	Viento Feérico
584	9	Fairy Wind
585	7	Fuerza Lunar
585	9	Moonblast
586	7	Estruendo
586	9	Boomburst
587	7	Cerrojo Feérico
587	9	Fairy Lock
588	7	Escudo Real
588	9	King's Shield
589	7	Camaradería
589	9	Play Nice
590	7	Confidencia
590	9	Confide
591	7	Torm. Diamantes
591	9	Diamond Storm
592	7	Chorro de Vapor
592	9	Steam Eruption
593	7	Paso Dimensional
593	9	Hyperspace Hole
594	7	Shuriken de Agua
594	9	Water Shuriken
595	7	Llama Embrujada
595	9	Mystical Fire
596	7	Barrera Espinosa
596	9	Spiky Shield
597	7	Niebla Aromática
597	9	Aromatic Mist
598	7	Onda Anómala
598	9	Eerie Impulse
599	7	Trampa Venenosa
599	9	Venom Drench
600	7	Polvo Explosivo
600	9	Powder
601	7	Geocontrol
601	9	Geomancy
602	7	Aura Magnética
602	9	Magnetic Flux
603	7	Paga Extra
603	9	Happy Hour
604	7	Campo Eléctrico
604	9	Electric Terrain
605	7	Brillo Mágico
605	9	Dazzling Gleam
606	7	Celebración
606	9	Celebrate
607	7	Manos Juntas
607	9	Hold Hands
608	7	Ojitos Tiernos
608	9	Baby-Doll Eyes
609	7	Moflete Estático
609	9	Nuzzle
610	7	Clemencia
610	9	Hold Back
611	7	Acoso
611	9	Infestation
612	7	Puño Incremento
612	9	Power-Up Punch
613	7	Ala Mortífera
613	9	Oblivion Wing
614	7	Mil Flechas
614	9	Thousand Arrows
615	7	Mil Temblores
615	9	Thousand Waves
616	7	Fuerza Telúrica
616	9	Land's Wrath
617	7	Luz Aniquiladora
617	9	Light of Ruin
42	10	Jehlostřela
227	10	Přídavek
94	10	Psychika
181	10	Prašan
364	10	Lest
217	10	Dárek
144	10	Transformace
111	10	Schoulení
354	10	Psyzvýšení
283	10	Úsilí
150	10	Šplouchnutí
408	10	Síla drahokamu
101	10	Noční stín
273	10	Přání
28	10	Písečný útok
414	10	Síla Země
64	10	Klovnutí
167	10	Trojitý kop
18	10	Odfouknutí
292	10	Úder paží
203	10	Výdrž
70	10	Síla
157	10	Pád skály
328	10	Písečné peklo
431	10	Horolezectví
282	10	Vyražení
193	10	Vidění
467	10	Potopení do stínů
334	10	Zaželezení
421	10	Stínový dráp
87	10	Blesk
457	10	Drcení hlavou
212	10	Zlý pohled
123	10	Smog
384	10	Výměna síly
77	10	Jedovatý pyl
248	10	Budoucnost
351	10	Šoková vlna
202	10	Giga-vysátí
113	10	Světelná zeď
131	10	Ostnové dělo
390	10	Toxické ostny
254	10	Zásobení
341	10	Bahnomet
268	10	Nabití
377	10	Blokace léčení
304	10	hlaszvuk
407	10	Dračí zteč
15	10	Sek
258	10	Kroupy
443	10	Magnetická puma
122	10	Oblíznutí
51	10	Kyselina
310	10	Vyděšení
397	10	Broušení kamene
5	10	Megarána
433	10	Komnata triků
188	10	Bahenní puma
41	10	Dvojehla
224	10	Megaroh
327	10	Nebeský úder
178	10	Chmýří
452	10	Dřevěné kladivo
363	10	Dar přírody
230	10	Sladká vůně
317	10	Kamenná past
442	10	Železná hlava
353	10	Vůle osudu
108	10	Kouřová clona
247	10	Koule stínů
98	10	Hbitý útok
372	10	Ujištění
27	10	Kop s otočkou
237	10	Skrytá síla
152	10	Krabí kladivo
362	10	Slaná voda
17	10	Křídlový útok
291	10	Potopení
158	10	Hypertesák
428	10	Zenová hlavička
281	10	Zívnutí
36	10	Sejmutí
464	10	Temná prázdnota
72	10	Megavysátí
175	10	Škubání
418	10	Výstřelový úder
26	10	Kop z výskoku
211	10	Ocelové křídlo
78	10	Omračující pyl
165	10	Zoufalý útok
348	10	Ostrý list
201	10	Písečná bouře
128	10	Sevření
95	10	Hypnóza
338	10	Šílená kytka
267	10	Přírodní síla
134	10	Kineze
392	10	Vodní kruh
85	10	Bleskový útok
257	10	Tepelná vlna
12	10	Klepetí gilotina
121	10	Vaječná puma
398	10	Jedové bodnutí
48	10	Ultrazvuk
151	10	Rozpuštění
2	10	Karatistický úder
276	10	Supersíla
187	10	Břišní buben
54	10	Mlha
141	10	Vysátí
312	10	Aromaterapie
415	10	Zamíchání
266	10	Za mnou
177	10	Vzdušný výbuch
451	10	Paprsek náboje
318	10	Stříbrný vítr
405	10	Zabzučení
71	10	Vstřebání
441	10	Zásah sajrajtem
196	10	Severák
107	10	Zmenšení
61	10	Bublinomet
232	10	Kovový dráp
335	10	Zablokování
186	10	Sladký polibek
97	10	Hbitost
371	10	Vyrovnání účtů
238	10	Křížový úder
325	10	Temná pěst
361	10	Léčivé přání
116	10	Soustředění
288	10	Zášť
391	10	Výměna srdcí
255	10	Vyplivnutí
427	10	Psychosek
106	10	Zatvrzení
35	10	Ovinutí
294	10	Ocasní světélko
245	10	Extrémní rychlost
417	10	Intrika
172	10	Ohnivý kruh
25	10	Megakop
208	10	Doušek mléka
311	10	Koule počasí
162	10	Supertesák
436	10	Výbuch lávy
347	10	Klidná mysl
214	10	Řeč ze sna
301	10	Ledová koule
426	10	Blátivá puma
337	10	Dračí Spár
92	10	Toxický útok
231	10	Železný ocas
82	10	Dračí hněv
356	10	Gravitace
11	10	Svěrák
221	10	Posvátný oheň
136	10	Vysoký kop
346	10	Vodní hra
1	10	Facka
275	10	Zakořenění
142	10	Polibek
412	10	Míč energie
265	10	Smradlavá sůl
20	10	Omotání
448	10	Žvanění
56	10	Vodní pumpa
159	10	Nabroušení
402	10	Semínková puma
10	10	Škrábnutí
195	10	Píseň zániku
454	10	Příkaz k útoku
62	10	Polární záře
149	10	Psy-vlna
332	10	Vzdušné eso
185	10	Matný útok
368	10	Ocelový výbuch
79	10	Uspávací pyl
322	10	Kosmická síla
115	10	Zrcadlová zeď
374	10	Hod
461	10	Měsíční tanec
69	10	Seismický vrh
252	10	Předstírání
105	10	Obnovení
32	10	Vrtání rohem
135	10	Na měkko
242	10	Křupnutí
260	10	Lichotka
171	10	Noční můra
38	10	Dvojí ostří
381	10	Popěvek pro štěstí
296	10	Mlhová koule
399	10	Temný puls
161	10	Trojitý útok
435	10	Vybití
302	10	Trnitá ruka
389	10	Podpásovka
55	10	Vodní dělo
425	10	Plížení stínem
180	10	Zlá vůle
91	10	Hrabavý útok
45	10	Zavrčení
216	10	Opětování
319	10	Kovový zvuk
170	10	Čtení mysli
81	10	Lepivé vlákno
355	10	Hřadování
222	10	Magnituda
309	10	Meteorána
345	10	Magický list
100	10	Teleportace
272	10	Vžití do role
239	10	Tornádo
411	10	Usměrnění Síly
90	10	Puklina v zemi
19	10	Let
278	10	Recyklace
229	10	Kolotoč
401	10	Vodní ocas
156	10	Odpočinek
9	10	Blesková rána
192	10	Výbojové dělo
295	10	Očistná záře
146	10	Zmatený úder
420	10	Střechýle
331	10	Semenomet
198	10	Příval kostí
285	10	Výměna
456	10	Příkaz vyléčit
410	10	Vlna vzduchoprázdna
321	10	Polechtání
76	10	Sluneční paprsek
462	10	Drtivý stisk
112	10	Bariéra
215	10	Léčivý zvonek
66	10	Znehybnění
340	10	Odražení
251	10	Zbití
205	10	Valivý útok
376	10	Trumf
330	10	Kalná voda
241	10	Slunečný den
259	10	Trápení
382	10	Nejdřív já
396	10	Kulová aura
4	10	Opakovaný úder
432	10	Odmlžení
125	10	Kostěný kyj
40	10	Jedovaté žihadlo
143	10	Nebeský útok
386	10	Co proto
250	10	Vodní vír
179	10	Zvrat
438	10	Šleh bičem
46	10	Řev
133	10	Amnézie
316	10	Pachová stopa
169	10	Pavučina
352	10	Vodní puls
455	10	Příkaz k obraně
63	10	Hyperpaprsek
306	10	Drtivá tlapa
99	10	Hněv
358	10	Facka na probuzení
445	10	Okouzlení
53	10	Plamenomet
236	10	Měsíční svit
89	10	Zemětřesení
16	10	Vzdušný vír
375	10	Psychopřesun
226	10	Štafeta
155	10	Kostmerang
22	10	Úponkový bič
365	10	Vyklovnutí
280	10	Rozbití cihly
145	10	Bublinky
419	10	Lavina
286	10	Uvěznění
39	10	Vrtění ocasem
409	10	Vysávací úder
164	10	Zástupce
75	10	Listová břitva
29	10	Náraz hlavou
200	10	Rozzuření
303	10	Zalenošení
154	10	Zuřivé řezání
65	10	Nebozezobák
339	10	Nadmutí
206	10	Falešný sek
293	10	Kamufláž
329	10	Totální mráz
84	10	Bleskový šok
256	10	Spolknutí
120	10	Sebezničení
223	10	Výbušný úder
466	10	Zlověstný vítr
395	10	Použití Síly
74	10	Růst
3	10	Dvojitá facka
262	10	Odkaz
126	10	Výbuch ohně
213	10	Zalíbení
385	10	Výměna obrany
140	10	Bombardování
249	10	Drcení kamenů
279	10	Odplata
130	10	Úder lebkou
404	10	X-Šmik
315	10	Přehřátí
182	10	Protekce
269	10	Navádění
440	10	Křížový jed
394	10	Plamenný nálet
305	10	Jedovatý tesák
60	10	Psychický paprsek
446	10	Zákeřný kámen
96	10	Meditace
199	10	Zaměření
50	10	Zákaz
324	10	Signální záře
235	10	Syntéza
102	10	Napodobení
189	10	Plesknutí blátem
360	10	Gyrokáča
463	10	Bouře lávy
314	10	Sek vzduchem
225	10	Dračí dech
366	10	Vítr v zádech
453	10	Proud vody
119	10	Zrcadlový útok
244	10	Nápsych
416	10	Meganáraz
109	10	Matoucí paprsek
24	10	Dvojitý kop
383	10	Opičení
234	10	Ranní slunce
163	10	Šmik
422	10	Hromový tesák
30	10	Rohový útok
373	10	Embargo
300	10	Blátivá hra
153	10	Exploze
336	10	Zavytí
439	10	Kamenné dělo
47	10	Zpěv
290	10	Tajemná síla
83	10	Ohnivý vír
342	10	Jedovatý ocas
429	10	Zrcadlová střela
37	10	Zuřivost
465	10	Semínková světlice
220	10	Půlená bolest
73	10	Pijavičné semínko
359	10	Kladivová pěst
210	10	Zuřivé nože
139	10	Jedovatý plyn
6	10	Výplata
349	10	Dračí tanec
264	10	Mířená rána
129	10	Hvězdičky
403	10	Vzdušný sek
270	10	Pomocná ruka
23	10	Dupnutí
393	10	Magnetický zdvih
148	10	Záblesk
59	10	Vánice
13	10	Ostrý vítr
184	10	Děsivý škleb
287	10	Osvěžení
138	10	Požírač snů
49	10	Zvuková vlna
323	10	Vodotrysk
190	10	Chobozuka
277	10	Magický plášť
460	10	Trhlina prostoru
313	10	Falešné slzy
68	10	Odvetný úder
104	10	Zdvojení
207	10	Naparování
450	10	Hmyzí kousanec
58	10	Ledový paprsek
243	10	Zrcadlo
110	10	Schování
197	10	Detekce
380	10	Žaludeční šťáva
233	10	Osudný vrh
160	10	Konverze
263	10	Vzteklý útok
127	10	Vodopád
370	10	Boj na blízko
388	10	Semínko starostí
299	10	Žárový kop
166	10	Náčrt
424	10	Ohnivý tesák
117	10	Výzva
289	10	Šlohnutí
44	10	Kousnutí
430	10	Světelné dělo
80	10	Tanec listů
183	10	Hbitá pěst
34	10	Zavalení
308	10	Hydrodělo
219	10	Ochrana
86	10	Blesková vlna
173	10	Chrápání
344	10	Voltonáraz
447	10	Uzel z trávy
298	10	Bláznivé tóny
209	10	Jiskra
350	10	SuprŠutr
437	10	Listová bouře
103	10	Zaskřípání
228	10	Pronásledování
400	10	Rozpárání
93	10	Zmatení
8	10	Ledový úder
367	10	Akupresura
218	10	Frustrace
147	10	Výtrus
406	10	Dračí puls
14	10	Tanec mečů
357	10	Zázračné oko
284	10	Erupce
137	10	Hadí pohled
320	10	Travní hvizd
423	10	Ledový tesák
31	10	Zuřivý útok
274	10	Asistence
459	10	Řev času
67	10	Nízký kop
326	10	Mimosmyslové vnímání
413	10	Nálet
21	10	Náraz
449	10	Rozsudek
204	10	Šarm
57	10	Surfování
240	10	Tanec v dešti
343	10	Chamtivost
194	10	Pouto osudu
379	10	Trik síly
246	10	Prastará síla
333	10	Rampouchové kopí
458	10	Dvojitá rána
369	10	Otočka
124	10	Bahno
387	10	Záloha
7	10	Ohnivý úder
114	10	Opar
132	10	Škrcení
43	10	Lstivý pohled
253	10	Hluk
168	10	Zloděj
271	10	Trik
378	10	Vyždímání
33	10	Nárazový útok
307	10	Ohnivý výšleh
174	10	Prokletí
261	10	Bludička
444	10	Kamenné ostří
297	10	Tanec peří
52	10	Popálení
88	10	Hod kamenem
191	10	Střepiny
434	10	Dračí meteor
618	9	Origin Pulse
619	9	Precipice Blades
620	9	Dragon Ascent
621	9	Hyperspace Fury
618	7	Pulso Primigenio
619	7	Filo del Abismo
620	7	Ascenso Draco
621	7	Furia Dimensional
622	7	Accelrock
622	9	Accelrock
623	7	Anchor Shot
623	9	Anchor Shot
624	7	Aurora Veil
624	9	Aurora Veil
625	7	Baneful Bunker
625	9	Baneful Bunker
626	7	Beak Blast
626	9	Beak Blast
627	7	Brutal Swing
627	9	Brutal Swing
628	7	Burn Up
628	9	Burn Up
629	7	Clanging Scales
629	9	Clanging Scales
630	7	Core Enforcer
630	9	Core Enforcer
631	7	Darkest Lariat
631	9	Darkest Lariat
632	7	Dragon Hammer
632	9	Dragon Hammer
633	7	Fire Lash
633	9	Fire Lash
634	7	First Impression
634	9	First Impression
635	7	Fleaur Cannon
635	9	Fleaur Cannon
636	7	Floral Healing
636	9	Floral Healing
637	7	Gear Up
637	9	Gear Up
638	7	High Horsepower
638	9	High Horsepower
639	7	Ice Hammer
639	9	Ice Hammer
640	7	Instruct
640	9	Instruct
641	7	Laser Focus
641	9	Laser Focus
642	7	Leafage
642	9	Leafage
643	7	Liquidation
643	9	Liquidation
644	7	Lunge
644	9	Lunge
645	7	Moongeist Beam
645	9	Moongeist Beam
646	7	Multi-Attack
646	9	Multi-Attack
647	7	Nature's Madness
647	9	Nature's Madness
648	7	Pollen Puff
648	9	Pollen Puff
649	7	Power Trip
649	9	Power Trip
650	7	Prismatic Laser
650	9	Prismatic Laser
651	7	Psychic Fangs
651	9	Psychic Fangs
652	7	Psychic Terrain
652	9	Psychic Terrain
653	7	Purify
653	9	Purify
654	7	Revelation Dancer
654	9	Revelation Dancer
655	7	Shadow Bone
655	9	Shadow Bone
656	7	Shell Trap
656	9	Shell Trap
657	7	Shore Up
657	9	Shore Up
658	7	Smart Strike
658	9	Smart Strike
659	7	Solar Blade
659	9	Solar Blade
660	7	Sparkling Aria
660	9	Sparkling Aria
661	7	Spectral Thief
661	9	Spectral Thief
662	7	Speed Swap
662	9	Speed Swap
663	7	Spirit Shackle
663	9	Spirit Shackle
664	7	Spotlight
664	9	Spotlight
665	7	Stomping Tantrum
665	9	Stomping Tantrum
666	7	Strength Sap
666	9	Strength Sap
667	7	Sunsteel Strike
667	9	Sunsteel Strike
668	7	Tearful Look
668	9	Tearful Look
669	7	Throat Chop
669	9	Throat Chop
670	7	Toxic Thread
670	9	Toxic Thread
671	7	Trop Kick
671	9	Trop Kick
672	7	Zing Zap
672	9	Zing Zap
1	7	Destructor
1	9	Pound
2	7	Golpe Kárate
2	9	Karate Chop
3	7	Doble Bofetón
3	9	Double Slap
4	7	Puño Cometa
4	9	Comet Punch
5	7	Megapuño
5	9	Mega Punch
6	7	Día de Pago
6	9	Pay Day
7	7	Puño Fuego
7	9	Fire Punch
8	7	Puño Hielo
8	9	Ice Punch
9	7	Puño Trueno
9	9	Thunder Punch
10	7	Arañazo
10	9	Scratch
11	7	Agarre
11	9	Vice Grip
12	7	Guillotina
12	9	Guillotine
13	7	Viento Cortante
13	9	Razor Wind
14	7	Danza Espada
14	9	Swords Dance
15	7	Corte
15	9	Cut
16	7	Tornado
16	9	Gust
17	7	Ataque Ala
17	9	Wing Attack
18	7	Remolino
18	9	Whirlwind
19	7	Vuelo
19	9	Fly
20	7	Atadura
20	9	Bind
21	7	Atizar
21	9	Slam
22	7	Látigo Cepa
22	9	Vine Whip
23	7	Pisotón
23	9	Stomp
24	7	Doble Patada
24	9	Double Kick
25	7	Megapatada
25	9	Mega Kick
26	7	Patada Salto
26	9	Jump Kick
27	7	Patada Giro
27	9	Rolling Kick
28	7	Ataque Arena
28	9	Sand Attack
29	7	Golpe Cabeza
29	9	Headbutt
30	7	Cornada
30	9	Horn Attack
31	7	Ataque Furia
31	9	Fury Attack
32	7	Perforador
32	9	Horn Drill
33	7	Placaje
33	9	Tackle
34	7	Golpe Cuerpo
34	9	Body Slam
35	7	Constricción
35	9	Wrap
36	7	Derribo
36	9	Take Down
37	7	Golpe
37	9	Thrash
38	7	Doble Filo
38	9	Double-Edge
39	7	Látigo
39	9	Tail Whip
40	7	Picotazo Ven
40	9	Poison Sting
41	7	Doble Ataque
41	9	Twineedle
42	7	Pin Misil
42	9	Pin Missile
43	7	Malicioso
43	9	Leer
44	7	Mordisco
44	9	Bite
45	7	Gruñido
45	9	Growl
46	7	Rugido
46	9	Roar
47	7	Canto
47	9	Sing
48	7	Supersónico
48	9	Supersonic
49	7	Bomba Sónica
49	9	Sonic Boom
50	7	Anulación
50	9	Disable
51	7	Ácido
51	9	Acid
52	7	Ascuas
52	9	Ember
53	7	Lanzallamas
53	9	Flamethrower
54	7	Neblina
54	9	Mist
55	7	Pistola Agua
55	9	Water Gun
56	7	Hidrobomba
56	9	Hydro Pump
57	7	Surf
57	9	Surf
58	7	Rayo Hielo
58	9	Ice Beam
59	7	Ventisca
59	9	Blizzard
60	7	Psicorrayo
60	9	Psybeam
61	7	Rayo Burbuja
61	9	Bubble Beam
62	7	Rayo Aurora
62	9	Aurora Beam
63	7	Hiperrayo
63	9	Hyper Beam
64	7	Picotazo
64	9	Peck
65	7	Pico Taladro
65	9	Drill Peck
66	7	Sumisión
66	9	Submission
67	7	Patada Baja
67	9	Low Kick
68	7	Contraataque
68	9	Counter
69	7	Mov. Sísmico
69	9	Seismic Toss
70	7	Fuerza
70	9	Strength
71	7	Absorber
71	9	Absorb
72	7	Megaagotar
72	9	Mega Drain
73	7	Drenadoras
73	9	Leech Seed
74	7	Desarrollo
74	9	Growth
75	7	Hoja Afilada
75	9	Razor Leaf
76	7	Rayo Solar
76	9	Solar Beam
77	7	Polvo Veneno
77	9	Poison Powder
78	7	Paralizador
78	9	Stun Spore
79	7	Somnífero
79	9	Sleep Powder
80	7	Danza Pétalo
80	9	Petal Dance
81	7	Disparo Demora
81	9	String Shot
82	7	Furia Dragón
82	9	Dragon Rage
83	7	Giro Fuego
83	9	Fire Spin
84	7	Impactrueno
84	9	Thunder Shock
85	7	Rayo
85	9	Thunderbolt
86	7	Onda Trueno
86	9	Thunder Wave
87	7	Trueno
87	9	Thunder
88	7	Lanzarrocas
88	9	Rock Throw
89	7	Terremoto
89	9	Earthquake
90	7	Fisura
90	9	Fissure
91	7	Excavar
91	9	Dig
92	7	Tóxico
92	9	Toxic
93	7	Confusión
93	9	Confusion
94	7	Psíquico
94	9	Psychic
95	7	Hipnosis
95	9	Hypnosis
96	7	Meditación
96	9	Meditate
97	7	Agilidad
97	9	Agility
98	7	Ataque Rápido
98	9	Quick Attack
99	7	Furia
99	9	Rage
100	7	Teletransporte
100	9	Teleport
101	7	Tinieblas
101	9	Night Shade
102	7	Mimético
102	9	Mimic
103	7	Chirrido
103	9	Screech
104	7	Doble Equipo
104	9	Double Team
105	7	Recuperación
105	9	Recover
106	7	Fortaleza
106	9	Harden
107	7	Reducción
107	9	Minimize
108	7	Pantalla de Humo
108	9	Smokescreen
109	7	Rayo Confuso
109	9	Confuse Ray
110	7	Refugio
110	9	Withdraw
111	7	Rizo Defensa
111	9	Defense Curl
112	7	Barrera
112	9	Barrier
113	7	Pantalla de Luz
113	9	Light Screen
114	7	Niebla
114	9	Haze
115	7	Reflejo
115	9	Reflect
116	7	Foco Energía
116	9	Focus Energy
117	7	Venganza
117	9	Bide
118	7	Metrónomo
118	9	Metronome
119	7	Mov. Espejo
119	9	Mirror Move
120	7	Autodestrucción
120	9	Self-Destruct
121	7	Bomba Huevo
121	9	Egg Bomb
122	7	Lengüetazo
122	9	Lick
123	7	Polución
123	9	Smog
124	7	Residuos
124	9	Sludge
125	7	Hueso Palo
125	9	Bone Club
126	7	Llamarada
126	9	Fire Blast
127	7	Cascada
127	9	Waterfall
128	7	Tenaza
128	9	Clamp
129	7	Rapidez
129	9	Swift
130	7	Cabezazo
130	9	Skull Bash
131	7	Clavo Cañón
131	9	Spike Cannon
132	7	Restricción
132	9	Constrict
133	7	Amnesia
133	9	Amnesia
134	7	Kinético
134	9	Kinesis
135	7	Amortiguador
135	9	Soft-Boiled
136	7	Pat. Salto Alta
136	9	High Jump Kick
137	7	Deslumbrar
137	9	Glare
138	7	Come Sueños
138	9	Dream Eater
139	7	Gas Venenoso
139	9	Poison Gas
140	7	Presa
140	9	Barrage
141	7	Chupavidas
141	9	Leech Life
142	7	Beso Amoroso
142	9	Lovely Kiss
143	7	Ataque Aéreo
143	9	Sky Attack
144	7	Transformación
144	9	Transform
145	7	Burbuja
145	9	Bubble
146	7	Puño Mareo
146	9	Dizzy Punch
147	7	Espora
147	9	Spore
148	7	Destello
148	9	Flash
149	7	Psicoonda
149	9	Psywave
150	7	Salpicadura
150	9	Splash
151	7	Armadura Ácida
151	9	Acid Armor
152	7	Martillazo
152	9	Crabhammer
153	7	Explosión
153	9	Explosion
154	7	Golpes Furia
154	9	Fury Swipes
155	7	Huesomerang
155	9	Bonemerang
156	7	Descanso
156	9	Rest
157	7	Avalancha
157	9	Rock Slide
158	7	Hipercolmillo
158	9	Hyper Fang
159	7	Afilar
159	9	Sharpen
160	7	Conversión
160	9	Conversion
161	7	Triataque
161	9	Tri Attack
162	7	Superdiente
162	9	Super Fang
163	7	Cuchillada
163	9	Slash
164	7	Sustituto
164	9	Substitute
165	7	Combate
165	9	Struggle
166	7	Esquema
166	9	Sketch
167	7	Triple Patada
167	9	Triple Kick
168	7	Ladrón
168	9	Thief
169	7	Telaraña
169	9	Spider Web
170	7	Telépata
170	9	Mind Reader
171	7	Pesadilla
171	9	Nightmare
172	7	Rueda Fuego
172	9	Flame Wheel
173	7	Ronquido
173	9	Snore
174	7	Maldición
174	9	Curse
175	7	Azote
175	9	Flail
176	7	Conversión2
176	9	Conversion 2
177	7	Aerochorro
177	9	Aeroblast
178	7	Esporagodón
178	9	Cotton Spore
179	7	Inversión
179	9	Reversal
180	7	Rencor
180	9	Spite
181	7	Nieve Polvo
181	9	Powder Snow
182	7	Protección
182	9	Protect
183	7	Ultrapuño
183	9	Mach Punch
184	7	Cara Susto
184	9	Scary Face
185	7	Finta
185	9	Feint Attack
186	7	Beso Dulce
186	9	Sweet Kiss
187	7	Tambor
187	9	Belly Drum
188	7	Bomba Lodo
188	9	Sludge Bomb
189	7	Bofetón Lodo
189	9	Mud-Slap
190	7	Pulpocañón
190	9	Octazooka
191	7	Púas
191	9	Spikes
192	7	Electrocañón
192	9	Zap Cannon
193	7	Profecía
193	9	Foresight
194	7	Mismo Destino
194	9	Destiny Bond
195	7	Canto Mortal
195	9	Perish Song
196	7	Viento Hielo
196	9	Icy Wind
197	7	Detección
197	9	Detect
198	7	Ataque Óseo
198	9	Bone Rush
199	7	Fijar Blanco
199	9	Lock-On
200	7	Enfado
200	9	Outrage
201	7	Tormenta Arena
201	9	Sandstorm
202	7	Gigadrenado
202	9	Giga Drain
203	7	Aguante
203	9	Endure
204	7	Encanto
204	9	Charm
205	7	Desenrollar
205	9	Rollout
206	7	Falsotortazo
206	9	False Swipe
207	7	Contoneo
207	9	Swagger
208	7	Batido
208	9	Milk Drink
209	7	Chispa
209	9	Spark
210	7	Corte Furia
210	9	Fury Cutter
211	7	Ala de Acero
211	9	Steel Wing
212	7	Mal de Ojo
212	9	Mean Look
213	7	Atracción
213	9	Attract
214	7	Sonámbulo
214	9	Sleep Talk
215	7	Campana Cura
215	9	Heal Bell
216	7	Retribución
216	9	Return
217	7	Presente
217	9	Present
218	7	Frustración
218	9	Frustration
219	7	Velo Sagrado
219	9	Safeguard
220	7	Divide Dolor
220	9	Pain Split
221	7	Fuego Sagrado
221	9	Sacred Fire
222	7	Magnitud
222	9	Magnitude
223	7	Puño Dinámico
223	9	Dynamic Punch
224	7	Megacuerno
224	9	Megahorn
225	7	Dragoaliento
225	9	Dragon Breath
226	7	Relevo
226	9	Baton Pass
227	7	Otra Vez
227	9	Encore
228	7	Persecución
228	9	Pursuit
229	7	Giro Rápido
229	9	Rapid Spin
230	7	Dulce Aroma
230	9	Sweet Scent
231	7	Cola Férrea
231	9	Iron Tail
232	7	Garra Metal
232	9	Metal Claw
233	7	Tiro Vital
233	9	Vital Throw
234	7	Sol Matinal
234	9	Morning Sun
235	7	Síntesis
235	9	Synthesis
236	7	Luz Lunar
236	9	Moonlight
237	7	Poder Oculto
237	9	Hidden Power
238	7	Tajo Cruzado
238	9	Cross Chop
239	7	Ciclón
239	9	Twister
240	7	Danza Lluvia
240	9	Rain Dance
241	7	Día Soleado
241	9	Sunny Day
242	7	Triturar
242	9	Crunch
243	7	Manto Espejo
243	9	Mirror Coat
244	7	Más Psique
244	9	Psych Up
245	7	Veloc. Extrema
245	9	Extreme Speed
246	7	Poder Pasado
246	9	Ancient Power
247	7	Bola Sombra
247	9	Shadow Ball
248	7	Premonición
248	9	Future Sight
249	7	Golpe Roca
249	9	Rock Smash
250	7	Torbellino
250	9	Whirlpool
251	7	Paliza
251	9	Beat Up
252	7	Sorpresa
252	9	Fake Out
253	7	Alboroto
253	9	Uproar
254	7	Reserva
254	9	Stockpile
255	7	Escupir
255	9	Spit Up
256	7	Tragar
256	9	Swallow
257	7	Onda Ígnea
257	9	Heat Wave
258	7	Granizo
258	9	Hail
259	7	Tormento
259	9	Torment
260	7	Camelo
260	9	Flatter
261	7	Fuego Fatuo
261	9	Will-O-Wisp
262	7	Legado
262	9	Memento
263	7	Imagen
263	9	Facade
264	7	Puño Certero
264	9	Focus Punch
265	7	Estímulo
265	9	Smelling Salts
266	7	Señuelo
266	9	Follow Me
267	7	Adaptación
267	9	Nature Power
268	7	Carga
268	9	Charge
269	7	Mofa
269	9	Taunt
270	7	Refuerzo
270	9	Helping Hand
271	7	Truco
271	9	Trick
272	7	Imitación
272	9	Role Play
273	7	Deseo
273	9	Wish
274	7	Ayuda
274	9	Assist
275	7	Arraigo
275	9	Ingrain
276	7	Fuerza Bruta
276	9	Superpower
277	7	Capa Mágica
277	9	Magic Coat
278	7	Reciclaje
278	9	Recycle
279	7	Desquite
279	9	Revenge
280	7	Demolición
280	9	Brick Break
281	7	Bostezo
281	9	Yawn
282	7	Desarme
282	9	Knock Off
283	7	Esfuerzo
283	9	Endeavor
284	7	Estallido
284	9	Eruption
285	7	Intercambio
285	9	Skill Swap
286	7	Cerca
286	9	Imprison
287	7	Alivio
287	9	Refresh
288	7	Rabia
288	9	Grudge
289	7	Robo
289	9	Snatch
290	7	Daño Secreto
290	9	Secret Power
291	7	Buceo
291	9	Dive
292	7	Empujón
292	9	Arm Thrust
293	7	Camuflaje
293	9	Camouflage
294	7	Ráfaga
294	9	Tail Glow
295	7	Resplandor
295	9	Luster Purge
296	7	Bola Neblina
296	9	Mist Ball
297	7	Danza Pluma
297	9	Feather Dance
298	7	Danza Caos
298	9	Teeter Dance
299	7	Patada Ígnea
299	9	Blaze Kick
300	7	Chapoteo Lodo
300	9	Mud Sport
301	7	Bola Hielo
301	9	Ice Ball
302	7	Brazo Pincho
302	9	Needle Arm
303	7	Relajo
303	9	Slack Off
304	7	Vozarrón
304	9	Hyper Voice
305	7	Colmillo Ven
305	9	Poison Fang
306	7	Garra Brutal
306	9	Crush Claw
307	7	Anillo Ígneo
307	9	Blast Burn
308	7	Hidrocañón
308	9	Hydro Cannon
309	7	Puño Meteoro
309	9	Meteor Mash
310	7	Impresionar
310	9	Astonish
311	7	Meteorobola
311	9	Weather Ball
312	7	Aromaterapia
312	9	Aromatherapy
313	7	Llanto Falso
313	9	Fake Tears
314	7	Aire Afilado
314	9	Air Cutter
315	7	Sofoco
315	9	Overheat
316	7	Rastreo
316	9	Odor Sleuth
317	7	Tumba Rocas
317	9	Rock Tomb
318	7	Viento Plata
318	9	Silver Wind
319	7	Eco Metálico
319	9	Metal Sound
320	7	Silbato
320	9	Grass Whistle
321	7	Cosquillas
321	9	Tickle
322	7	Masa Cósmica
322	9	Cosmic Power
323	7	Salpicar
323	9	Water Spout
324	7	Doble Rayo
324	9	Signal Beam
325	7	Puño Sombra
325	9	Shadow Punch
326	7	Paranormal
326	9	Extrasensory
327	7	Gancho Alto
327	9	Sky Uppercut
328	7	Bucle Arena
328	9	Sand Tomb
329	7	Frío Polar
329	9	Sheer Cold
330	7	Agua Lodosa
330	9	Muddy Water
331	7	Recurrente
331	9	Bullet Seed
332	7	Golpe Aéreo
332	9	Aerial Ace
333	7	Carámbano
333	9	Icicle Spear
334	7	Defensa Férrea
334	9	Iron Defense
335	7	Bloqueo
335	9	Block
336	7	Aullido
336	9	Howl
337	7	Garra Dragón
337	9	Dragon Claw
338	7	Planta Feroz
338	9	Frenzy Plant
339	7	Corpulencia
339	9	Bulk Up
340	7	Bote
340	9	Bounce
341	7	Disparo Lodo
341	9	Mud Shot
342	7	Cola Veneno
342	9	Poison Tail
343	7	Antojo
343	9	Covet
344	7	Placaje Eléc
344	9	Volt Tackle
345	7	Hoja Mágica
345	9	Magical Leaf
346	7	Hidrochorro
346	9	Water Sport
347	7	Paz Mental
347	9	Calm Mind
348	7	Hoja Aguda
348	9	Leaf Blade
349	7	Danza Dragón
349	9	Dragon Dance
350	7	Pedrada
350	9	Rock Blast
351	7	Onda Voltio
351	9	Shock Wave
352	7	Hidropulso
352	9	Water Pulse
353	7	Deseo Oculto
353	9	Doom Desire
354	7	Psicoataque
354	9	Psycho Boost
355	7	Respiro
355	9	Roost
356	7	Gravedad
356	9	Gravity
357	7	Gran Ojo
357	9	Miracle Eye
358	7	Espabila
358	9	Wake-Up Slap
359	7	Machada
359	9	Hammer Arm
360	7	Giro Bola
360	9	Gyro Ball
361	7	Deseo Cura
361	9	Healing Wish
362	7	Salmuera
362	9	Brine
363	7	Don Natural
363	9	Natural Gift
364	7	Amago
364	9	Feint
365	7	Picoteo
365	9	Pluck
366	7	Viento Afín
366	9	Tailwind
367	7	Acupresión
367	9	Acupressure
368	7	Represión Metal
368	9	Metal Burst
369	7	Ida y Vuelta
369	9	U-turn
370	7	A Bocajarro
370	9	Close Combat
371	7	Vendetta
371	9	Payback
372	7	Buena Baza
372	9	Assurance
373	7	Embargo
373	9	Embargo
374	7	Lanzamiento
374	9	Fling
375	7	Psicocambio
375	9	Psycho Shift
376	7	As Oculto
376	9	Trump Card
377	7	Anticura
377	9	Heal Block
378	7	Estrujón
378	9	Wring Out
379	7	Truco Fuerza
379	9	Power Trick
380	7	Bilis
380	9	Gastro Acid
381	7	Conjuro
381	9	Lucky Chant
382	7	Yo Primero
382	9	Me First
383	7	Copión
383	9	Copycat
384	7	Cambia Fuerza
384	9	Power Swap
385	7	Cambia Defensa
385	9	Guard Swap
386	7	Castigo
386	9	Punishment
387	7	Última Baza
387	9	Last Resort
388	7	Abatidoras
388	9	Worry Seed
389	7	Golpe Bajo
389	9	Sucker Punch
390	7	Púas Tóxicas
390	9	Toxic Spikes
391	7	Cambia Almas
391	9	Heart Swap
392	7	Acua Aro
392	9	Aqua Ring
393	7	Levitón
393	9	Magnet Rise
394	7	Envite Ígneo
394	9	Flare Blitz
395	7	Palmeo
395	9	Force Palm
396	7	Esfera Aural
396	9	Aura Sphere
397	7	Pulimento
397	9	Rock Polish
398	7	Puya Nociva
398	9	Poison Jab
399	7	Pulso Umbrío
399	9	Dark Pulse
400	7	Tajo Umbrío
400	9	Night Slash
401	7	Acua Cola
401	9	Aqua Tail
402	7	Bomba Germen
402	9	Seed Bomb
403	7	Tajo Aéreo
403	9	Air Slash
404	7	Tijera X
404	9	X-Scissor
405	7	Zumbido
405	9	Bug Buzz
406	7	Pulso Dragón
406	9	Dragon Pulse
407	7	Carga Dragón
407	9	Dragon Rush
408	7	Joya de Luz
408	9	Power Gem
409	7	Puño Drenaje
409	9	Drain Punch
410	7	Onda Vacío
410	9	Vacuum Wave
411	7	Onda Certera
411	9	Focus Blast
412	7	Energibola
412	9	Energy Ball
413	7	Pájaro Osado
413	9	Brave Bird
414	7	Tierra Viva
414	9	Earth Power
415	7	Trapicheo
415	9	Switcheroo
416	7	Giga Impacto
416	9	Giga Impact
417	7	Maquinación
417	9	Nasty Plot
418	7	Puño Bala
418	9	Bullet Punch
419	7	Alud
419	9	Avalanche
420	7	Canto Helado
420	9	Ice Shard
421	7	Garra Umbría
421	9	Shadow Claw
422	7	Colmillo Rayo
422	9	Thunder Fang
423	7	Colmillo Hielo
423	9	Ice Fang
424	7	Colmillo Ígneo
424	9	Fire Fang
425	7	Sombra Vil
425	9	Shadow Sneak
426	7	Bomba Fango
426	9	Mud Bomb
427	7	Psicocorte
427	9	Psycho Cut
428	7	Cabezazo Zen
428	9	Zen Headbutt
429	7	Disparo Espejo
429	9	Mirror Shot
430	7	Foco Resplandor
430	9	Flash Cannon
431	7	Treparrocas
431	9	Rock Climb
432	7	Despejar
432	9	Defog
433	7	Espacio Raro
433	9	Trick Room
434	7	Cometa Draco
434	9	Draco Meteor
435	7	Chispazo
435	9	Discharge
436	7	Humareda
436	9	Lava Plume
437	7	Lluevehojas
437	9	Leaf Storm
438	7	Latigazo
438	9	Power Whip
439	7	Romperrocas
439	9	Rock Wrecker
440	7	Veneno X
440	9	Cross Poison
441	7	Lanza Mugre
441	9	Gunk Shot
442	7	Cabeza de Hierro
442	9	Iron Head
443	7	Bomba Imán
443	9	Magnet Bomb
444	7	Roca Afilada
444	9	Stone Edge
445	7	Seducción
445	9	Captivate
446	7	Trampa Rocas
446	9	Stealth Rock
447	7	Hierba Lazo
447	9	Grass Knot
448	7	Cháchara
448	9	Chatter
449	7	Sentencia
449	9	Judgment
450	7	Picadura
450	9	Bug Bite
451	7	Rayo Carga
451	9	Charge Beam
452	7	Mazazo
452	9	Wood Hammer
453	7	Acua Jet
453	9	Aqua Jet
454	7	Al Ataque
454	9	Attack Order
455	7	A Defender
455	9	Defend Order
456	7	Auxilio
456	9	Heal Order
457	7	Testarazo
457	9	Head Smash
458	7	Doble Golpe
458	9	Double Hit
459	7	Distorsión
459	9	Roar of Time
460	7	Corte Vacío
460	9	Spacial Rend
461	7	Danza Lunar
461	9	Lunar Dance
462	7	Agarrón
462	9	Crush Grip
463	7	Lluvia Ígnea
463	9	Magma Storm
464	7	Brecha Negra
464	9	Dark Void
465	7	Fogonazo
465	9	Seed Flare
466	7	Viento Aciago
466	9	Ominous Wind
467	7	Golpe Umbrío
467	9	Shadow Force
468	7	Afilagarras
468	9	Hone Claws
469	7	Vastaguardia
469	9	Wide Guard
470	7	Isoguardia
470	9	Guard Split
471	7	Isofuerza
471	9	Power Split
472	7	Zona Extraña
472	9	Wonder Room
473	7	Psicocarga
473	9	Psyshock
474	7	Carga Tóxica
474	9	Venoshock
475	7	Aligerar
475	9	Autotomize
476	7	Polvo Ira
476	9	Rage Powder
477	7	Telequinesis
477	9	Telekinesis
478	7	Zona Mágica
478	9	Magic Room
479	7	Antiaéreo
479	9	Smack Down
480	7	Llave Corsé
480	9	Storm Throw
481	7	Pirotecnia
481	9	Flame Burst
482	7	Onda Tóxica
482	9	Sludge Wave
483	7	Danza Aleteo
483	9	Quiver Dance
484	7	Cuerpo Pesado
484	9	Heavy Slam
485	7	Sincrorruido
485	9	Synchronoise
486	7	Bola Voltio
486	9	Electro Ball
487	7	Anegar
487	9	Soak
488	7	Nitrocarga
488	9	Flame Charge
489	7	Enrosque
489	9	Coil
490	7	Puntapié
490	9	Low Sweep
491	7	Bomba Ácida
491	9	Acid Spray
492	7	Juego Sucio
492	9	Foul Play
493	7	Onda Simple
493	9	Simple Beam
494	7	Danza Amiga
494	9	Entrainment
495	7	Cede Paso
495	9	After You
496	7	Canon
496	9	Round
497	7	Eco Voz
497	9	Echoed Voice
498	7	Guardia Baja
498	9	Chip Away
499	7	Niebla Clara
499	9	Clear Smog
500	7	Poder Reserva
500	9	Stored Power
501	7	Anticipo
501	9	Quick Guard
502	7	Cambio Banda
502	9	Ally Switch
503	7	Escaldar
503	9	Scald
504	7	Rompecoraza
504	9	Shell Smash
505	7	Pulso Cura
505	9	Heal Pulse
506	7	Infortunio
506	9	Hex
507	7	Caída Libre
507	9	Sky Drop
508	7	Cambio de Marcha
508	9	Shift Gear
509	7	Llave Giro
509	9	Circle Throw
510	7	Calcinación
510	9	Incinerate
511	7	Último Lugar
511	9	Quash
512	7	Acróbata
512	9	Acrobatics
513	7	Clonatipo
513	9	Reflect Type
514	7	Represalia
514	9	Retaliate
515	7	Sacrificio
515	9	Final Gambit
516	7	Ofrenda
516	9	Bestow
517	7	Infierno
517	9	Inferno
518	7	Voto Agua
518	9	Water Pledge
519	7	Voto Fuego
519	9	Fire Pledge
520	7	Voto Planta
520	9	Grass Pledge
521	7	Voltiocambio
521	9	Volt Switch
522	7	Estoicismo
522	9	Struggle Bug
523	7	Terratemblor
523	9	Bulldoze
524	7	Vaho Gélido
524	9	Frost Breath
525	7	Cola Dragón
525	9	Dragon Tail
526	7	Avivar
526	9	Work Up
527	7	Electrotela
527	9	Electroweb
528	7	Voltio Cruel
528	9	Wild Charge
529	7	Taladradora
529	9	Drill Run
530	7	Golpe Bis
530	9	Dual Chop
531	7	Arrumaco
531	9	Heart Stamp
532	7	Asta Drenaje
532	9	Horn Leech
533	7	Espada Santa
533	9	Sacred Sword
534	7	Concha Filo
534	9	Razor Shell
535	7	Golpe Calor
535	9	Heat Crash
536	7	Ciclón de Hojas
536	9	Leaf Tornado
537	7	Rodillo de Púas
537	9	Steamroller
538	7	Rizo Algodón
538	9	Cotton Guard
539	7	Pulso Noche
539	9	Night Daze
540	7	Onda Mental
540	9	Psystrike
541	7	Plumerazo
541	9	Tail Slap
542	7	Vendaval
542	9	Hurricane
543	7	Ariete
543	9	Head Charge
544	7	Rueda Doble
544	9	Gear Grind
545	7	Bomba Ígnea
545	9	Searing Shot
546	7	Tecno Shock
546	9	Techno Blast
547	7	Canto Arcaico
547	9	Relic Song
548	7	Sable Místico
548	9	Secret Sword
549	7	Mundo Gélido
549	9	Glaciate
550	7	Ataque Fulgor
550	9	Bolt Strike
551	7	Llama Azul
551	9	Blue Flare
552	7	Danza Llama
552	9	Fiery Dance
553	7	Rayo Gélido
553	9	Freeze Shock
554	7	Llama Gélida
554	9	Ice Burn
555	7	Alarido
555	9	Snarl
556	7	Chuzos
556	9	Icicle Crash
557	7	V de Fuego
557	9	V-create
558	7	Llama Fusión
558	9	Fusion Flare
559	7	Rayo Fusión
559	9	Fusion Bolt
560	7	Plancha Voladora
560	9	Flying Press
561	7	Escudo Tatami
561	9	Mat Block
562	7	Eructo
562	9	Belch
563	7	Fertilizante
563	9	Rototiller
564	7	Red Viscosa
564	9	Sticky Web
565	7	Aguijón Letal
565	9	Fell Stinger
566	7	Golpe Fantasma
566	9	Phantom Force
567	7	Halloween
567	9	Trick-or-Treat
568	7	Rugido de Guerra
568	9	Noble Roar
569	7	Cortina Plasma
569	9	Ion Deluge
570	7	Carga Parábola
570	9	Parabolic Charge
571	7	Condena Silvana
571	9	Forest's Curse
572	7	Tormenta Floral
572	9	Petal Blizzard
573	7	Liofilización
573	9	Freeze-Dry
574	7	Voz Cautivadora
574	9	Disarming Voice
575	7	Última Palabra
575	9	Parting Shot
576	7	Reversión
576	9	Topsy-Turvy
577	7	Beso Drenaje
577	9	Draining Kiss
578	7	Truco Defensa
578	9	Crafty Shield
579	7	Defensa Floral
579	9	Flower Shield
580	7	Campo de Hierba
580	9	Grassy Terrain
581	7	Campo de Niebla
581	9	Misty Terrain
582	7	Electrificación
582	9	Electrify
583	7	Carantoña
583	9	Play Rough
584	7	Viento Feérico
584	9	Fairy Wind
585	7	Fuerza Lunar
585	9	Moonblast
586	7	Estruendo
586	9	Boomburst
587	7	Cerrojo Feérico
587	9	Fairy Lock
588	7	Escudo Real
588	9	King's Shield
589	7	Camaradería
589	9	Play Nice
590	7	Confidencia
590	9	Confide
591	7	Torm. Diamantes
591	9	Diamond Storm
592	7	Chorro de Vapor
592	9	Steam Eruption
593	7	Paso Dimensional
593	9	Hyperspace Hole
594	7	Shuriken de Agua
594	9	Water Shuriken
595	7	Llama Embrujada
595	9	Mystical Fire
596	7	Barrera Espinosa
596	9	Spiky Shield
597	7	Niebla Aromática
597	9	Aromatic Mist
598	7	Onda Anómala
598	9	Eerie Impulse
599	7	Trampa Venenosa
599	9	Venom Drench
600	7	Polvo Explosivo
600	9	Powder
601	7	Geocontrol
601	9	Geomancy
602	7	Aura Magnética
602	9	Magnetic Flux
603	7	Paga Extra
603	9	Happy Hour
604	7	Campo Eléctrico
604	9	Electric Terrain
605	7	Brillo Mágico
605	9	Dazzling Gleam
606	7	Celebración
606	9	Celebrate
607	7	Manos Juntas
607	9	Hold Hands
608	7	Ojitos Tiernos
608	9	Baby-Doll Eyes
609	7	Moflete Estático
609	9	Nuzzle
610	7	Clemencia
610	9	Hold Back
611	7	Acoso
611	9	Infestation
612	7	Puño Incremento
612	9	Power-Up Punch
613	7	Ala Mortífera
613	9	Oblivion Wing
614	7	Mil Flechas
614	9	Thousand Arrows
615	7	Mil Temblores
615	9	Thousand Waves
616	7	Fuerza Telúrica
616	9	Land's Wrath
617	7	Luz Aniquiladora
617	9	Light of Ruin
42	10	Jehlostřela
227	10	Přídavek
94	10	Psychika
181	10	Prašan
364	10	Lest
217	10	Dárek
144	10	Transformace
111	10	Schoulení
354	10	Psyzvýšení
283	10	Úsilí
150	10	Šplouchnutí
408	10	Síla drahokamu
101	10	Noční stín
273	10	Přání
28	10	Písečný útok
414	10	Síla Země
64	10	Klovnutí
167	10	Trojitý kop
18	10	Odfouknutí
292	10	Úder paží
203	10	Výdrž
70	10	Síla
157	10	Pád skály
328	10	Písečné peklo
431	10	Horolezectví
282	10	Vyražení
193	10	Vidění
467	10	Potopení do stínů
334	10	Zaželezení
421	10	Stínový dráp
87	10	Blesk
457	10	Drcení hlavou
212	10	Zlý pohled
123	10	Smog
384	10	Výměna síly
77	10	Jedovatý pyl
248	10	Budoucnost
351	10	Šoková vlna
202	10	Giga-vysátí
113	10	Světelná zeď
131	10	Ostnové dělo
390	10	Toxické ostny
254	10	Zásobení
341	10	Bahnomet
268	10	Nabití
377	10	Blokace léčení
304	10	hlaszvuk
407	10	Dračí zteč
15	10	Sek
258	10	Kroupy
443	10	Magnetická puma
122	10	Oblíznutí
51	10	Kyselina
310	10	Vyděšení
397	10	Broušení kamene
5	10	Megarána
433	10	Komnata triků
188	10	Bahenní puma
41	10	Dvojehla
224	10	Megaroh
327	10	Nebeský úder
178	10	Chmýří
452	10	Dřevěné kladivo
363	10	Dar přírody
230	10	Sladká vůně
317	10	Kamenná past
442	10	Železná hlava
353	10	Vůle osudu
108	10	Kouřová clona
247	10	Koule stínů
98	10	Hbitý útok
372	10	Ujištění
27	10	Kop s otočkou
237	10	Skrytá síla
152	10	Krabí kladivo
362	10	Slaná voda
17	10	Křídlový útok
291	10	Potopení
158	10	Hypertesák
428	10	Zenová hlavička
281	10	Zívnutí
36	10	Sejmutí
464	10	Temná prázdnota
72	10	Megavysátí
175	10	Škubání
418	10	Výstřelový úder
26	10	Kop z výskoku
211	10	Ocelové křídlo
78	10	Omračující pyl
165	10	Zoufalý útok
348	10	Ostrý list
201	10	Písečná bouře
128	10	Sevření
95	10	Hypnóza
338	10	Šílená kytka
267	10	Přírodní síla
134	10	Kineze
392	10	Vodní kruh
85	10	Bleskový útok
257	10	Tepelná vlna
12	10	Klepetí gilotina
121	10	Vaječná puma
398	10	Jedové bodnutí
48	10	Ultrazvuk
151	10	Rozpuštění
2	10	Karatistický úder
276	10	Supersíla
187	10	Břišní buben
54	10	Mlha
141	10	Vysátí
312	10	Aromaterapie
415	10	Zamíchání
266	10	Za mnou
177	10	Vzdušný výbuch
451	10	Paprsek náboje
318	10	Stříbrný vítr
405	10	Zabzučení
71	10	Vstřebání
441	10	Zásah sajrajtem
196	10	Severák
107	10	Zmenšení
61	10	Bublinomet
232	10	Kovový dráp
335	10	Zablokování
186	10	Sladký polibek
97	10	Hbitost
371	10	Vyrovnání účtů
238	10	Křížový úder
325	10	Temná pěst
361	10	Léčivé přání
116	10	Soustředění
288	10	Zášť
391	10	Výměna srdcí
255	10	Vyplivnutí
427	10	Psychosek
106	10	Zatvrzení
35	10	Ovinutí
294	10	Ocasní světélko
245	10	Extrémní rychlost
417	10	Intrika
172	10	Ohnivý kruh
25	10	Megakop
208	10	Doušek mléka
311	10	Koule počasí
162	10	Supertesák
436	10	Výbuch lávy
347	10	Klidná mysl
214	10	Řeč ze sna
301	10	Ledová koule
426	10	Blátivá puma
337	10	Dračí Spár
92	10	Toxický útok
231	10	Železný ocas
82	10	Dračí hněv
356	10	Gravitace
11	10	Svěrák
221	10	Posvátný oheň
136	10	Vysoký kop
346	10	Vodní hra
1	10	Facka
275	10	Zakořenění
142	10	Polibek
412	10	Míč energie
265	10	Smradlavá sůl
20	10	Omotání
448	10	Žvanění
56	10	Vodní pumpa
159	10	Nabroušení
402	10	Semínková puma
10	10	Škrábnutí
195	10	Píseň zániku
454	10	Příkaz k útoku
62	10	Polární záře
149	10	Psy-vlna
332	10	Vzdušné eso
185	10	Matný útok
368	10	Ocelový výbuch
79	10	Uspávací pyl
322	10	Kosmická síla
115	10	Zrcadlová zeď
374	10	Hod
461	10	Měsíční tanec
69	10	Seismický vrh
252	10	Předstírání
105	10	Obnovení
32	10	Vrtání rohem
135	10	Na měkko
242	10	Křupnutí
260	10	Lichotka
171	10	Noční můra
38	10	Dvojí ostří
381	10	Popěvek pro štěstí
296	10	Mlhová koule
399	10	Temný puls
161	10	Trojitý útok
435	10	Vybití
302	10	Trnitá ruka
389	10	Podpásovka
55	10	Vodní dělo
425	10	Plížení stínem
180	10	Zlá vůle
91	10	Hrabavý útok
45	10	Zavrčení
216	10	Opětování
319	10	Kovový zvuk
170	10	Čtení mysli
81	10	Lepivé vlákno
355	10	Hřadování
222	10	Magnituda
309	10	Meteorána
345	10	Magický list
100	10	Teleportace
272	10	Vžití do role
239	10	Tornádo
411	10	Usměrnění Síly
90	10	Puklina v zemi
19	10	Let
278	10	Recyklace
229	10	Kolotoč
401	10	Vodní ocas
156	10	Odpočinek
9	10	Blesková rána
192	10	Výbojové dělo
295	10	Očistná záře
146	10	Zmatený úder
420	10	Střechýle
331	10	Semenomet
198	10	Příval kostí
285	10	Výměna
456	10	Příkaz vyléčit
410	10	Vlna vzduchoprázdna
321	10	Polechtání
76	10	Sluneční paprsek
462	10	Drtivý stisk
112	10	Bariéra
215	10	Léčivý zvonek
66	10	Znehybnění
340	10	Odražení
251	10	Zbití
205	10	Valivý útok
376	10	Trumf
330	10	Kalná voda
241	10	Slunečný den
259	10	Trápení
382	10	Nejdřív já
396	10	Kulová aura
4	10	Opakovaný úder
432	10	Odmlžení
125	10	Kostěný kyj
40	10	Jedovaté žihadlo
143	10	Nebeský útok
386	10	Co proto
250	10	Vodní vír
179	10	Zvrat
438	10	Šleh bičem
46	10	Řev
133	10	Amnézie
316	10	Pachová stopa
169	10	Pavučina
352	10	Vodní puls
455	10	Příkaz k obraně
63	10	Hyperpaprsek
306	10	Drtivá tlapa
99	10	Hněv
358	10	Facka na probuzení
445	10	Okouzlení
53	10	Plamenomet
236	10	Měsíční svit
89	10	Zemětřesení
16	10	Vzdušný vír
375	10	Psychopřesun
226	10	Štafeta
155	10	Kostmerang
22	10	Úponkový bič
365	10	Vyklovnutí
280	10	Rozbití cihly
145	10	Bublinky
419	10	Lavina
286	10	Uvěznění
39	10	Vrtění ocasem
409	10	Vysávací úder
164	10	Zástupce
75	10	Listová břitva
29	10	Náraz hlavou
200	10	Rozzuření
303	10	Zalenošení
154	10	Zuřivé řezání
65	10	Nebozezobák
339	10	Nadmutí
206	10	Falešný sek
293	10	Kamufláž
329	10	Totální mráz
84	10	Bleskový šok
256	10	Spolknutí
120	10	Sebezničení
223	10	Výbušný úder
466	10	Zlověstný vítr
395	10	Použití Síly
74	10	Růst
3	10	Dvojitá facka
262	10	Odkaz
126	10	Výbuch ohně
213	10	Zalíbení
385	10	Výměna obrany
140	10	Bombardování
249	10	Drcení kamenů
279	10	Odplata
130	10	Úder lebkou
404	10	X-Šmik
315	10	Přehřátí
182	10	Protekce
269	10	Navádění
440	10	Křížový jed
394	10	Plamenný nálet
305	10	Jedovatý tesák
60	10	Psychický paprsek
446	10	Zákeřný kámen
96	10	Meditace
199	10	Zaměření
50	10	Zákaz
324	10	Signální záře
235	10	Syntéza
102	10	Napodobení
189	10	Plesknutí blátem
360	10	Gyrokáča
463	10	Bouře lávy
314	10	Sek vzduchem
225	10	Dračí dech
366	10	Vítr v zádech
453	10	Proud vody
119	10	Zrcadlový útok
244	10	Nápsych
416	10	Meganáraz
109	10	Matoucí paprsek
24	10	Dvojitý kop
383	10	Opičení
234	10	Ranní slunce
163	10	Šmik
422	10	Hromový tesák
30	10	Rohový útok
373	10	Embargo
300	10	Blátivá hra
153	10	Exploze
336	10	Zavytí
439	10	Kamenné dělo
47	10	Zpěv
290	10	Tajemná síla
83	10	Ohnivý vír
342	10	Jedovatý ocas
429	10	Zrcadlová střela
37	10	Zuřivost
465	10	Semínková světlice
220	10	Půlená bolest
73	10	Pijavičné semínko
359	10	Kladivová pěst
210	10	Zuřivé nože
139	10	Jedovatý plyn
6	10	Výplata
349	10	Dračí tanec
264	10	Mířená rána
129	10	Hvězdičky
403	10	Vzdušný sek
270	10	Pomocná ruka
23	10	Dupnutí
393	10	Magnetický zdvih
148	10	Záblesk
59	10	Vánice
13	10	Ostrý vítr
184	10	Děsivý škleb
287	10	Osvěžení
138	10	Požírač snů
49	10	Zvuková vlna
323	10	Vodotrysk
190	10	Chobozuka
277	10	Magický plášť
460	10	Trhlina prostoru
313	10	Falešné slzy
68	10	Odvetný úder
104	10	Zdvojení
207	10	Naparování
450	10	Hmyzí kousanec
58	10	Ledový paprsek
243	10	Zrcadlo
110	10	Schování
197	10	Detekce
380	10	Žaludeční šťáva
233	10	Osudný vrh
160	10	Konverze
263	10	Vzteklý útok
127	10	Vodopád
370	10	Boj na blízko
388	10	Semínko starostí
299	10	Žárový kop
166	10	Náčrt
424	10	Ohnivý tesák
117	10	Výzva
289	10	Šlohnutí
44	10	Kousnutí
430	10	Světelné dělo
80	10	Tanec listů
183	10	Hbitá pěst
34	10	Zavalení
308	10	Hydrodělo
219	10	Ochrana
86	10	Blesková vlna
173	10	Chrápání
344	10	Voltonáraz
447	10	Uzel z trávy
298	10	Bláznivé tóny
209	10	Jiskra
350	10	SuprŠutr
437	10	Listová bouře
103	10	Zaskřípání
228	10	Pronásledování
400	10	Rozpárání
93	10	Zmatení
8	10	Ledový úder
367	10	Akupresura
218	10	Frustrace
147	10	Výtrus
406	10	Dračí puls
14	10	Tanec mečů
357	10	Zázračné oko
284	10	Erupce
137	10	Hadí pohled
320	10	Travní hvizd
423	10	Ledový tesák
31	10	Zuřivý útok
274	10	Asistence
459	10	Řev času
67	10	Nízký kop
326	10	Mimosmyslové vnímání
413	10	Nálet
21	10	Náraz
449	10	Rozsudek
204	10	Šarm
57	10	Surfování
240	10	Tanec v dešti
343	10	Chamtivost
194	10	Pouto osudu
379	10	Trik síly
246	10	Prastará síla
333	10	Rampouchové kopí
458	10	Dvojitá rána
369	10	Otočka
124	10	Bahno
387	10	Záloha
7	10	Ohnivý úder
114	10	Opar
132	10	Škrcení
43	10	Lstivý pohled
253	10	Hluk
168	10	Zloděj
271	10	Trik
378	10	Vyždímání
33	10	Nárazový útok
307	10	Ohnivý výšleh
174	10	Prokletí
261	10	Bludička
444	10	Kamenné ostří
297	10	Tanec peří
52	10	Popálení
88	10	Hod kamenem
191	10	Střepiny
434	10	Dračí meteor
618	9	Origin Pulse
619	9	Precipice Blades
620	9	Dragon Ascent
621	9	Hyperspace Fury
618	7	Pulso Primigenio
619	7	Filo del Abismo
620	7	Ascenso Draco
621	7	Furia Dimensional
622	7	Accelrock
622	9	Accelrock
623	7	Anchor Shot
623	9	Anchor Shot
624	7	Aurora Veil
624	9	Aurora Veil
625	7	Baneful Bunker
625	9	Baneful Bunker
626	7	Beak Blast
626	9	Beak Blast
627	7	Brutal Swing
627	9	Brutal Swing
628	7	Burn Up
628	9	Burn Up
629	7	Clanging Scales
629	9	Clanging Scales
630	7	Core Enforcer
630	9	Core Enforcer
631	7	Darkest Lariat
631	9	Darkest Lariat
632	7	Dragon Hammer
632	9	Dragon Hammer
633	7	Fire Lash
633	9	Fire Lash
634	7	First Impression
634	9	First Impression
635	7	Fleaur Cannon
635	9	Fleaur Cannon
636	7	Floral Healing
636	9	Floral Healing
637	7	Gear Up
637	9	Gear Up
638	7	High Horsepower
638	9	High Horsepower
639	7	Ice Hammer
639	9	Ice Hammer
640	7	Instruct
640	9	Instruct
641	7	Laser Focus
641	9	Laser Focus
642	7	Leafage
642	9	Leafage
643	7	Liquidation
643	9	Liquidation
644	7	Lunge
644	9	Lunge
645	7	Moongeist Beam
645	9	Moongeist Beam
646	7	Multi-Attack
646	9	Multi-Attack
647	7	Nature's Madness
647	9	Nature's Madness
648	7	Pollen Puff
648	9	Pollen Puff
649	7	Power Trip
649	9	Power Trip
650	7	Prismatic Laser
650	9	Prismatic Laser
651	7	Psychic Fangs
651	9	Psychic Fangs
652	7	Psychic Terrain
652	9	Psychic Terrain
653	7	Purify
653	9	Purify
654	7	Revelation Dancer
654	9	Revelation Dancer
655	7	Shadow Bone
655	9	Shadow Bone
656	7	Shell Trap
656	9	Shell Trap
657	7	Shore Up
657	9	Shore Up
658	7	Smart Strike
658	9	Smart Strike
659	7	Solar Blade
659	9	Solar Blade
660	7	Sparkling Aria
660	9	Sparkling Aria
661	7	Spectral Thief
661	9	Spectral Thief
662	7	Speed Swap
662	9	Speed Swap
663	7	Spirit Shackle
663	9	Spirit Shackle
664	7	Spotlight
664	9	Spotlight
665	7	Stomping Tantrum
665	9	Stomping Tantrum
666	7	Strength Sap
666	9	Strength Sap
667	7	Sunsteel Strike
667	9	Sunsteel Strike
668	7	Tearful Look
668	9	Tearful Look
669	7	Throat Chop
669	9	Throat Chop
670	7	Toxic Thread
670	9	Toxic Thread
671	7	Trop Kick
671	9	Trop Kick
672	7	Zing Zap
672	9	Zing Zap
\.


--
-- Data for Name: nature_names; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY nature_names (nature_id, local_language_id, name) FROM stdin;
1	7	Fuerte
1	9	Hardy
2	7	Osado
2	9	Bold
3	7	Modesto
3	9	Modest
4	7	Sereno
4	9	Calm
5	7	Miedoso
5	9	Timid
6	7	Huraño
6	9	Lonely
7	7	Dócil
7	9	Docile
8	7	Afable
8	9	Mild
9	7	Amable
9	9	Gentle
10	7	Activo
10	9	Hasty
11	7	Firme
11	9	Adamant
12	7	Agitado
12	9	Impish
13	7	Tímido
13	9	Bashful
14	7	Cauto
14	9	Careful
15	7	Alocado
15	9	Rash
16	7	Alegre
16	9	Jolly
17	7	Pícaro
17	9	Naughty
18	7	Flojo
18	9	Lax
19	7	Raro
19	9	Quirky
20	7	Ingenuo
20	9	Naive
21	7	Audaz
21	9	Brave
22	7	Plácido
22	9	Relaxed
23	7	Manso
23	9	Quiet
24	7	Grosero
24	9	Sassy
25	7	Serio
25	9	Serious
1	7	Fuerte
1	9	Hardy
2	7	Osado
2	9	Bold
3	7	Modesto
3	9	Modest
4	7	Sereno
4	9	Calm
5	7	Miedoso
5	9	Timid
6	7	Huraño
6	9	Lonely
7	7	Dócil
7	9	Docile
8	7	Afable
8	9	Mild
9	7	Amable
9	9	Gentle
10	7	Activo
10	9	Hasty
11	7	Firme
11	9	Adamant
12	7	Agitado
12	9	Impish
13	7	Tímido
13	9	Bashful
14	7	Cauto
14	9	Careful
15	7	Alocado
15	9	Rash
16	7	Alegre
16	9	Jolly
17	7	Pícaro
17	9	Naughty
18	7	Flojo
18	9	Lax
19	7	Raro
19	9	Quirky
20	7	Ingenuo
20	9	Naive
21	7	Audaz
21	9	Brave
22	7	Plácido
22	9	Relaxed
23	7	Manso
23	9	Quiet
24	7	Grosero
24	9	Sassy
25	7	Serio
25	9	Serious
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY players (id, name, nickname, country, facebook, twitter, youtube, blog, created_at, updated_at) FROM stdin;
1	Alejandro Díaz	Cano	CL			https://www.youtube.com/channel/UCA9keBdoGX307sDWP8XvesA		2016-12-15 03:22:43	2016-12-15 03:22:43
2	Ignacio Sepulveda		CL					2016-12-15 03:24:26	2016-12-15 03:24:26
3	Abel Yantorno	FRIKI	CL	https://www.facebook.com/FRIKITR/	https://twitter.com/friki_tr			2016-12-15 03:27:36	2016-12-15 03:27:36
4	Benjamin Varas	BEN	CL					2016-12-15 03:28:04	2016-12-15 03:28:04
5	Rodrigo Vega		CL					2016-12-15 03:28:19	2016-12-15 03:28:19
6	Galvarino Colluguin	Misha	CL					2016-12-15 03:28:48	2016-12-15 03:28:48
7	Marcelo Salgado	Lerion	CL					2016-12-15 03:29:09	2016-12-15 03:29:09
8	Cristopher Ruiz	Razor	CL					2016-12-15 03:29:32	2016-12-15 03:29:32
9	Javier Ponce	Ponkachu	CL	https://www.facebook.com/PonkachuChannel	https://twitter.com/javponcelhoff	https://www.youtube.com/channel/UCg7xhYkoBHdp92g4M0yXi2Q		2016-12-15 03:39:43	2016-12-15 03:39:43
10	Cristian Aravena	Radke	CL					2016-12-15 03:40:10	2016-12-15 03:40:10
11	Juan Pablo Rodriguez	JP	CL					2016-12-15 03:40:31	2016-12-15 03:40:31
12	Manuel Vallejos	ElmoVGC	CL					2016-12-15 03:40:52	2016-12-15 03:40:52
13	Hector Castillo		CL					2016-12-15 03:41:04	2016-12-15 03:41:04
14	Estephan Valdebenito	Pephan	CL		https://twitter.com/pephanvgc			2016-12-15 03:41:31	2016-12-15 03:41:31
15	Hugo Mercado	Jugol	CL					2016-12-15 03:41:47	2016-12-15 03:41:57
16	Catalina Castillo	CB	CL	https://www.facebook.com/DogeCrew	https://twitter.com/dogecrew		https://ub09blog.wordpress.com/	2016-12-15 03:44:36	2016-12-15 03:44:36
17	Javier Valdes	IRNemesis	CL			https://www.youtube.com/playlist?list=PLChCRy2-69H9KXo-lAOMiN7dw_wFdDjDJ		2016-12-15 04:17:03	2016-12-15 04:17:03
18	Diego Aguilera	Desire	CL					2016-12-15 04:17:25	2016-12-15 04:17:25
19	Fabian Alvarez		CL					2016-12-15 04:17:40	2016-12-15 04:17:40
20	Sergio Morales		CL					2016-12-15 04:17:59	2016-12-15 04:17:59
21	Renzo Hernández	HuasoMetaVGC	CL					2016-12-15 04:18:26	2016-12-15 04:18:26
22	Sergio Oyarzun		CL					2016-12-15 04:18:44	2016-12-15 04:18:44
23	Felipe Mendez	TR Kid	CL					2016-12-15 04:19:49	2016-12-15 04:19:49
24	Sergio Fuentes	S3RG10	CL					2016-12-15 15:35:59	2016-12-15 15:35:59
25	Nicolas Villagra	Goku	CL					2016-12-15 15:36:30	2016-12-15 15:36:30
26	Heriberto Pacaje	Kaze	CL		https://twitter.com/KazeVGC	https://www.youtube.com/channel/UCSmNSv8WYXEdQimhkN0qLgw		2016-12-15 15:37:49	2016-12-15 15:37:49
27	Omar Acuña	Homero	CL	https://www.facebook.com/HomeroVGC/	https://twitter.com/HomeroChildprey		http://tghomero.hatenablog.com/	2016-12-15 15:39:38	2016-12-15 15:39:38
28	Christopher Soto	Chris	CL					2016-12-15 16:05:29	2016-12-15 16:05:29
29	Matias Roa	Boah	CL					2016-12-15 16:21:42	2016-12-15 16:21:42
30	Jorge Aburto	JorgeBale	CL					2016-12-15 16:22:03	2016-12-15 16:22:03
31	David Pezoa	DalexVGC	CL					2016-12-15 16:34:54	2016-12-15 16:34:54
32	Javier Espejo	Mizael	CL					2016-12-15 16:36:06	2016-12-15 16:36:06
33	Alexis Hormazabal	Great Alexis	CL					2016-12-15 16:36:27	2016-12-15 16:36:27
34	Nicolas Matus		CL					2016-12-15 16:36:41	2016-12-15 16:36:41
35	Nicolas Del Campo	Sh4dowzon	CL					2016-12-15 16:37:16	2016-12-15 16:37:16
36	Victor Meriño	Sigfried	CL					2016-12-15 20:00:33	2016-12-15 20:00:33
37	Diego Ferreira		CL					2016-12-15 20:00:47	2016-12-15 20:00:47
38	Walter Burgos		CL					2016-12-16 00:27:34	2016-12-16 00:27:34
39	Sebastián Lara		CL					2016-12-16 01:26:17	2016-12-16 01:26:17
40	Ariel Romo	Amsterdam	CL					2016-12-16 01:26:38	2016-12-16 01:26:38
41	Javier Córdova		CL					2016-12-16 01:27:14	2016-12-16 01:27:14
42	Carlos Del Rio	Claus	CL					2016-12-16 01:40:21	2016-12-16 01:40:21
43	Fabian Medina	Jirou	CL					2016-12-16 01:40:49	2016-12-16 01:40:49
44	Felipe Allende		CL					2016-12-16 01:41:04	2016-12-16 01:41:04
45	Esteban Tapia	Redolink	CL					2016-12-16 01:41:24	2016-12-16 01:41:24
46	Felipe Romero		CL					2016-12-16 01:41:42	2016-12-16 01:41:42
47	Sergio Urtubia	Tobi	CL					2016-12-19 20:44:54	2016-12-19 20:44:54
48	Javier Riveros	Articz	CL					2016-12-19 20:46:06	2016-12-19 20:46:06
49	Javier Parada	Grandfire	CL					2016-12-19 20:46:36	2016-12-19 20:46:36
50	Renzo Ramírez	Renxoman	PE					2016-12-20 01:22:49	2016-12-20 01:22:49
51	Matías Vivaceta		PE					2016-12-20 01:41:36	2016-12-20 01:41:36
52	Diego Loayza		PE		https://twitter.com/TeamTherian			2016-12-20 01:41:49	2016-12-20 01:56:00
53	David Del Busto	EstiloDM	PE					2016-12-20 01:42:36	2017-02-01 14:36:02
54	Diego Paredes	Hunter Walls	PE		https://twitter.com/Hunterdwalls			2016-12-20 01:51:47	2016-12-20 01:55:02
55	Alexiev Castro		PE					2016-12-20 01:54:24	2016-12-20 01:54:24
56	Juan C. Ortiz	MrPenguin93	EC		https://twitter.com/MrPenguin93			2016-12-20 06:28:58	2016-12-20 15:50:06
57	Sebastian Altamirano	D3*Kalas	EC					2016-12-20 06:31:05	2016-12-20 15:54:27
58	Angel Beltran	Duffman	EC					2016-12-20 06:32:48	2016-12-20 15:47:38
59	Abraham Ordoñez	Abrahim	EC					2016-12-20 06:33:34	2016-12-20 15:35:58
60	Rafael Tavarez	D3*Yofo	EC		https://twitter.com/Yofo_o			2016-12-20 06:34:51	2016-12-20 15:53:20
61	Paul Ruiz	ralfdude90	EC		https://twitter.com/ralfdude90 			2016-12-20 06:36:34	2016-12-20 15:51:08
62	Munir Kahil	Typh	EC					2016-12-20 06:38:08	2016-12-20 15:50:52
63	Raul Ramirez	D3*Rul	EC		https://twitter.com/_RaulAndres			2016-12-20 06:39:10	2016-12-20 15:53:56
64	Jazmani Gonzalez	[CD] Haxmani	EC					2016-12-20 06:40:21	2016-12-20 15:48:42
65	Rafael Mayor	SOUL	EC					2016-12-20 06:43:30	2016-12-20 15:52:21
66	Mario Pillajo	MARGER	EC					2016-12-20 06:47:04	2016-12-20 15:50:31
67	Jose Alvarado	parzival 	EC					2016-12-20 06:47:27	2016-12-20 23:27:32
68	Jose Ubilla	Jose 12	EC					2016-12-20 06:47:49	2016-12-20 15:49:33
69	Andryell Herrera	D3*Andryell	EC		https://twitter.com/Andryell14 			2016-12-20 06:48:45	2016-12-20 15:47:49
70	Dario Freire	D3*Dario	EC		https://twitter.com/dariofr90			2016-12-20 06:52:00	2016-12-20 15:48:12
71	Roberto Ortega	PKCR MADNESS	CR			https://www.youtube.com/channel/UCAlXndTHV7zjWlpYzdf-b3g		2016-12-20 12:58:57	2017-05-04 17:44:01
72	Esteban Molina	PKCR MADNESS	CR	https://www.facebook.com/MolinaVGC/?fref=ts		https://www.youtube.com/channel/UCrGNASn76ftHzWYk9ybFs5w		2016-12-20 13:00:22	2017-05-04 17:17:42
73	David Rodríguez	Team Heredia	CR					2016-12-20 13:02:20	2017-05-04 17:09:01
74	Jorge Salazar	Jasm	CR					2016-12-20 13:02:43	2016-12-20 13:09:18
75	Erick Córdoba Ramírez	SteMaeVGC	CR					2016-12-20 13:03:17	2016-12-20 13:03:17
76	Victor González	Team Heredia	CR					2016-12-20 13:16:08	2017-05-04 17:43:41
77	Francisco Bernard	Harden Knights	CR					2016-12-20 13:16:40	2017-05-04 17:40:40
78	Max Morales	Team Heredia	CR					2016-12-20 13:17:53	2017-05-04 17:42:19
79	Andrés Parada	PKCR MADNESS	CR					2016-12-20 13:18:21	2017-05-04 17:43:07
80	Leonardo Vargas	Pranksters	CR					2016-12-20 13:19:03	2017-05-04 17:41:51
81	Leonardo Chinchilla	SSQ	CR					2016-12-20 13:19:31	2017-05-04 17:41:25
82	Joshua Quiros	SSQ	CR					2016-12-20 13:20:16	2017-05-04 17:40:57
83	Esteban Hernández	Team Heredia	CR					2016-12-20 13:21:01	2017-05-04 17:09:21
84	Reynord González		CR			https://www.youtube.com/channel/UC4k3sN-TAMyLbBPQnSVDkpg		2016-12-20 13:25:43	2017-05-04 17:44:20
85	Yostin Rojas	Harden Knights	CR	https://www.facebook.com/yostin.rojas.71				2016-12-20 13:26:56	2017-05-04 17:32:13
86	Marcelo Campos		CR					2016-12-20 13:27:27	2017-05-04 17:41:40
189	Diego Varea		PE					2017-02-01 18:27:18	2017-02-01 18:27:18
87	Kevin Vega	SSQ	CR					2016-12-20 13:28:54	2017-05-04 17:41:10
88	Erick Porras	Team Dark Lugia	CR					2016-12-20 13:30:20	2017-05-04 18:28:16
89	Pablo Dodero		CR					2016-12-20 13:32:58	2017-05-04 17:42:51
90	Oscar Zhunio	Kyooz8	EC					2016-12-20 16:53:19	2016-12-20 16:53:19
91	Pedro Avellaneda	Chano	EC					2016-12-20 16:55:16	2016-12-20 16:55:16
92	Aníbal Vásquez	D3*Anibal	EC		https://twitter.com/aniavasq			2016-12-20 17:17:17	2016-12-20 17:24:00
93	Guillermo Naranjo	Guillermo	EC					2016-12-20 17:22:40	2016-12-20 17:22:40
94	Nicole Jaramillo	Nico	EC					2016-12-20 17:23:11	2016-12-20 17:23:11
95	Daniel Pérez		CR					2016-12-20 17:41:01	2016-12-20 17:41:01
96	Maria Ávila	Pranksters	CR					2016-12-20 17:41:53	2017-05-04 17:42:05
97	Raúl Arias		CR					2016-12-20 18:06:04	2016-12-20 18:06:04
98	Jose Pablo Oviedo		CR					2016-12-20 18:06:19	2016-12-20 18:06:19
99	Adrian Araya	Pranksters	CR					2016-12-20 18:07:17	2017-05-04 17:40:17
100	René Alvarenga	RenéVGC	SV	https://www.facebook.com/renepokemon/?fref=ts		https://www.youtube.com/watch?v=tcLANFehLv0&feature=share		2016-12-20 18:10:56	2016-12-20 18:10:56
101	Matilda Petrasic	Braix	CL	https://www.facebook.com/matildapetrasic/				2016-12-21 03:17:22	2016-12-21 04:12:11
102	Emiliano Reyes	Clifford	CL					2016-12-21 03:20:31	2017-01-03 20:58:56
103	Benjamin Ghirardelli	Ghirardelli	CL					2016-12-21 03:33:08	2016-12-21 03:33:08
104	Joan Campaña	Joan	EC					2016-12-23 04:12:52	2016-12-23 04:12:52
105	Henry Rodriguez	Henry	EC					2016-12-23 04:13:09	2016-12-23 04:13:09
106	David Samanez	Dietrich	PE					2016-12-24 07:36:13	2016-12-24 07:36:13
107	Jean Paul Lopez		PE					2016-12-24 07:36:41	2016-12-24 07:36:41
108	León Ochoa		PE					2016-12-24 07:37:03	2016-12-24 07:37:03
109	Manuel Juarez		PE					2016-12-24 07:38:01	2016-12-24 07:38:10
110	Renzo Navarro		PE					2016-12-24 07:38:53	2016-12-24 07:38:53
111	Manuel Espíritu		PE					2016-12-24 07:44:40	2016-12-24 07:44:40
112	Ivan Ubilla	Ivan	EC					2017-01-08 03:41:58	2017-01-08 03:41:58
113	Esteban Almeida	Esteban	EC					2017-01-09 16:57:18	2017-01-09 16:57:18
114	Alexis Rosero	Alexis	EC					2017-01-09 16:57:29	2017-01-09 16:57:29
115	Carlos Brandt	BRANCHO	EC					2017-01-09 16:58:28	2017-01-09 16:58:28
116	Marcelo Muñoz		CL					2017-01-12 01:31:34	2017-01-12 01:31:34
117	Fernando Olave		CL					2017-01-12 01:32:05	2017-01-12 01:32:05
118	David Gaibor	David	EC					2017-01-15 07:04:10	2017-01-15 07:04:20
119	Jose Chilan	Geojoan	EC					2017-01-15 07:04:45	2017-01-28 22:47:05
120	Felipe Olivero	Phil	EC					2017-01-15 07:05:06	2017-01-15 07:05:15
121	Kelvin Quishpe	D3*Kelvin	EC					2017-01-15 07:06:22	2017-01-15 07:06:22
122	Danilo Nuñez	Dn	CL					2017-01-22 03:18:58	2017-01-22 03:18:58
123	Anibal Amaro		CL					2017-01-22 03:19:14	2017-01-22 03:19:14
124	Sebastián Huenuvil		CL					2017-01-24 02:26:38	2017-01-31 20:37:53
125	Francisco Trigo		CL					2017-01-24 02:34:54	2017-01-24 02:34:54
126	David Gutierrez		CL					2017-01-24 02:35:18	2017-01-24 02:35:18
127	Luis Pastenes		CL					2017-01-24 02:35:30	2017-01-24 02:35:30
128	Luis Araos		CL					2017-01-24 02:35:42	2017-01-24 02:35:42
129	Franco Fernandez		CL					2017-01-24 02:36:07	2017-01-24 02:36:07
130	Barbara Sasaki		CL					2017-01-24 02:36:20	2017-01-24 02:36:20
131	Yeneri Cortés		CL					2017-01-24 02:36:38	2017-01-24 02:36:38
132	Pamela Mardones		CL					2017-01-24 02:44:25	2017-01-24 02:44:25
133	Sebastián Reyes	Kings	CL					2017-01-24 02:44:45	2017-09-12 00:40:58
134	Paulo Miranda		CL					2017-01-24 02:45:08	2017-01-24 02:45:08
135	Roberto Najle		CL					2017-01-24 02:51:05	2017-01-24 02:51:05
136	Nelson Ocampo	Cranidactyl	MX					2017-01-31 19:25:00	2017-01-31 19:25:00
137	Daniel Salazar	Walavii	MX					2017-01-31 19:25:18	2017-01-31 19:25:18
138	Luis Canseco	Chaivon	MX					2017-01-31 19:25:43	2017-01-31 19:25:43
139	Adrián Hernández		MX					2017-01-31 19:26:12	2017-01-31 19:26:12
140	Aldo Loyola		MX					2017-01-31 19:26:23	2017-01-31 19:26:23
141	Erick Serrano		MX					2017-01-31 19:26:34	2017-01-31 19:26:34
142	Cesar Reyes		MX					2017-01-31 19:26:45	2017-01-31 19:26:45
143	Francisco Arroyo		MX					2017-01-31 19:27:01	2017-01-31 19:27:01
144	Luis Miguel Hernández	Luvier	MX					2017-01-31 19:39:24	2017-01-31 19:39:24
145	Dafne Jasso		MX					2017-01-31 19:39:38	2017-01-31 19:39:38
146	Rafael Ramirez	Rafax	MX					2017-01-31 19:39:52	2017-01-31 19:39:52
147	Israel Ramirez	Arkham	MX					2017-01-31 19:40:11	2017-01-31 19:40:11
148	Alejandro Rolon		MX					2017-01-31 19:40:21	2017-01-31 19:40:28
149	Eliezer Gómez		MX					2017-01-31 19:41:03	2017-01-31 19:41:03
150	Ernesto Cuahutencos		MX					2017-01-31 19:41:27	2017-01-31 19:41:27
151	Hiram Silva		MX					2017-01-31 19:41:39	2017-01-31 19:41:39
152	Sergio Scabbiolo		AR					2017-01-31 19:52:41	2017-01-31 19:52:41
153	Mariano Hernández		AR					2017-01-31 19:52:55	2017-01-31 19:52:55
154	Sebastián Escalante	SebasVGC	AR					2017-01-31 19:53:12	2017-02-15 21:51:46
155	Rodrigo Arispe		AR					2017-01-31 19:53:27	2017-01-31 19:53:27
156	Federico Andino	AndyVGC	AR					2017-01-31 19:53:37	2017-02-15 21:50:50
157	Daniel Fau		AR					2017-01-31 19:53:46	2017-01-31 19:53:46
158	Emilio Zabala		AR					2017-01-31 19:53:56	2017-01-31 19:53:56
159	Gonzalo De Marotte		AR					2017-01-31 19:54:09	2017-01-31 19:54:09
160	Federico Turano	Avatar Fede	AR					2017-01-31 20:15:44	2017-02-15 21:51:27
161	Fabrizzio Morandi		AR					2017-01-31 20:16:08	2017-01-31 20:16:08
162	Agustín De Cicco		AR					2017-01-31 20:16:34	2017-01-31 20:16:34
163	Alex Maidana		AR					2017-01-31 20:16:43	2017-01-31 20:16:43
164	Dann Valverde		AR					2017-01-31 20:16:59	2017-01-31 20:23:47
165	Pablo Cid		CL					2017-01-31 20:25:41	2017-01-31 20:25:41
166	Miguel Ángel Adofacci	TheFang	CL					2017-01-31 20:26:18	2017-01-31 20:26:18
167	Jose Luis Pando		PE					2017-02-01 14:31:57	2017-02-01 14:31:57
168	Eduardo Díaz		PE					2017-02-01 14:32:11	2017-02-01 14:32:11
169	John Franco Gamarra		PE					2017-02-01 14:32:43	2017-02-01 14:32:43
170	Dorian Andre Quiñonez		PE					2017-02-01 14:35:42	2017-02-01 14:35:42
171	Jorge Baca		PE					2017-02-01 15:00:40	2017-02-01 15:00:40
172	Diego Natividad	Mega Flygon	PE					2017-02-01 15:01:13	2017-02-01 15:01:13
173	Carlos Andrés Beingolea		PE					2017-02-01 15:01:44	2017-02-01 15:01:44
174	Carlos Ventura	CDZ	PE					2017-02-01 15:12:19	2017-02-01 15:16:59
175	Hanns Pizarro		PE					2017-02-01 15:12:39	2017-02-01 15:12:39
176	Manuel Rivera		PE					2017-02-01 15:12:56	2017-02-01 15:12:56
177	Julio Campos		PE					2017-02-01 15:13:18	2017-02-01 15:13:18
178	Sebastián Bisbal		PE					2017-02-01 18:01:11	2017-02-01 18:01:11
179	José Iparraguirre		PE					2017-02-01 18:01:29	2017-02-01 18:01:29
180	Macpierre Carbonero		PE					2017-02-01 18:01:48	2017-02-01 18:01:48
181	Arnaldo Alanya		PE					2017-02-01 18:02:22	2017-02-01 18:02:22
182	Roman Villanueva		PE					2017-02-01 18:02:35	2017-02-01 18:02:35
183	Leandro Azañedo		PE					2017-02-01 18:09:47	2017-02-01 18:09:47
184	José Espinoza		PE					2017-02-01 18:10:08	2017-02-01 18:10:08
185	Giorgio Falconí		PE					2017-02-01 18:18:43	2017-02-01 18:18:43
186	Diego Guevara		PE					2017-02-01 18:19:13	2017-02-01 18:19:13
187	Brando Medina		PE					2017-02-01 18:19:45	2017-02-01 18:19:45
188	Gonzalo Padilla		PE					2017-02-01 18:20:03	2017-02-01 18:20:03
190	Sebastian Rodríguez	Kommander	PE					2017-02-01 18:46:38	2017-02-01 18:46:38
191	Sebastian Chavarry		PE					2017-02-01 18:46:57	2017-02-01 18:46:57
192	Gino Maldonado		PE					2017-02-01 18:53:19	2017-02-01 18:53:19
193	Daniel Saenz		PE					2017-02-01 18:53:41	2017-02-01 18:53:41
194	Fabian Llanos		BO					2017-02-02 22:59:18	2017-02-02 22:59:25
195	Andres Camacho		BO					2017-02-02 22:59:44	2017-02-02 22:59:44
196	Sergio Medrano		BO					2017-02-02 23:00:01	2017-02-02 23:00:01
197	Ted Carrasco		BO					2017-02-02 23:00:17	2017-02-02 23:00:17
198	Giovanni Aranibar		BO					2017-02-02 23:00:34	2017-02-02 23:00:34
199	Andres Bolivar		BO					2017-02-02 23:00:50	2017-02-02 23:00:50
200	Joaquin Gavilano		BO					2017-02-02 23:01:06	2017-02-02 23:01:06
201	Ricardo Pantoja		BO					2017-02-02 23:01:23	2017-02-02 23:01:23
202	Guillermo Gumucio		BO					2017-02-02 23:11:20	2017-02-02 23:11:20
203	Jose Ignacio Pardo		BO					2017-02-02 23:11:48	2017-02-02 23:11:48
204	Alejandro Quinteros		BO					2017-02-02 23:12:56	2017-02-02 23:12:56
205	Jorge Orias		BO					2017-02-02 23:13:11	2017-02-02 23:13:11
206	Ronald Huanca		BO					2017-02-02 23:22:02	2017-02-02 23:22:02
207	Bruno Cuellar		BO					2017-02-02 23:28:49	2017-02-02 23:28:49
208	Samuel Sanchez		BO					2017-02-02 23:33:06	2017-02-02 23:33:06
209	Diego Herrera		BO					2017-02-02 23:37:13	2017-02-02 23:37:13
210	Pablo Sanabria	Tailmon	CL		https://twitter.com/pabloTailmon			2017-02-02 23:40:25	2017-02-02 23:40:53
211	Jasson Calderon		BO					2017-02-02 23:41:22	2017-02-02 23:41:22
212	Yamil Flores		BO					2017-02-02 23:41:37	2017-02-02 23:41:37
213	Oscar Antezana		BO					2017-02-02 23:41:52	2017-02-02 23:41:52
214	Limber Saavedra		BO					2017-02-02 23:42:17	2017-02-02 23:42:17
215	Diego Alexander Camacho Terrazas		BO					2017-02-02 23:42:37	2017-02-02 23:42:37
216	Joaquin Nogales		BO					2017-02-02 23:42:51	2017-02-02 23:42:51
217	Heinrich Garey		BO					2017-02-02 23:43:04	2017-02-02 23:43:04
218	Isabel Flor	Isabel	EC					2017-02-12 00:53:48	2017-02-12 00:53:48
219	Ezequiel Bustamante		AR					2017-02-15 21:52:20	2017-02-15 21:52:20
220	Manuel Brignole Feuer		AR					2017-02-15 21:52:48	2017-02-15 21:52:48
221	Franco De Cicco		AR					2017-02-15 21:53:15	2017-02-15 21:53:15
222	Nazareno Cruz		AR					2017-02-15 21:53:26	2017-02-15 21:53:26
223	Fernando Ferreira		AR					2017-02-15 21:53:41	2017-02-15 21:53:41
224	Brian Burgos		AR					2017-02-15 21:53:55	2017-02-15 21:53:55
225	Juan Pablo Naar	DonVGC	CO					2017-02-15 22:01:11	2017-02-15 22:01:11
226	Laura Prada	Lau-Lau	CO					2017-02-15 22:01:26	2017-02-15 22:01:26
227	Mauricio Arango		CO					2017-02-15 22:01:39	2017-02-15 22:01:39
228	Daniel Rojo		CO					2017-02-15 22:01:45	2017-02-15 22:01:45
229	Andrés Aristazabal		CO					2017-02-15 22:01:58	2017-02-27 04:26:27
230	Camilo Ezquivel	ShineVGC	CO					2017-02-15 22:02:08	2017-02-24 01:39:46
231	James Arango		CO					2017-02-15 22:02:18	2017-02-15 22:02:18
232	Tomás Arango		CO					2017-02-15 22:02:26	2017-02-15 22:02:26
233	Pedro Ramirez		PY					2017-02-15 22:10:11	2017-02-15 22:10:11
234	Alan Paez		PY					2017-02-15 22:10:20	2017-02-15 22:10:20
235	Steval Vali		PY					2017-02-15 22:10:59	2017-02-15 22:10:59
236	Hugo Notario		PY					2017-02-15 22:11:10	2017-02-15 22:11:10
237	Juan Pablo Martinez		PY					2017-02-15 22:11:22	2017-02-15 22:11:22
238	Victor Vargas		PY					2017-02-15 22:11:31	2017-02-15 22:11:31
239	David Chaparro		PY					2017-02-15 22:11:41	2017-02-15 22:11:41
240	Alberto Casco		PY					2017-02-15 22:11:53	2017-02-15 22:11:53
241	Gabriel Menegon		BR					2017-02-15 22:24:48	2017-02-15 22:24:48
242	Patrick Minoita		BR					2017-02-15 22:24:58	2017-02-15 22:24:58
243	André Luca		BR					2017-02-15 22:25:06	2017-02-15 22:25:06
244	Luiz Gustavo Valle		BR					2017-02-15 22:25:18	2017-02-15 22:25:18
245	Juan José Jimenez		CO					2017-02-15 22:29:13	2017-02-15 22:29:13
246	Manuel Pinzón		CO					2017-02-15 22:29:28	2017-02-15 22:29:28
247	Kevin Sarmiento		CO					2017-02-15 22:29:37	2017-02-15 22:29:37
248	Juan Manuel Rengifo		CO					2017-02-15 22:29:49	2017-02-15 22:29:49
249	Audy Lopez		CO					2017-02-15 22:30:00	2017-02-15 22:30:00
250	Jhonatan Ruiz		CO					2017-02-15 22:30:13	2017-02-15 22:30:13
251	Steven Ortiz		CO					2017-02-15 22:30:22	2017-02-15 22:30:22
252	Germán Cuchilla		SV					2017-02-15 22:38:11	2017-02-15 22:38:11
253	Frank Moreno		SV					2017-02-15 22:38:20	2017-02-15 22:38:20
254	José Gonzales		SV					2017-02-15 22:38:35	2017-02-15 22:38:35
255	Gustavo Ruballo		SV					2017-02-15 22:38:45	2017-02-15 22:38:45
256	Christian Eduardo		SV					2017-02-15 22:38:57	2017-02-15 22:38:57
257	Cesar Cubias		SV					2017-02-15 22:39:05	2017-02-15 22:39:05
258	Jonathan Sosa		SV					2017-02-15 22:39:14	2017-02-15 22:39:14
259	Alfredo Prada		CO					2017-02-15 22:48:29	2017-02-15 22:48:29
260	Adam Yaacob		CO					2017-02-15 22:48:41	2017-02-15 22:48:41
261	Jeffry Chaves		CO					2017-02-15 22:48:52	2017-02-15 22:48:52
262	Nicolás Granda		CO					2017-02-15 22:49:02	2017-02-15 22:49:02
263	Juan David Gomez		CO					2017-02-15 22:49:14	2017-02-15 22:49:14
264	Fredy Vanegas		CO					2017-02-15 22:49:23	2017-04-10 19:19:08
265	Nicolás Chavez		CO					2017-02-15 22:49:31	2017-02-15 22:49:31
266	Matias Laino		AR					2017-02-24 01:23:12	2017-02-24 01:24:18
267	Lautaro Guinez		AR					2017-02-24 01:25:00	2017-02-24 01:25:00
268	Gonzalo Bush		AR					2017-02-24 01:25:30	2017-02-24 01:25:30
269	Nicolás Quiñenao		AR					2017-02-24 01:25:49	2017-02-24 01:25:49
270	Diego Llanes	SeeD	CO					2017-02-24 01:37:33	2017-02-24 01:37:33
271	Andrés Quintero		CO					2017-02-24 01:37:56	2017-02-24 01:37:56
272	Andrés Campos	Camuc	CO					2017-02-24 01:38:19	2017-02-24 01:38:19
273	David Davila	cormyrean	CO					2017-02-24 01:38:42	2017-02-24 01:38:42
274	Juan Pablo Alzate	Yakzara	CO					2017-02-24 01:39:29	2017-02-24 01:39:29
275	Kevin Munizaga	Arconte	CL					2017-02-24 01:47:55	2017-02-24 01:47:55
276	Fabián Vergara		CL					2017-02-24 01:56:20	2017-02-24 01:56:20
277	Eric Arenas		CL					2017-02-24 01:56:38	2017-02-24 01:56:38
278	Beatriz Olea	Bea	CL					2017-02-24 01:56:57	2017-02-24 01:56:57
279	Diego Ovando		CL					2017-02-24 01:57:12	2017-02-24 01:57:12
280	Matías Díaz	Cook Monster	CL					2017-02-24 02:03:33	2017-02-24 02:03:33
281	Roberto Arancibia		CL					2017-02-24 02:03:50	2017-02-24 02:03:50
282	Lissa Aguirre	Raven♪	EC					2017-02-25 17:29:51	2017-02-25 17:29:51
283	Cristian La Mota	CRIS	EC					2017-02-25 17:31:51	2017-02-25 17:31:51
284	Santiago Uribe		CO					2017-02-27 04:23:12	2017-02-27 04:23:12
285	Alejandro Rivera		CO					2017-02-27 04:23:36	2017-02-27 04:23:36
286	Sebastián Velez		CO					2017-02-27 04:23:57	2017-02-27 04:23:57
287	Jorge Ramos		CL					2017-02-27 04:33:06	2017-02-27 04:33:06
288	Kyara Zepeda		CL					2017-02-27 04:33:42	2017-02-27 04:33:42
289	Iván Inostroza		CL					2017-02-27 04:34:21	2017-02-27 04:34:21
290	Pablo Gómez	Vyse	CL					2017-03-01 02:07:55	2017-03-01 02:07:55
291	Jorge Tapia	Makise	CL					2017-03-01 02:08:06	2017-03-01 02:08:06
292	Samuel Rojas		CL					2017-03-07 19:44:46	2017-03-07 19:44:46
293	Joaquín Reyes		CL					2017-03-07 19:50:22	2017-03-07 19:50:22
294	William Villar		PE					2017-03-07 20:07:04	2017-03-07 20:07:04
295	José Cruz		CO					2017-03-07 20:29:18	2017-03-07 20:29:18
296	Juan Ruiz		CO					2017-03-07 20:30:10	2017-03-07 20:30:10
297	Cristian Andre		CO					2017-03-07 20:30:20	2017-03-07 20:30:20
298	Christian Jaramillo		CO					2017-03-07 20:30:40	2017-03-07 20:30:40
299	Sergio Barreto		CO					2017-03-07 20:31:02	2017-03-07 20:31:02
301	Jackson Baque	Jackson	EC					2017-03-12 18:13:59	2017-03-12 18:13:59
302	Jhon Vargas	Jhxn	EC					2017-03-12 18:17:33	2017-03-12 18:17:33
303	David Bustos		CL					2017-03-15 17:08:01	2017-03-15 17:08:01
304	Pablo Parra		CL					2017-03-15 17:08:07	2017-03-15 17:08:07
305	Jorge Luis Coria		AR					2017-03-22 21:17:05	2017-03-22 21:17:05
306	Pablo Henríquez		CL					2017-03-25 21:15:40	2017-03-25 21:15:40
307	Sebastián Palavaccino		CL					2017-03-25 22:24:14	2017-03-25 22:24:14
308	Cristian Rojas		CL					2017-03-25 22:32:13	2017-03-25 22:32:13
309	Luis Cofré		CL					2017-03-25 22:39:02	2017-03-25 22:39:02
310	Pablo Arenas		CL					2017-03-25 22:39:20	2017-03-25 22:39:20
311	Lucas Inostroza		CL					2017-03-25 22:39:40	2017-03-25 22:39:40
312	Christian Andrade de Novae		BR					2017-03-30 01:40:16	2017-03-30 01:40:16
313	André Fumis		BR					2017-03-30 01:40:26	2017-03-30 01:40:26
314	Andrea Guardia		PE					2017-04-04 18:05:18	2017-04-04 18:05:30
315	Tomás Orellana	SitrusVGC	CL					2017-04-10 03:17:01	2017-04-10 03:17:01
316	Arnaldo Maidana	AndroidVGC	PY					2017-04-10 19:14:27	2017-04-10 19:14:27
317	Anahi Vicente		PY					2017-04-10 19:15:09	2017-04-10 19:15:09
318	Eduardo Jaramillo		CO					2017-04-10 19:19:43	2017-04-10 19:19:43
319	Guido Michelis		AR					2017-04-11 17:11:28	2017-04-11 17:11:28
320	Francisco Lagomarsino		AR					2017-04-11 17:12:44	2017-04-11 17:12:44
321	Roberto Oyola	LINK	EC					2017-04-15 23:22:33	2017-04-15 23:22:33
322	Pedro Iñiguez	Pedro	EC					2017-04-15 23:22:56	2017-04-15 23:22:56
323	Alexandre Savona	NimboEC	EC					2017-04-16 01:25:45	2017-04-16 01:25:45
324	David Arruelas 	David	EC					2017-04-16 01:25:57	2017-04-16 01:25:57
325	Fernando Angamarca	Geovanny	EC					2017-04-16 01:26:16	2017-04-16 01:26:16
326	Daniel Muñoz	Lito	CL					2017-04-16 03:58:19	2017-04-16 03:58:19
327	Yara Prades	Kuroi	CL					2017-04-22 23:18:37	2017-04-22 23:18:37
328	Ignacio Villar	Ketzer	CL					2017-04-22 23:20:00	2017-04-22 23:20:00
329	Rafael Gajardo	El Sueño	CL					2017-04-22 23:21:09	2017-04-22 23:21:09
330	Misael Abad	Riruka	EC					2017-04-30 03:50:12	2017-04-30 05:03:07
331	Alonso Sevilla	Team Heredia	CR					2017-05-04 17:08:29	2017-05-04 17:08:29
332	Giovanni Benavides	Team Heredia	CR					2017-05-04 17:48:00	2017-05-04 17:48:00
333	Alexis Boza	Harden Knights	CR					2017-05-04 17:54:09	2017-05-04 17:54:09
334	Mauro Solis		CR					2017-05-04 18:27:54	2017-05-04 18:27:54
335	Karla Corrales	Team Dark Lugia	CR					2017-05-04 18:28:43	2017-05-04 18:28:43
336	Christopher Solis 	Team Heredia	CR					2017-05-04 19:53:02	2017-05-04 19:53:02
337	Joan Jiménez	SSQ	CR					2017-05-04 19:53:54	2017-05-04 19:53:54
338	Enio Fonseca	Team Heredia	CR					2017-05-04 20:04:18	2017-05-04 20:04:18
339	Carmelo Dcesare	Krmul	EC					2017-05-07 02:49:53	2017-05-07 02:49:53
340	Efrain Suarez	Efrain	EC					2017-05-07 02:50:11	2017-05-07 02:50:11
341	Daniel Romero		CL					2017-05-11 20:47:59	2017-05-11 20:47:59
342	Brian Figueroa		CL					2017-05-11 20:52:45	2017-05-11 20:52:45
343	Constanza Sepúlveda		CL					2017-05-11 20:55:45	2017-05-11 20:55:45
344	Alejandro Pérez		CL					2017-05-11 20:56:05	2017-05-11 20:56:33
345	Blass Muena		CL					2017-05-11 20:56:21	2017-05-11 20:56:21
346	Robinson Ávila		CL					2017-05-11 21:07:13	2017-05-11 21:07:13
347	Fabián Barria		CL					2017-05-11 21:12:01	2017-05-11 21:12:01
348	Sebastián Sanhueza		CL					2017-05-11 21:12:26	2017-05-11 21:12:26
349	Vicente Guzmán		CL					2017-05-11 21:13:03	2017-05-11 21:13:03
350	Felipe Rojas		CL					2017-05-11 21:13:27	2017-05-11 21:13:27
351	Felipe Casas		CL					2017-05-11 21:13:51	2017-05-11 21:13:51
352	Ian Behrendt		CL					2017-05-11 21:14:11	2017-05-11 21:14:11
353	Felipe Coronado		CL					2017-05-11 21:14:20	2017-05-11 21:14:20
354	Matías Cariceo		CL					2017-05-11 21:23:16	2017-05-11 21:23:16
355	Manuel Del Campo		CL					2017-05-11 21:27:34	2017-05-11 21:27:34
356	Milton Arriagada		CL					2017-05-11 21:27:52	2017-05-11 21:27:52
357	Alexis Albarracin	El Rosca	EC					2017-05-16 00:10:07	2017-05-16 00:10:07
358	Camilo Rosales	Aisaka	CL					2017-05-22 23:18:55	2017-05-22 23:18:55
359	Sebastián Sepúlveda		CL					2017-05-22 23:19:33	2017-05-22 23:19:33
360	Juan Pino		CL					2017-05-23 18:16:22	2017-05-23 18:16:22
361	Javier Ramírez		CL					2017-05-23 18:18:50	2017-05-23 18:18:50
362	Daniel Segovia		CL					2017-05-23 18:18:56	2017-05-23 18:18:56
363	Julio Fuentes		GT					2017-05-25 00:07:12	2017-05-25 00:07:12
364	Renato Arellano		GT					2017-05-25 00:07:25	2017-05-25 00:07:25
365	Carlos Ruano		SV					2017-05-25 00:07:52	2017-05-25 00:07:52
366	Jonathan Villalta		SV					2017-05-25 00:08:37	2017-05-25 00:08:37
367	Alexis Rosero	Alex	EC					2017-05-31 23:41:37	2017-05-31 23:41:37
368	Ian Guerra		CL					2017-06-01 01:02:33	2017-06-01 01:02:33
369	Jose Miguel Alvarez		BO					2017-06-05 22:14:20	2017-06-05 22:14:20
370	Alejandro Medina		CL					2017-07-12 01:48:41	2017-07-12 01:48:41
371	Martín Muñoz		CL					2017-07-12 02:40:03	2017-07-12 02:40:03
372	Bastián Tapia		CL					2017-07-13 04:34:22	2017-07-13 04:34:22
373	Eric Cardenas	Eric	EC					2017-09-03 01:07:00	2017-09-03 01:07:00
374	Ricardo Tapia	Ruben	EC					2017-09-03 01:17:47	2017-09-03 01:17:47
375	Kevin Ortiz	Kevin	EC					2017-09-03 01:19:49	2017-09-03 01:19:49
376	Pablo Supanta		CL					2017-09-10 16:18:24	2017-09-10 16:18:24
377	Boris Paredes		CL					2017-09-10 19:06:27	2017-09-10 19:06:27
378	Juan Pablo Muñoz		CL					2017-09-11 02:15:17	2017-09-11 02:15:17
379	Marco Pavez		CL					2017-09-11 02:15:37	2017-09-11 02:15:37
380	Esteban Vásquez	Sho	CL					2017-09-12 00:32:26	2017-09-12 00:32:26
381	Ricardo Torrijos		CL					2017-09-12 00:32:43	2017-09-12 00:32:43
382	Bryan Suarez		EC					2017-09-16 22:57:00	2017-09-16 22:57:00
383	Luis Lerque	Luis	EC					2017-09-18 16:23:45	2017-09-18 16:23:45
384	Adrian Rincon	Adryest	EC					2017-09-18 16:23:58	2017-09-18 16:23:58
385	Camila Ibarra		CL					2017-09-19 01:38:40	2017-09-19 01:38:40
386	Benjamin Sanso		CL					2017-09-19 01:39:00	2017-09-19 01:39:00
\.


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cano
--

SELECT pg_catalog.setval('players_id_seq', 1, false);


--
-- Data for Name: pokemon_species_names; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY pokemon_species_names (pokemon_species_id, local_language_id, name, genus) FROM stdin;
722	9	Rotom-wash	Plasma
1	7	Bulbasaur	Semilla
723	9	Rotom-heat	Plasma
1	9	Bulbasaur	Seed
725	9	Rotom-fan	Plasma
726	9	Rotom-frost	Plasma
2	7	Ivysaur	Semilla
2	9	Ivysaur	Seed
3	7	Venusaur	Semilla
3	9	Venusaur	Seed
4	7	Charmander	Lagartija
4	9	Charmander	Lizard
5	7	Charmeleon	Llama
5	9	Charmeleon	Flame
6	7	Charizard	Llama
6	9	Charizard	Flame
7	7	Squirtle	Tortuguita
7	9	Squirtle	Tiny Turtle
8	7	Wartortle	Tortuga
8	9	Wartortle	Turtle
9	7	Blastoise	Marisco
9	9	Blastoise	Shellfish
10	7	Caterpie	Gusano
10	9	Caterpie	Worm
11	7	Metapod	Capullo
11	9	Metapod	Cocoon
12	7	Butterfree	Mariposa
12	9	Butterfree	Butterfly
13	7	Weedle	Oruga
13	9	Weedle	Hairy Bug
14	7	Kakuna	Capullo
14	9	Kakuna	Cocoon
15	7	Beedrill	Abeja Ven.
15	9	Beedrill	Poison Bee
16	7	Pidgey	Pajarito
16	9	Pidgey	Tiny Bird
724	9	Rotom-mow	Plasma
17	7	Pidgeotto	Pájaro
17	9	Pidgeotto	Bird
18	7	Pidgeot	Pájaro
18	9	Pidgeot	Bird
19	7	Rattata	Ratón
19	9	Rattata	Mouse
20	7	Raticate	Ratón
20	9	Raticate	Mouse
21	7	Spearow	Pajarito
21	9	Spearow	Tiny Bird
22	7	Fearow	Pico
22	9	Fearow	Beak
23	7	Ekans	Serpiente
23	9	Ekans	Snake
24	7	Arbok	Cobra
24	9	Arbok	Cobra
25	7	Pikachu	Ratón
25	9	Pikachu	Mouse
26	7	Raichu	Ratón
26	9	Raichu	Mouse
27	7	Sandshrew	Ratón
27	9	Sandshrew	Mouse
28	7	Sandslash	Ratón
28	9	Sandslash	Mouse
29	7	Nidoran♀	Pin Veneno
29	9	Nidoran♀	Poison Pin
30	7	Nidorina	Pin Veneno
30	9	Nidorina	Poison Pin
31	7	Nidoqueen	Taladro
31	9	Nidoqueen	Drill
32	7	Nidoran♂	Pin Veneno
32	9	Nidoran♂	Poison Pin
33	7	Nidorino	Pin Veneno
33	9	Nidorino	Poison Pin
34	7	Nidoking	Taladro
34	9	Nidoking	Drill
35	7	Clefairy	Hada
35	9	Clefairy	Fairy
36	7	Clefable	Hada
36	9	Clefable	Fairy
37	7	Vulpix	Zorro
37	9	Vulpix	Fox
38	7	Ninetales	Zorro
38	9	Ninetales	Fox
39	7	Jigglypuff	Globo
39	9	Jigglypuff	Balloon
40	7	Wigglytuff	Globo
40	9	Wigglytuff	Balloon
41	7	Zubat	Murciélago
41	9	Zubat	Bat
42	7	Golbat	Murciélago
42	9	Golbat	Bat
43	7	Oddish	Hierbajo
43	9	Oddish	Weed
44	7	Gloom	Hierbajo
44	9	Gloom	Weed
45	7	Vileplume	Flor
45	9	Vileplume	Flower
46	7	Paras	Hongo
46	9	Paras	Mushroom
47	7	Parasect	Hongo
47	9	Parasect	Mushroom
48	7	Venonat	Insecto
48	9	Venonat	Insect
49	7	Venomoth	Polilla Ven.
49	9	Venomoth	Poison Moth
50	7	Diglett	Topo
50	9	Diglett	Mole
51	7	Dugtrio	Topo
51	9	Dugtrio	Mole
52	7	Meowth	Gato Araña
52	9	Meowth	Scratch Cat
53	7	Persian	Gato Fino
53	9	Persian	Classy Cat
54	7	Psyduck	Pato
54	9	Psyduck	Duck
55	7	Golduck	Pato
55	9	Golduck	Duck
56	7	Mankey	Mono Cerdo
56	9	Mankey	Pig Monkey
57	7	Primeape	Mono Cerdo
57	9	Primeape	Pig Monkey
58	7	Growlithe	Perrito
58	9	Growlithe	Puppy
59	7	Arcanine	Legendario
59	9	Arcanine	Legendary
60	7	Poliwag	Renacuajo
60	9	Poliwag	Tadpole
61	7	Poliwhirl	Renacuajo
61	9	Poliwhirl	Tadpole
62	7	Poliwrath	Renacuajo
62	9	Poliwrath	Tadpole
63	7	Abra	Psi
63	9	Abra	Psi
64	7	Kadabra	Psi
64	9	Kadabra	Psi
65	7	Alakazam	Psi
65	9	Alakazam	Psi
66	7	Machop	Superpoder
66	9	Machop	Superpower
67	7	Machoke	Superpoder
67	9	Machoke	Superpower
68	7	Machamp	Superpoder
68	9	Machamp	Superpower
69	7	Bellsprout	Flor
69	9	Bellsprout	Flower
70	7	Weepinbell	Matamoscas
70	9	Weepinbell	Flycatcher
71	7	Victreebel	Matamoscas
71	9	Victreebel	Flycatcher
72	7	Tentacool	Medusa
72	9	Tentacool	Jellyfish
73	7	Tentacruel	Medusa
73	9	Tentacruel	Jellyfish
74	7	Geodude	Roca
74	9	Geodude	Rock
75	7	Graveler	Roca
75	9	Graveler	Rock
76	7	Golem	Megatón
76	9	Golem	Megaton
77	7	Ponyta	Caballo F.
77	9	Ponyta	Fire Horse
78	7	Rapidash	Caballo F.
78	9	Rapidash	Fire Horse
79	7	Slowpoke	Atontado
79	9	Slowpoke	Dopey
80	7	Slowbro	Ermitaño
80	9	Slowbro	Hermit Crab
81	7	Magnemite	Imán
81	9	Magnemite	Magnet
82	7	Magneton	Imán
82	9	Magneton	Magnet
83	7	Farfetch'd	Pato Salvaje
83	9	Farfetch'd	Wild Duck
84	7	Doduo	Ave Gemela
84	9	Doduo	Twin Bird
85	7	Dodrio	Ave Triple
85	9	Dodrio	Triple Bird
86	7	Seel	León Marino
86	9	Seel	Sea Lion
87	7	Dewgong	León Marino
87	9	Dewgong	Sea Lion
88	7	Grimer	Lodo
88	9	Grimer	Sludge
89	7	Muk	Lodo
89	9	Muk	Sludge
90	7	Shellder	Bivalvo
90	9	Shellder	Bivalve
91	7	Cloyster	Bivalvo
91	9	Cloyster	Bivalve
92	7	Gastly	Gas
92	9	Gastly	Gas
93	7	Haunter	Gas
93	9	Haunter	Gas
94	7	Gengar	Sombra
94	9	Gengar	Shadow
95	7	Onix	Serp. Roca
95	9	Onix	Rock Snake
96	7	Drowzee	Hipnosis
96	9	Drowzee	Hypnosis
97	7	Hypno	Hipnosis
97	9	Hypno	Hypnosis
98	7	Krabby	Cangrejo
98	9	Krabby	River Crab
99	7	Kingler	Tenaza
99	9	Kingler	Pincer
100	7	Voltorb	Bola
100	9	Voltorb	Ball
101	7	Electrode	Bola
101	9	Electrode	Ball
102	7	Exeggcute	Huevo
102	9	Exeggcute	Egg
103	7	Exeggutor	Coco
103	9	Exeggutor	Coconut
104	7	Cubone	Solitario
104	9	Cubone	Lonely
105	7	Marowak	Apilahueso
105	9	Marowak	Bone Keeper
106	7	Hitmonlee	Patada
106	9	Hitmonlee	Kicking
107	7	Hitmonchan	Puñetazo
107	9	Hitmonchan	Punching
108	7	Lickitung	Lametazo
108	9	Lickitung	Licking
109	7	Koffing	Gas Venenoso
109	9	Koffing	Poison Gas
110	7	Weezing	Gas Venenoso
110	9	Weezing	Poison Gas
111	7	Rhyhorn	Clavos
111	9	Rhyhorn	Spikes
112	7	Rhydon	Taladro
112	9	Rhydon	Drill
113	7	Chansey	Huevo
113	9	Chansey	Egg
114	7	Tangela	Enredadera
114	9	Tangela	Vine
115	7	Kangaskhan	Padres
115	9	Kangaskhan	Parent
116	7	Horsea	Dragón
116	9	Horsea	Dragon
117	7	Seadra	Dragón
117	9	Seadra	Dragon
118	7	Goldeen	Pez Color
118	9	Goldeen	Goldfish
119	7	Seaking	Pez Color
119	9	Seaking	Goldfish
120	7	Staryu	Estrellada
120	9	Staryu	Star Shape
121	7	Starmie	Misterioso
121	9	Starmie	Mysterious
122	7	Mr. Mime	Barrera
122	9	Mr. Mime	Barrier
123	7	Scyther	Mantis
123	9	Scyther	Mantis
124	7	Jynx	Forma Humana
124	9	Jynx	Human Shape
125	7	Electabuzz	Eléctrico
125	9	Electabuzz	Electric
126	7	Magmar	Escupefuego
126	9	Magmar	Spitfire
127	7	Pinsir	Escarabajo
127	9	Pinsir	Stag Beetle
128	7	Tauros	Toro Bravo
128	9	Tauros	Wild Bull
129	7	Magikarp	Pez
129	9	Magikarp	Fish
130	7	Gyarados	Atrocidad
130	9	Gyarados	Atrocious
131	7	Lapras	Transporte
131	9	Lapras	Transport
132	7	Ditto	Transform.
132	9	Ditto	Transform
133	7	Eevee	Evolución
133	9	Eevee	Evolution
134	7	Vaporeon	Burbuja
134	9	Vaporeon	Bubble Jet
135	7	Jolteon	Relámpago
135	9	Jolteon	Lightning
136	7	Flareon	Llama
136	9	Flareon	Flame
137	7	Porygon	Virtual
137	9	Porygon	Virtual
138	7	Omanyte	Espiral
138	9	Omanyte	Spiral
139	7	Omastar	Espiral
139	9	Omastar	Spiral
140	7	Kabuto	Marisco
140	9	Kabuto	Shellfish
141	7	Kabutops	Marisco
141	9	Kabutops	Shellfish
142	7	Aerodactyl	Fósil
142	9	Aerodactyl	Fossil
143	7	Snorlax	Dormir
143	9	Snorlax	Sleeping
144	7	Articuno	Congelar
144	9	Articuno	Freeze
145	7	Zapdos	Eléctrico
145	9	Zapdos	Electric
146	7	Moltres	Llama
146	9	Moltres	Flame
147	7	Dratini	Dragón
147	9	Dratini	Dragon
148	7	Dragonair	Dragón
148	9	Dragonair	Dragon
149	7	Dragonite	Dragón
149	9	Dragonite	Dragon
150	7	Mewtwo	Genético
150	9	Mewtwo	Genetic
151	7	Mew	N. Especie
151	9	Mew	New Species
152	7	Chikorita	Hoja
152	9	Chikorita	Leaf
153	7	Bayleef	Hoja
153	9	Bayleef	Leaf
154	7	Meganium	Hierba
154	9	Meganium	Herb
155	7	Cyndaquil	Ratón Fuego
155	9	Cyndaquil	Fire Mouse
156	7	Quilava	Volcán
156	9	Quilava	Volcano
157	7	Typhlosion	Volcán
157	9	Typhlosion	Volcano
158	7	Totodile	Fauces
158	9	Totodile	Big Jaw
159	7	Croconaw	Fauces
159	9	Croconaw	Big Jaw
160	7	Feraligatr	Fauces
160	9	Feraligatr	Big Jaw
161	7	Sentret	Explorador
161	9	Sentret	Scout
162	7	Furret	Alargado
162	9	Furret	Long Body
163	7	Hoothoot	Búho
163	9	Hoothoot	Owl
164	7	Noctowl	Búho
164	9	Noctowl	Owl
165	7	Ledyba	5 Estrellas
165	9	Ledyba	Five Star
166	7	Ledian	5 Estrellas
166	9	Ledian	Five Star
167	7	Spinarak	Escupesoga
167	9	Spinarak	String Spit
168	7	Ariados	Pata Larga
168	9	Ariados	Long Leg
169	7	Crobat	Murciélago
169	9	Crobat	Bat
170	7	Chinchou	Rape
170	9	Chinchou	Angler
171	7	Lanturn	Luz
171	9	Lanturn	Light
172	7	Pichu	Ratoncito
172	9	Pichu	Tiny Mouse
173	7	Cleffa	Estrellada
173	9	Cleffa	Star Shape
174	7	Igglybuff	Globo
174	9	Igglybuff	Balloon
175	7	Togepi	Bolaclavos
175	9	Togepi	Spike Ball
176	7	Togetic	Felicidad
176	9	Togetic	Happiness
177	7	Natu	Pajarito
177	9	Natu	Tiny Bird
178	7	Xatu	Místico
178	9	Xatu	Mystic
179	7	Mareep	Lana
179	9	Mareep	Wool
180	7	Flaaffy	Lana
180	9	Flaaffy	Wool
181	7	Ampharos	Luz
181	9	Ampharos	Light
182	7	Bellossom	Flor
182	9	Bellossom	Flower
183	7	Marill	Ratón Agua
183	9	Marill	Aqua Mouse
184	7	Azumarill	Conejo Agua
184	9	Azumarill	Aqua Rabbit
185	7	Sudowoodo	Imitación
185	9	Sudowoodo	Imitation
186	7	Politoed	Rana
186	9	Politoed	Frog
187	7	Hoppip	Algadón
187	9	Hoppip	Cottonweed
188	7	Skiploom	Algadón
188	9	Skiploom	Cottonweed
189	7	Jumpluff	Algadón
189	9	Jumpluff	Cottonweed
190	7	Aipom	Cola Larga
190	9	Aipom	Long Tail
191	7	Sunkern	Semilla
191	9	Sunkern	Seed
192	7	Sunflora	Sol
192	9	Sunflora	Sun
193	7	Yanma	Ala Clara
193	9	Yanma	Clear Wing
194	7	Wooper	Pez Agua
194	9	Wooper	Water Fish
195	7	Quagsire	Pez Agua
195	9	Quagsire	Water Fish
196	7	Espeon	Sol
196	9	Espeon	Sun
197	7	Umbreon	Luz Lunar
197	9	Umbreon	Moonlight
198	7	Murkrow	Oscuridad
198	9	Murkrow	Darkness
199	7	Slowking	Regio
199	9	Slowking	Royal
200	7	Misdreavus	Chirrido
200	9	Misdreavus	Screech
201	7	Unown	Símbolo
201	9	Unown	Symbol
202	7	Wobbuffet	Paciente
202	9	Wobbuffet	Patient
203	7	Girafarig	Gran Cuello
203	9	Girafarig	Long Neck
204	7	Pineco	Larva
204	9	Pineco	Bagworm
205	7	Forretress	Larva
205	9	Forretress	Bagworm
206	7	Dunsparce	Serptierra
206	9	Dunsparce	Land Snake
207	7	Gligar	Escorpiala
207	9	Gligar	Fly Scorpion
208	7	Steelix	Serpférrea
208	9	Steelix	Iron Snake
209	7	Snubbull	Hada
209	9	Snubbull	Fairy
210	7	Granbull	Hada
210	9	Granbull	Fairy
211	7	Qwilfish	Globo
211	9	Qwilfish	Balloon
212	7	Scizor	Tenaza
212	9	Scizor	Pincer
213	7	Shuckle	Moho
213	9	Shuckle	Mold
214	7	Heracross	Unicornio
214	9	Heracross	Single Horn
215	7	Sneasel	Garra Filo
215	9	Sneasel	Sharp Claw
216	7	Teddiursa	Osito
216	9	Teddiursa	Little Bear
217	7	Ursaring	Hibernante
217	9	Ursaring	Hibernator
218	7	Slugma	Lava
218	9	Slugma	Lava
219	7	Magcargo	Lava
219	9	Magcargo	Lava
220	7	Swinub	Cerdo
220	9	Swinub	Pig
221	7	Piloswine	Puerco
221	9	Piloswine	Swine
222	7	Corsola	Coral
222	9	Corsola	Coral
223	7	Remoraid	Reactor
223	9	Remoraid	Jet
224	7	Octillery	Reactor
224	9	Octillery	Jet
225	7	Delibird	Reparto
225	9	Delibird	Delivery
226	7	Mantine	Milano
226	9	Mantine	Kite
227	7	Skarmory	Coraza Ave
227	9	Skarmory	Armor Bird
228	7	Houndour	Siniestro
228	9	Houndour	Dark
229	7	Houndoom	Siniestro
229	9	Houndoom	Dark
230	7	Kingdra	Dragón
230	9	Kingdra	Dragon
231	7	Phanpy	Narizotas
231	9	Phanpy	Long Nose
232	7	Donphan	Coraza
232	9	Donphan	Armor
233	7	Porygon2	Virtual
233	9	Porygon2	Virtual
234	7	Stantler	Gran Cuerno
234	9	Stantler	Big Horn
235	7	Smeargle	Pintor
235	9	Smeargle	Painter
236	7	Tyrogue	Peleón
236	9	Tyrogue	Scuffle
237	7	Hitmontop	Boca Abajo
237	9	Hitmontop	Handstand
238	7	Smoochum	Beso
238	9	Smoochum	Kiss
239	7	Elekid	Eléctrico
239	9	Elekid	Electric
240	7	Magby	Ascuas
240	9	Magby	Live Coal
241	7	Miltank	Lechera
241	9	Miltank	Milk Cow
242	7	Blissey	Felicidad
242	9	Blissey	Happiness
243	7	Raikou	Trueno
243	9	Raikou	Thunder
244	7	Entei	Volcán
244	9	Entei	Volcano
245	7	Suicune	Aurora
245	9	Suicune	Aurora
246	7	Larvitar	Piel Roca
246	9	Larvitar	Rock Skin
247	7	Pupitar	Caparazón
247	9	Pupitar	Hard Shell
248	7	Tyranitar	Coraza
248	9	Tyranitar	Armor
249	7	Lugia	Buceo
249	9	Lugia	Diving
250	7	Ho-Oh	Arcoíris
250	9	Ho-Oh	Rainbow
251	7	Celebi	Viajetiempo
251	9	Celebi	Time Travel
252	7	Treecko	Geco Bosque
252	9	Treecko	Wood Gecko
253	7	Grovyle	Geco Bosque
253	9	Grovyle	Wood Gecko
254	7	Sceptile	Monte
254	9	Sceptile	Forest
255	7	Torchic	Polluelo
255	9	Torchic	Chick
256	7	Combusken	Ave Corral
256	9	Combusken	Young Fowl
257	7	Blaziken	Llameante
257	9	Blaziken	Blaze
258	7	Mudkip	Pez Lodo
258	9	Mudkip	Mud Fish
259	7	Marshtomp	Pez Lodo
259	9	Marshtomp	Mud Fish
260	7	Swampert	Pez Lodo
260	9	Swampert	Mud Fish
261	7	Poochyena	Mordisco
261	9	Poochyena	Bite
262	7	Mightyena	Mordisco
262	9	Mightyena	Bite
263	7	Zigzagoon	Mapachito
263	9	Zigzagoon	Tiny Raccoon
264	7	Linoone	Lanzado
264	9	Linoone	Rushing
265	7	Wurmple	Gusano
265	9	Wurmple	Worm
266	7	Silcoon	Capullo
266	9	Silcoon	Cocoon
267	7	Beautifly	Mariposa
267	9	Beautifly	Butterfly
268	7	Cascoon	Capullo
268	9	Cascoon	Cocoon
269	7	Dustox	Polilla Ven.
269	9	Dustox	Poison Moth
270	7	Lotad	Alga
270	9	Lotad	Water Weed
271	7	Lombre	Alegre
271	9	Lombre	Jolly
272	7	Ludicolo	Optimista
272	9	Ludicolo	Carefree
273	7	Seedot	Bellota
273	9	Seedot	Acorn
274	7	Nuzleaf	Astuto
274	9	Nuzleaf	Wily
275	7	Shiftry	Malvado
275	9	Shiftry	Wicked
276	7	Taillow	Pequebuche
276	9	Taillow	Tiny Swallow
277	7	Swellow	Buche
277	9	Swellow	Swallow
278	7	Wingull	Gaviota
278	9	Wingull	Seagull
279	7	Pelipper	Ave Agua
279	9	Pelipper	Water Bird
280	7	Ralts	Sensible
280	9	Ralts	Feeling
281	7	Kirlia	Sensorio
281	9	Kirlia	Emotion
282	7	Gardevoir	Envolvente
282	9	Gardevoir	Embrace
283	7	Surskit	Zapatero
283	9	Surskit	Pond Skater
284	7	Masquerain	Globocular
284	9	Masquerain	Eyeball
285	7	Shroomish	Hongo
285	9	Shroomish	Mushroom
286	7	Breloom	Hongo
286	9	Breloom	Mushroom
287	7	Slakoth	Gandul
287	9	Slakoth	Slacker
288	7	Vigoroth	Mono Feroz
288	9	Vigoroth	Wild Monkey
289	7	Slaking	Holgazán
289	9	Slaking	Lazy
290	7	Nincada	Aprendiz
290	9	Nincada	Trainee
291	7	Ninjask	Ninja
291	9	Ninjask	Ninja
292	7	Shedinja	Muda
292	9	Shedinja	Shed
293	7	Whismur	Susurro
293	9	Whismur	Whisper
294	7	Loudred	Chillón
294	9	Loudred	Big Voice
295	7	Exploud	Escandaloso
295	9	Exploud	Loud Noise
296	7	Makuhita	Valiente
296	9	Makuhita	Guts
297	7	Hariyama	Empuje
297	9	Hariyama	Arm Thrust
298	7	Azurill	A Topos
298	9	Azurill	Polka Dot
299	7	Nosepass	Brújula
299	9	Nosepass	Compass
300	7	Skitty	Gatito
300	9	Skitty	Kitten
301	7	Delcatty	Cursi
301	9	Delcatty	Prim
302	7	Sableye	Oscuridad
302	9	Sableye	Darkness
303	7	Mawile	Tramposo
303	9	Mawile	Deceiver
304	7	Aron	Cor. Férrea
304	9	Aron	Iron Armor
305	7	Lairon	Cor. Férrea
305	9	Lairon	Iron Armor
306	7	Aggron	Cor. Férrea
306	9	Aggron	Iron Armor
307	7	Meditite	Meditador
307	9	Meditite	Meditate
308	7	Medicham	Meditador
308	9	Medicham	Meditate
309	7	Electrike	Calambre
309	9	Electrike	Lightning
310	7	Manectric	Descarga
310	9	Manectric	Discharge
311	7	Plusle	Ánimo
311	9	Plusle	Cheering
312	7	Minun	Ánimo
312	9	Minun	Cheering
313	7	Volbeat	Luciérnaga
313	9	Volbeat	Firefly
314	7	Illumise	Luciérnaga
314	9	Illumise	Firefly
315	7	Roselia	Espina
315	9	Roselia	Thorn
316	7	Gulpin	Estómago
316	9	Gulpin	Stomach
317	7	Swalot	Bolsa Veneno
317	9	Swalot	Poison Bag
318	7	Carvanha	Feroz
318	9	Carvanha	Savage
319	7	Sharpedo	Voraz
319	9	Sharpedo	Brutal
320	7	Wailmer	Ballenabola
320	9	Wailmer	Ball Whale
321	7	Wailord	Ballenaflot
321	9	Wailord	Float Whale
322	7	Numel	Torpe
322	9	Numel	Numb
323	7	Camerupt	Erupción
323	9	Camerupt	Eruption
324	7	Torkoal	Carbón
324	9	Torkoal	Coal
325	7	Spoink	Saltarín
325	9	Spoink	Bounce
326	7	Grumpig	Manipulador
326	9	Grumpig	Manipulate
327	7	Spinda	Panda Topos
327	9	Spinda	Spot Panda
328	7	Trapinch	Hormigaleón
328	9	Trapinch	Ant Pit
329	7	Vibrava	Vibrante
329	9	Vibrava	Vibration
330	7	Flygon	Místico
330	9	Flygon	Mystic
331	7	Cacnea	Cactus
331	9	Cacnea	Cactus
332	7	Cacturne	Espantajo
332	9	Cacturne	Scarecrow
333	7	Swablu	Ave Algodón
333	9	Swablu	Cotton Bird
334	7	Altaria	Cantor
334	9	Altaria	Humming
335	7	Zangoose	Gato Hurón
335	9	Zangoose	Cat Ferret
336	7	Seviper	Colmillos
336	9	Seviper	Fang Snake
337	7	Lunatone	Meteorito
337	9	Lunatone	Meteorite
338	7	Solrock	Meteorito
338	9	Solrock	Meteorite
339	7	Barboach	Bigotudo
339	9	Barboach	Whiskers
340	7	Whiscash	Bigotudo
340	9	Whiscash	Whiskers
341	7	Corphish	Rufián
341	9	Corphish	Ruffian
342	7	Crawdaunt	Granuja
342	9	Crawdaunt	Rogue
343	7	Baltoy	Muñeca Barro
343	9	Baltoy	Clay Doll
344	7	Claydol	Muñeca Barro
344	9	Claydol	Clay Doll
345	7	Lileep	Lila Mar
345	9	Lileep	Sea Lily
346	7	Cradily	Percebe
346	9	Cradily	Barnacle
347	7	Anorith	Camarón
347	9	Anorith	Old Shrimp
348	7	Armaldo	Armadura
348	9	Armaldo	Plate
349	7	Feebas	Pez
349	9	Feebas	Fish
350	7	Milotic	Tierno
350	9	Milotic	Tender
351	7	Castform	Clima
351	9	Castform	Weather
352	7	Kecleon	Camaleónico
352	9	Kecleon	Color Swap
353	7	Shuppet	Títere
353	9	Shuppet	Puppet
354	7	Banette	Marioneta
354	9	Banette	Marionette
355	7	Duskull	Réquiem
355	9	Duskull	Requiem
356	7	Dusclops	Atrayente
356	9	Dusclops	Beckon
357	7	Tropius	Fruto
357	9	Tropius	Fruit
358	7	Chimecho	Sonido Aire
358	9	Chimecho	Wind Chime
359	7	Absol	Catástrofe
359	9	Absol	Disaster
360	7	Wynaut	Radiante
360	9	Wynaut	Bright
361	7	Snorunt	Gorro Nieve
361	9	Snorunt	Snow Hat
362	7	Glalie	Cara
362	9	Glalie	Face
363	7	Spheal	Aplauso
363	9	Spheal	Clap
364	7	Sealeo	Rodabola
364	9	Sealeo	Ball Roll
365	7	Walrein	Rompehielo
365	9	Walrein	Ice Break
366	7	Clamperl	Bivalvo
366	9	Clamperl	Bivalve
367	7	Huntail	Abisal
367	9	Huntail	Deep Sea
368	7	Gorebyss	Mar Del Sur
368	9	Gorebyss	South Sea
369	7	Relicanth	Longevo
369	9	Relicanth	Longevity
370	7	Luvdisc	Cita
370	9	Luvdisc	Rendezvous
371	7	Bagon	Cabeza Roca
371	9	Bagon	Rock Head
372	7	Shelgon	Resistencia
372	9	Shelgon	Endurance
373	7	Salamence	Dragón
373	9	Salamence	Dragon
374	7	Beldum	Bola Hierro
374	9	Beldum	Iron Ball
375	7	Metang	Garrahierro
375	9	Metang	Iron Claw
376	7	Metagross	Pata Hierro
376	9	Metagross	Iron Leg
377	7	Regirock	Pico Roca
377	9	Regirock	Rock Peak
378	7	Regice	Iceberg
378	9	Regice	Iceberg
379	7	Registeel	Hierro
379	9	Registeel	Iron
380	7	Latias	Eón
380	9	Latias	Eon
381	7	Latios	Eón
381	9	Latios	Eon
382	7	Kyogre	Cuenca Mar
382	9	Kyogre	Sea Basin
383	7	Groudon	Continente
383	9	Groudon	Continent
384	7	Rayquaza	Cielo
384	9	Rayquaza	Sky High
385	7	Jirachi	Deseo
385	9	Jirachi	Wish
386	7	Deoxys	ADN
386	9	Deoxys	DNA
387	7	Turtwig	Hojita
387	9	Turtwig	Tiny Leaf
388	7	Grotle	Arboleda
388	9	Grotle	Grove
389	7	Torterra	Continente
389	9	Torterra	Continent
390	7	Chimchar	Chimpancé
390	9	Chimchar	Chimp
391	7	Monferno	Juguetón
391	9	Monferno	Playful
392	7	Infernape	Llama
392	9	Infernape	Flame
393	7	Piplup	Pingüino
393	9	Piplup	Penguin
394	7	Prinplup	Pingüino
394	9	Prinplup	Penguin
395	7	Empoleon	Emperador
395	9	Empoleon	Emperor
396	7	Starly	Estornino
396	9	Starly	Starling
397	7	Staravia	Estornino
397	9	Staravia	Starling
398	7	Staraptor	Depredador
398	9	Staraptor	Predator
399	7	Bidoof	Gran Ratón
399	9	Bidoof	Plump Mouse
400	7	Bibarel	Castor
400	9	Bibarel	Beaver
401	7	Kricketot	Grillo
401	9	Kricketot	Cricket
402	7	Kricketune	Grillo
402	9	Kricketune	Cricket
403	7	Shinx	Flash
403	9	Shinx	Flash
404	7	Luxio	Chispa
404	9	Luxio	Spark
405	7	Luxray	Chispa Ojos
405	9	Luxray	Gleam Eyes
406	7	Budew	Brote
406	9	Budew	Bud
407	7	Roserade	Ramillete
407	9	Roserade	Bouquet
408	7	Cranidos	Cabezazo
408	9	Cranidos	Head Butt
409	7	Rampardos	Cabezazo
409	9	Rampardos	Head Butt
410	7	Shieldon	Escudo
410	9	Shieldon	Shield
411	7	Bastiodon	Escudo
411	9	Bastiodon	Shield
412	7	Burmy	Larva
412	9	Burmy	Bagworm
413	7	Wormadam	Larva
413	9	Wormadam	Bagworm
414	7	Mothim	Polilla
414	9	Mothim	Moth
415	7	Combee	Abejita
415	9	Combee	Tiny Bee
416	7	Vespiquen	Colmena
416	9	Vespiquen	Beehive
417	7	Pachirisu	Ardillalec
417	9	Pachirisu	EleSquirrel
418	7	Buizel	Nutria Mar.
418	9	Buizel	Sea Weasel
419	7	Floatzel	Nutria Mar.
419	9	Floatzel	Sea Weasel
420	7	Cherubi	Cereza
420	9	Cherubi	Cherry
421	7	Cherrim	Floración
421	9	Cherrim	Blossom
422	7	Shellos	Babosa Mar.
422	9	Shellos	Sea Slug
423	7	Gastrodon	Babosa Mar.
423	9	Gastrodon	Sea Slug
424	7	Ambipom	Cola Larga
424	9	Ambipom	Long Tail
425	7	Drifloon	Globo
425	9	Drifloon	Balloon
426	7	Drifblim	Dirigible
426	9	Drifblim	Blimp
427	7	Buneary	Conejo
427	9	Buneary	Rabbit
428	7	Lopunny	Conejo
428	9	Lopunny	Rabbit
429	7	Mismagius	Mágico
429	9	Mismagius	Magical
430	7	Honchkrow	Gran Jefe
430	9	Honchkrow	Big Boss
431	7	Glameow	Gastuto
431	9	Glameow	Catty
432	7	Purugly	Tigre Gato
432	9	Purugly	Tiger Cat
433	7	Chingling	Campana
433	9	Chingling	Bell
434	7	Stunky	Mofeta
434	9	Stunky	Skunk
435	7	Skuntank	Mofeta
435	9	Skuntank	Skunk
436	7	Bronzor	Bronce
436	9	Bronzor	Bronze
437	7	Bronzong	Cam. Bronce
437	9	Bronzong	Bronze Bell
438	7	Bonsly	Bonsái
438	9	Bonsly	Bonsai
439	7	Mime Jr.	Mimo
439	9	Mime Jr.	Mime
440	7	Happiny	Casita
440	9	Happiny	Playhouse
441	7	Chatot	Corchea
441	9	Chatot	Music Note
442	7	Spiritomb	Prohibido
442	9	Spiritomb	Forbidden
443	7	Gible	Terrascualo
443	9	Gible	Land Shark
444	7	Gabite	Cueva
444	9	Gabite	Cave
445	7	Garchomp	Mach
445	9	Garchomp	Mach
446	7	Munchlax	Comilón
446	9	Munchlax	Big Eater
447	7	Riolu	Emanación
447	9	Riolu	Emanation
448	7	Lucario	Aura
448	9	Lucario	Aura
449	7	Hippopotas	Hipo
449	9	Hippopotas	Hippo
450	7	Hippowdon	Peso Pesado
450	9	Hippowdon	Heavyweight
451	7	Skorupi	Escorpión
451	9	Skorupi	Scorpion
452	7	Drapion	Escorpiogro
452	9	Drapion	Ogre Scorpion
453	7	Croagunk	Boca Tóxica
453	9	Croagunk	Toxic Mouth
454	7	Toxicroak	Boca Tóxica
454	9	Toxicroak	Toxic Mouth
455	7	Carnivine	Caza Bichos
455	9	Carnivine	Bug Catcher
456	7	Finneon	Pez Ala
456	9	Finneon	Wing Fish
457	7	Lumineon	Neón
457	9	Lumineon	Neon
458	7	Mantyke	Milano
458	9	Mantyke	Kite
459	7	Snover	Árbol Nieve
459	9	Snover	Frost Tree
460	7	Abomasnow	Árbol Nieve
460	9	Abomasnow	Frost Tree
461	7	Weavile	Garra Filo
461	9	Weavile	Sharp Claw
462	7	Magnezone	Magnético
462	9	Magnezone	Magnet Area
463	7	Lickilicky	Lametazo
463	9	Lickilicky	Licking
464	7	Rhyperior	Taladro
464	9	Rhyperior	Drill
465	7	Tangrowth	Enredadera
465	9	Tangrowth	Vine
466	7	Electivire	Rayo
466	9	Electivire	Thunderbolt
467	7	Magmortar	Explosión
467	9	Magmortar	Blast
468	7	Togekiss	Festejo
468	9	Togekiss	Jubilee
469	7	Yanmega	Libélula
469	9	Yanmega	Ogre Darner
470	7	Leafeon	Verdor
470	9	Leafeon	Verdant
471	7	Glaceon	Nieve Fresca
471	9	Glaceon	Fresh Snow
472	7	Gliscor	Colmicorpio
472	9	Gliscor	Fang Scorpion
473	7	Mamoswine	Doscolmillos
473	9	Mamoswine	Twin Tusk
474	7	Porygon-Z	Virtual
474	9	Porygon-Z	Virtual
475	7	Gallade	Cuchilla
475	9	Gallade	Blade
476	7	Probopass	Brújula
476	9	Probopass	Compass
477	7	Dusknoir	Grilletes
477	9	Dusknoir	Gripper
478	7	Froslass	Tierra Fría
478	9	Froslass	Snow Land
479	7	Rotom	Plasma
479	9	Rotom	Plasma
480	7	Uxie	Sabiduría
480	9	Uxie	Knowledge
481	7	Mesprit	Sensorio
481	9	Mesprit	Emotion
482	7	Azelf	Voluntad
482	9	Azelf	Willpower
483	7	Dialga	Temporal
483	9	Dialga	Temporal
484	7	Palkia	Espacial
484	9	Palkia	Spatial
485	7	Heatran	Domo Lava
485	9	Heatran	Lava Dome
486	7	Regigigas	Colosal
486	9	Regigigas	Colossal
487	7	Giratina	Renegado
487	9	Giratina	Renegade
488	7	Cresselia	Lunar
488	9	Cresselia	Lunar
489	7	Phione	Marino
489	9	Phione	Sea Drifter
490	7	Manaphy	Náutico
490	9	Manaphy	Seafaring
491	7	Darkrai	Oscuridad
491	9	Darkrai	Pitch-Black
492	7	Shaymin	Gratitud
492	9	Shaymin	Gratitude
493	7	Arceus	Alfa
493	9	Arceus	Alpha
494	7	Victini	Victoria
494	9	Victini	Victory
495	7	Snivy	Serp. Hierba
495	9	Snivy	Grass Snake
496	7	Servine	Serp. Hierba
496	9	Servine	Grass Snake
497	7	Serperior	Realeza
497	9	Serperior	Regal
498	7	Tepig	Cerdo Fuego
498	9	Tepig	Fire Pig
499	7	Pignite	Cerdo Fuego
499	9	Pignite	Fire Pig
500	7	Emboar	Cerdo Ígneo
500	9	Emboar	Mega Fire Pig
501	7	Oshawott	Nutria
501	9	Oshawott	Sea Otter
502	7	Dewott	Superación
502	9	Dewott	Discipline
503	7	Samurott	Majestuoso
503	9	Samurott	Formidable
504	7	Patrat	Explorador
504	9	Patrat	Scout
505	7	Watchog	Alerta
505	9	Watchog	Lookout
506	7	Lillipup	Perrito
506	9	Lillipup	Puppy
507	7	Herdier	Leal
507	9	Herdier	Loyal Dog
508	7	Stoutland	Magnánimo
508	9	Stoutland	Big-Hearted
509	7	Purrloin	Malicioso
509	9	Purrloin	Devious
510	7	Liepard	Calculador
510	9	Liepard	Cruel
511	7	Pansage	Mono Hierba
511	9	Pansage	Grass Monkey
512	7	Simisage	Mono Pincho
512	9	Simisage	Thorn Monkey
513	7	Pansear	Ardiente
513	9	Pansear	High Temp
514	7	Simisear	Lumbre
514	9	Simisear	Ember
515	7	Panpour	Salpicadura
515	9	Panpour	Spray
516	7	Simipour	Drenaje
516	9	Simipour	Geyser
517	7	Munna	Comesueños
517	9	Munna	Dream Eater
518	7	Musharna	Duermevela
518	9	Musharna	Drowsing
519	7	Pidove	Pichón
519	9	Pidove	Tiny Pigeon
520	7	Tranquill	Torcaz
520	9	Tranquill	Wild Pigeon
521	7	Unfezant	Altanero
521	9	Unfezant	Proud
522	7	Blitzle	Electrizado
522	9	Blitzle	Electrified
523	7	Zebstrika	Rayo
523	9	Zebstrika	Thunderbolt
524	7	Roggenrola	Manto
524	9	Roggenrola	Mantle
525	7	Boldore	Mineral
525	9	Boldore	Ore
526	7	Gigalith	Presurizado
526	9	Gigalith	Compressed
527	7	Woobat	Murciélago
527	9	Woobat	Bat
528	7	Swoobat	Galante
528	9	Swoobat	Courting
529	7	Drilbur	Topo
529	9	Drilbur	Mole
530	7	Excadrill	Subterráneo
530	9	Excadrill	Subterrene
531	7	Audino	Escucha
531	9	Audino	Hearing
532	7	Timburr	Musculoso
532	9	Timburr	Muscular
533	7	Gurdurr	Musculoso
533	9	Gurdurr	Muscular
534	7	Conkeldurr	Musculoso
534	9	Conkeldurr	Muscular
535	7	Tympole	Renacuajo
535	9	Tympole	Tadpole
536	7	Palpitoad	Vibrante
536	9	Palpitoad	Vibration
537	7	Seismitoad	Vibrante
537	9	Seismitoad	Vibration
538	7	Throh	Judo
538	9	Throh	Judo
539	7	Sawk	Kárate
539	9	Sawk	Karate
540	7	Sewaddle	Sastre
540	9	Sewaddle	Sewing
541	7	Swadloon	Arropado
541	9	Swadloon	Leaf-Wrapped
542	7	Leavanny	Cuidador
542	9	Leavanny	Nurturing
543	7	Venipede	Ciempiés
543	9	Venipede	Centipede
544	7	Whirlipede	Pupaciempiés
544	9	Whirlipede	Curlipede
545	7	Scolipede	Megaciempiés
545	9	Scolipede	Megapede
546	7	Cottonee	Bolalgodón
546	9	Cottonee	Cotton Puff
547	7	Whimsicott	Vuelalviento
547	9	Whimsicott	Windveiled
548	7	Petilil	Bulbo
548	9	Petilil	Bulb
549	7	Lilligant	Adornofloral
549	9	Lilligant	Flowering
550	7	Basculin	Violento
550	9	Basculin	Hostile
551	7	Sandile	Desierdrilo
551	9	Sandile	Desert Croc
552	7	Krokorok	Desierdrilo
552	9	Krokorok	Desert Croc
553	7	Krookodile	Amenazador
553	9	Krookodile	Intimidation
554	7	Darumaka	Daruma
554	9	Darumaka	Zen Charm
555	7	Darmanitan	Candente
555	9	Darmanitan	Blazing
556	7	Maractus	Cactus
556	9	Maractus	Cactus
557	7	Dwebble	Casapiedra
557	9	Dwebble	Rock Inn
558	7	Crustle	Casarroca
558	9	Crustle	Stone Home
559	7	Scraggy	Mudapiel
559	9	Scraggy	Shedding
560	7	Scrafty	Gamberro
560	9	Scrafty	Hoodlum
561	7	Sigilyph	Pseudopájaro
561	9	Sigilyph	Avianoid
562	7	Yamask	Espíritu
562	9	Yamask	Spirit
563	7	Cofagrigus	Sepultura
563	9	Cofagrigus	Coffin
564	7	Tirtouga	Pretortuga
564	9	Tirtouga	Prototurtle
565	7	Carracosta	Pretortuga
565	9	Carracosta	Prototurtle
566	7	Archen	Protopájaro
566	9	Archen	First Bird
567	7	Archeops	Protopájaro
567	9	Archeops	First Bird
568	7	Trubbish	Bolsabasura
568	9	Trubbish	Trash Bag
569	7	Garbodor	Vertedero
569	9	Garbodor	Trash Heap
570	7	Zorua	Zorropillo
570	9	Zorua	Tricky Fox
571	7	Zoroark	Disfrazorro
571	9	Zoroark	Illusion Fox
572	7	Minccino	Chinchilla
572	9	Minccino	Chinchilla
573	7	Cinccino	Estola
573	9	Cinccino	Scarf
574	7	Gothita	Inquisitivo
574	9	Gothita	Fixation
575	7	Gothorita	Manipulador
575	9	Gothorita	Manipulate
576	7	Gothitelle	Astro
576	9	Gothitelle	Astral Body
577	7	Solosis	Célula
577	9	Solosis	Cell
578	7	Duosion	Mitosis
578	9	Duosion	Mitosis
579	7	Reuniclus	Ampliación
579	9	Reuniclus	Multiplying
580	7	Ducklett	Ave Agua
580	9	Ducklett	Water Bird
581	7	Swanna	Cisne
581	9	Swanna	White Bird
582	7	Vanillite	Nieve Fresca
582	9	Vanillite	Fresh Snow
583	7	Vanillish	Nieve Helada
583	9	Vanillish	Icy Snow
584	7	Vanilluxe	Nieve Gélida
584	9	Vanilluxe	Snowstorm
585	7	Deerling	Estacional
585	9	Deerling	Season
586	7	Sawsbuck	Estacional
586	9	Sawsbuck	Season
587	7	Emolga	Vuelardilla
587	9	Emolga	Sky Squirrel
588	7	Karrablast	Bocado
588	9	Karrablast	Clamping
589	7	Escavalier	Soldado
589	9	Escavalier	Cavalry
590	7	Foongus	Hongo
590	9	Foongus	Mushroom
591	7	Amoonguss	Hongo
591	9	Amoonguss	Mushroom
592	7	Frillish	Ingrávido
592	9	Frillish	Floating
593	7	Jellicent	Ingrávido
593	9	Jellicent	Floating
594	7	Alomomola	Socorrista
594	9	Alomomola	Caring
595	7	Joltik	Lapa
595	9	Joltik	Attaching
596	7	Galvantula	Electroaraña
596	9	Galvantula	EleSpider
597	7	Ferroseed	Fruto Espina
597	9	Ferroseed	Thorn Seed
598	7	Ferrothorn	Bola Espina
598	9	Ferrothorn	Thorn Pod
599	7	Klink	Engranaje
599	9	Klink	Gear
600	7	Klang	Engranaje
600	9	Klang	Gear
601	7	Klinklang	Engranaje
601	9	Klinklang	Gear
602	7	Tynamo	Electropez
602	9	Tynamo	EleFish
603	7	Eelektrik	Electropez
603	9	Eelektrik	EleFish
604	7	Eelektross	Electropez
604	9	Eelektross	EleFish
605	7	Elgyem	Cerebro
605	9	Elgyem	Cerebral
606	7	Beheeyem	Cerebro
606	9	Beheeyem	Cerebral
607	7	Litwick	Vela
607	9	Litwick	Candle
608	7	Lampent	Farolillo
608	9	Lampent	Lamp
609	7	Chandelure	Señuelo
609	9	Chandelure	Luring
610	7	Axew	Colmillo
610	9	Axew	Tusk
611	7	Fraxure	Boca Hacha
611	9	Fraxure	Axe Jaw
612	7	Haxorus	Boca Hacha
612	9	Haxorus	Axe Jaw
613	7	Cubchoo	Congelación
613	9	Cubchoo	Chill
614	7	Beartic	Glaciación
614	9	Beartic	Freezing
615	7	Cryogonal	Cristal
615	9	Cryogonal	Crystallizing
616	7	Shelmet	Caracol
616	9	Shelmet	Snail
617	7	Accelgor	Sincaparazón
617	9	Accelgor	Shell Out
618	7	Stunfisk	Trampa
618	9	Stunfisk	Trap
619	7	Mienfoo	Arte Marcial
619	9	Mienfoo	Martial Arts
620	7	Mienshao	Arte Marcial
620	9	Mienshao	Martial Arts
621	7	Druddigon	Cueva
621	9	Druddigon	Cave
622	7	Golett	Autómata
622	9	Golett	Automaton
623	7	Golurk	Autómata
623	9	Golurk	Automaton
624	7	Pawniard	Tajo
624	9	Pawniard	Sharp Blade
625	7	Bisharp	Filo
625	9	Bisharp	Sword Blade
626	7	Bouffalant	Torocabezazo
626	9	Bouffalant	Bash Buffalo
627	7	Rufflet	Aguilucho
627	9	Rufflet	Eaglet
628	7	Braviary	Aguerrido
628	9	Braviary	Valiant
629	7	Vullaby	Pañal
629	9	Vullaby	Diapered
630	7	Mandibuzz	Aguilahueso
630	9	Mandibuzz	Bone Vulture
631	7	Heatmor	Hormiguero
631	9	Heatmor	Anteater
632	7	Durant	Hormigacero
632	9	Durant	Iron Ant
633	7	Deino	Tosco
633	9	Deino	Irate
634	7	Zweilous	Violento
634	9	Zweilous	Hostile
635	7	Hydreigon	Voraz
635	9	Hydreigon	Brutal
636	7	Larvesta	Antorcha
636	9	Larvesta	Torch
637	7	Volcarona	Sol
637	9	Volcarona	Sun
638	7	Cobalion	Tesón Acero
638	9	Cobalion	Iron Will
639	7	Terrakion	Gruta
639	9	Terrakion	Cavern
640	7	Virizion	Prado
640	9	Virizion	Grassland
641	7	Tornadus	Torbellino
641	9	Tornadus	Cyclone
642	7	Thundurus	Centella
642	9	Thundurus	Bolt Strike
643	7	Reshiram	Blanco Veraz
643	9	Reshiram	Vast White
644	7	Zekrom	Negro Puro
644	9	Zekrom	Deep Black
645	7	Landorus	Fertilidad
645	9	Landorus	Abundance
646	7	Kyurem	Frontera
646	9	Kyurem	Boundary
647	7	Keldeo	Potro
647	9	Keldeo	Colt
648	7	Meloetta	Melodía
648	9	Meloetta	Melody
649	7	Genesect	Paleozoico
649	9	Genesect	Paleozoic
650	7	Chespin	Erizo
650	9	Chespin	Spiny Nut
651	7	Quilladin	Corazaespín
651	9	Quilladin	Spiny Armor
652	7	Chesnaught	Corazaespín
652	9	Chesnaught	Spiny Armor
653	7	Fennekin	Zorro
653	9	Fennekin	Fox
654	7	Braixen	Zorro
654	9	Braixen	Fox
655	7	Delphox	Zorro
655	9	Delphox	Fox
656	7	Froakie	Burburrana
656	9	Froakie	Bubble Frog
657	7	Frogadier	Burburrana
657	9	Frogadier	Bubble Frog
658	7	Greninja	Ninja
658	9	Greninja	Ninja
659	7	Bunnelby	Excavador
659	9	Bunnelby	Digging
660	7	Diggersby	Excavador
660	9	Diggersby	Digging
661	7	Fletchling	Petirrojo
661	9	Fletchling	Tiny Robin
662	7	Fletchinder	Lumbre
662	9	Fletchinder	Ember
663	7	Talonflame	Flamígero
663	9	Talonflame	Scorching
664	7	Scatterbug	Tiraescamas
664	9	Scatterbug	Scatterdust
665	7	Spewpa	Tiraescamas
665	9	Spewpa	Scatterdust
666	7	Vivillon	Escamaposa
666	9	Vivillon	Scale
667	7	Litleo	Leoncito
667	9	Litleo	Lion Cub
668	7	Pyroar	Regio
668	9	Pyroar	Royal
669	7	Flabébé	Monoflor
669	9	Flabébé	Single Bloom
670	7	Floette	Monoflor
670	9	Floette	Single Bloom
671	7	Florges	Jardín
671	9	Florges	Garden
672	7	Skiddo	Montura
672	9	Skiddo	Mount
673	7	Gogoat	Montura
673	9	Gogoat	Mount
674	7	Pancham	Juguetón
674	9	Pancham	Playful
675	7	Pangoro	Rostro Fiero
675	9	Pangoro	Daunting
676	7	Furfrou	Caniche
676	9	Furfrou	Poodle
677	7	Espurr	Moderación
677	9	Espurr	Restraint
678	7	Meowstic	Autocontrol
678	9	Meowstic	Constraint
679	7	Honedge	Tizona
679	9	Honedge	Sword
680	7	Doublade	Tizona
680	9	Doublade	Sword
681	7	Aegislash	Espada Real
681	9	Aegislash	Royal Sword
682	7	Spritzee	Aroma
682	9	Spritzee	Perfume
683	7	Aromatisse	Fragancia
683	9	Aromatisse	Fragrance
684	7	Swirlix	Chuchería
684	9	Swirlix	Cotton Candy
685	7	Slurpuff	Nata
685	9	Slurpuff	Meringue
686	7	Inkay	Rotación
686	9	Inkay	Revolving
687	7	Malamar	Revolución
687	9	Malamar	Overturning
688	7	Binacle	Dos Manos
688	9	Binacle	Two-Handed
689	7	Barbaracle	Combinación
689	9	Barbaracle	Collective
690	7	Skrelp	Pseudoalga
690	9	Skrelp	Mock Kelp
691	7	Dragalge	Pseudoalga
691	9	Dragalge	Mock Kelp
692	7	Clauncher	Proyectagua
692	9	Clauncher	Water Gun
693	7	Clawitzer	Lanzachorro
693	9	Clawitzer	Howitzer
694	7	Helioptile	Generador
694	9	Helioptile	Generator
695	7	Heliolisk	Generador
695	9	Heliolisk	Generator
696	7	Tyrunt	Heredero
696	9	Tyrunt	Royal Heir
697	7	Tyrantrum	Tirano
697	9	Tyrantrum	Despot
698	7	Amaura	Tundra
698	9	Amaura	Tundra
699	7	Aurorus	Tundra
699	9	Aurorus	Tundra
700	7	Sylveon	Vínculo
700	9	Sylveon	Intertwining
701	7	Hawlucha	Lucha Libre
701	9	Hawlucha	Wrestling
702	7	Dedenne	Antenas
702	9	Dedenne	Antenna
703	7	Carbink	Joya
703	9	Carbink	Jewel
704	7	Goomy	Molusco
704	9	Goomy	Soft Tissue
705	7	Sliggoo	Molusco
705	9	Sliggoo	Soft Tissue
706	7	Goodra	Dragón
706	9	Goodra	Dragon
707	7	Klefki	Llavero
707	9	Klefki	Key Ring
708	7	Phantump	Tocón
708	9	Phantump	Stump
709	7	Trevenant	Árbol Viejo
709	9	Trevenant	Elder Tree
710	7	Pumpkaboo	Calabaza
710	9	Pumpkaboo	Pumpkin
711	7	Gourgeist	Calabaza
711	9	Gourgeist	Pumpkin
712	7	Bergmite	Témpano
712	9	Bergmite	Ice Chunk
713	7	Avalugg	Iceberg
713	9	Avalugg	Iceberg
714	7	Noibat	Onda Sónica
714	9	Noibat	Sound Wave
715	7	Noivern	Onda Sónica
715	9	Noivern	Sound Wave
716	7	Xerneas	Creación
716	9	Xerneas	Life
717	7	Yveltal	Destrucción
717	9	Yveltal	Destruction
718	7	Zygarde	Equilibrio
718	9	Zygarde	Order
719	7	Diancie	Joya
719	9	Diancie	Jewel
720	7	Hoopa	Travesura
720	9	Hoopa	Mischief
721	7	Volcanion	Vapor
721	9	Volcanion	Steam
68	10	\N	Supersilný
262	10	\N	Kousavý
132	10	\N	Transformační
614	10	\N	Mrazící
66	10	\N	Supersilný
615	10	\N	Krystalizující
97	10	\N	Hypnotický
243	10	\N	Bleskový
120	10	\N	Hvězdicovitý
466	10	\N	Bleskový
89	10	\N	Kalový
136	10	\N	Plamenný
11	10	\N	Kuklový
197	10	\N	Měsíční
323	10	\N	Erupční
392	10	\N	Plamenný
523	10	\N	Bleskový
3	10	\N	Semínkový
6	10	\N	Plamenný
8	10	\N	Želví
111	10	\N	Střepinový
325	10	\N	Skákavý
7	10	\N	Malý želví
1	10	\N	Semínkový
12	10	\N	Motýlí
403	10	\N	Jiskrový
121	10	\N	Záhadný
4	10	\N	Ještěrkovitý
14	10	\N	Kuklový
613	10	\N	Studený
618	10	\N	Pasťový
267	10	\N	Motýlí
2	10	\N	Semínkový
9	10	\N	Korýší
140	10	\N	Korýší
122	10	\N	Bariérový
261	10	\N	Kousavý
307	10	\N	Meditační
404	10	\N	Jiskrový
141	10	\N	Korýší
146	10	\N	Plamenný
265	10	\N	Červí
5	10	\N	Plamenný
10	10	\N	Červí
67	10	\N	Supersilný
266	10	\N	Kuklový
200	10	\N	Skřípavý
308	10	\N	Meditační
277	10	\N	Polykací
96	10	\N	Hypnotický
268	10	\N	Kuklový
173	10	\N	Hvězdicovitý
88	10	\N	Kalový
191	10	\N	Semínkový
726	7	Rotom-frost	Plasma
725	7	Rotom-fan	Plasma
724	7	Rotom-mow	Plasma
723	7	Rotom-heat	Plasma
722	7	Rotom-wash	Plasma
727	7	Tornadus-therian	Cyclone
727	9	Tornadus-therian	Cyclone
728	7	Thundurus-therian	Bolt Strike
728	9	Thundurus-therian	Bolt Strike
729	7	Landorus-therian	Abundance
729	9	Landorus-therian	Abundance
730	7	Kyurem-white	Boundary
730	9	Kyurem-white	Boundary
731	7	Kyurem-black	Boundary
731	9	Kyurem-black	Boundary
732	7	Rowlet	\N
732	9	Rowlet	\N
733	7	Dartrix	\N
733	9	Dartrix	\N
734	7	Decidueye	\N
734	9	Decidueye	\N
735	7	Litten	\N
735	9	Litten	\N
736	7	Torracat	\N
736	9	Torracat	\N
737	7	Incineroar	\N
737	9	Incineroar	\N
738	7	Popplio	\N
738	9	Popplio	\N
739	7	Brionne	\N
739	9	Brionne	\N
740	7	Primarina	\N
740	9	Primarina	\N
741	7	Pikipek	\N
741	9	Pikipek	\N
742	7	Trumbeak	\N
742	9	Trumbeak	\N
743	7	Toucannon	\N
743	9	Toucannon	\N
744	7	Yungoos	\N
744	9	Yungoos	\N
745	7	Gumshoos	\N
745	9	Gumshoos	\N
746	7	Grubbin	\N
746	9	Grubbin	\N
747	7	Charjabug	\N
747	9	Charjabug	\N
748	7	Vikavolt	\N
748	9	Vikavolt	\N
749	7	Crabrawler	\N
749	9	Crabrawler	\N
750	7	Crabominable	\N
750	9	Crabominable	\N
751	7	Oricorio-Fire	\N
751	9	Oricorio-Fire	\N
752	7	Oricorio-Electric	\N
752	9	Oricorio-Electric	\N
753	7	Oricorio-Ghost	\N
753	9	Oricorio-Ghost	\N
754	7	Oricorio-Psychic	\N
754	9	Oricorio-Psychic	\N
755	7	Cutiefly	\N
755	9	Cutiefly	\N
756	7	Ribombee	\N
756	9	Ribombee	\N
757	7	Rockruff	\N
757	9	Rockruff	\N
758	7	Lycanroc-Midday	\N
758	9	Lycanroc-Midday	\N
759	7	Lycanroc-Midnight	\N
759	9	Lycanroc-Midnight	\N
760	7	Wishiwashi	\N
760	9	Wishiwashi	\N
761	7	Mareanie	\N
761	9	Mareanie	\N
762	7	Toxapex	\N
762	9	Toxapex	\N
763	7	Mudbray	\N
763	9	Mudbray	\N
764	7	Mudsdale	\N
764	9	Mudsdale	\N
765	7	Dewpider	\N
765	9	Dewpider	\N
766	7	Araquanid	\N
766	9	Araquanid	\N
767	7	Fomantis	\N
767	9	Fomantis	\N
768	7	Lurantis	\N
768	9	Lurantis	\N
769	7	Morelull	\N
769	9	Morelull	\N
770	7	Shiinotic	\N
770	9	Shiinotic	\N
771	7	Salandit	\N
771	9	Salandit	\N
772	7	Salazzle	\N
772	9	Salazzle	\N
773	7	Stufful	\N
773	9	Stufful	\N
774	7	Bewear	\N
774	9	Bewear	\N
775	7	Bounsweet	\N
775	9	Bounsweet	\N
776	7	Steenee	\N
776	9	Steenee	\N
777	7	Tsareena	\N
777	9	Tsareena	\N
778	7	Comfey	\N
778	9	Comfey	\N
779	7	Oranguru	\N
779	9	Oranguru	\N
780	7	Passimian	\N
780	9	Passimian	\N
781	7	Wimpod	\N
781	9	Wimpod	\N
782	7	Golisopod	\N
782	9	Golisopod	\N
783	7	Sandygast	\N
783	9	Sandygast	\N
784	7	Palossand	\N
784	9	Palossand	\N
785	7	Pyukumuku	\N
785	9	Pyukumuku	\N
786	7	Type: Null	\N
786	9	Type: Null	\N
787	7	Silvally	\N
787	9	Silvally	\N
788	7	Minior	\N
788	9	Minior	\N
789	7	Komala	\N
789	9	Komala	\N
790	7	Turtonator	\N
790	9	Turtonator	\N
791	7	Togedemaru	\N
791	9	Togedemaru	\N
792	7	Mimikyu	\N
792	9	Mimikyu	\N
793	7	Bruxish	\N
793	9	Bruxish	\N
794	7	Drampa	\N
794	9	Drampa	\N
795	7	Dhelmise	\N
795	9	Dhelmise	\N
796	7	Jangmo-o	\N
796	9	Jangmo-o	\N
797	7	Hakamo-o	\N
797	9	Hakamo-o	\N
798	7	Kommo-o	\N
798	9	Kommo-o	\N
799	7	Tapu Koko	\N
799	9	Tapu Koko	\N
800	7	Tapu Lele	\N
800	9	Tapu Lele	\N
801	7	Tapu Bulu	\N
801	9	Tapu Bulu	\N
802	7	Tapu Fini	\N
802	9	Tapu Fini	\N
803	7	Cosmog	\N
803	9	Cosmog	\N
804	7	Cosmoem	\N
804	9	Cosmoem	\N
805	7	Solgaleo	\N
805	9	Solgaleo	\N
806	7	Lunala	\N
806	9	Lunala	\N
807	7	Nihilego	\N
807	9	Nihilego	\N
808	7	Buzzwole	\N
808	9	Buzzwole	\N
809	7	Pheromosa	\N
809	9	Pheromosa	\N
810	7	Xurkitree	\N
810	9	Xurkitree	\N
811	7	Celesteela	\N
811	9	Celesteela	\N
812	7	Kartana	\N
812	9	Kartana	\N
813	7	Guzzlord	\N
813	9	Guzzlord	\N
814	7	Necrozma	\N
814	9	Necrozma	\N
815	7	Magearna	\N
815	9	Magearna	\N
816	7	Rattata-Alola	\N
816	9	Rattata-Alola	\N
817	7	Raticate-Alola	\N
817	9	Raticate-Alola	\N
818	7	Raichu-Alola	\N
818	9	Raichu-Alola	\N
819	7	Sandshrew-Alola	\N
819	9	Sandshrew-Alola	\N
820	7	Sandslash-Alola	\N
820	9	Sandslash-Alola	\N
821	7	Vulpix-Alola	\N
821	9	Vulpix-Alola	\N
822	7	Ninetales-Alola	\N
822	9	Ninetales-Alola	\N
823	7	Diglett-Alola	\N
823	9	Diglett-Alola	\N
824	7	Dugtrio-Alola	\N
824	9	Dugtrio-Alola	\N
825	7	Meowth-Alola	\N
825	9	Meowth-Alola	\N
826	7	Persian-Alola	\N
826	9	Persian-Alola	\N
827	7	Geodude-Alola	\N
827	9	Geodude-Alola	\N
828	7	Graveler-Alola	\N
828	9	Graveler-Alola	\N
829	7	Golem-Alola	\N
829	9	Golem-Alola	\N
830	7	Grimer-Alola	\N
830	9	Grimer-Alola	\N
831	7	Muk-Alola	\N
831	9	Muk-Alola	\N
832	7	Exeggutor-Alola	\N
832	9	Exeggutor-Alola	\N
833	7	Marowak-Alola	\N
833	9	Marowak-Alola	\N
834	7	Unown-Question	
834	9	Unown-Question	
835	7	Venusaur-mega	\N
835	9	Venusaur-mega	\N
836	7	Charizard-mega-x	\N
836	9	Charizard-mega-x	\N
837	7	Charizard-mega-y	\N
837	9	Charizard-mega-y	\N
838	7	Blastoise-mega	\N
838	9	Blastoise-mega	\N
839	7	Beedrill-mega	\N
839	9	Beedrill-mega	\N
840	7	Pidgeot-mega	\N
840	9	Pidgeot-mega	\N
841	7	Alakazam-mega	\N
841	9	Alakazam-mega	\N
842	7	Slowbro-mega	\N
842	9	Slowbro-mega	\N
843	7	Gengar-mega	\N
843	9	Gengar-mega	\N
844	7	Kangaskhan-mega	\N
844	9	Kangaskhan-mega	\N
845	7	Pinsir-mega	\N
845	9	Pinsir-mega	\N
846	7	Gyarados-mega	\N
846	9	Gyarados-mega	\N
847	7	Aerodactyl-mega	\N
847	9	Aerodactyl-mega	\N
848	7	Mewtwo-mega-x	\N
848	9	Mewtwo-mega-x	\N
849	7	Mewtwo-mega-y	\N
849	9	Mewtwo-mega-y	\N
850	7	Ampharos-mega	\N
850	9	Ampharos-mega	\N
851	7	Steelix-mega	\N
851	9	Steelix-mega	\N
852	7	Scizor-mega	\N
852	9	Scizor-mega	\N
853	7	Heracross-mega	\N
853	9	Heracross-mega	\N
854	7	Houndoom-mega	\N
854	9	Houndoom-mega	\N
855	7	Tyranitar-mega	\N
855	9	Tyranitar-mega	\N
856	7	Sceptile-mega	\N
856	9	Sceptile-mega	\N
857	7	Blaziken-mega	\N
857	9	Blaziken-mega	\N
858	7	Swampert-mega	\N
858	9	Swampert-mega	\N
859	7	Gardevoir-mega	\N
859	9	Gardevoir-mega	\N
860	7	Sableye-mega	\N
860	9	Sableye-mega	\N
861	7	Mawile-mega	\N
861	9	Mawile-mega	\N
862	7	Aggron-mega	\N
862	9	Aggron-mega	\N
863	7	Medicham-mega	\N
863	9	Medicham-mega	\N
864	7	Manectric-mega	\N
864	9	Manectric-mega	\N
865	7	Sharpedo-mega	\N
865	9	Sharpedo-mega	\N
866	7	Camerupt-mega	\N
866	9	Camerupt-mega	\N
867	7	Altaria-mega	\N
867	9	Altaria-mega	\N
868	7	Banette-mega	\N
868	9	Banette-mega	\N
869	7	Absol-mega	\N
869	9	Absol-mega	\N
870	7	Glalie-mega	\N
870	9	Glalie-mega	\N
871	7	Salamence-mega	\N
871	9	Salamence-mega	\N
872	7	Metagross-mega	\N
872	9	Metagross-mega	\N
873	7	Latias-mega	\N
873	9	Latias-mega	\N
874	7	Latios-mega	\N
874	9	Latios-mega	\N
875	7	Kyogre-primal	
875	9	Kyogre-primal	
876	7	Groudon-primal	
876	9	Groudon-primal	
877	7	Rayquaza-mega	\N
877	9	Rayquaza-mega	\N
878	7	Lopunny-mega	\N
878	9	Lopunny-mega	\N
879	7	Garchomp-mega	\N
879	9	Garchomp-mega	\N
880	7	Lucario-mega	\N
880	9	Lucario-mega	\N
881	7	Abomasnow-mega	\N
881	9	Abomasnow-mega	\N
882	7	Gallade-mega	\N
882	9	Gallade-mega	\N
883	7	Audino-mega	\N
883	9	Audino-mega	\N
884	7	Diancie-mega	\N
884	9	Diancie-mega	\N
885	7	Giratina-origin	
885	9	Giratina-origin	
886	7	Meowstic-female	
886	9	Meowstic-female	
\.


--
-- Data for Name: pokemon_stats; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY pokemon_stats (pokemon_id, stat_id, base_stat, effort) FROM stdin;
1	1	45	0
1	2	49	0
1	3	49	0
1	4	65	1
1	5	65	0
1	6	45	0
2	1	60	0
2	2	62	0
2	3	63	0
2	4	80	1
2	5	80	1
2	6	60	0
3	1	80	0
3	2	82	0
3	3	83	0
3	4	100	2
3	5	100	1
3	6	80	0
4	1	39	0
4	2	52	0
4	3	43	0
4	4	60	0
4	5	50	0
4	6	65	1
5	1	58	0
5	2	64	0
5	3	58	0
5	4	80	1
5	5	65	0
5	6	80	1
6	1	78	0
6	2	84	0
6	3	78	0
6	4	109	3
6	5	85	0
6	6	100	0
7	1	44	0
7	2	48	0
7	3	65	1
7	4	50	0
7	5	64	0
7	6	43	0
8	1	59	0
8	2	63	0
8	3	80	1
8	4	65	0
8	5	80	1
8	6	58	0
9	1	79	0
9	2	83	0
9	3	100	0
9	4	85	0
9	5	105	3
9	6	78	0
10	1	45	1
10	2	30	0
10	3	35	0
10	4	20	0
10	5	20	0
10	6	45	0
11	1	50	0
11	2	20	0
11	3	55	2
11	4	25	0
11	5	25	0
11	6	30	0
12	1	60	0
12	2	45	0
12	3	50	0
12	4	90	2
12	5	80	1
12	6	70	0
13	1	40	0
13	2	35	0
13	3	30	0
13	4	20	0
13	5	20	0
13	6	50	1
14	1	45	0
14	2	25	0
14	3	50	2
14	4	25	0
14	5	25	0
14	6	35	0
15	1	65	0
15	2	90	2
15	3	40	0
15	4	45	0
15	5	80	1
15	6	75	0
16	1	40	0
16	2	45	0
16	3	40	0
16	4	35	0
16	5	35	0
16	6	56	1
17	1	63	0
17	2	60	0
17	3	55	0
17	4	50	0
17	5	50	0
17	6	71	2
18	1	83	0
18	2	80	0
18	3	75	0
18	4	70	0
18	5	70	0
18	6	101	3
19	1	30	0
19	2	56	0
19	3	35	0
19	4	25	0
19	5	35	0
19	6	72	1
20	1	55	0
20	2	81	0
20	3	60	0
20	4	50	0
20	5	70	0
20	6	97	2
21	1	40	0
21	2	60	0
21	3	30	0
21	4	31	0
21	5	31	0
21	6	70	1
22	1	65	0
22	2	90	0
22	3	65	0
22	4	61	0
22	5	61	0
22	6	100	2
23	1	35	0
23	2	60	1
23	3	44	0
23	4	40	0
23	5	54	0
23	6	55	0
24	1	60	0
24	2	85	2
24	3	69	0
24	4	65	0
24	5	79	0
24	6	80	0
25	1	35	0
25	2	55	0
25	3	40	0
25	4	50	0
25	5	50	0
25	6	90	2
26	1	60	0
26	2	90	0
26	3	55	0
26	4	90	0
26	5	80	0
26	6	110	3
27	1	50	0
27	2	75	0
27	3	85	1
27	4	20	0
27	5	30	0
27	6	40	0
28	1	75	0
28	2	100	0
28	3	110	2
28	4	45	0
28	5	55	0
28	6	65	0
29	1	55	1
29	2	47	0
29	3	52	0
29	4	40	0
29	5	40	0
29	6	41	0
30	1	70	2
30	2	62	0
30	3	67	0
30	4	55	0
30	5	55	0
30	6	56	0
31	1	90	3
31	2	92	0
31	3	87	0
31	4	75	0
31	5	85	0
31	6	76	0
32	1	46	0
32	2	57	1
32	3	40	0
32	4	40	0
32	5	40	0
32	6	50	0
33	1	61	0
33	2	72	2
33	3	57	0
33	4	55	0
33	5	55	0
33	6	65	0
34	1	81	0
34	2	102	3
34	3	77	0
34	4	85	0
34	5	75	0
34	6	85	0
35	1	70	2
35	2	45	0
35	3	48	0
35	4	60	0
35	5	65	0
35	6	35	0
36	1	95	3
36	2	70	0
36	3	73	0
36	4	95	0
36	5	90	0
36	6	60	0
37	1	38	0
37	2	41	0
37	3	40	0
37	4	50	0
37	5	65	0
37	6	65	1
38	1	73	0
38	2	76	0
38	3	75	0
38	4	81	0
38	5	100	1
38	6	100	1
39	1	115	2
39	2	45	0
39	3	20	0
39	4	45	0
39	5	25	0
39	6	20	0
40	1	140	3
40	2	70	0
40	3	45	0
40	4	85	0
40	5	50	0
40	6	45	0
41	1	40	0
41	2	45	0
41	3	35	0
41	4	30	0
41	5	40	0
41	6	55	1
42	1	75	0
42	2	80	0
42	3	70	0
42	4	65	0
42	5	75	0
42	6	90	2
43	1	45	0
43	2	50	0
43	3	55	0
43	4	75	1
43	5	65	0
43	6	30	0
44	1	60	0
44	2	65	0
44	3	70	0
44	4	85	2
44	5	75	0
44	6	40	0
45	1	75	0
45	2	80	0
45	3	85	0
45	4	110	3
45	5	90	0
45	6	50	0
46	1	35	0
46	2	70	1
46	3	55	0
46	4	45	0
46	5	55	0
46	6	25	0
47	1	60	0
47	2	95	2
47	3	80	1
47	4	60	0
47	5	80	0
47	6	30	0
48	1	60	0
48	2	55	0
48	3	50	0
48	4	40	0
48	5	55	1
48	6	45	0
49	1	70	0
49	2	65	0
49	3	60	0
49	4	90	1
49	5	75	0
49	6	90	1
50	1	10	0
50	2	55	0
50	3	25	0
50	4	35	0
50	5	45	0
50	6	95	1
51	1	35	0
51	2	80	0
51	3	50	0
51	4	50	0
51	5	70	0
51	6	120	2
52	1	40	0
52	2	45	0
52	3	35	0
52	4	40	0
52	5	40	0
52	6	90	1
53	1	65	0
53	2	70	0
53	3	60	0
53	4	65	0
53	5	65	0
53	6	115	2
54	1	50	0
54	2	52	0
54	3	48	0
54	4	65	1
54	5	50	0
54	6	55	0
55	1	80	0
55	2	82	0
55	3	78	0
55	4	95	2
55	5	80	0
55	6	85	0
56	1	40	0
56	2	80	1
56	3	35	0
56	4	35	0
56	5	45	0
56	6	70	0
57	1	65	0
57	2	105	2
57	3	60	0
57	4	60	0
57	5	70	0
57	6	95	0
58	1	55	0
58	2	70	1
58	3	45	0
58	4	70	0
58	5	50	0
58	6	60	0
59	1	90	0
59	2	110	2
59	3	80	0
59	4	100	0
59	5	80	0
59	6	95	0
60	1	40	0
60	2	50	0
60	3	40	0
60	4	40	0
60	5	40	0
60	6	90	1
61	1	65	0
61	2	65	0
61	3	65	0
61	4	50	0
61	5	50	0
61	6	90	2
62	1	90	0
62	2	95	0
62	3	95	3
62	4	70	0
62	5	90	0
62	6	70	0
63	1	25	0
63	2	20	0
63	3	15	0
63	4	105	1
63	5	55	0
63	6	90	0
64	1	40	0
64	2	35	0
64	3	30	0
64	4	120	2
64	5	70	0
64	6	105	0
65	1	55	0
65	2	50	0
65	3	45	0
65	4	135	3
65	5	95	0
65	6	120	0
66	1	70	0
66	2	80	1
66	3	50	0
66	4	35	0
66	5	35	0
66	6	35	0
67	1	80	0
67	2	100	2
67	3	70	0
67	4	50	0
67	5	60	0
67	6	45	0
68	1	90	0
68	2	130	3
68	3	80	0
68	4	65	0
68	5	85	0
68	6	55	0
69	1	50	0
69	2	75	1
69	3	35	0
69	4	70	0
69	5	30	0
69	6	40	0
70	1	65	0
70	2	90	2
70	3	50	0
70	4	85	0
70	5	45	0
70	6	55	0
71	1	80	0
71	2	105	3
71	3	65	0
71	4	100	0
71	5	70	0
71	6	70	0
72	1	40	0
72	2	40	0
72	3	35	0
72	4	50	0
72	5	100	1
72	6	70	0
73	1	80	0
73	2	70	0
73	3	65	0
73	4	80	0
73	5	120	2
73	6	100	0
74	1	40	0
74	2	80	0
74	3	100	1
74	4	30	0
74	5	30	0
74	6	20	0
75	1	55	0
75	2	95	0
75	3	115	2
75	4	45	0
75	5	45	0
75	6	35	0
76	1	80	0
76	2	120	0
76	3	130	3
76	4	55	0
76	5	65	0
76	6	45	0
77	1	50	0
77	2	85	0
77	3	55	0
77	4	65	0
77	5	65	0
77	6	90	1
78	1	65	0
78	2	100	0
78	3	70	0
78	4	80	0
78	5	80	0
78	6	105	2
79	1	90	1
79	2	65	0
79	3	65	0
79	4	40	0
79	5	40	0
79	6	15	0
80	1	95	0
80	2	75	0
80	3	110	2
80	4	100	0
80	5	80	0
80	6	30	0
81	1	25	0
81	2	35	0
81	3	70	0
81	4	95	1
81	5	55	0
81	6	45	0
82	1	50	0
82	2	60	0
82	3	95	0
82	4	120	2
82	5	70	0
82	6	70	0
83	1	52	0
83	2	65	1
83	3	55	0
83	4	58	0
83	5	62	0
83	6	60	0
84	1	35	0
84	2	85	1
84	3	45	0
84	4	35	0
84	5	35	0
84	6	75	0
85	1	60	0
85	2	110	2
85	3	70	0
85	4	60	0
85	5	60	0
85	6	100	0
86	1	65	0
86	2	45	0
86	3	55	0
86	4	45	0
86	5	70	1
86	6	45	0
87	1	90	0
87	2	70	0
87	3	80	0
87	4	70	0
87	5	95	2
87	6	70	0
88	1	80	1
88	2	80	0
88	3	50	0
88	4	40	0
88	5	50	0
88	6	25	0
89	1	105	1
89	2	105	1
89	3	75	0
89	4	65	0
89	5	100	0
89	6	50	0
90	1	30	0
90	2	65	0
90	3	100	1
90	4	45	0
90	5	25	0
90	6	40	0
91	1	50	0
91	2	95	0
91	3	180	2
91	4	85	0
91	5	45	0
91	6	70	0
92	1	30	0
92	2	35	0
92	3	30	0
92	4	100	1
92	5	35	0
92	6	80	0
93	1	45	0
93	2	50	0
93	3	45	0
93	4	115	2
93	5	55	0
93	6	95	0
94	1	60	0
94	2	65	0
94	3	60	0
94	4	130	3
94	5	75	0
94	6	110	0
95	1	35	0
95	2	45	0
95	3	160	1
95	4	30	0
95	5	45	0
95	6	70	0
96	1	60	0
96	2	48	0
96	3	45	0
96	4	43	0
96	5	90	1
96	6	42	0
97	1	85	0
97	2	73	0
97	3	70	0
97	4	73	0
97	5	115	2
97	6	67	0
98	1	30	0
98	2	105	1
98	3	90	0
98	4	25	0
98	5	25	0
98	6	50	0
99	1	55	0
99	2	130	2
99	3	115	0
99	4	50	0
99	5	50	0
99	6	75	0
100	1	40	0
100	2	30	0
100	3	50	0
100	4	55	0
100	5	55	0
100	6	100	1
101	1	60	0
101	2	50	0
101	3	70	0
101	4	80	0
101	5	80	0
101	6	140	2
102	1	60	0
102	2	40	0
102	3	80	1
102	4	60	0
102	5	45	0
102	6	40	0
103	1	95	0
103	2	95	0
103	3	85	0
103	4	125	2
103	5	65	0
103	6	55	0
104	1	50	0
104	2	50	0
104	3	95	1
104	4	40	0
104	5	50	0
104	6	35	0
105	1	60	0
105	2	80	0
105	3	110	2
105	4	50	0
105	5	80	0
105	6	45	0
106	1	50	0
106	2	120	2
106	3	53	0
106	4	35	0
106	5	110	0
106	6	87	0
107	1	50	0
107	2	105	0
107	3	79	0
107	4	35	0
107	5	110	2
107	6	76	0
108	1	90	2
108	2	55	0
108	3	75	0
108	4	60	0
108	5	75	0
108	6	30	0
109	1	40	0
109	2	65	0
109	3	95	1
109	4	60	0
109	5	45	0
109	6	35	0
110	1	65	0
110	2	90	0
110	3	120	2
110	4	85	0
110	5	70	0
110	6	60	0
111	1	80	0
111	2	85	0
111	3	95	1
111	4	30	0
111	5	30	0
111	6	25	0
112	1	105	0
112	2	130	2
112	3	120	0
112	4	45	0
112	5	45	0
112	6	40	0
113	1	250	2
113	2	5	0
113	3	5	0
113	4	35	0
113	5	105	0
113	6	50	0
114	1	65	0
114	2	55	0
114	3	115	1
114	4	100	0
114	5	40	0
114	6	60	0
115	1	105	2
115	2	95	0
115	3	80	0
115	4	40	0
115	5	80	0
115	6	90	0
116	1	30	0
116	2	40	0
116	3	70	0
116	4	70	1
116	5	25	0
116	6	60	0
117	1	55	0
117	2	65	0
117	3	95	1
117	4	95	1
117	5	45	0
117	6	85	0
118	1	45	0
118	2	67	1
118	3	60	0
118	4	35	0
118	5	50	0
118	6	63	0
119	1	80	0
119	2	92	2
119	3	65	0
119	4	65	0
119	5	80	0
119	6	68	0
120	1	30	0
120	2	45	0
120	3	55	0
120	4	70	0
120	5	55	0
120	6	85	1
121	1	60	0
121	2	75	0
121	3	85	0
121	4	100	0
121	5	85	0
121	6	115	2
122	1	40	0
122	2	45	0
122	3	65	0
122	4	100	0
122	5	120	2
122	6	90	0
123	1	70	0
123	2	110	1
123	3	80	0
123	4	55	0
123	5	80	0
123	6	105	0
124	1	65	0
124	2	50	0
124	3	35	0
124	4	115	2
124	5	95	0
124	6	95	0
125	1	65	0
125	2	83	0
125	3	57	0
125	4	95	0
125	5	85	0
125	6	105	2
126	1	65	0
126	2	95	0
126	3	57	0
126	4	100	2
126	5	85	0
126	6	93	0
127	1	65	0
127	2	125	2
127	3	100	0
127	4	55	0
127	5	70	0
127	6	85	0
128	1	75	0
128	2	100	1
128	3	95	0
128	4	40	0
128	5	70	0
128	6	110	1
129	1	20	0
129	2	10	0
129	3	55	0
129	4	15	0
129	5	20	0
129	6	80	1
130	1	95	0
130	2	125	2
130	3	79	0
130	4	60	0
130	5	100	0
130	6	81	0
131	1	130	2
131	2	85	0
131	3	80	0
131	4	85	0
131	5	95	0
131	6	60	0
132	1	48	1
132	2	48	0
132	3	48	0
132	4	48	0
132	5	48	0
132	6	48	0
133	1	55	0
133	2	55	0
133	3	50	0
133	4	45	0
133	5	65	1
133	6	55	0
134	1	130	2
134	2	65	0
134	3	60	0
134	4	110	0
134	5	95	0
134	6	65	0
135	1	65	0
135	2	65	0
135	3	60	0
135	4	110	0
135	5	95	0
135	6	130	2
136	1	65	0
136	2	130	2
136	3	60	0
136	4	95	0
136	5	110	0
136	6	65	0
137	1	65	0
137	2	60	0
137	3	70	0
137	4	85	1
137	5	75	0
137	6	40	0
138	1	35	0
138	2	40	0
138	3	100	1
138	4	90	0
138	5	55	0
138	6	35	0
139	1	70	0
139	2	60	0
139	3	125	2
139	4	115	0
139	5	70	0
139	6	55	0
140	1	30	0
140	2	80	0
140	3	90	1
140	4	55	0
140	5	45	0
140	6	55	0
141	1	60	0
141	2	115	2
141	3	105	0
141	4	65	0
141	5	70	0
141	6	80	0
142	1	80	0
142	2	105	0
142	3	65	0
142	4	60	0
142	5	75	0
142	6	130	2
143	1	160	2
143	2	110	0
143	3	65	0
143	4	65	0
143	5	110	0
143	6	30	0
144	1	90	0
144	2	85	0
144	3	100	0
144	4	95	0
144	5	125	3
144	6	85	0
145	1	90	0
145	2	90	0
145	3	85	0
145	4	125	3
145	5	90	0
145	6	100	0
146	1	90	0
146	2	100	0
146	3	90	0
146	4	125	3
146	5	85	0
146	6	90	0
147	1	41	0
147	2	64	1
147	3	45	0
147	4	50	0
147	5	50	0
147	6	50	0
148	1	61	0
148	2	84	2
148	3	65	0
148	4	70	0
148	5	70	0
148	6	70	0
149	1	91	0
149	2	134	3
149	3	95	0
149	4	100	0
149	5	100	0
149	6	80	0
150	1	106	0
150	2	110	0
150	3	90	0
150	4	154	3
150	5	90	0
150	6	130	0
151	1	100	3
151	2	100	0
151	3	100	0
151	4	100	0
151	5	100	0
151	6	100	0
152	1	45	0
152	2	49	0
152	3	65	0
152	4	49	0
152	5	65	1
152	6	45	0
153	1	60	0
153	2	62	0
153	3	80	1
153	4	63	0
153	5	80	1
153	6	60	0
154	1	80	0
154	2	82	0
154	3	100	1
154	4	83	0
154	5	100	2
154	6	80	0
155	1	39	0
155	2	52	0
155	3	43	0
155	4	60	0
155	5	50	0
155	6	65	1
156	1	58	0
156	2	64	0
156	3	58	0
156	4	80	1
156	5	65	0
156	6	80	1
157	1	78	0
157	2	84	0
157	3	78	0
157	4	109	3
157	5	85	0
157	6	100	0
158	1	50	0
158	2	65	1
158	3	64	0
158	4	44	0
158	5	48	0
158	6	43	0
159	1	65	0
159	2	80	1
159	3	80	1
159	4	59	0
159	5	63	0
159	6	58	0
160	1	85	0
160	2	105	2
160	3	100	1
160	4	79	0
160	5	83	0
160	6	78	0
161	1	35	0
161	2	46	1
161	3	34	0
161	4	35	0
161	5	45	0
161	6	20	0
162	1	85	0
162	2	76	0
162	3	64	0
162	4	45	0
162	5	55	0
162	6	90	2
163	1	60	1
163	2	30	0
163	3	30	0
163	4	36	0
163	5	56	0
163	6	50	0
164	1	100	2
164	2	50	0
164	3	50	0
164	4	76	0
164	5	96	0
164	6	70	0
165	1	40	0
165	2	20	0
165	3	30	0
165	4	40	0
165	5	80	1
165	6	55	0
166	1	55	0
166	2	35	0
166	3	50	0
166	4	55	0
166	5	110	2
166	6	85	0
167	1	40	0
167	2	60	1
167	3	40	0
167	4	40	0
167	5	40	0
167	6	30	0
168	1	70	0
168	2	90	2
168	3	70	0
168	4	60	0
168	5	60	0
168	6	40	0
169	1	85	0
169	2	90	0
169	3	80	0
169	4	70	0
169	5	80	0
169	6	130	3
170	1	75	1
170	2	38	0
170	3	38	0
170	4	56	0
170	5	56	0
170	6	67	0
171	1	125	2
171	2	58	0
171	3	58	0
171	4	76	0
171	5	76	0
171	6	67	0
172	1	20	0
172	2	40	0
172	3	15	0
172	4	35	0
172	5	35	0
172	6	60	1
173	1	50	0
173	2	25	0
173	3	28	0
173	4	45	0
173	5	55	1
173	6	15	0
174	1	90	1
174	2	30	0
174	3	15	0
174	4	40	0
174	5	20	0
174	6	15	0
175	1	35	0
175	2	20	0
175	3	65	0
175	4	40	0
175	5	65	1
175	6	20	0
176	1	55	0
176	2	40	0
176	3	85	0
176	4	80	0
176	5	105	2
176	6	40	0
177	1	40	0
177	2	50	0
177	3	45	0
177	4	70	1
177	5	45	0
177	6	70	0
178	1	65	0
178	2	75	0
178	3	70	0
178	4	95	1
178	5	70	0
178	6	95	1
179	1	55	0
179	2	40	0
179	3	40	0
179	4	65	1
179	5	45	0
179	6	35	0
180	1	70	0
180	2	55	0
180	3	55	0
180	4	80	2
180	5	60	0
180	6	45	0
181	1	90	0
181	2	75	0
181	3	85	0
181	4	115	3
181	5	90	0
181	6	55	0
182	1	75	0
182	2	80	0
182	3	95	0
182	4	90	0
182	5	100	3
182	6	50	0
183	1	70	2
183	2	20	0
183	3	50	0
183	4	20	0
183	5	50	0
183	6	40	0
184	1	100	3
184	2	50	0
184	3	80	0
184	4	60	0
184	5	80	0
184	6	50	0
185	1	70	0
185	2	100	0
185	3	115	2
185	4	30	0
185	5	65	0
185	6	30	0
186	1	90	0
186	2	75	0
186	3	75	0
186	4	90	0
186	5	100	3
186	6	70	0
187	1	35	0
187	2	35	0
187	3	40	0
187	4	35	0
187	5	55	1
187	6	50	0
188	1	55	0
188	2	45	0
188	3	50	0
188	4	45	0
188	5	65	0
188	6	80	2
189	1	75	0
189	2	55	0
189	3	70	0
189	4	55	0
189	5	95	0
189	6	110	3
190	1	55	0
190	2	70	0
190	3	55	0
190	4	40	0
190	5	55	0
190	6	85	1
191	1	30	0
191	2	30	0
191	3	30	0
191	4	30	1
191	5	30	0
191	6	30	0
192	1	75	0
192	2	75	0
192	3	55	0
192	4	105	2
192	5	85	0
192	6	30	0
193	1	65	0
193	2	65	0
193	3	45	0
193	4	75	0
193	5	45	0
193	6	95	1
194	1	55	1
194	2	45	0
194	3	45	0
194	4	25	0
194	5	25	0
194	6	15	0
195	1	95	2
195	2	85	0
195	3	85	0
195	4	65	0
195	5	65	0
195	6	35	0
196	1	65	0
196	2	65	0
196	3	60	0
196	4	130	2
196	5	95	0
196	6	110	0
197	1	95	0
197	2	65	0
197	3	110	0
197	4	60	0
197	5	130	2
197	6	65	0
198	1	60	0
198	2	85	0
198	3	42	0
198	4	85	0
198	5	42	0
198	6	91	1
199	1	95	0
199	2	75	0
199	3	80	0
199	4	100	0
199	5	110	3
199	6	30	0
200	1	60	0
200	2	60	0
200	3	60	0
200	4	85	0
200	5	85	1
200	6	85	0
201	1	48	0
201	2	72	1
201	3	48	0
201	4	72	1
201	5	48	0
201	6	48	0
202	1	190	2
202	2	33	0
202	3	58	0
202	4	33	0
202	5	58	0
202	6	33	0
203	1	70	0
203	2	80	0
203	3	65	0
203	4	90	2
203	5	65	0
203	6	85	0
204	1	50	0
204	2	65	0
204	3	90	1
204	4	35	0
204	5	35	0
204	6	15	0
205	1	75	0
205	2	90	0
205	3	140	2
205	4	60	0
205	5	60	0
205	6	40	0
206	1	100	1
206	2	70	0
206	3	70	0
206	4	65	0
206	5	65	0
206	6	45	0
207	1	65	0
207	2	75	0
207	3	105	1
207	4	35	0
207	5	65	0
207	6	85	0
208	1	75	0
208	2	85	0
208	3	200	2
208	4	55	0
208	5	65	0
208	6	30	0
209	1	60	0
209	2	80	1
209	3	50	0
209	4	40	0
209	5	40	0
209	6	30	0
210	1	90	0
210	2	120	2
210	3	75	0
210	4	60	0
210	5	60	0
210	6	45	0
211	1	65	0
211	2	95	1
211	3	75	0
211	4	55	0
211	5	55	0
211	6	85	0
212	1	70	0
212	2	130	2
212	3	100	0
212	4	55	0
212	5	80	0
212	6	65	0
213	1	20	0
213	2	10	0
213	3	230	1
213	4	10	0
213	5	230	1
213	6	5	0
214	1	80	0
214	2	125	2
214	3	75	0
214	4	40	0
214	5	95	0
214	6	85	0
215	1	55	0
215	2	95	0
215	3	55	0
215	4	35	0
215	5	75	0
215	6	115	1
216	1	60	0
216	2	80	1
216	3	50	0
216	4	50	0
216	5	50	0
216	6	40	0
217	1	90	0
217	2	130	2
217	3	75	0
217	4	75	0
217	5	75	0
217	6	55	0
218	1	40	0
218	2	40	0
218	3	40	0
218	4	70	1
218	5	40	0
218	6	20	0
219	1	50	0
219	2	50	0
219	3	120	2
219	4	80	0
219	5	80	0
219	6	30	0
220	1	50	0
220	2	50	1
220	3	40	0
220	4	30	0
220	5	30	0
220	6	50	0
221	1	100	1
221	2	100	1
221	3	80	0
221	4	60	0
221	5	60	0
221	6	50	0
222	1	55	0
222	2	55	0
222	3	85	1
222	4	65	0
222	5	85	1
222	6	35	0
223	1	35	0
223	2	65	0
223	3	35	0
223	4	65	1
223	5	35	0
223	6	65	0
224	1	75	0
224	2	105	1
224	3	75	0
224	4	105	1
224	5	75	0
224	6	45	0
225	1	45	0
225	2	55	0
225	3	45	0
225	4	65	0
225	5	45	0
225	6	75	1
226	1	65	0
226	2	40	0
226	3	70	0
226	4	80	0
226	5	140	2
226	6	70	0
227	1	65	0
227	2	80	0
227	3	140	2
227	4	40	0
227	5	70	0
227	6	70	0
228	1	45	0
228	2	60	0
228	3	30	0
228	4	80	1
228	5	50	0
228	6	65	0
229	1	75	0
229	2	90	0
229	3	50	0
229	4	110	2
229	5	80	0
229	6	95	0
230	1	75	0
230	2	95	1
230	3	95	0
230	4	95	1
230	5	95	1
230	6	85	0
231	1	90	1
231	2	60	0
231	3	60	0
231	4	40	0
231	5	40	0
231	6	40	0
232	1	90	0
232	2	120	1
232	3	120	1
232	4	60	0
232	5	60	0
232	6	50	0
233	1	85	0
233	2	80	0
233	3	90	0
233	4	105	2
233	5	95	0
233	6	60	0
234	1	73	0
234	2	95	1
234	3	62	0
234	4	85	0
234	5	65	0
234	6	85	0
235	1	55	0
235	2	20	0
235	3	35	0
235	4	20	0
235	5	45	0
235	6	75	1
236	1	35	0
236	2	35	1
236	3	35	0
236	4	35	0
236	5	35	0
236	6	35	0
237	1	50	0
237	2	95	0
237	3	95	0
237	4	35	0
237	5	110	2
237	6	70	0
238	1	45	0
238	2	30	0
238	3	15	0
238	4	85	1
238	5	65	0
238	6	65	0
239	1	45	0
239	2	63	0
239	3	37	0
239	4	65	0
239	5	55	0
239	6	95	1
240	1	45	0
240	2	75	0
240	3	37	0
240	4	70	0
240	5	55	0
240	6	83	1
241	1	95	0
241	2	80	0
241	3	105	2
241	4	40	0
241	5	70	0
241	6	100	0
242	1	255	3
242	2	10	0
242	3	10	0
242	4	75	0
242	5	135	0
242	6	55	0
243	1	90	0
243	2	85	0
243	3	75	0
243	4	115	1
243	5	100	0
243	6	115	2
244	1	115	1
244	2	115	2
244	3	85	0
244	4	90	0
244	5	75	0
244	6	100	0
245	1	100	0
245	2	75	0
245	3	115	1
245	4	90	0
245	5	115	2
245	6	85	0
246	1	50	0
246	2	64	1
246	3	50	0
246	4	45	0
246	5	50	0
246	6	41	0
247	1	70	0
247	2	84	2
247	3	70	0
247	4	65	0
247	5	70	0
247	6	51	0
248	1	100	0
248	2	134	3
248	3	110	0
248	4	95	0
248	5	100	0
248	6	61	0
249	1	106	0
249	2	90	0
249	3	130	0
249	4	90	0
249	5	154	3
249	6	110	0
250	1	106	0
250	2	130	0
250	3	90	0
250	4	110	0
250	5	154	3
250	6	90	0
251	1	100	3
251	2	100	0
251	3	100	0
251	4	100	0
251	5	100	0
251	6	100	0
252	1	40	0
252	2	45	0
252	3	35	0
252	4	65	0
252	5	55	0
252	6	70	1
253	1	50	0
253	2	65	0
253	3	45	0
253	4	85	0
253	5	65	0
253	6	95	2
254	1	70	0
254	2	85	0
254	3	65	0
254	4	105	0
254	5	85	0
254	6	120	3
255	1	45	0
255	2	60	0
255	3	40	0
255	4	70	1
255	5	50	0
255	6	45	0
256	1	60	0
256	2	85	1
256	3	60	0
256	4	85	1
256	5	60	0
256	6	55	0
257	1	80	0
257	2	120	3
257	3	70	0
257	4	110	0
257	5	70	0
257	6	80	0
258	1	50	0
258	2	70	1
258	3	50	0
258	4	50	0
258	5	50	0
258	6	40	0
259	1	70	0
259	2	85	2
259	3	70	0
259	4	60	0
259	5	70	0
259	6	50	0
260	1	100	0
260	2	110	3
260	3	90	0
260	4	85	0
260	5	90	0
260	6	60	0
261	1	35	0
261	2	55	1
261	3	35	0
261	4	30	0
261	5	30	0
261	6	35	0
262	1	70	0
262	2	90	2
262	3	70	0
262	4	60	0
262	5	60	0
262	6	70	0
263	1	38	0
263	2	30	0
263	3	41	0
263	4	30	0
263	5	41	0
263	6	60	1
264	1	78	0
264	2	70	0
264	3	61	0
264	4	50	0
264	5	61	0
264	6	100	2
265	1	45	1
265	2	45	0
265	3	35	0
265	4	20	0
265	5	30	0
265	6	20	0
266	1	50	0
266	2	35	0
266	3	55	2
266	4	25	0
266	5	25	0
266	6	15	0
267	1	60	0
267	2	70	0
267	3	50	0
267	4	100	3
267	5	50	0
267	6	65	0
268	1	50	0
268	2	35	0
268	3	55	2
268	4	25	0
268	5	25	0
268	6	15	0
269	1	60	0
269	2	50	0
269	3	70	0
269	4	50	0
269	5	90	3
269	6	65	0
270	1	40	0
270	2	30	0
270	3	30	0
270	4	40	0
270	5	50	1
270	6	30	0
271	1	60	0
271	2	50	0
271	3	50	0
271	4	60	0
271	5	70	2
271	6	50	0
272	1	80	0
272	2	70	0
272	3	70	0
272	4	90	0
272	5	100	3
272	6	70	0
273	1	40	0
273	2	40	0
273	3	50	1
273	4	30	0
273	5	30	0
273	6	30	0
274	1	70	0
274	2	70	2
274	3	40	0
274	4	60	0
274	5	40	0
274	6	60	0
275	1	90	0
275	2	100	3
275	3	60	0
275	4	90	0
275	5	60	0
275	6	80	0
276	1	40	0
276	2	55	0
276	3	30	0
276	4	30	0
276	5	30	0
276	6	85	1
277	1	60	0
277	2	85	0
277	3	60	0
277	4	50	0
277	5	50	0
277	6	125	2
278	1	40	0
278	2	30	0
278	3	30	0
278	4	55	0
278	5	30	0
278	6	85	1
279	1	60	0
279	2	50	0
279	3	100	2
279	4	85	0
279	5	70	0
279	6	65	0
280	1	28	0
280	2	25	0
280	3	25	0
280	4	45	1
280	5	35	0
280	6	40	0
281	1	38	0
281	2	35	0
281	3	35	0
281	4	65	2
281	5	55	0
281	6	50	0
282	1	68	0
282	2	65	0
282	3	65	0
282	4	125	3
282	5	115	0
282	6	80	0
283	1	40	0
283	2	30	0
283	3	32	0
283	4	50	0
283	5	52	0
283	6	65	1
284	1	70	0
284	2	60	0
284	3	62	0
284	4	80	1
284	5	82	1
284	6	60	0
285	1	60	1
285	2	40	0
285	3	60	0
285	4	40	0
285	5	60	0
285	6	35	0
286	1	60	0
286	2	130	2
286	3	80	0
286	4	60	0
286	5	60	0
286	6	70	0
287	1	60	1
287	2	60	0
287	3	60	0
287	4	35	0
287	5	35	0
287	6	30	0
288	1	80	0
288	2	80	0
288	3	80	0
288	4	55	0
288	5	55	0
288	6	90	2
289	1	150	3
289	2	160	0
289	3	100	0
289	4	95	0
289	5	65	0
289	6	100	0
290	1	31	0
290	2	45	0
290	3	90	1
290	4	30	0
290	5	30	0
290	6	40	0
291	1	61	0
291	2	90	0
291	3	45	0
291	4	50	0
291	5	50	0
291	6	160	2
292	1	1	2
292	2	90	0
292	3	45	0
292	4	30	0
292	5	30	0
292	6	40	0
293	1	64	1
293	2	51	0
293	3	23	0
293	4	51	0
293	5	23	0
293	6	28	0
294	1	84	2
294	2	71	0
294	3	43	0
294	4	71	0
294	5	43	0
294	6	48	0
295	1	104	3
295	2	91	0
295	3	63	0
295	4	91	0
295	5	73	0
295	6	68	0
296	1	72	1
296	2	60	0
296	3	30	0
296	4	20	0
296	5	30	0
296	6	25	0
297	1	144	2
297	2	120	0
297	3	60	0
297	4	40	0
297	5	60	0
297	6	50	0
298	1	50	1
298	2	20	0
298	3	40	0
298	4	20	0
298	5	40	0
298	6	20	0
299	1	30	0
299	2	45	0
299	3	135	1
299	4	45	0
299	5	90	0
299	6	30	0
300	1	50	0
300	2	45	0
300	3	45	0
300	4	35	0
300	5	35	0
300	6	50	1
301	1	70	1
301	2	65	0
301	3	65	0
301	4	55	0
301	5	55	0
301	6	70	1
302	1	50	0
302	2	75	1
302	3	75	1
302	4	65	0
302	5	65	0
302	6	50	0
303	1	50	0
303	2	85	1
303	3	85	1
303	4	55	0
303	5	55	0
303	6	50	0
304	1	50	0
304	2	70	0
304	3	100	1
304	4	40	0
304	5	40	0
304	6	30	0
305	1	60	0
305	2	90	0
305	3	140	2
305	4	50	0
305	5	50	0
305	6	40	0
306	1	70	0
306	2	110	0
306	3	180	3
306	4	60	0
306	5	60	0
306	6	50	0
307	1	30	0
307	2	40	0
307	3	55	0
307	4	40	0
307	5	55	0
307	6	60	1
308	1	60	0
308	2	60	0
308	3	75	0
308	4	60	0
308	5	75	0
308	6	80	2
309	1	40	0
309	2	45	0
309	3	40	0
309	4	65	0
309	5	40	0
309	6	65	1
310	1	70	0
310	2	75	0
310	3	60	0
310	4	105	0
310	5	60	0
310	6	105	2
311	1	60	0
311	2	50	0
311	3	40	0
311	4	85	0
311	5	75	0
311	6	95	1
312	1	60	0
312	2	40	0
312	3	50	0
312	4	75	0
312	5	85	0
312	6	95	1
313	1	65	0
313	2	73	0
313	3	55	0
313	4	47	0
313	5	75	0
313	6	85	1
314	1	65	0
314	2	47	0
314	3	55	0
314	4	73	0
314	5	75	0
314	6	85	1
315	1	50	0
315	2	60	0
315	3	45	0
315	4	100	2
315	5	80	0
315	6	65	0
316	1	70	1
316	2	43	0
316	3	53	0
316	4	43	0
316	5	53	0
316	6	40	0
317	1	100	2
317	2	73	0
317	3	83	0
317	4	73	0
317	5	83	0
317	6	55	0
318	1	45	0
318	2	90	1
318	3	20	0
318	4	65	0
318	5	20	0
318	6	65	0
319	1	70	0
319	2	120	2
319	3	40	0
319	4	95	0
319	5	40	0
319	6	95	0
320	1	130	1
320	2	70	0
320	3	35	0
320	4	70	0
320	5	35	0
320	6	60	0
321	1	170	2
321	2	90	0
321	3	45	0
321	4	90	0
321	5	45	0
321	6	60	0
322	1	60	0
322	2	60	0
322	3	40	0
322	4	65	1
322	5	45	0
322	6	35	0
323	1	70	0
323	2	100	1
323	3	70	0
323	4	105	1
323	5	75	0
323	6	40	0
324	1	70	0
324	2	85	0
324	3	140	2
324	4	85	0
324	5	70	0
324	6	20	0
325	1	60	0
325	2	25	0
325	3	35	0
325	4	70	0
325	5	80	1
325	6	60	0
326	1	80	0
326	2	45	0
326	3	65	0
326	4	90	0
326	5	110	2
326	6	80	0
327	1	60	0
327	2	60	0
327	3	60	0
327	4	60	1
327	5	60	0
327	6	60	0
328	1	45	0
328	2	100	1
328	3	45	0
328	4	45	0
328	5	45	0
328	6	10	0
329	1	50	0
329	2	70	1
329	3	50	0
329	4	50	0
329	5	50	0
329	6	70	1
330	1	80	0
330	2	100	1
330	3	80	0
330	4	80	0
330	5	80	0
330	6	100	2
331	1	50	0
331	2	85	0
331	3	40	0
331	4	85	1
331	5	40	0
331	6	35	0
332	1	70	0
332	2	115	1
332	3	60	0
332	4	115	1
332	5	60	0
332	6	55	0
333	1	45	0
333	2	40	0
333	3	60	0
333	4	40	0
333	5	75	1
333	6	50	0
334	1	75	0
334	2	70	0
334	3	90	0
334	4	70	0
334	5	105	2
334	6	80	0
335	1	73	0
335	2	115	2
335	3	60	0
335	4	60	0
335	5	60	0
335	6	90	0
336	1	73	0
336	2	100	1
336	3	60	0
336	4	100	1
336	5	60	0
336	6	65	0
337	1	70	0
337	2	55	0
337	3	65	0
337	4	95	2
337	5	85	0
337	6	70	0
338	1	70	0
338	2	95	2
338	3	85	0
338	4	55	0
338	5	65	0
338	6	70	0
339	1	50	1
339	2	48	0
339	3	43	0
339	4	46	0
339	5	41	0
339	6	60	0
340	1	110	2
340	2	78	0
340	3	73	0
340	4	76	0
340	5	71	0
340	6	60	0
341	1	43	0
341	2	80	1
341	3	65	0
341	4	50	0
341	5	35	0
341	6	35	0
342	1	63	0
342	2	120	2
342	3	85	0
342	4	90	0
342	5	55	0
342	6	55	0
343	1	40	0
343	2	40	0
343	3	55	0
343	4	40	0
343	5	70	1
343	6	55	0
344	1	60	0
344	2	70	0
344	3	105	0
344	4	70	0
344	5	120	2
344	6	75	0
345	1	66	0
345	2	41	0
345	3	77	0
345	4	61	0
345	5	87	1
345	6	23	0
346	1	86	0
346	2	81	0
346	3	97	0
346	4	81	0
346	5	107	2
346	6	43	0
347	1	45	0
347	2	95	1
347	3	50	0
347	4	40	0
347	5	50	0
347	6	75	0
348	1	75	0
348	2	125	2
348	3	100	0
348	4	70	0
348	5	80	0
348	6	45	0
349	1	20	0
349	2	15	0
349	3	20	0
349	4	10	0
349	5	55	0
349	6	80	1
350	1	95	0
350	2	60	0
350	3	79	0
350	4	100	0
350	5	125	2
350	6	81	0
351	1	70	1
351	2	70	0
351	3	70	0
351	4	70	0
351	5	70	0
351	6	70	0
352	1	60	0
352	2	90	0
352	3	70	0
352	4	60	0
352	5	120	1
352	6	40	0
353	1	44	0
353	2	75	1
353	3	35	0
353	4	63	0
353	5	33	0
353	6	45	0
354	1	64	0
354	2	115	2
354	3	65	0
354	4	83	0
354	5	63	0
354	6	65	0
355	1	20	0
355	2	40	0
355	3	90	0
355	4	30	0
355	5	90	1
355	6	25	0
356	1	40	0
356	2	70	0
356	3	130	1
356	4	60	0
356	5	130	1
356	6	25	0
357	1	99	2
357	2	68	0
357	3	83	0
357	4	72	0
357	5	87	0
357	6	51	0
358	1	65	0
358	2	50	0
358	3	70	0
358	4	95	1
358	5	80	1
358	6	65	0
359	1	65	0
359	2	130	2
359	3	60	0
359	4	75	0
359	5	60	0
359	6	75	0
360	1	95	1
360	2	23	0
360	3	48	0
360	4	23	0
360	5	48	0
360	6	23	0
361	1	50	1
361	2	50	0
361	3	50	0
361	4	50	0
361	5	50	0
361	6	50	0
362	1	80	2
362	2	80	0
362	3	80	0
362	4	80	0
362	5	80	0
362	6	80	0
363	1	70	1
363	2	40	0
363	3	50	0
363	4	55	0
363	5	50	0
363	6	25	0
364	1	90	2
364	2	60	0
364	3	70	0
364	4	75	0
364	5	70	0
364	6	45	0
365	1	110	3
365	2	80	0
365	3	90	0
365	4	95	0
365	5	90	0
365	6	65	0
366	1	35	0
366	2	64	0
366	3	85	1
366	4	74	0
366	5	55	0
366	6	32	0
367	1	55	0
367	2	104	1
367	3	105	1
367	4	94	0
367	5	75	0
367	6	52	0
368	1	55	0
368	2	84	0
368	3	105	0
368	4	114	2
368	5	75	0
368	6	52	0
369	1	100	1
369	2	90	0
369	3	130	1
369	4	45	0
369	5	65	0
369	6	55	0
370	1	43	0
370	2	30	0
370	3	55	0
370	4	40	0
370	5	65	0
370	6	97	1
371	1	45	0
371	2	75	1
371	3	60	0
371	4	40	0
371	5	30	0
371	6	50	0
372	1	65	0
372	2	95	0
372	3	100	2
372	4	60	0
372	5	50	0
372	6	50	0
373	1	95	0
373	2	135	3
373	3	80	0
373	4	110	0
373	5	80	0
373	6	100	0
374	1	40	0
374	2	55	0
374	3	80	1
374	4	35	0
374	5	60	0
374	6	30	0
375	1	60	0
375	2	75	0
375	3	100	2
375	4	55	0
375	5	80	0
375	6	50	0
376	1	80	0
376	2	135	0
376	3	130	3
376	4	95	0
376	5	90	0
376	6	70	0
377	1	80	0
377	2	100	0
377	3	200	3
377	4	50	0
377	5	100	0
377	6	50	0
378	1	80	0
378	2	50	0
378	3	100	0
378	4	100	0
378	5	200	3
378	6	50	0
379	1	80	0
379	2	75	0
379	3	150	2
379	4	75	0
379	5	150	1
379	6	50	0
380	1	80	0
380	2	80	0
380	3	90	0
380	4	110	0
380	5	130	3
380	6	110	0
381	1	80	0
381	2	90	0
381	3	80	0
381	4	130	3
381	5	110	0
381	6	110	0
382	1	100	0
382	2	100	0
382	3	90	0
382	4	150	3
382	5	140	0
382	6	90	0
383	1	100	0
383	2	150	3
383	3	140	0
383	4	100	0
383	5	90	0
383	6	90	0
384	1	105	0
384	2	150	2
384	3	90	0
384	4	150	1
384	5	90	0
384	6	95	0
385	1	100	3
385	2	100	0
385	3	100	0
385	4	100	0
385	5	100	0
385	6	100	0
386	1	50	0
386	2	150	1
386	3	50	0
386	4	150	1
386	5	50	0
386	6	150	1
387	1	55	0
387	2	68	1
387	3	64	0
387	4	45	0
387	5	55	0
387	6	31	0
388	1	75	0
388	2	89	1
388	3	85	1
388	4	55	0
388	5	65	0
388	6	36	0
389	1	95	0
389	2	109	2
389	3	105	1
389	4	75	0
389	5	85	0
389	6	56	0
390	1	44	0
390	2	58	0
390	3	44	0
390	4	58	0
390	5	44	0
390	6	61	1
391	1	64	0
391	2	78	0
391	3	52	0
391	4	78	1
391	5	52	0
391	6	81	1
392	1	76	0
392	2	104	1
392	3	71	0
392	4	104	1
392	5	71	0
392	6	108	1
393	1	53	0
393	2	51	0
393	3	53	0
393	4	61	1
393	5	56	0
393	6	40	0
394	1	64	0
394	2	66	0
394	3	68	0
394	4	81	2
394	5	76	0
394	6	50	0
395	1	84	0
395	2	86	0
395	3	88	0
395	4	111	3
395	5	101	0
395	6	60	0
396	1	40	0
396	2	55	0
396	3	30	0
396	4	30	0
396	5	30	0
396	6	60	1
397	1	55	0
397	2	75	0
397	3	50	0
397	4	40	0
397	5	40	0
397	6	80	2
398	1	85	0
398	2	120	3
398	3	70	0
398	4	50	0
398	5	60	0
398	6	100	0
399	1	59	1
399	2	45	0
399	3	40	0
399	4	35	0
399	5	40	0
399	6	31	0
400	1	79	0
400	2	85	2
400	3	60	0
400	4	55	0
400	5	60	0
400	6	71	0
401	1	37	0
401	2	25	0
401	3	41	1
401	4	25	0
401	5	41	0
401	6	25	0
402	1	77	0
402	2	85	2
402	3	51	0
402	4	55	0
402	5	51	0
402	6	65	0
403	1	45	0
403	2	65	1
403	3	34	0
403	4	40	0
403	5	34	0
403	6	45	0
404	1	60	0
404	2	85	2
404	3	49	0
404	4	60	0
404	5	49	0
404	6	60	0
405	1	80	0
405	2	120	3
405	3	79	0
405	4	95	0
405	5	79	0
405	6	70	0
406	1	40	0
406	2	30	0
406	3	35	0
406	4	50	1
406	5	70	0
406	6	55	0
407	1	60	0
407	2	70	0
407	3	65	0
407	4	125	3
407	5	105	0
407	6	90	0
408	1	67	0
408	2	125	1
408	3	40	0
408	4	30	0
408	5	30	0
408	6	58	0
409	1	97	0
409	2	165	2
409	3	60	0
409	4	65	0
409	5	50	0
409	6	58	0
410	1	30	0
410	2	42	0
410	3	118	1
410	4	42	0
410	5	88	0
410	6	30	0
411	1	60	0
411	2	52	0
411	3	168	2
411	4	47	0
411	5	138	0
411	6	30	0
412	1	40	0
412	2	29	0
412	3	45	0
412	4	29	0
412	5	45	1
412	6	36	0
413	1	60	0
413	2	59	0
413	3	85	0
413	4	79	0
413	5	105	2
413	6	36	0
414	1	70	0
414	2	94	1
414	3	50	0
414	4	94	1
414	5	50	0
414	6	66	0
415	1	30	0
415	2	30	0
415	3	42	0
415	4	30	0
415	5	42	0
415	6	70	1
416	1	70	0
416	2	80	0
416	3	102	1
416	4	80	0
416	5	102	1
416	6	40	0
417	1	60	0
417	2	45	0
417	3	70	0
417	4	45	0
417	5	90	0
417	6	95	1
418	1	55	0
418	2	65	0
418	3	35	0
418	4	60	0
418	5	30	0
418	6	85	1
419	1	85	0
419	2	105	0
419	3	55	0
419	4	85	0
419	5	50	0
419	6	115	2
420	1	45	0
420	2	35	0
420	3	45	0
420	4	62	1
420	5	53	0
420	6	35	0
421	1	70	0
421	2	60	0
421	3	70	0
421	4	87	2
421	5	78	0
421	6	85	0
422	1	76	1
422	2	48	0
422	3	48	0
422	4	57	0
422	5	62	0
422	6	34	0
423	1	111	2
423	2	83	0
423	3	68	0
423	4	92	0
423	5	82	0
423	6	39	0
424	1	75	0
424	2	100	0
424	3	66	0
424	4	60	0
424	5	66	0
424	6	115	2
425	1	90	1
425	2	50	0
425	3	34	0
425	4	60	0
425	5	44	0
425	6	70	0
426	1	150	2
426	2	80	0
426	3	44	0
426	4	90	0
426	5	54	0
426	6	80	0
427	1	55	0
427	2	66	0
427	3	44	0
427	4	44	0
427	5	56	0
427	6	85	1
428	1	65	0
428	2	76	0
428	3	84	0
428	4	54	0
428	5	96	0
428	6	105	2
429	1	60	0
429	2	60	0
429	3	60	0
429	4	105	1
429	5	105	1
429	6	105	0
430	1	100	0
430	2	125	2
430	3	52	0
430	4	105	0
430	5	52	0
430	6	71	0
431	1	49	0
431	2	55	0
431	3	42	0
431	4	42	0
431	5	37	0
431	6	85	1
432	1	71	0
432	2	82	0
432	3	64	0
432	4	64	0
432	5	59	0
432	6	112	2
433	1	45	0
433	2	30	0
433	3	50	0
433	4	65	1
433	5	50	0
433	6	45	0
434	1	63	0
434	2	63	0
434	3	47	0
434	4	41	0
434	5	41	0
434	6	74	1
435	1	103	2
435	2	93	0
435	3	67	0
435	4	71	0
435	5	61	0
435	6	84	0
436	1	57	0
436	2	24	0
436	3	86	1
436	4	24	0
436	5	86	0
436	6	23	0
437	1	67	0
437	2	89	0
437	3	116	1
437	4	79	0
437	5	116	1
437	6	33	0
438	1	50	0
438	2	80	0
438	3	95	1
438	4	10	0
438	5	45	0
438	6	10	0
439	1	20	0
439	2	25	0
439	3	45	0
439	4	70	0
439	5	90	1
439	6	60	0
440	1	100	1
440	2	5	0
440	3	5	0
440	4	15	0
440	5	65	0
440	6	30	0
441	1	76	0
441	2	65	1
441	3	45	0
441	4	92	0
441	5	42	0
441	6	91	0
442	1	50	0
442	2	92	0
442	3	108	1
442	4	92	0
442	5	108	1
442	6	35	0
443	1	58	0
443	2	70	1
443	3	45	0
443	4	40	0
443	5	45	0
443	6	42	0
444	1	68	0
444	2	90	2
444	3	65	0
444	4	50	0
444	5	55	0
444	6	82	0
445	1	108	0
445	2	130	3
445	3	95	0
445	4	80	0
445	5	85	0
445	6	102	0
446	1	135	1
446	2	85	0
446	3	40	0
446	4	40	0
446	5	85	0
446	6	5	0
447	1	40	0
447	2	70	1
447	3	40	0
447	4	35	0
447	5	40	0
447	6	60	0
448	1	70	0
448	2	110	1
448	3	70	0
448	4	115	1
448	5	70	0
448	6	90	0
449	1	68	0
449	2	72	0
449	3	78	1
449	4	38	0
449	5	42	0
449	6	32	0
450	1	108	0
450	2	112	0
450	3	118	2
450	4	68	0
450	5	72	0
450	6	47	0
451	1	40	0
451	2	50	0
451	3	90	1
451	4	30	0
451	5	55	0
451	6	65	0
452	1	70	0
452	2	90	0
452	3	110	2
452	4	60	0
452	5	75	0
452	6	95	0
453	1	48	0
453	2	61	1
453	3	40	0
453	4	61	0
453	5	40	0
453	6	50	0
454	1	83	0
454	2	106	2
454	3	65	0
454	4	86	0
454	5	65	0
454	6	85	0
455	1	74	0
455	2	100	2
455	3	72	0
455	4	90	0
455	5	72	0
455	6	46	0
456	1	49	0
456	2	49	0
456	3	56	0
456	4	49	0
456	5	61	0
456	6	66	1
457	1	69	0
457	2	69	0
457	3	76	0
457	4	69	0
457	5	86	0
457	6	91	2
458	1	45	0
458	2	20	0
458	3	50	0
458	4	60	0
458	5	120	1
458	6	50	0
459	1	60	0
459	2	62	1
459	3	50	0
459	4	62	0
459	5	60	0
459	6	40	0
460	1	90	0
460	2	92	1
460	3	75	0
460	4	92	1
460	5	85	0
460	6	60	0
461	1	70	0
461	2	120	1
461	3	65	0
461	4	45	0
461	5	85	0
461	6	125	1
462	1	70	0
462	2	70	0
462	3	115	0
462	4	130	3
462	5	90	0
462	6	60	0
463	1	110	3
463	2	85	0
463	3	95	0
463	4	80	0
463	5	95	0
463	6	50	0
464	1	115	0
464	2	140	3
464	3	130	0
464	4	55	0
464	5	55	0
464	6	40	0
465	1	100	0
465	2	100	0
465	3	125	2
465	4	110	0
465	5	50	0
465	6	50	0
466	1	75	0
466	2	123	3
466	3	67	0
466	4	95	0
466	5	85	0
466	6	95	0
467	1	75	0
467	2	95	0
467	3	67	0
467	4	125	3
467	5	95	0
467	6	83	0
468	1	85	0
468	2	50	0
468	3	95	0
468	4	120	2
468	5	115	1
468	6	80	0
469	1	86	0
469	2	76	2
469	3	86	0
469	4	116	0
469	5	56	0
469	6	95	0
470	1	65	0
470	2	110	0
470	3	130	2
470	4	60	0
470	5	65	0
470	6	95	0
471	1	65	0
471	2	60	0
471	3	110	0
471	4	130	2
471	5	95	0
471	6	65	0
472	1	75	0
472	2	95	0
472	3	125	2
472	4	45	0
472	5	75	0
472	6	95	0
473	1	110	0
473	2	130	3
473	3	80	0
473	4	70	0
473	5	60	0
473	6	80	0
474	1	85	0
474	2	80	0
474	3	70	0
474	4	135	3
474	5	75	0
474	6	90	0
475	1	68	0
475	2	125	3
475	3	65	0
475	4	65	0
475	5	115	0
475	6	80	0
476	1	60	0
476	2	55	0
476	3	145	1
476	4	75	0
476	5	150	2
476	6	40	0
477	1	45	0
477	2	100	0
477	3	135	1
477	4	65	0
477	5	135	2
477	6	45	0
478	1	70	0
478	2	80	0
478	3	70	0
478	4	80	0
478	5	70	0
478	6	110	2
479	1	50	0
479	2	50	0
479	3	77	0
479	4	95	1
479	5	77	0
479	6	91	1
480	1	75	0
480	2	75	0
480	3	130	2
480	4	75	0
480	5	130	1
480	6	95	0
481	1	80	0
481	2	105	1
481	3	105	0
481	4	105	1
481	5	105	1
481	6	80	0
482	1	75	0
482	2	125	2
482	3	70	0
482	4	125	1
482	5	70	0
482	6	115	0
483	1	100	0
483	2	120	0
483	3	120	0
483	4	150	3
483	5	100	0
483	6	90	0
484	1	90	0
484	2	120	0
484	3	100	0
484	4	150	3
484	5	120	0
484	6	100	0
485	1	91	0
485	2	90	0
485	3	106	0
485	4	130	3
485	5	106	0
485	6	77	0
486	1	110	0
486	2	160	3
486	3	110	0
486	4	80	0
486	5	110	0
486	6	100	0
487	1	150	3
487	2	100	0
487	3	120	0
487	4	100	0
487	5	120	0
487	6	90	0
488	1	120	0
488	2	70	0
488	3	120	0
488	4	75	0
488	5	130	3
488	6	85	0
489	1	80	1
489	2	80	0
489	3	80	0
489	4	80	0
489	5	80	0
489	6	80	0
490	1	100	3
490	2	100	0
490	3	100	0
490	4	100	0
490	5	100	0
490	6	100	0
491	1	70	0
491	2	90	0
491	3	90	0
491	4	135	2
491	5	90	0
491	6	125	1
492	1	100	3
492	2	100	0
492	3	100	0
492	4	100	0
492	5	100	0
492	6	100	0
493	1	120	3
493	2	120	0
493	3	120	0
493	4	120	0
493	5	120	0
493	6	120	0
494	1	100	3
494	2	100	0
494	3	100	0
494	4	100	0
494	5	100	0
494	6	100	0
495	1	45	0
495	2	45	0
495	3	55	0
495	4	45	0
495	5	55	0
495	6	63	1
496	1	60	0
496	2	60	0
496	3	75	0
496	4	60	0
496	5	75	0
496	6	83	2
497	1	75	0
497	2	75	0
497	3	95	0
497	4	75	0
497	5	95	0
497	6	113	3
498	1	65	1
498	2	63	0
498	3	45	0
498	4	45	0
498	5	45	0
498	6	45	0
499	1	90	0
499	2	93	2
499	3	55	0
499	4	70	0
499	5	55	0
499	6	55	0
500	1	110	0
500	2	123	3
500	3	65	0
500	4	100	0
500	5	65	0
500	6	65	0
501	1	55	0
501	2	55	0
501	3	45	0
501	4	63	1
501	5	45	0
501	6	45	0
502	1	75	0
502	2	75	0
502	3	60	0
502	4	83	2
502	5	60	0
502	6	60	0
503	1	95	0
503	2	100	0
503	3	85	0
503	4	108	3
503	5	70	0
503	6	70	0
504	1	45	0
504	2	55	1
504	3	39	0
504	4	35	0
504	5	39	0
504	6	42	0
505	1	60	0
505	2	85	2
505	3	69	0
505	4	60	0
505	5	69	0
505	6	77	0
506	1	45	0
506	2	60	1
506	3	45	0
506	4	25	0
506	5	45	0
506	6	55	0
507	1	65	0
507	2	80	2
507	3	65	0
507	4	35	0
507	5	65	0
507	6	60	0
508	1	85	0
508	2	110	3
508	3	90	0
508	4	45	0
508	5	90	0
508	6	80	0
509	1	41	0
509	2	50	0
509	3	37	0
509	4	50	0
509	5	37	0
509	6	66	1
510	1	64	0
510	2	88	0
510	3	50	0
510	4	88	0
510	5	50	0
510	6	106	2
511	1	50	0
511	2	53	0
511	3	48	0
511	4	53	0
511	5	48	0
511	6	64	1
512	1	75	0
512	2	98	0
512	3	63	0
512	4	98	0
512	5	63	0
512	6	101	2
513	1	50	0
513	2	53	0
513	3	48	0
513	4	53	0
513	5	48	0
513	6	64	1
514	1	75	0
514	2	98	0
514	3	63	0
514	4	98	0
514	5	63	0
514	6	101	2
515	1	50	0
515	2	53	0
515	3	48	0
515	4	53	0
515	5	48	0
515	6	64	1
516	1	75	0
516	2	98	0
516	3	63	0
516	4	98	0
516	5	63	0
516	6	101	2
517	1	76	1
517	2	25	0
517	3	45	0
517	4	67	0
517	5	55	0
517	6	24	0
518	1	116	2
518	2	55	0
518	3	85	0
518	4	107	0
518	5	95	0
518	6	29	0
519	1	50	0
519	2	55	1
519	3	50	0
519	4	36	0
519	5	30	0
519	6	43	0
520	1	62	0
520	2	77	2
520	3	62	0
520	4	50	0
520	5	42	0
520	6	65	0
521	1	80	0
521	2	115	3
521	3	80	0
521	4	65	0
521	5	55	0
521	6	93	0
522	1	45	0
522	2	60	0
522	3	32	0
522	4	50	0
522	5	32	0
522	6	76	1
523	1	75	0
523	2	100	0
523	3	63	0
523	4	80	0
523	5	63	0
523	6	116	2
524	1	55	0
524	2	75	0
524	3	85	1
524	4	25	0
524	5	25	0
524	6	15	0
525	1	70	0
525	2	105	1
525	3	105	1
525	4	50	0
525	5	40	0
525	6	20	0
526	1	85	0
526	2	135	3
526	3	130	0
526	4	60	0
526	5	80	0
526	6	25	0
527	1	55	0
527	2	45	0
527	3	43	0
527	4	55	0
527	5	43	0
527	6	72	1
528	1	67	0
528	2	57	0
528	3	55	0
528	4	77	0
528	5	55	0
528	6	114	2
529	1	60	0
529	2	85	1
529	3	40	0
529	4	30	0
529	5	45	0
529	6	68	0
530	1	110	0
530	2	135	2
530	3	60	0
530	4	50	0
530	5	65	0
530	6	88	0
531	1	103	2
531	2	60	0
531	3	86	0
531	4	60	0
531	5	86	0
531	6	50	0
532	1	75	0
532	2	80	1
532	3	55	0
532	4	25	0
532	5	35	0
532	6	35	0
533	1	85	0
533	2	105	2
533	3	85	0
533	4	40	0
533	5	50	0
533	6	40	0
534	1	105	0
534	2	140	3
534	3	95	0
534	4	55	0
534	5	65	0
534	6	45	0
535	1	50	0
535	2	50	0
535	3	40	0
535	4	50	0
535	5	40	0
535	6	64	1
536	1	75	2
536	2	65	0
536	3	55	0
536	4	65	0
536	5	55	0
536	6	69	0
537	1	105	3
537	2	95	0
537	3	75	0
537	4	85	0
537	5	75	0
537	6	74	0
538	1	120	2
538	2	100	0
538	3	85	0
538	4	30	0
538	5	85	0
538	6	45	0
539	1	75	0
539	2	125	2
539	3	75	0
539	4	30	0
539	5	75	0
539	6	85	0
540	1	45	0
540	2	53	0
540	3	70	1
540	4	40	0
540	5	60	0
540	6	42	0
541	1	55	0
541	2	63	0
541	3	90	2
541	4	50	0
541	5	80	0
541	6	42	0
542	1	75	0
542	2	103	3
542	3	80	0
542	4	70	0
542	5	80	0
542	6	92	0
543	1	30	0
543	2	45	0
543	3	59	1
543	4	30	0
543	5	39	0
543	6	57	0
544	1	40	0
544	2	55	0
544	3	99	2
544	4	40	0
544	5	79	0
544	6	47	0
545	1	60	0
545	2	100	0
545	3	89	0
545	4	55	0
545	5	69	0
545	6	112	3
546	1	40	0
546	2	27	0
546	3	60	0
546	4	37	0
546	5	50	0
546	6	66	1
547	1	60	0
547	2	67	0
547	3	85	0
547	4	77	0
547	5	75	0
547	6	116	2
548	1	45	0
548	2	35	0
548	3	50	0
548	4	70	1
548	5	50	0
548	6	30	0
549	1	70	0
549	2	60	0
549	3	75	0
549	4	110	2
549	5	75	0
549	6	90	0
550	1	70	0
550	2	92	0
550	3	65	0
550	4	80	0
550	5	55	0
550	6	98	2
551	1	50	0
551	2	72	1
551	3	35	0
551	4	35	0
551	5	35	0
551	6	65	0
552	1	60	0
552	2	82	2
552	3	45	0
552	4	45	0
552	5	45	0
552	6	74	0
553	1	95	0
553	2	117	3
553	3	80	0
553	4	65	0
553	5	70	0
553	6	92	0
554	1	70	0
554	2	90	1
554	3	45	0
554	4	15	0
554	5	45	0
554	6	50	0
555	1	105	0
555	2	140	2
555	3	55	0
555	4	30	0
555	5	55	0
555	6	95	0
556	1	75	0
556	2	86	0
556	3	67	0
556	4	106	2
556	5	67	0
556	6	60	0
557	1	50	0
557	2	65	0
557	3	85	1
557	4	35	0
557	5	35	0
557	6	55	0
558	1	70	0
558	2	95	0
558	3	125	2
558	4	65	0
558	5	75	0
558	6	45	0
559	1	50	0
559	2	75	1
559	3	70	0
559	4	35	0
559	5	70	0
559	6	48	0
560	1	65	0
560	2	90	0
560	3	115	1
560	4	45	0
560	5	115	1
560	6	58	0
561	1	72	0
561	2	58	0
561	3	80	0
561	4	103	2
561	5	80	0
561	6	97	0
562	1	38	0
562	2	30	0
562	3	85	1
562	4	55	0
562	5	65	0
562	6	30	0
563	1	58	0
563	2	50	0
563	3	145	2
563	4	95	0
563	5	105	0
563	6	30	0
564	1	54	0
564	2	78	0
564	3	103	1
564	4	53	0
564	5	45	0
564	6	22	0
565	1	74	0
565	2	108	0
565	3	133	2
565	4	83	0
565	5	65	0
565	6	32	0
566	1	55	0
566	2	112	1
566	3	45	0
566	4	74	0
566	5	45	0
566	6	70	0
567	1	75	0
567	2	140	2
567	3	65	0
567	4	112	0
567	5	65	0
567	6	110	0
568	1	50	0
568	2	50	0
568	3	62	0
568	4	40	0
568	5	62	0
568	6	65	1
569	1	80	0
569	2	95	2
569	3	82	0
569	4	60	0
569	5	82	0
569	6	75	0
570	1	40	0
570	2	65	0
570	3	40	0
570	4	80	1
570	5	40	0
570	6	65	0
571	1	60	0
571	2	105	0
571	3	60	0
571	4	120	2
571	5	60	0
571	6	105	0
572	1	55	0
572	2	50	0
572	3	40	0
572	4	40	0
572	5	40	0
572	6	75	1
573	1	75	0
573	2	95	0
573	3	60	0
573	4	65	0
573	5	60	0
573	6	115	2
574	1	45	0
574	2	30	0
574	3	50	0
574	4	55	0
574	5	65	1
574	6	45	0
575	1	60	0
575	2	45	0
575	3	70	0
575	4	75	0
575	5	85	2
575	6	55	0
576	1	70	0
576	2	55	0
576	3	95	0
576	4	95	0
576	5	110	3
576	6	65	0
577	1	45	0
577	2	30	0
577	3	40	0
577	4	105	1
577	5	50	0
577	6	20	0
578	1	65	0
578	2	40	0
578	3	50	0
578	4	125	2
578	5	60	0
578	6	30	0
579	1	110	0
579	2	65	0
579	3	75	0
579	4	125	3
579	5	85	0
579	6	30	0
580	1	62	1
580	2	44	0
580	3	50	0
580	4	44	0
580	5	50	0
580	6	55	0
581	1	75	0
581	2	87	0
581	3	63	0
581	4	87	0
581	5	63	0
581	6	98	2
582	1	36	0
582	2	50	0
582	3	50	0
582	4	65	1
582	5	60	0
582	6	44	0
583	1	51	0
583	2	65	0
583	3	65	0
583	4	80	2
583	5	75	0
583	6	59	0
584	1	71	0
584	2	95	0
584	3	85	0
584	4	110	3
584	5	95	0
584	6	79	0
585	1	60	0
585	2	60	0
585	3	50	0
585	4	40	0
585	5	50	0
585	6	75	1
586	1	80	0
586	2	100	2
586	3	70	0
586	4	60	0
586	5	70	0
586	6	95	0
587	1	55	0
587	2	75	0
587	3	60	0
587	4	75	0
587	5	60	0
587	6	103	2
588	1	50	0
588	2	75	1
588	3	45	0
588	4	40	0
588	5	45	0
588	6	60	0
589	1	70	0
589	2	135	2
589	3	105	0
589	4	60	0
589	5	105	0
589	6	20	0
590	1	69	1
590	2	55	0
590	3	45	0
590	4	55	0
590	5	55	0
590	6	15	0
591	1	114	2
591	2	85	0
591	3	70	0
591	4	85	0
591	5	80	0
591	6	30	0
592	1	55	0
592	2	40	0
592	3	50	0
592	4	65	0
592	5	85	1
592	6	40	0
593	1	100	0
593	2	60	0
593	3	70	0
593	4	85	0
593	5	105	2
593	6	60	0
594	1	165	2
594	2	75	0
594	3	80	0
594	4	40	0
594	5	45	0
594	6	65	0
595	1	50	0
595	2	47	0
595	3	50	0
595	4	57	0
595	5	50	0
595	6	65	1
596	1	70	0
596	2	77	0
596	3	60	0
596	4	97	0
596	5	60	0
596	6	108	2
597	1	44	0
597	2	50	0
597	3	91	1
597	4	24	0
597	5	86	0
597	6	10	0
598	1	74	0
598	2	94	0
598	3	131	2
598	4	54	0
598	5	116	0
598	6	20	0
599	1	40	0
599	2	55	0
599	3	70	1
599	4	45	0
599	5	60	0
599	6	30	0
600	1	60	0
600	2	80	0
600	3	95	2
600	4	70	0
600	5	85	0
600	6	50	0
601	1	60	0
601	2	100	0
601	3	115	3
601	4	70	0
601	5	85	0
601	6	90	0
602	1	35	0
602	2	55	0
602	3	40	0
602	4	45	0
602	5	40	0
602	6	60	1
603	1	65	0
603	2	85	2
603	3	70	0
603	4	75	0
603	5	70	0
603	6	40	0
604	1	85	0
604	2	115	3
604	3	80	0
604	4	105	0
604	5	80	0
604	6	50	0
605	1	55	0
605	2	55	0
605	3	55	0
605	4	85	1
605	5	55	0
605	6	30	0
606	1	75	0
606	2	75	0
606	3	75	0
606	4	125	2
606	5	95	0
606	6	40	0
607	1	50	0
607	2	30	0
607	3	55	0
607	4	65	1
607	5	55	0
607	6	20	0
608	1	60	0
608	2	40	0
608	3	60	0
608	4	95	2
608	5	60	0
608	6	55	0
609	1	60	0
609	2	55	0
609	3	90	0
609	4	145	3
609	5	90	0
609	6	80	0
610	1	46	0
610	2	87	1
610	3	60	0
610	4	30	0
610	5	40	0
610	6	57	0
611	1	66	0
611	2	117	2
611	3	70	0
611	4	40	0
611	5	50	0
611	6	67	0
612	1	76	0
612	2	147	3
612	3	90	0
612	4	60	0
612	5	70	0
612	6	97	0
613	1	55	0
613	2	70	1
613	3	40	0
613	4	60	0
613	5	40	0
613	6	40	0
614	1	95	0
614	2	110	2
614	3	80	0
614	4	70	0
614	5	80	0
614	6	50	0
615	1	70	0
615	2	50	0
615	3	30	0
615	4	95	0
615	5	135	2
615	6	105	0
616	1	50	0
616	2	40	0
616	3	85	1
616	4	40	0
616	5	65	0
616	6	25	0
617	1	80	0
617	2	70	0
617	3	40	0
617	4	100	0
617	5	60	0
617	6	145	2
618	1	109	2
618	2	66	0
618	3	84	0
618	4	81	0
618	5	99	0
618	6	32	0
619	1	45	0
619	2	85	1
619	3	50	0
619	4	55	0
619	5	50	0
619	6	65	0
620	1	65	0
620	2	125	2
620	3	60	0
620	4	95	0
620	5	60	0
620	6	105	0
621	1	77	0
621	2	120	2
621	3	90	0
621	4	60	0
621	5	90	0
621	6	48	0
622	1	59	0
622	2	74	1
622	3	50	0
622	4	35	0
622	5	50	0
622	6	35	0
623	1	89	0
623	2	124	2
623	3	80	0
623	4	55	0
623	5	80	0
623	6	55	0
624	1	45	0
624	2	85	1
624	3	70	0
624	4	40	0
624	5	40	0
624	6	60	0
625	1	65	0
625	2	125	2
625	3	100	0
625	4	60	0
625	5	70	0
625	6	70	0
626	1	95	0
626	2	110	2
626	3	95	0
626	4	40	0
626	5	95	0
626	6	55	0
627	1	70	0
627	2	83	1
627	3	50	0
627	4	37	0
627	5	50	0
627	6	60	0
628	1	100	0
628	2	123	2
628	3	75	0
628	4	57	0
628	5	75	0
628	6	80	0
629	1	70	0
629	2	55	0
629	3	75	1
629	4	45	0
629	5	65	0
629	6	60	0
630	1	110	0
630	2	65	0
630	3	105	0
630	4	55	2
630	5	95	0
630	6	80	0
631	1	85	0
631	2	97	0
631	3	66	0
631	4	105	2
631	5	66	0
631	6	65	0
632	1	58	0
632	2	109	0
632	3	112	2
632	4	48	0
632	5	48	0
632	6	109	0
633	1	52	0
633	2	65	1
633	3	50	0
633	4	45	0
633	5	50	0
633	6	38	0
634	1	72	0
634	2	85	2
634	3	70	0
634	4	65	0
634	5	70	0
634	6	58	0
635	1	92	0
635	2	105	0
635	3	90	0
635	4	125	3
635	5	90	0
635	6	98	0
636	1	55	0
636	2	85	1
636	3	55	0
636	4	50	0
636	5	55	0
636	6	60	0
637	1	85	0
637	2	60	0
637	3	65	0
637	4	135	3
637	5	105	0
637	6	100	0
638	1	91	0
638	2	90	0
638	3	129	3
638	4	90	0
638	5	72	0
638	6	108	0
639	1	91	0
639	2	129	3
639	3	90	0
639	4	72	0
639	5	90	0
639	6	108	0
640	1	91	0
640	2	90	0
640	3	72	0
640	4	90	0
640	5	129	3
640	6	108	0
641	1	79	0
641	2	115	3
641	3	70	0
641	4	125	0
641	5	80	0
641	6	111	0
642	1	79	0
642	2	115	3
642	3	70	0
642	4	125	0
642	5	80	0
642	6	111	0
643	1	100	0
643	2	120	0
643	3	100	0
643	4	150	3
643	5	120	0
643	6	90	0
644	1	100	0
644	2	150	3
644	3	120	0
644	4	120	0
644	5	100	0
644	6	90	0
645	1	89	0
645	2	125	0
645	3	90	0
645	4	115	3
645	5	80	0
645	6	101	0
646	1	125	1
646	2	130	1
646	3	90	0
646	4	130	1
646	5	90	0
646	6	95	0
647	1	91	0
647	2	72	0
647	3	90	0
647	4	129	3
647	5	90	0
647	6	108	0
648	1	100	0
648	2	77	0
648	3	77	0
648	4	128	1
648	5	128	1
648	6	90	1
649	1	71	0
649	2	120	1
649	3	95	0
649	4	120	1
649	5	95	0
649	6	99	1
650	1	56	0
650	2	61	0
650	3	65	1
650	4	48	0
650	5	45	0
650	6	38	0
651	1	61	0
651	2	78	0
651	3	95	2
651	4	56	0
651	5	58	0
651	6	57	0
652	1	88	0
652	2	107	0
652	3	122	3
652	4	74	0
652	5	75	0
652	6	64	0
653	1	40	0
653	2	45	0
653	3	40	0
653	4	62	1
653	5	60	0
653	6	60	0
654	1	59	0
654	2	59	0
654	3	58	0
654	4	90	2
654	5	70	0
654	6	73	0
655	1	75	0
655	2	69	0
655	3	72	0
655	4	114	3
655	5	100	0
655	6	104	0
656	1	41	0
656	2	56	0
656	3	40	0
656	4	62	0
656	5	44	0
656	6	71	1
657	1	54	0
657	2	63	0
657	3	52	0
657	4	83	0
657	5	56	0
657	6	97	2
658	1	72	0
658	2	95	0
658	3	67	0
658	4	103	0
658	5	71	0
658	6	122	3
659	1	38	0
659	2	36	0
659	3	38	0
659	4	32	0
659	5	36	0
659	6	57	1
660	1	85	2
660	2	56	0
660	3	77	0
660	4	50	0
660	5	77	0
660	6	78	0
661	1	45	0
661	2	50	0
661	3	43	0
661	4	40	0
661	5	38	0
661	6	62	1
662	1	62	0
662	2	73	0
662	3	55	0
662	4	56	0
662	5	52	0
662	6	84	2
663	1	78	0
663	2	81	0
663	3	71	0
663	4	74	0
663	5	69	0
663	6	126	3
664	1	38	0
664	2	35	0
664	3	40	1
664	4	27	0
664	5	25	0
664	6	35	0
665	1	45	0
665	2	22	0
665	3	60	2
665	4	27	0
665	5	30	0
665	6	29	0
666	1	80	1
666	2	52	0
666	3	50	0
666	4	90	1
666	5	50	0
666	6	89	1
667	1	62	0
667	2	50	0
667	3	58	0
667	4	73	1
667	5	54	0
667	6	72	0
668	1	86	0
668	2	68	0
668	3	72	0
668	4	109	2
668	5	66	0
668	6	106	0
669	1	44	0
669	2	38	0
669	3	39	0
669	4	61	0
669	5	79	1
669	6	42	0
670	1	54	0
670	2	45	0
670	3	47	0
670	4	75	0
670	5	98	2
670	6	52	0
671	1	78	0
671	2	65	0
671	3	68	0
671	4	112	0
671	5	154	3
671	6	75	0
672	1	66	1
672	2	65	0
672	3	48	0
672	4	62	0
672	5	57	0
672	6	52	0
673	1	123	2
673	2	100	0
673	3	62	0
673	4	97	0
673	5	81	0
673	6	68	0
674	1	67	0
674	2	82	1
674	3	62	0
674	4	46	0
674	5	48	0
674	6	43	0
675	1	95	0
675	2	124	2
675	3	78	0
675	4	69	0
675	5	71	0
675	6	58	0
676	1	75	0
676	2	80	0
676	3	60	0
676	4	65	0
676	5	90	0
676	6	102	1
677	1	62	0
677	2	48	0
677	3	54	0
677	4	63	0
677	5	60	0
677	6	68	1
678	1	74	0
678	2	48	0
678	3	76	0
678	4	83	0
678	5	81	0
678	6	104	2
679	1	45	0
679	2	80	0
679	3	100	1
679	4	35	0
679	5	37	0
679	6	28	0
680	1	59	0
680	2	110	0
680	3	150	2
680	4	45	0
680	5	49	0
680	6	35	0
681	1	60	0
681	2	50	0
681	3	150	2
681	4	50	0
681	5	150	1
681	6	60	0
682	1	78	1
682	2	52	0
682	3	60	0
682	4	63	0
682	5	65	0
682	6	23	0
683	1	101	2
683	2	72	0
683	3	72	0
683	4	99	0
683	5	89	0
683	6	29	0
684	1	62	0
684	2	48	0
684	3	66	1
684	4	59	0
684	5	57	0
684	6	49	0
685	1	82	0
685	2	80	0
685	3	86	2
685	4	85	0
685	5	75	0
685	6	72	0
686	1	53	0
686	2	54	1
686	3	53	0
686	4	37	0
686	5	46	0
686	6	45	0
687	1	86	0
687	2	92	2
687	3	88	0
687	4	68	0
687	5	75	0
687	6	73	0
688	1	42	0
688	2	52	1
688	3	67	0
688	4	39	0
688	5	56	0
688	6	50	0
689	1	72	0
689	2	105	2
689	3	115	0
689	4	54	0
689	5	86	0
689	6	68	0
690	1	50	0
690	2	60	0
690	3	60	0
690	4	60	0
690	5	60	1
690	6	30	0
691	1	65	0
691	2	75	0
691	3	90	0
691	4	97	0
691	5	123	2
691	6	44	0
692	1	50	0
692	2	53	0
692	3	62	0
692	4	58	1
692	5	63	0
692	6	44	0
693	1	71	0
693	2	73	0
693	3	88	0
693	4	120	2
693	5	89	0
693	6	59	0
694	1	44	0
694	2	38	0
694	3	33	0
694	4	61	0
694	5	43	0
694	6	70	1
695	1	62	0
695	2	55	0
695	3	52	0
695	4	109	1
695	5	94	0
695	6	109	1
696	1	58	0
696	2	89	1
696	3	77	0
696	4	45	0
696	5	45	0
696	6	48	0
697	1	82	0
697	2	121	2
697	3	119	0
697	4	69	0
697	5	59	0
697	6	71	0
698	1	77	1
698	2	59	0
698	3	50	0
698	4	67	0
698	5	63	0
698	6	46	0
699	1	123	2
699	2	77	0
699	3	72	0
699	4	99	0
699	5	92	0
699	6	58	0
700	1	95	0
700	2	65	0
700	3	65	0
700	4	110	0
700	5	130	2
700	6	60	0
701	1	78	0
701	2	92	2
701	3	75	0
701	4	74	0
701	5	63	0
701	6	118	0
702	1	67	0
702	2	58	0
702	3	57	0
702	4	81	0
702	5	67	0
702	6	101	2
703	1	50	0
703	2	50	0
703	3	150	1
703	4	50	0
703	5	150	1
703	6	50	0
704	1	45	0
704	2	50	0
704	3	35	0
704	4	55	0
704	5	75	1
704	6	40	0
705	1	68	0
705	2	75	0
705	3	53	0
705	4	83	0
705	5	113	2
705	6	60	0
706	1	90	0
706	2	100	0
706	3	70	0
706	4	110	0
706	5	150	3
706	6	80	0
707	1	57	0
707	2	80	0
707	3	91	1
707	4	80	0
707	5	87	0
707	6	75	0
708	1	43	0
708	2	70	1
708	3	48	0
708	4	50	0
708	5	60	0
708	6	38	0
709	1	85	0
709	2	110	2
709	3	76	0
709	4	65	0
709	5	82	0
709	6	56	0
710	1	49	0
710	2	66	0
710	3	70	1
710	4	44	0
710	5	55	0
710	6	51	0
711	1	65	0
711	2	90	0
711	3	122	2
711	4	58	0
711	5	75	0
711	6	84	0
712	1	55	0
712	2	69	0
712	3	85	1
712	4	32	0
712	5	35	0
712	6	28	0
713	1	95	0
713	2	117	0
713	3	184	2
713	4	44	0
713	5	46	0
713	6	28	0
714	1	40	0
714	2	30	0
714	3	35	0
714	4	45	0
714	5	40	0
714	6	55	1
715	1	85	0
715	2	70	0
715	3	80	0
715	4	97	0
715	5	80	0
715	6	123	2
716	1	126	3
716	2	131	0
716	3	95	0
716	4	131	0
716	5	98	0
716	6	99	0
717	1	126	3
717	2	131	0
717	3	95	0
717	4	131	0
717	5	98	0
717	6	99	0
718	1	108	3
718	2	100	0
718	3	121	0
718	4	81	0
718	5	95	0
718	6	95	0
719	1	50	0
719	2	100	0
719	3	150	1
719	4	100	0
719	5	150	2
719	6	50	0
720	1	80	0
720	2	110	0
720	3	60	0
720	4	150	3
720	5	130	0
720	6	70	0
721	1	80	0
721	2	110	0
721	3	120	0
721	4	130	3
721	5	90	0
721	6	70	0
722	1	50	0
722	2	65	0
722	3	107	0
722	4	105	3
722	5	107	0
722	6	86	0
723	1	50	0
723	2	65	0
723	3	107	0
723	4	105	3
723	5	107	0
723	6	86	0
724	1	50	0
724	2	65	0
724	3	107	0
724	4	105	3
724	5	107	0
724	6	86	0
725	1	50	0
725	2	65	0
725	3	107	0
725	4	105	3
725	5	107	0
725	6	86	0
726	1	50	0
726	2	65	0
726	3	107	0
726	4	105	3
726	5	107	0
726	6	86	0
727	1	79	0
727	2	100	0
727	3	80	0
727	4	110	0
727	5	90	0
727	6	121	3
728	1	79	0
728	2	105	0
728	3	70	0
728	4	145	3
728	5	80	0
728	6	101	0
729	1	89	0
729	2	145	3
729	3	90	0
729	4	105	0
729	5	80	0
729	6	91	0
730	1	125	0
730	2	120	0
730	3	90	0
730	4	170	3
730	5	100	0
730	6	95	3
731	1	125	0
731	2	170	3
731	3	100	0
731	4	120	0
731	5	90	0
731	6	95	0
1	1	45	0
1	2	49	0
1	3	49	0
1	4	65	1
1	5	65	0
1	6	45	0
2	1	60	0
2	2	62	0
2	3	63	0
2	4	80	1
2	5	80	1
2	6	60	0
3	1	80	0
3	2	82	0
3	3	83	0
3	4	100	2
3	5	100	1
3	6	80	0
4	1	39	0
4	2	52	0
4	3	43	0
4	4	60	0
4	5	50	0
4	6	65	1
5	1	58	0
5	2	64	0
5	3	58	0
5	4	80	1
5	5	65	0
5	6	80	1
6	1	78	0
6	2	84	0
6	3	78	0
6	4	109	3
6	5	85	0
6	6	100	0
7	1	44	0
7	2	48	0
7	3	65	1
7	4	50	0
7	5	64	0
7	6	43	0
8	1	59	0
8	2	63	0
8	3	80	1
8	4	65	0
8	5	80	1
8	6	58	0
9	1	79	0
9	2	83	0
9	3	100	0
9	4	85	0
9	5	105	3
9	6	78	0
10	1	45	1
10	2	30	0
10	3	35	0
10	4	20	0
10	5	20	0
10	6	45	0
11	1	50	0
11	2	20	0
11	3	55	2
11	4	25	0
11	5	25	0
11	6	30	0
12	1	60	0
12	2	45	0
12	3	50	0
12	4	90	2
12	5	80	1
12	6	70	0
13	1	40	0
13	2	35	0
13	3	30	0
13	4	20	0
13	5	20	0
13	6	50	1
14	1	45	0
14	2	25	0
14	3	50	2
14	4	25	0
14	5	25	0
14	6	35	0
15	1	65	0
15	2	90	2
15	3	40	0
15	4	45	0
15	5	80	1
15	6	75	0
16	1	40	0
16	2	45	0
16	3	40	0
16	4	35	0
16	5	35	0
16	6	56	1
17	1	63	0
17	2	60	0
17	3	55	0
17	4	50	0
17	5	50	0
17	6	71	2
18	1	83	0
18	2	80	0
18	3	75	0
18	4	70	0
18	5	70	0
18	6	101	3
19	1	30	0
19	2	56	0
19	3	35	0
19	4	25	0
19	5	35	0
19	6	72	1
20	1	55	0
20	2	81	0
20	3	60	0
20	4	50	0
20	5	70	0
20	6	97	2
21	1	40	0
21	2	60	0
21	3	30	0
21	4	31	0
21	5	31	0
21	6	70	1
22	1	65	0
22	2	90	0
22	3	65	0
22	4	61	0
22	5	61	0
22	6	100	2
23	1	35	0
23	2	60	1
23	3	44	0
23	4	40	0
23	5	54	0
23	6	55	0
24	1	60	0
24	2	85	2
24	3	69	0
24	4	65	0
24	5	79	0
24	6	80	0
25	1	35	0
25	2	55	0
25	3	40	0
25	4	50	0
25	5	50	0
25	6	90	2
26	1	60	0
26	2	90	0
26	3	55	0
26	4	90	0
26	5	80	0
26	6	110	3
27	1	50	0
27	2	75	0
27	3	85	1
27	4	20	0
27	5	30	0
27	6	40	0
28	1	75	0
28	2	100	0
28	3	110	2
28	4	45	0
28	5	55	0
28	6	65	0
29	1	55	1
29	2	47	0
29	3	52	0
29	4	40	0
29	5	40	0
29	6	41	0
30	1	70	2
30	2	62	0
30	3	67	0
30	4	55	0
30	5	55	0
30	6	56	0
31	1	90	3
31	2	92	0
31	3	87	0
31	4	75	0
31	5	85	0
31	6	76	0
32	1	46	0
32	2	57	1
32	3	40	0
32	4	40	0
32	5	40	0
32	6	50	0
33	1	61	0
33	2	72	2
33	3	57	0
33	4	55	0
33	5	55	0
33	6	65	0
34	1	81	0
34	2	102	3
34	3	77	0
34	4	85	0
34	5	75	0
34	6	85	0
35	1	70	2
35	2	45	0
35	3	48	0
35	4	60	0
35	5	65	0
35	6	35	0
36	1	95	3
36	2	70	0
36	3	73	0
36	4	95	0
36	5	90	0
36	6	60	0
37	1	38	0
37	2	41	0
37	3	40	0
37	4	50	0
37	5	65	0
37	6	65	1
38	1	73	0
38	2	76	0
38	3	75	0
38	4	81	0
38	5	100	1
38	6	100	1
39	1	115	2
39	2	45	0
39	3	20	0
39	4	45	0
39	5	25	0
39	6	20	0
40	1	140	3
40	2	70	0
40	3	45	0
40	4	85	0
40	5	50	0
40	6	45	0
41	1	40	0
41	2	45	0
41	3	35	0
41	4	30	0
41	5	40	0
41	6	55	1
42	1	75	0
42	2	80	0
42	3	70	0
42	4	65	0
42	5	75	0
42	6	90	2
43	1	45	0
43	2	50	0
43	3	55	0
43	4	75	1
43	5	65	0
43	6	30	0
44	1	60	0
44	2	65	0
44	3	70	0
44	4	85	2
44	5	75	0
44	6	40	0
45	1	75	0
45	2	80	0
45	3	85	0
45	4	110	3
45	5	90	0
45	6	50	0
46	1	35	0
46	2	70	1
46	3	55	0
46	4	45	0
46	5	55	0
46	6	25	0
47	1	60	0
47	2	95	2
47	3	80	1
47	4	60	0
47	5	80	0
47	6	30	0
48	1	60	0
48	2	55	0
48	3	50	0
48	4	40	0
48	5	55	1
48	6	45	0
49	1	70	0
49	2	65	0
49	3	60	0
49	4	90	1
49	5	75	0
49	6	90	1
50	1	10	0
50	2	55	0
50	3	25	0
50	4	35	0
50	5	45	0
50	6	95	1
51	1	35	0
51	2	80	0
51	3	50	0
51	4	50	0
51	5	70	0
51	6	120	2
52	1	40	0
52	2	45	0
52	3	35	0
52	4	40	0
52	5	40	0
52	6	90	1
53	1	65	0
53	2	70	0
53	3	60	0
53	4	65	0
53	5	65	0
53	6	115	2
54	1	50	0
54	2	52	0
54	3	48	0
54	4	65	1
54	5	50	0
54	6	55	0
55	1	80	0
55	2	82	0
55	3	78	0
55	4	95	2
55	5	80	0
55	6	85	0
56	1	40	0
56	2	80	1
56	3	35	0
56	4	35	0
56	5	45	0
56	6	70	0
57	1	65	0
57	2	105	2
57	3	60	0
57	4	60	0
57	5	70	0
57	6	95	0
58	1	55	0
58	2	70	1
58	3	45	0
58	4	70	0
58	5	50	0
58	6	60	0
59	1	90	0
59	2	110	2
59	3	80	0
59	4	100	0
59	5	80	0
59	6	95	0
60	1	40	0
60	2	50	0
60	3	40	0
60	4	40	0
60	5	40	0
60	6	90	1
61	1	65	0
61	2	65	0
61	3	65	0
61	4	50	0
61	5	50	0
61	6	90	2
62	1	90	0
62	2	95	0
62	3	95	3
62	4	70	0
62	5	90	0
62	6	70	0
63	1	25	0
63	2	20	0
63	3	15	0
63	4	105	1
63	5	55	0
63	6	90	0
64	1	40	0
64	2	35	0
64	3	30	0
64	4	120	2
64	5	70	0
64	6	105	0
65	1	55	0
65	2	50	0
65	3	45	0
65	4	135	3
65	5	95	0
65	6	120	0
66	1	70	0
66	2	80	1
66	3	50	0
66	4	35	0
66	5	35	0
66	6	35	0
67	1	80	0
67	2	100	2
67	3	70	0
67	4	50	0
67	5	60	0
67	6	45	0
68	1	90	0
68	2	130	3
68	3	80	0
68	4	65	0
68	5	85	0
68	6	55	0
69	1	50	0
69	2	75	1
69	3	35	0
69	4	70	0
69	5	30	0
69	6	40	0
70	1	65	0
70	2	90	2
70	3	50	0
70	4	85	0
70	5	45	0
70	6	55	0
71	1	80	0
71	2	105	3
71	3	65	0
71	4	100	0
71	5	70	0
71	6	70	0
72	1	40	0
72	2	40	0
72	3	35	0
72	4	50	0
72	5	100	1
72	6	70	0
73	1	80	0
73	2	70	0
73	3	65	0
73	4	80	0
73	5	120	2
73	6	100	0
74	1	40	0
74	2	80	0
74	3	100	1
74	4	30	0
74	5	30	0
74	6	20	0
75	1	55	0
75	2	95	0
75	3	115	2
75	4	45	0
75	5	45	0
75	6	35	0
76	1	80	0
76	2	120	0
76	3	130	3
76	4	55	0
76	5	65	0
76	6	45	0
77	1	50	0
77	2	85	0
77	3	55	0
77	4	65	0
77	5	65	0
77	6	90	1
78	1	65	0
78	2	100	0
78	3	70	0
78	4	80	0
78	5	80	0
78	6	105	2
79	1	90	1
79	2	65	0
79	3	65	0
79	4	40	0
79	5	40	0
79	6	15	0
80	1	95	0
80	2	75	0
80	3	110	2
80	4	100	0
80	5	80	0
80	6	30	0
81	1	25	0
81	2	35	0
81	3	70	0
81	4	95	1
81	5	55	0
81	6	45	0
82	1	50	0
82	2	60	0
82	3	95	0
82	4	120	2
82	5	70	0
82	6	70	0
83	1	52	0
83	2	65	1
83	3	55	0
83	4	58	0
83	5	62	0
83	6	60	0
84	1	35	0
84	2	85	1
84	3	45	0
84	4	35	0
84	5	35	0
84	6	75	0
85	1	60	0
85	2	110	2
85	3	70	0
85	4	60	0
85	5	60	0
85	6	100	0
86	1	65	0
86	2	45	0
86	3	55	0
86	4	45	0
86	5	70	1
86	6	45	0
87	1	90	0
87	2	70	0
87	3	80	0
87	4	70	0
87	5	95	2
87	6	70	0
88	1	80	1
88	2	80	0
88	3	50	0
88	4	40	0
88	5	50	0
88	6	25	0
89	1	105	1
89	2	105	1
89	3	75	0
89	4	65	0
89	5	100	0
89	6	50	0
90	1	30	0
90	2	65	0
90	3	100	1
90	4	45	0
90	5	25	0
90	6	40	0
91	1	50	0
91	2	95	0
91	3	180	2
91	4	85	0
91	5	45	0
91	6	70	0
92	1	30	0
92	2	35	0
92	3	30	0
92	4	100	1
92	5	35	0
92	6	80	0
93	1	45	0
93	2	50	0
93	3	45	0
93	4	115	2
93	5	55	0
93	6	95	0
94	1	60	0
94	2	65	0
94	3	60	0
94	4	130	3
94	5	75	0
94	6	110	0
95	1	35	0
95	2	45	0
95	3	160	1
95	4	30	0
95	5	45	0
95	6	70	0
96	1	60	0
96	2	48	0
96	3	45	0
96	4	43	0
96	5	90	1
96	6	42	0
97	1	85	0
97	2	73	0
97	3	70	0
97	4	73	0
97	5	115	2
97	6	67	0
98	1	30	0
98	2	105	1
98	3	90	0
98	4	25	0
98	5	25	0
98	6	50	0
99	1	55	0
99	2	130	2
99	3	115	0
99	4	50	0
99	5	50	0
99	6	75	0
100	1	40	0
100	2	30	0
100	3	50	0
100	4	55	0
100	5	55	0
100	6	100	1
101	1	60	0
101	2	50	0
101	3	70	0
101	4	80	0
101	5	80	0
101	6	140	2
102	1	60	0
102	2	40	0
102	3	80	1
102	4	60	0
102	5	45	0
102	6	40	0
103	1	95	0
103	2	95	0
103	3	85	0
103	4	125	2
103	5	65	0
103	6	55	0
104	1	50	0
104	2	50	0
104	3	95	1
104	4	40	0
104	5	50	0
104	6	35	0
105	1	60	0
105	2	80	0
105	3	110	2
105	4	50	0
105	5	80	0
105	6	45	0
106	1	50	0
106	2	120	2
106	3	53	0
106	4	35	0
106	5	110	0
106	6	87	0
107	1	50	0
107	2	105	0
107	3	79	0
107	4	35	0
107	5	110	2
107	6	76	0
108	1	90	2
108	2	55	0
108	3	75	0
108	4	60	0
108	5	75	0
108	6	30	0
109	1	40	0
109	2	65	0
109	3	95	1
109	4	60	0
109	5	45	0
109	6	35	0
110	1	65	0
110	2	90	0
110	3	120	2
110	4	85	0
110	5	70	0
110	6	60	0
111	1	80	0
111	2	85	0
111	3	95	1
111	4	30	0
111	5	30	0
111	6	25	0
112	1	105	0
112	2	130	2
112	3	120	0
112	4	45	0
112	5	45	0
112	6	40	0
113	1	250	2
113	2	5	0
113	3	5	0
113	4	35	0
113	5	105	0
113	6	50	0
114	1	65	0
114	2	55	0
114	3	115	1
114	4	100	0
114	5	40	0
114	6	60	0
115	1	105	2
115	2	95	0
115	3	80	0
115	4	40	0
115	5	80	0
115	6	90	0
116	1	30	0
116	2	40	0
116	3	70	0
116	4	70	1
116	5	25	0
116	6	60	0
117	1	55	0
117	2	65	0
117	3	95	1
117	4	95	1
117	5	45	0
117	6	85	0
118	1	45	0
118	2	67	1
118	3	60	0
118	4	35	0
118	5	50	0
118	6	63	0
119	1	80	0
119	2	92	2
119	3	65	0
119	4	65	0
119	5	80	0
119	6	68	0
120	1	30	0
120	2	45	0
120	3	55	0
120	4	70	0
120	5	55	0
120	6	85	1
121	1	60	0
121	2	75	0
121	3	85	0
121	4	100	0
121	5	85	0
121	6	115	2
122	1	40	0
122	2	45	0
122	3	65	0
122	4	100	0
122	5	120	2
122	6	90	0
123	1	70	0
123	2	110	1
123	3	80	0
123	4	55	0
123	5	80	0
123	6	105	0
124	1	65	0
124	2	50	0
124	3	35	0
124	4	115	2
124	5	95	0
124	6	95	0
125	1	65	0
125	2	83	0
125	3	57	0
125	4	95	0
125	5	85	0
125	6	105	2
126	1	65	0
126	2	95	0
126	3	57	0
126	4	100	2
126	5	85	0
126	6	93	0
127	1	65	0
127	2	125	2
127	3	100	0
127	4	55	0
127	5	70	0
127	6	85	0
128	1	75	0
128	2	100	1
128	3	95	0
128	4	40	0
128	5	70	0
128	6	110	1
129	1	20	0
129	2	10	0
129	3	55	0
129	4	15	0
129	5	20	0
129	6	80	1
130	1	95	0
130	2	125	2
130	3	79	0
130	4	60	0
130	5	100	0
130	6	81	0
131	1	130	2
131	2	85	0
131	3	80	0
131	4	85	0
131	5	95	0
131	6	60	0
132	1	48	1
132	2	48	0
132	3	48	0
132	4	48	0
132	5	48	0
132	6	48	0
133	1	55	0
133	2	55	0
133	3	50	0
133	4	45	0
133	5	65	1
133	6	55	0
134	1	130	2
134	2	65	0
134	3	60	0
134	4	110	0
134	5	95	0
134	6	65	0
135	1	65	0
135	2	65	0
135	3	60	0
135	4	110	0
135	5	95	0
135	6	130	2
136	1	65	0
136	2	130	2
136	3	60	0
136	4	95	0
136	5	110	0
136	6	65	0
137	1	65	0
137	2	60	0
137	3	70	0
137	4	85	1
137	5	75	0
137	6	40	0
138	1	35	0
138	2	40	0
138	3	100	1
138	4	90	0
138	5	55	0
138	6	35	0
139	1	70	0
139	2	60	0
139	3	125	2
139	4	115	0
139	5	70	0
139	6	55	0
140	1	30	0
140	2	80	0
140	3	90	1
140	4	55	0
140	5	45	0
140	6	55	0
141	1	60	0
141	2	115	2
141	3	105	0
141	4	65	0
141	5	70	0
141	6	80	0
142	1	80	0
142	2	105	0
142	3	65	0
142	4	60	0
142	5	75	0
142	6	130	2
143	1	160	2
143	2	110	0
143	3	65	0
143	4	65	0
143	5	110	0
143	6	30	0
144	1	90	0
144	2	85	0
144	3	100	0
144	4	95	0
144	5	125	3
144	6	85	0
145	1	90	0
145	2	90	0
145	3	85	0
145	4	125	3
145	5	90	0
145	6	100	0
146	1	90	0
146	2	100	0
146	3	90	0
146	4	125	3
146	5	85	0
146	6	90	0
147	1	41	0
147	2	64	1
147	3	45	0
147	4	50	0
147	5	50	0
147	6	50	0
148	1	61	0
148	2	84	2
148	3	65	0
148	4	70	0
148	5	70	0
148	6	70	0
149	1	91	0
149	2	134	3
149	3	95	0
149	4	100	0
149	5	100	0
149	6	80	0
150	1	106	0
150	2	110	0
150	3	90	0
150	4	154	3
150	5	90	0
150	6	130	0
151	1	100	3
151	2	100	0
151	3	100	0
151	4	100	0
151	5	100	0
151	6	100	0
152	1	45	0
152	2	49	0
152	3	65	0
152	4	49	0
152	5	65	1
152	6	45	0
153	1	60	0
153	2	62	0
153	3	80	1
153	4	63	0
153	5	80	1
153	6	60	0
154	1	80	0
154	2	82	0
154	3	100	1
154	4	83	0
154	5	100	2
154	6	80	0
155	1	39	0
155	2	52	0
155	3	43	0
155	4	60	0
155	5	50	0
155	6	65	1
156	1	58	0
156	2	64	0
156	3	58	0
156	4	80	1
156	5	65	0
156	6	80	1
157	1	78	0
157	2	84	0
157	3	78	0
157	4	109	3
157	5	85	0
157	6	100	0
158	1	50	0
158	2	65	1
158	3	64	0
158	4	44	0
158	5	48	0
158	6	43	0
159	1	65	0
159	2	80	1
159	3	80	1
159	4	59	0
159	5	63	0
159	6	58	0
160	1	85	0
160	2	105	2
160	3	100	1
160	4	79	0
160	5	83	0
160	6	78	0
161	1	35	0
161	2	46	1
161	3	34	0
161	4	35	0
161	5	45	0
161	6	20	0
162	1	85	0
162	2	76	0
162	3	64	0
162	4	45	0
162	5	55	0
162	6	90	2
163	1	60	1
163	2	30	0
163	3	30	0
163	4	36	0
163	5	56	0
163	6	50	0
164	1	100	2
164	2	50	0
164	3	50	0
164	4	76	0
164	5	96	0
164	6	70	0
165	1	40	0
165	2	20	0
165	3	30	0
165	4	40	0
165	5	80	1
165	6	55	0
166	1	55	0
166	2	35	0
166	3	50	0
166	4	55	0
166	5	110	2
166	6	85	0
167	1	40	0
167	2	60	1
167	3	40	0
167	4	40	0
167	5	40	0
167	6	30	0
168	1	70	0
168	2	90	2
168	3	70	0
168	4	60	0
168	5	60	0
168	6	40	0
169	1	85	0
169	2	90	0
169	3	80	0
169	4	70	0
169	5	80	0
169	6	130	3
170	1	75	1
170	2	38	0
170	3	38	0
170	4	56	0
170	5	56	0
170	6	67	0
171	1	125	2
171	2	58	0
171	3	58	0
171	4	76	0
171	5	76	0
171	6	67	0
172	1	20	0
172	2	40	0
172	3	15	0
172	4	35	0
172	5	35	0
172	6	60	1
173	1	50	0
173	2	25	0
173	3	28	0
173	4	45	0
173	5	55	1
173	6	15	0
174	1	90	1
174	2	30	0
174	3	15	0
174	4	40	0
174	5	20	0
174	6	15	0
175	1	35	0
175	2	20	0
175	3	65	0
175	4	40	0
175	5	65	1
175	6	20	0
176	1	55	0
176	2	40	0
176	3	85	0
176	4	80	0
176	5	105	2
176	6	40	0
177	1	40	0
177	2	50	0
177	3	45	0
177	4	70	1
177	5	45	0
177	6	70	0
178	1	65	0
178	2	75	0
178	3	70	0
178	4	95	1
178	5	70	0
178	6	95	1
179	1	55	0
179	2	40	0
179	3	40	0
179	4	65	1
179	5	45	0
179	6	35	0
180	1	70	0
180	2	55	0
180	3	55	0
180	4	80	2
180	5	60	0
180	6	45	0
181	1	90	0
181	2	75	0
181	3	85	0
181	4	115	3
181	5	90	0
181	6	55	0
182	1	75	0
182	2	80	0
182	3	95	0
182	4	90	0
182	5	100	3
182	6	50	0
183	1	70	2
183	2	20	0
183	3	50	0
183	4	20	0
183	5	50	0
183	6	40	0
184	1	100	3
184	2	50	0
184	3	80	0
184	4	60	0
184	5	80	0
184	6	50	0
185	1	70	0
185	2	100	0
185	3	115	2
185	4	30	0
185	5	65	0
185	6	30	0
186	1	90	0
186	2	75	0
186	3	75	0
186	4	90	0
186	5	100	3
186	6	70	0
187	1	35	0
187	2	35	0
187	3	40	0
187	4	35	0
187	5	55	1
187	6	50	0
188	1	55	0
188	2	45	0
188	3	50	0
188	4	45	0
188	5	65	0
188	6	80	2
189	1	75	0
189	2	55	0
189	3	70	0
189	4	55	0
189	5	95	0
189	6	110	3
190	1	55	0
190	2	70	0
190	3	55	0
190	4	40	0
190	5	55	0
190	6	85	1
191	1	30	0
191	2	30	0
191	3	30	0
191	4	30	1
191	5	30	0
191	6	30	0
192	1	75	0
192	2	75	0
192	3	55	0
192	4	105	2
192	5	85	0
192	6	30	0
193	1	65	0
193	2	65	0
193	3	45	0
193	4	75	0
193	5	45	0
193	6	95	1
194	1	55	1
194	2	45	0
194	3	45	0
194	4	25	0
194	5	25	0
194	6	15	0
195	1	95	2
195	2	85	0
195	3	85	0
195	4	65	0
195	5	65	0
195	6	35	0
196	1	65	0
196	2	65	0
196	3	60	0
196	4	130	2
196	5	95	0
196	6	110	0
197	1	95	0
197	2	65	0
197	3	110	0
197	4	60	0
197	5	130	2
197	6	65	0
198	1	60	0
198	2	85	0
198	3	42	0
198	4	85	0
198	5	42	0
198	6	91	1
199	1	95	0
199	2	75	0
199	3	80	0
199	4	100	0
199	5	110	3
199	6	30	0
200	1	60	0
200	2	60	0
200	3	60	0
200	4	85	0
200	5	85	1
200	6	85	0
201	1	48	0
201	2	72	1
201	3	48	0
201	4	72	1
201	5	48	0
201	6	48	0
202	1	190	2
202	2	33	0
202	3	58	0
202	4	33	0
202	5	58	0
202	6	33	0
203	1	70	0
203	2	80	0
203	3	65	0
203	4	90	2
203	5	65	0
203	6	85	0
204	1	50	0
204	2	65	0
204	3	90	1
204	4	35	0
204	5	35	0
204	6	15	0
205	1	75	0
205	2	90	0
205	3	140	2
205	4	60	0
205	5	60	0
205	6	40	0
206	1	100	1
206	2	70	0
206	3	70	0
206	4	65	0
206	5	65	0
206	6	45	0
207	1	65	0
207	2	75	0
207	3	105	1
207	4	35	0
207	5	65	0
207	6	85	0
208	1	75	0
208	2	85	0
208	3	200	2
208	4	55	0
208	5	65	0
208	6	30	0
209	1	60	0
209	2	80	1
209	3	50	0
209	4	40	0
209	5	40	0
209	6	30	0
210	1	90	0
210	2	120	2
210	3	75	0
210	4	60	0
210	5	60	0
210	6	45	0
211	1	65	0
211	2	95	1
211	3	75	0
211	4	55	0
211	5	55	0
211	6	85	0
212	1	70	0
212	2	130	2
212	3	100	0
212	4	55	0
212	5	80	0
212	6	65	0
213	1	20	0
213	2	10	0
213	3	230	1
213	4	10	0
213	5	230	1
213	6	5	0
214	1	80	0
214	2	125	2
214	3	75	0
214	4	40	0
214	5	95	0
214	6	85	0
215	1	55	0
215	2	95	0
215	3	55	0
215	4	35	0
215	5	75	0
215	6	115	1
216	1	60	0
216	2	80	1
216	3	50	0
216	4	50	0
216	5	50	0
216	6	40	0
217	1	90	0
217	2	130	2
217	3	75	0
217	4	75	0
217	5	75	0
217	6	55	0
218	1	40	0
218	2	40	0
218	3	40	0
218	4	70	1
218	5	40	0
218	6	20	0
219	1	50	0
219	2	50	0
219	3	120	2
219	4	80	0
219	5	80	0
219	6	30	0
220	1	50	0
220	2	50	1
220	3	40	0
220	4	30	0
220	5	30	0
220	6	50	0
221	1	100	1
221	2	100	1
221	3	80	0
221	4	60	0
221	5	60	0
221	6	50	0
222	1	55	0
222	2	55	0
222	3	85	1
222	4	65	0
222	5	85	1
222	6	35	0
223	1	35	0
223	2	65	0
223	3	35	0
223	4	65	1
223	5	35	0
223	6	65	0
224	1	75	0
224	2	105	1
224	3	75	0
224	4	105	1
224	5	75	0
224	6	45	0
225	1	45	0
225	2	55	0
225	3	45	0
225	4	65	0
225	5	45	0
225	6	75	1
226	1	65	0
226	2	40	0
226	3	70	0
226	4	80	0
226	5	140	2
226	6	70	0
227	1	65	0
227	2	80	0
227	3	140	2
227	4	40	0
227	5	70	0
227	6	70	0
228	1	45	0
228	2	60	0
228	3	30	0
228	4	80	1
228	5	50	0
228	6	65	0
229	1	75	0
229	2	90	0
229	3	50	0
229	4	110	2
229	5	80	0
229	6	95	0
230	1	75	0
230	2	95	1
230	3	95	0
230	4	95	1
230	5	95	1
230	6	85	0
231	1	90	1
231	2	60	0
231	3	60	0
231	4	40	0
231	5	40	0
231	6	40	0
232	1	90	0
232	2	120	1
232	3	120	1
232	4	60	0
232	5	60	0
232	6	50	0
233	1	85	0
233	2	80	0
233	3	90	0
233	4	105	2
233	5	95	0
233	6	60	0
234	1	73	0
234	2	95	1
234	3	62	0
234	4	85	0
234	5	65	0
234	6	85	0
235	1	55	0
235	2	20	0
235	3	35	0
235	4	20	0
235	5	45	0
235	6	75	1
236	1	35	0
236	2	35	1
236	3	35	0
236	4	35	0
236	5	35	0
236	6	35	0
237	1	50	0
237	2	95	0
237	3	95	0
237	4	35	0
237	5	110	2
237	6	70	0
238	1	45	0
238	2	30	0
238	3	15	0
238	4	85	1
238	5	65	0
238	6	65	0
239	1	45	0
239	2	63	0
239	3	37	0
239	4	65	0
239	5	55	0
239	6	95	1
240	1	45	0
240	2	75	0
240	3	37	0
240	4	70	0
240	5	55	0
240	6	83	1
241	1	95	0
241	2	80	0
241	3	105	2
241	4	40	0
241	5	70	0
241	6	100	0
242	1	255	3
242	2	10	0
242	3	10	0
242	4	75	0
242	5	135	0
242	6	55	0
243	1	90	0
243	2	85	0
243	3	75	0
243	4	115	1
243	5	100	0
243	6	115	2
244	1	115	1
244	2	115	2
244	3	85	0
244	4	90	0
244	5	75	0
244	6	100	0
245	1	100	0
245	2	75	0
245	3	115	1
245	4	90	0
245	5	115	2
245	6	85	0
246	1	50	0
246	2	64	1
246	3	50	0
246	4	45	0
246	5	50	0
246	6	41	0
247	1	70	0
247	2	84	2
247	3	70	0
247	4	65	0
247	5	70	0
247	6	51	0
248	1	100	0
248	2	134	3
248	3	110	0
248	4	95	0
248	5	100	0
248	6	61	0
249	1	106	0
249	2	90	0
249	3	130	0
249	4	90	0
249	5	154	3
249	6	110	0
250	1	106	0
250	2	130	0
250	3	90	0
250	4	110	0
250	5	154	3
250	6	90	0
251	1	100	3
251	2	100	0
251	3	100	0
251	4	100	0
251	5	100	0
251	6	100	0
252	1	40	0
252	2	45	0
252	3	35	0
252	4	65	0
252	5	55	0
252	6	70	1
253	1	50	0
253	2	65	0
253	3	45	0
253	4	85	0
253	5	65	0
253	6	95	2
254	1	70	0
254	2	85	0
254	3	65	0
254	4	105	0
254	5	85	0
254	6	120	3
255	1	45	0
255	2	60	0
255	3	40	0
255	4	70	1
255	5	50	0
255	6	45	0
256	1	60	0
256	2	85	1
256	3	60	0
256	4	85	1
256	5	60	0
256	6	55	0
257	1	80	0
257	2	120	3
257	3	70	0
257	4	110	0
257	5	70	0
257	6	80	0
258	1	50	0
258	2	70	1
258	3	50	0
258	4	50	0
258	5	50	0
258	6	40	0
259	1	70	0
259	2	85	2
259	3	70	0
259	4	60	0
259	5	70	0
259	6	50	0
260	1	100	0
260	2	110	3
260	3	90	0
260	4	85	0
260	5	90	0
260	6	60	0
261	1	35	0
261	2	55	1
261	3	35	0
261	4	30	0
261	5	30	0
261	6	35	0
262	1	70	0
262	2	90	2
262	3	70	0
262	4	60	0
262	5	60	0
262	6	70	0
263	1	38	0
263	2	30	0
263	3	41	0
263	4	30	0
263	5	41	0
263	6	60	1
264	1	78	0
264	2	70	0
264	3	61	0
264	4	50	0
264	5	61	0
264	6	100	2
265	1	45	1
265	2	45	0
265	3	35	0
265	4	20	0
265	5	30	0
265	6	20	0
266	1	50	0
266	2	35	0
266	3	55	2
266	4	25	0
266	5	25	0
266	6	15	0
267	1	60	0
267	2	70	0
267	3	50	0
267	4	100	3
267	5	50	0
267	6	65	0
268	1	50	0
268	2	35	0
268	3	55	2
268	4	25	0
268	5	25	0
268	6	15	0
269	1	60	0
269	2	50	0
269	3	70	0
269	4	50	0
269	5	90	3
269	6	65	0
270	1	40	0
270	2	30	0
270	3	30	0
270	4	40	0
270	5	50	1
270	6	30	0
271	1	60	0
271	2	50	0
271	3	50	0
271	4	60	0
271	5	70	2
271	6	50	0
272	1	80	0
272	2	70	0
272	3	70	0
272	4	90	0
272	5	100	3
272	6	70	0
273	1	40	0
273	2	40	0
273	3	50	1
273	4	30	0
273	5	30	0
273	6	30	0
274	1	70	0
274	2	70	2
274	3	40	0
274	4	60	0
274	5	40	0
274	6	60	0
275	1	90	0
275	2	100	3
275	3	60	0
275	4	90	0
275	5	60	0
275	6	80	0
276	1	40	0
276	2	55	0
276	3	30	0
276	4	30	0
276	5	30	0
276	6	85	1
277	1	60	0
277	2	85	0
277	3	60	0
277	4	50	0
277	5	50	0
277	6	125	2
278	1	40	0
278	2	30	0
278	3	30	0
278	4	55	0
278	5	30	0
278	6	85	1
279	1	60	0
279	2	50	0
279	3	100	2
279	4	85	0
279	5	70	0
279	6	65	0
280	1	28	0
280	2	25	0
280	3	25	0
280	4	45	1
280	5	35	0
280	6	40	0
281	1	38	0
281	2	35	0
281	3	35	0
281	4	65	2
281	5	55	0
281	6	50	0
282	1	68	0
282	2	65	0
282	3	65	0
282	4	125	3
282	5	115	0
282	6	80	0
283	1	40	0
283	2	30	0
283	3	32	0
283	4	50	0
283	5	52	0
283	6	65	1
284	1	70	0
284	2	60	0
284	3	62	0
284	4	80	1
284	5	82	1
284	6	60	0
285	1	60	1
285	2	40	0
285	3	60	0
285	4	40	0
285	5	60	0
285	6	35	0
286	1	60	0
286	2	130	2
286	3	80	0
286	4	60	0
286	5	60	0
286	6	70	0
287	1	60	1
287	2	60	0
287	3	60	0
287	4	35	0
287	5	35	0
287	6	30	0
288	1	80	0
288	2	80	0
288	3	80	0
288	4	55	0
288	5	55	0
288	6	90	2
289	1	150	3
289	2	160	0
289	3	100	0
289	4	95	0
289	5	65	0
289	6	100	0
290	1	31	0
290	2	45	0
290	3	90	1
290	4	30	0
290	5	30	0
290	6	40	0
291	1	61	0
291	2	90	0
291	3	45	0
291	4	50	0
291	5	50	0
291	6	160	2
292	1	1	2
292	2	90	0
292	3	45	0
292	4	30	0
292	5	30	0
292	6	40	0
293	1	64	1
293	2	51	0
293	3	23	0
293	4	51	0
293	5	23	0
293	6	28	0
294	1	84	2
294	2	71	0
294	3	43	0
294	4	71	0
294	5	43	0
294	6	48	0
295	1	104	3
295	2	91	0
295	3	63	0
295	4	91	0
295	5	73	0
295	6	68	0
296	1	72	1
296	2	60	0
296	3	30	0
296	4	20	0
296	5	30	0
296	6	25	0
297	1	144	2
297	2	120	0
297	3	60	0
297	4	40	0
297	5	60	0
297	6	50	0
298	1	50	1
298	2	20	0
298	3	40	0
298	4	20	0
298	5	40	0
298	6	20	0
299	1	30	0
299	2	45	0
299	3	135	1
299	4	45	0
299	5	90	0
299	6	30	0
300	1	50	0
300	2	45	0
300	3	45	0
300	4	35	0
300	5	35	0
300	6	50	1
301	1	70	1
301	2	65	0
301	3	65	0
301	4	55	0
301	5	55	0
301	6	70	1
302	1	50	0
302	2	75	1
302	3	75	1
302	4	65	0
302	5	65	0
302	6	50	0
303	1	50	0
303	2	85	1
303	3	85	1
303	4	55	0
303	5	55	0
303	6	50	0
304	1	50	0
304	2	70	0
304	3	100	1
304	4	40	0
304	5	40	0
304	6	30	0
305	1	60	0
305	2	90	0
305	3	140	2
305	4	50	0
305	5	50	0
305	6	40	0
306	1	70	0
306	2	110	0
306	3	180	3
306	4	60	0
306	5	60	0
306	6	50	0
307	1	30	0
307	2	40	0
307	3	55	0
307	4	40	0
307	5	55	0
307	6	60	1
308	1	60	0
308	2	60	0
308	3	75	0
308	4	60	0
308	5	75	0
308	6	80	2
309	1	40	0
309	2	45	0
309	3	40	0
309	4	65	0
309	5	40	0
309	6	65	1
310	1	70	0
310	2	75	0
310	3	60	0
310	4	105	0
310	5	60	0
310	6	105	2
311	1	60	0
311	2	50	0
311	3	40	0
311	4	85	0
311	5	75	0
311	6	95	1
312	1	60	0
312	2	40	0
312	3	50	0
312	4	75	0
312	5	85	0
312	6	95	1
313	1	65	0
313	2	73	0
313	3	55	0
313	4	47	0
313	5	75	0
313	6	85	1
314	1	65	0
314	2	47	0
314	3	55	0
314	4	73	0
314	5	75	0
314	6	85	1
315	1	50	0
315	2	60	0
315	3	45	0
315	4	100	2
315	5	80	0
315	6	65	0
316	1	70	1
316	2	43	0
316	3	53	0
316	4	43	0
316	5	53	0
316	6	40	0
317	1	100	2
317	2	73	0
317	3	83	0
317	4	73	0
317	5	83	0
317	6	55	0
318	1	45	0
318	2	90	1
318	3	20	0
318	4	65	0
318	5	20	0
318	6	65	0
319	1	70	0
319	2	120	2
319	3	40	0
319	4	95	0
319	5	40	0
319	6	95	0
320	1	130	1
320	2	70	0
320	3	35	0
320	4	70	0
320	5	35	0
320	6	60	0
321	1	170	2
321	2	90	0
321	3	45	0
321	4	90	0
321	5	45	0
321	6	60	0
322	1	60	0
322	2	60	0
322	3	40	0
322	4	65	1
322	5	45	0
322	6	35	0
323	1	70	0
323	2	100	1
323	3	70	0
323	4	105	1
323	5	75	0
323	6	40	0
324	1	70	0
324	2	85	0
324	3	140	2
324	4	85	0
324	5	70	0
324	6	20	0
325	1	60	0
325	2	25	0
325	3	35	0
325	4	70	0
325	5	80	1
325	6	60	0
326	1	80	0
326	2	45	0
326	3	65	0
326	4	90	0
326	5	110	2
326	6	80	0
327	1	60	0
327	2	60	0
327	3	60	0
327	4	60	1
327	5	60	0
327	6	60	0
328	1	45	0
328	2	100	1
328	3	45	0
328	4	45	0
328	5	45	0
328	6	10	0
329	1	50	0
329	2	70	1
329	3	50	0
329	4	50	0
329	5	50	0
329	6	70	1
330	1	80	0
330	2	100	1
330	3	80	0
330	4	80	0
330	5	80	0
330	6	100	2
331	1	50	0
331	2	85	0
331	3	40	0
331	4	85	1
331	5	40	0
331	6	35	0
332	1	70	0
332	2	115	1
332	3	60	0
332	4	115	1
332	5	60	0
332	6	55	0
333	1	45	0
333	2	40	0
333	3	60	0
333	4	40	0
333	5	75	1
333	6	50	0
334	1	75	0
334	2	70	0
334	3	90	0
334	4	70	0
334	5	105	2
334	6	80	0
335	1	73	0
335	2	115	2
335	3	60	0
335	4	60	0
335	5	60	0
335	6	90	0
336	1	73	0
336	2	100	1
336	3	60	0
336	4	100	1
336	5	60	0
336	6	65	0
337	1	70	0
337	2	55	0
337	3	65	0
337	4	95	2
337	5	85	0
337	6	70	0
338	1	70	0
338	2	95	2
338	3	85	0
338	4	55	0
338	5	65	0
338	6	70	0
339	1	50	1
339	2	48	0
339	3	43	0
339	4	46	0
339	5	41	0
339	6	60	0
340	1	110	2
340	2	78	0
340	3	73	0
340	4	76	0
340	5	71	0
340	6	60	0
341	1	43	0
341	2	80	1
341	3	65	0
341	4	50	0
341	5	35	0
341	6	35	0
342	1	63	0
342	2	120	2
342	3	85	0
342	4	90	0
342	5	55	0
342	6	55	0
343	1	40	0
343	2	40	0
343	3	55	0
343	4	40	0
343	5	70	1
343	6	55	0
344	1	60	0
344	2	70	0
344	3	105	0
344	4	70	0
344	5	120	2
344	6	75	0
345	1	66	0
345	2	41	0
345	3	77	0
345	4	61	0
345	5	87	1
345	6	23	0
346	1	86	0
346	2	81	0
346	3	97	0
346	4	81	0
346	5	107	2
346	6	43	0
347	1	45	0
347	2	95	1
347	3	50	0
347	4	40	0
347	5	50	0
347	6	75	0
348	1	75	0
348	2	125	2
348	3	100	0
348	4	70	0
348	5	80	0
348	6	45	0
349	1	20	0
349	2	15	0
349	3	20	0
349	4	10	0
349	5	55	0
349	6	80	1
350	1	95	0
350	2	60	0
350	3	79	0
350	4	100	0
350	5	125	2
350	6	81	0
351	1	70	1
351	2	70	0
351	3	70	0
351	4	70	0
351	5	70	0
351	6	70	0
352	1	60	0
352	2	90	0
352	3	70	0
352	4	60	0
352	5	120	1
352	6	40	0
353	1	44	0
353	2	75	1
353	3	35	0
353	4	63	0
353	5	33	0
353	6	45	0
354	1	64	0
354	2	115	2
354	3	65	0
354	4	83	0
354	5	63	0
354	6	65	0
355	1	20	0
355	2	40	0
355	3	90	0
355	4	30	0
355	5	90	1
355	6	25	0
356	1	40	0
356	2	70	0
356	3	130	1
356	4	60	0
356	5	130	1
356	6	25	0
357	1	99	2
357	2	68	0
357	3	83	0
357	4	72	0
357	5	87	0
357	6	51	0
358	1	65	0
358	2	50	0
358	3	70	0
358	4	95	1
358	5	80	1
358	6	65	0
359	1	65	0
359	2	130	2
359	3	60	0
359	4	75	0
359	5	60	0
359	6	75	0
360	1	95	1
360	2	23	0
360	3	48	0
360	4	23	0
360	5	48	0
360	6	23	0
361	1	50	1
361	2	50	0
361	3	50	0
361	4	50	0
361	5	50	0
361	6	50	0
362	1	80	2
362	2	80	0
362	3	80	0
362	4	80	0
362	5	80	0
362	6	80	0
363	1	70	1
363	2	40	0
363	3	50	0
363	4	55	0
363	5	50	0
363	6	25	0
364	1	90	2
364	2	60	0
364	3	70	0
364	4	75	0
364	5	70	0
364	6	45	0
365	1	110	3
365	2	80	0
365	3	90	0
365	4	95	0
365	5	90	0
365	6	65	0
366	1	35	0
366	2	64	0
366	3	85	1
366	4	74	0
366	5	55	0
366	6	32	0
367	1	55	0
367	2	104	1
367	3	105	1
367	4	94	0
367	5	75	0
367	6	52	0
368	1	55	0
368	2	84	0
368	3	105	0
368	4	114	2
368	5	75	0
368	6	52	0
369	1	100	1
369	2	90	0
369	3	130	1
369	4	45	0
369	5	65	0
369	6	55	0
370	1	43	0
370	2	30	0
370	3	55	0
370	4	40	0
370	5	65	0
370	6	97	1
371	1	45	0
371	2	75	1
371	3	60	0
371	4	40	0
371	5	30	0
371	6	50	0
372	1	65	0
372	2	95	0
372	3	100	2
372	4	60	0
372	5	50	0
372	6	50	0
373	1	95	0
373	2	135	3
373	3	80	0
373	4	110	0
373	5	80	0
373	6	100	0
374	1	40	0
374	2	55	0
374	3	80	1
374	4	35	0
374	5	60	0
374	6	30	0
375	1	60	0
375	2	75	0
375	3	100	2
375	4	55	0
375	5	80	0
375	6	50	0
376	1	80	0
376	2	135	0
376	3	130	3
376	4	95	0
376	5	90	0
376	6	70	0
377	1	80	0
377	2	100	0
377	3	200	3
377	4	50	0
377	5	100	0
377	6	50	0
378	1	80	0
378	2	50	0
378	3	100	0
378	4	100	0
378	5	200	3
378	6	50	0
379	1	80	0
379	2	75	0
379	3	150	2
379	4	75	0
379	5	150	1
379	6	50	0
380	1	80	0
380	2	80	0
380	3	90	0
380	4	110	0
380	5	130	3
380	6	110	0
381	1	80	0
381	2	90	0
381	3	80	0
381	4	130	3
381	5	110	0
381	6	110	0
382	1	100	0
382	2	100	0
382	3	90	0
382	4	150	3
382	5	140	0
382	6	90	0
383	1	100	0
383	2	150	3
383	3	140	0
383	4	100	0
383	5	90	0
383	6	90	0
384	1	105	0
384	2	150	2
384	3	90	0
384	4	150	1
384	5	90	0
384	6	95	0
385	1	100	3
385	2	100	0
385	3	100	0
385	4	100	0
385	5	100	0
385	6	100	0
386	1	50	0
386	2	150	1
386	3	50	0
386	4	150	1
386	5	50	0
386	6	150	1
387	1	55	0
387	2	68	1
387	3	64	0
387	4	45	0
387	5	55	0
387	6	31	0
388	1	75	0
388	2	89	1
388	3	85	1
388	4	55	0
388	5	65	0
388	6	36	0
389	1	95	0
389	2	109	2
389	3	105	1
389	4	75	0
389	5	85	0
389	6	56	0
390	1	44	0
390	2	58	0
390	3	44	0
390	4	58	0
390	5	44	0
390	6	61	1
391	1	64	0
391	2	78	0
391	3	52	0
391	4	78	1
391	5	52	0
391	6	81	1
392	1	76	0
392	2	104	1
392	3	71	0
392	4	104	1
392	5	71	0
392	6	108	1
393	1	53	0
393	2	51	0
393	3	53	0
393	4	61	1
393	5	56	0
393	6	40	0
394	1	64	0
394	2	66	0
394	3	68	0
394	4	81	2
394	5	76	0
394	6	50	0
395	1	84	0
395	2	86	0
395	3	88	0
395	4	111	3
395	5	101	0
395	6	60	0
396	1	40	0
396	2	55	0
396	3	30	0
396	4	30	0
396	5	30	0
396	6	60	1
397	1	55	0
397	2	75	0
397	3	50	0
397	4	40	0
397	5	40	0
397	6	80	2
398	1	85	0
398	2	120	3
398	3	70	0
398	4	50	0
398	5	60	0
398	6	100	0
399	1	59	1
399	2	45	0
399	3	40	0
399	4	35	0
399	5	40	0
399	6	31	0
400	1	79	0
400	2	85	2
400	3	60	0
400	4	55	0
400	5	60	0
400	6	71	0
401	1	37	0
401	2	25	0
401	3	41	1
401	4	25	0
401	5	41	0
401	6	25	0
402	1	77	0
402	2	85	2
402	3	51	0
402	4	55	0
402	5	51	0
402	6	65	0
403	1	45	0
403	2	65	1
403	3	34	0
403	4	40	0
403	5	34	0
403	6	45	0
404	1	60	0
404	2	85	2
404	3	49	0
404	4	60	0
404	5	49	0
404	6	60	0
405	1	80	0
405	2	120	3
405	3	79	0
405	4	95	0
405	5	79	0
405	6	70	0
406	1	40	0
406	2	30	0
406	3	35	0
406	4	50	1
406	5	70	0
406	6	55	0
407	1	60	0
407	2	70	0
407	3	65	0
407	4	125	3
407	5	105	0
407	6	90	0
408	1	67	0
408	2	125	1
408	3	40	0
408	4	30	0
408	5	30	0
408	6	58	0
409	1	97	0
409	2	165	2
409	3	60	0
409	4	65	0
409	5	50	0
409	6	58	0
410	1	30	0
410	2	42	0
410	3	118	1
410	4	42	0
410	5	88	0
410	6	30	0
411	1	60	0
411	2	52	0
411	3	168	2
411	4	47	0
411	5	138	0
411	6	30	0
412	1	40	0
412	2	29	0
412	3	45	0
412	4	29	0
412	5	45	1
412	6	36	0
413	1	60	0
413	2	59	0
413	3	85	0
413	4	79	0
413	5	105	2
413	6	36	0
414	1	70	0
414	2	94	1
414	3	50	0
414	4	94	1
414	5	50	0
414	6	66	0
415	1	30	0
415	2	30	0
415	3	42	0
415	4	30	0
415	5	42	0
415	6	70	1
416	1	70	0
416	2	80	0
416	3	102	1
416	4	80	0
416	5	102	1
416	6	40	0
417	1	60	0
417	2	45	0
417	3	70	0
417	4	45	0
417	5	90	0
417	6	95	1
418	1	55	0
418	2	65	0
418	3	35	0
418	4	60	0
418	5	30	0
418	6	85	1
419	1	85	0
419	2	105	0
419	3	55	0
419	4	85	0
419	5	50	0
419	6	115	2
420	1	45	0
420	2	35	0
420	3	45	0
420	4	62	1
420	5	53	0
420	6	35	0
421	1	70	0
421	2	60	0
421	3	70	0
421	4	87	2
421	5	78	0
421	6	85	0
422	1	76	1
422	2	48	0
422	3	48	0
422	4	57	0
422	5	62	0
422	6	34	0
423	1	111	2
423	2	83	0
423	3	68	0
423	4	92	0
423	5	82	0
423	6	39	0
424	1	75	0
424	2	100	0
424	3	66	0
424	4	60	0
424	5	66	0
424	6	115	2
425	1	90	1
425	2	50	0
425	3	34	0
425	4	60	0
425	5	44	0
425	6	70	0
426	1	150	2
426	2	80	0
426	3	44	0
426	4	90	0
426	5	54	0
426	6	80	0
427	1	55	0
427	2	66	0
427	3	44	0
427	4	44	0
427	5	56	0
427	6	85	1
428	1	65	0
428	2	76	0
428	3	84	0
428	4	54	0
428	5	96	0
428	6	105	2
429	1	60	0
429	2	60	0
429	3	60	0
429	4	105	1
429	5	105	1
429	6	105	0
430	1	100	0
430	2	125	2
430	3	52	0
430	4	105	0
430	5	52	0
430	6	71	0
431	1	49	0
431	2	55	0
431	3	42	0
431	4	42	0
431	5	37	0
431	6	85	1
432	1	71	0
432	2	82	0
432	3	64	0
432	4	64	0
432	5	59	0
432	6	112	2
433	1	45	0
433	2	30	0
433	3	50	0
433	4	65	1
433	5	50	0
433	6	45	0
434	1	63	0
434	2	63	0
434	3	47	0
434	4	41	0
434	5	41	0
434	6	74	1
435	1	103	2
435	2	93	0
435	3	67	0
435	4	71	0
435	5	61	0
435	6	84	0
436	1	57	0
436	2	24	0
436	3	86	1
436	4	24	0
436	5	86	0
436	6	23	0
437	1	67	0
437	2	89	0
437	3	116	1
437	4	79	0
437	5	116	1
437	6	33	0
438	1	50	0
438	2	80	0
438	3	95	1
438	4	10	0
438	5	45	0
438	6	10	0
439	1	20	0
439	2	25	0
439	3	45	0
439	4	70	0
439	5	90	1
439	6	60	0
440	1	100	1
440	2	5	0
440	3	5	0
440	4	15	0
440	5	65	0
440	6	30	0
441	1	76	0
441	2	65	1
441	3	45	0
441	4	92	0
441	5	42	0
441	6	91	0
442	1	50	0
442	2	92	0
442	3	108	1
442	4	92	0
442	5	108	1
442	6	35	0
443	1	58	0
443	2	70	1
443	3	45	0
443	4	40	0
443	5	45	0
443	6	42	0
444	1	68	0
444	2	90	2
444	3	65	0
444	4	50	0
444	5	55	0
444	6	82	0
445	1	108	0
445	2	130	3
445	3	95	0
445	4	80	0
445	5	85	0
445	6	102	0
446	1	135	1
446	2	85	0
446	3	40	0
446	4	40	0
446	5	85	0
446	6	5	0
447	1	40	0
447	2	70	1
447	3	40	0
447	4	35	0
447	5	40	0
447	6	60	0
448	1	70	0
448	2	110	1
448	3	70	0
448	4	115	1
448	5	70	0
448	6	90	0
449	1	68	0
449	2	72	0
449	3	78	1
449	4	38	0
449	5	42	0
449	6	32	0
450	1	108	0
450	2	112	0
450	3	118	2
450	4	68	0
450	5	72	0
450	6	47	0
451	1	40	0
451	2	50	0
451	3	90	1
451	4	30	0
451	5	55	0
451	6	65	0
452	1	70	0
452	2	90	0
452	3	110	2
452	4	60	0
452	5	75	0
452	6	95	0
453	1	48	0
453	2	61	1
453	3	40	0
453	4	61	0
453	5	40	0
453	6	50	0
454	1	83	0
454	2	106	2
454	3	65	0
454	4	86	0
454	5	65	0
454	6	85	0
455	1	74	0
455	2	100	2
455	3	72	0
455	4	90	0
455	5	72	0
455	6	46	0
456	1	49	0
456	2	49	0
456	3	56	0
456	4	49	0
456	5	61	0
456	6	66	1
457	1	69	0
457	2	69	0
457	3	76	0
457	4	69	0
457	5	86	0
457	6	91	2
458	1	45	0
458	2	20	0
458	3	50	0
458	4	60	0
458	5	120	1
458	6	50	0
459	1	60	0
459	2	62	1
459	3	50	0
459	4	62	0
459	5	60	0
459	6	40	0
460	1	90	0
460	2	92	1
460	3	75	0
460	4	92	1
460	5	85	0
460	6	60	0
461	1	70	0
461	2	120	1
461	3	65	0
461	4	45	0
461	5	85	0
461	6	125	1
462	1	70	0
462	2	70	0
462	3	115	0
462	4	130	3
462	5	90	0
462	6	60	0
463	1	110	3
463	2	85	0
463	3	95	0
463	4	80	0
463	5	95	0
463	6	50	0
464	1	115	0
464	2	140	3
464	3	130	0
464	4	55	0
464	5	55	0
464	6	40	0
465	1	100	0
465	2	100	0
465	3	125	2
465	4	110	0
465	5	50	0
465	6	50	0
466	1	75	0
466	2	123	3
466	3	67	0
466	4	95	0
466	5	85	0
466	6	95	0
467	1	75	0
467	2	95	0
467	3	67	0
467	4	125	3
467	5	95	0
467	6	83	0
468	1	85	0
468	2	50	0
468	3	95	0
468	4	120	2
468	5	115	1
468	6	80	0
469	1	86	0
469	2	76	2
469	3	86	0
469	4	116	0
469	5	56	0
469	6	95	0
470	1	65	0
470	2	110	0
470	3	130	2
470	4	60	0
470	5	65	0
470	6	95	0
471	1	65	0
471	2	60	0
471	3	110	0
471	4	130	2
471	5	95	0
471	6	65	0
472	1	75	0
472	2	95	0
472	3	125	2
472	4	45	0
472	5	75	0
472	6	95	0
473	1	110	0
473	2	130	3
473	3	80	0
473	4	70	0
473	5	60	0
473	6	80	0
474	1	85	0
474	2	80	0
474	3	70	0
474	4	135	3
474	5	75	0
474	6	90	0
475	1	68	0
475	2	125	3
475	3	65	0
475	4	65	0
475	5	115	0
475	6	80	0
476	1	60	0
476	2	55	0
476	3	145	1
476	4	75	0
476	5	150	2
476	6	40	0
477	1	45	0
477	2	100	0
477	3	135	1
477	4	65	0
477	5	135	2
477	6	45	0
478	1	70	0
478	2	80	0
478	3	70	0
478	4	80	0
478	5	70	0
478	6	110	2
479	1	50	0
479	2	50	0
479	3	77	0
479	4	95	1
479	5	77	0
479	6	91	1
480	1	75	0
480	2	75	0
480	3	130	2
480	4	75	0
480	5	130	1
480	6	95	0
481	1	80	0
481	2	105	1
481	3	105	0
481	4	105	1
481	5	105	1
481	6	80	0
482	1	75	0
482	2	125	2
482	3	70	0
482	4	125	1
482	5	70	0
482	6	115	0
483	1	100	0
483	2	120	0
483	3	120	0
483	4	150	3
483	5	100	0
483	6	90	0
484	1	90	0
484	2	120	0
484	3	100	0
484	4	150	3
484	5	120	0
484	6	100	0
485	1	91	0
485	2	90	0
485	3	106	0
485	4	130	3
485	5	106	0
485	6	77	0
486	1	110	0
486	2	160	3
486	3	110	0
486	4	80	0
486	5	110	0
486	6	100	0
487	1	150	3
487	2	100	0
487	3	120	0
487	4	100	0
487	5	120	0
487	6	90	0
488	1	120	0
488	2	70	0
488	3	120	0
488	4	75	0
488	5	130	3
488	6	85	0
489	1	80	1
489	2	80	0
489	3	80	0
489	4	80	0
489	5	80	0
489	6	80	0
490	1	100	3
490	2	100	0
490	3	100	0
490	4	100	0
490	5	100	0
490	6	100	0
491	1	70	0
491	2	90	0
491	3	90	0
491	4	135	2
491	5	90	0
491	6	125	1
492	1	100	3
492	2	100	0
492	3	100	0
492	4	100	0
492	5	100	0
492	6	100	0
493	1	120	3
493	2	120	0
493	3	120	0
493	4	120	0
493	5	120	0
493	6	120	0
494	1	100	3
494	2	100	0
494	3	100	0
494	4	100	0
494	5	100	0
494	6	100	0
495	1	45	0
495	2	45	0
495	3	55	0
495	4	45	0
495	5	55	0
495	6	63	1
496	1	60	0
496	2	60	0
496	3	75	0
496	4	60	0
496	5	75	0
496	6	83	2
497	1	75	0
497	2	75	0
497	3	95	0
497	4	75	0
497	5	95	0
497	6	113	3
498	1	65	1
498	2	63	0
498	3	45	0
498	4	45	0
498	5	45	0
498	6	45	0
499	1	90	0
499	2	93	2
499	3	55	0
499	4	70	0
499	5	55	0
499	6	55	0
500	1	110	0
500	2	123	3
500	3	65	0
500	4	100	0
500	5	65	0
500	6	65	0
501	1	55	0
501	2	55	0
501	3	45	0
501	4	63	1
501	5	45	0
501	6	45	0
502	1	75	0
502	2	75	0
502	3	60	0
502	4	83	2
502	5	60	0
502	6	60	0
503	1	95	0
503	2	100	0
503	3	85	0
503	4	108	3
503	5	70	0
503	6	70	0
504	1	45	0
504	2	55	1
504	3	39	0
504	4	35	0
504	5	39	0
504	6	42	0
505	1	60	0
505	2	85	2
505	3	69	0
505	4	60	0
505	5	69	0
505	6	77	0
506	1	45	0
506	2	60	1
506	3	45	0
506	4	25	0
506	5	45	0
506	6	55	0
507	1	65	0
507	2	80	2
507	3	65	0
507	4	35	0
507	5	65	0
507	6	60	0
508	1	85	0
508	2	110	3
508	3	90	0
508	4	45	0
508	5	90	0
508	6	80	0
509	1	41	0
509	2	50	0
509	3	37	0
509	4	50	0
509	5	37	0
509	6	66	1
510	1	64	0
510	2	88	0
510	3	50	0
510	4	88	0
510	5	50	0
510	6	106	2
511	1	50	0
511	2	53	0
511	3	48	0
511	4	53	0
511	5	48	0
511	6	64	1
512	1	75	0
512	2	98	0
512	3	63	0
512	4	98	0
512	5	63	0
512	6	101	2
513	1	50	0
513	2	53	0
513	3	48	0
513	4	53	0
513	5	48	0
513	6	64	1
514	1	75	0
514	2	98	0
514	3	63	0
514	4	98	0
514	5	63	0
514	6	101	2
515	1	50	0
515	2	53	0
515	3	48	0
515	4	53	0
515	5	48	0
515	6	64	1
516	1	75	0
516	2	98	0
516	3	63	0
516	4	98	0
516	5	63	0
516	6	101	2
517	1	76	1
517	2	25	0
517	3	45	0
517	4	67	0
517	5	55	0
517	6	24	0
518	1	116	2
518	2	55	0
518	3	85	0
518	4	107	0
518	5	95	0
518	6	29	0
519	1	50	0
519	2	55	1
519	3	50	0
519	4	36	0
519	5	30	0
519	6	43	0
520	1	62	0
520	2	77	2
520	3	62	0
520	4	50	0
520	5	42	0
520	6	65	0
521	1	80	0
521	2	115	3
521	3	80	0
521	4	65	0
521	5	55	0
521	6	93	0
522	1	45	0
522	2	60	0
522	3	32	0
522	4	50	0
522	5	32	0
522	6	76	1
523	1	75	0
523	2	100	0
523	3	63	0
523	4	80	0
523	5	63	0
523	6	116	2
524	1	55	0
524	2	75	0
524	3	85	1
524	4	25	0
524	5	25	0
524	6	15	0
525	1	70	0
525	2	105	1
525	3	105	1
525	4	50	0
525	5	40	0
525	6	20	0
526	1	85	0
526	2	135	3
526	3	130	0
526	4	60	0
526	5	80	0
526	6	25	0
527	1	55	0
527	2	45	0
527	3	43	0
527	4	55	0
527	5	43	0
527	6	72	1
528	1	67	0
528	2	57	0
528	3	55	0
528	4	77	0
528	5	55	0
528	6	114	2
529	1	60	0
529	2	85	1
529	3	40	0
529	4	30	0
529	5	45	0
529	6	68	0
530	1	110	0
530	2	135	2
530	3	60	0
530	4	50	0
530	5	65	0
530	6	88	0
531	1	103	2
531	2	60	0
531	3	86	0
531	4	60	0
531	5	86	0
531	6	50	0
532	1	75	0
532	2	80	1
532	3	55	0
532	4	25	0
532	5	35	0
532	6	35	0
533	1	85	0
533	2	105	2
533	3	85	0
533	4	40	0
533	5	50	0
533	6	40	0
534	1	105	0
534	2	140	3
534	3	95	0
534	4	55	0
534	5	65	0
534	6	45	0
535	1	50	0
535	2	50	0
535	3	40	0
535	4	50	0
535	5	40	0
535	6	64	1
536	1	75	2
536	2	65	0
536	3	55	0
536	4	65	0
536	5	55	0
536	6	69	0
537	1	105	3
537	2	95	0
537	3	75	0
537	4	85	0
537	5	75	0
537	6	74	0
538	1	120	2
538	2	100	0
538	3	85	0
538	4	30	0
538	5	85	0
538	6	45	0
539	1	75	0
539	2	125	2
539	3	75	0
539	4	30	0
539	5	75	0
539	6	85	0
540	1	45	0
540	2	53	0
540	3	70	1
540	4	40	0
540	5	60	0
540	6	42	0
541	1	55	0
541	2	63	0
541	3	90	2
541	4	50	0
541	5	80	0
541	6	42	0
542	1	75	0
542	2	103	3
542	3	80	0
542	4	70	0
542	5	80	0
542	6	92	0
543	1	30	0
543	2	45	0
543	3	59	1
543	4	30	0
543	5	39	0
543	6	57	0
544	1	40	0
544	2	55	0
544	3	99	2
544	4	40	0
544	5	79	0
544	6	47	0
545	1	60	0
545	2	100	0
545	3	89	0
545	4	55	0
545	5	69	0
545	6	112	3
546	1	40	0
546	2	27	0
546	3	60	0
546	4	37	0
546	5	50	0
546	6	66	1
547	1	60	0
547	2	67	0
547	3	85	0
547	4	77	0
547	5	75	0
547	6	116	2
548	1	45	0
548	2	35	0
548	3	50	0
548	4	70	1
548	5	50	0
548	6	30	0
549	1	70	0
549	2	60	0
549	3	75	0
549	4	110	2
549	5	75	0
549	6	90	0
550	1	70	0
550	2	92	0
550	3	65	0
550	4	80	0
550	5	55	0
550	6	98	2
551	1	50	0
551	2	72	1
551	3	35	0
551	4	35	0
551	5	35	0
551	6	65	0
552	1	60	0
552	2	82	2
552	3	45	0
552	4	45	0
552	5	45	0
552	6	74	0
553	1	95	0
553	2	117	3
553	3	80	0
553	4	65	0
553	5	70	0
553	6	92	0
554	1	70	0
554	2	90	1
554	3	45	0
554	4	15	0
554	5	45	0
554	6	50	0
555	1	105	0
555	2	140	2
555	3	55	0
555	4	30	0
555	5	55	0
555	6	95	0
556	1	75	0
556	2	86	0
556	3	67	0
556	4	106	2
556	5	67	0
556	6	60	0
557	1	50	0
557	2	65	0
557	3	85	1
557	4	35	0
557	5	35	0
557	6	55	0
558	1	70	0
558	2	95	0
558	3	125	2
558	4	65	0
558	5	75	0
558	6	45	0
559	1	50	0
559	2	75	1
559	3	70	0
559	4	35	0
559	5	70	0
559	6	48	0
560	1	65	0
560	2	90	0
560	3	115	1
560	4	45	0
560	5	115	1
560	6	58	0
561	1	72	0
561	2	58	0
561	3	80	0
561	4	103	2
561	5	80	0
561	6	97	0
562	1	38	0
562	2	30	0
562	3	85	1
562	4	55	0
562	5	65	0
562	6	30	0
563	1	58	0
563	2	50	0
563	3	145	2
563	4	95	0
563	5	105	0
563	6	30	0
564	1	54	0
564	2	78	0
564	3	103	1
564	4	53	0
564	5	45	0
564	6	22	0
565	1	74	0
565	2	108	0
565	3	133	2
565	4	83	0
565	5	65	0
565	6	32	0
566	1	55	0
566	2	112	1
566	3	45	0
566	4	74	0
566	5	45	0
566	6	70	0
567	1	75	0
567	2	140	2
567	3	65	0
567	4	112	0
567	5	65	0
567	6	110	0
568	1	50	0
568	2	50	0
568	3	62	0
568	4	40	0
568	5	62	0
568	6	65	1
569	1	80	0
569	2	95	2
569	3	82	0
569	4	60	0
569	5	82	0
569	6	75	0
570	1	40	0
570	2	65	0
570	3	40	0
570	4	80	1
570	5	40	0
570	6	65	0
571	1	60	0
571	2	105	0
571	3	60	0
571	4	120	2
571	5	60	0
571	6	105	0
572	1	55	0
572	2	50	0
572	3	40	0
572	4	40	0
572	5	40	0
572	6	75	1
573	1	75	0
573	2	95	0
573	3	60	0
573	4	65	0
573	5	60	0
573	6	115	2
574	1	45	0
574	2	30	0
574	3	50	0
574	4	55	0
574	5	65	1
574	6	45	0
575	1	60	0
575	2	45	0
575	3	70	0
575	4	75	0
575	5	85	2
575	6	55	0
576	1	70	0
576	2	55	0
576	3	95	0
576	4	95	0
576	5	110	3
576	6	65	0
577	1	45	0
577	2	30	0
577	3	40	0
577	4	105	1
577	5	50	0
577	6	20	0
578	1	65	0
578	2	40	0
578	3	50	0
578	4	125	2
578	5	60	0
578	6	30	0
579	1	110	0
579	2	65	0
579	3	75	0
579	4	125	3
579	5	85	0
579	6	30	0
580	1	62	1
580	2	44	0
580	3	50	0
580	4	44	0
580	5	50	0
580	6	55	0
581	1	75	0
581	2	87	0
581	3	63	0
581	4	87	0
581	5	63	0
581	6	98	2
582	1	36	0
582	2	50	0
582	3	50	0
582	4	65	1
582	5	60	0
582	6	44	0
583	1	51	0
583	2	65	0
583	3	65	0
583	4	80	2
583	5	75	0
583	6	59	0
584	1	71	0
584	2	95	0
584	3	85	0
584	4	110	3
584	5	95	0
584	6	79	0
585	1	60	0
585	2	60	0
585	3	50	0
585	4	40	0
585	5	50	0
585	6	75	1
586	1	80	0
586	2	100	2
586	3	70	0
586	4	60	0
586	5	70	0
586	6	95	0
587	1	55	0
587	2	75	0
587	3	60	0
587	4	75	0
587	5	60	0
587	6	103	2
588	1	50	0
588	2	75	1
588	3	45	0
588	4	40	0
588	5	45	0
588	6	60	0
589	1	70	0
589	2	135	2
589	3	105	0
589	4	60	0
589	5	105	0
589	6	20	0
590	1	69	1
590	2	55	0
590	3	45	0
590	4	55	0
590	5	55	0
590	6	15	0
591	1	114	2
591	2	85	0
591	3	70	0
591	4	85	0
591	5	80	0
591	6	30	0
592	1	55	0
592	2	40	0
592	3	50	0
592	4	65	0
592	5	85	1
592	6	40	0
593	1	100	0
593	2	60	0
593	3	70	0
593	4	85	0
593	5	105	2
593	6	60	0
594	1	165	2
594	2	75	0
594	3	80	0
594	4	40	0
594	5	45	0
594	6	65	0
595	1	50	0
595	2	47	0
595	3	50	0
595	4	57	0
595	5	50	0
595	6	65	1
596	1	70	0
596	2	77	0
596	3	60	0
596	4	97	0
596	5	60	0
596	6	108	2
597	1	44	0
597	2	50	0
597	3	91	1
597	4	24	0
597	5	86	0
597	6	10	0
598	1	74	0
598	2	94	0
598	3	131	2
598	4	54	0
598	5	116	0
598	6	20	0
599	1	40	0
599	2	55	0
599	3	70	1
599	4	45	0
599	5	60	0
599	6	30	0
600	1	60	0
600	2	80	0
600	3	95	2
600	4	70	0
600	5	85	0
600	6	50	0
601	1	60	0
601	2	100	0
601	3	115	3
601	4	70	0
601	5	85	0
601	6	90	0
602	1	35	0
602	2	55	0
602	3	40	0
602	4	45	0
602	5	40	0
602	6	60	1
603	1	65	0
603	2	85	2
603	3	70	0
603	4	75	0
603	5	70	0
603	6	40	0
604	1	85	0
604	2	115	3
604	3	80	0
604	4	105	0
604	5	80	0
604	6	50	0
605	1	55	0
605	2	55	0
605	3	55	0
605	4	85	1
605	5	55	0
605	6	30	0
606	1	75	0
606	2	75	0
606	3	75	0
606	4	125	2
606	5	95	0
606	6	40	0
607	1	50	0
607	2	30	0
607	3	55	0
607	4	65	1
607	5	55	0
607	6	20	0
608	1	60	0
608	2	40	0
608	3	60	0
608	4	95	2
608	5	60	0
608	6	55	0
609	1	60	0
609	2	55	0
609	3	90	0
609	4	145	3
609	5	90	0
609	6	80	0
610	1	46	0
610	2	87	1
610	3	60	0
610	4	30	0
610	5	40	0
610	6	57	0
611	1	66	0
611	2	117	2
611	3	70	0
611	4	40	0
611	5	50	0
611	6	67	0
612	1	76	0
612	2	147	3
612	3	90	0
612	4	60	0
612	5	70	0
612	6	97	0
613	1	55	0
613	2	70	1
613	3	40	0
613	4	60	0
613	5	40	0
613	6	40	0
614	1	95	0
614	2	110	2
614	3	80	0
614	4	70	0
614	5	80	0
614	6	50	0
615	1	70	0
615	2	50	0
615	3	30	0
615	4	95	0
615	5	135	2
615	6	105	0
616	1	50	0
616	2	40	0
616	3	85	1
616	4	40	0
616	5	65	0
616	6	25	0
617	1	80	0
617	2	70	0
617	3	40	0
617	4	100	0
617	5	60	0
617	6	145	2
618	1	109	2
618	2	66	0
618	3	84	0
618	4	81	0
618	5	99	0
618	6	32	0
619	1	45	0
619	2	85	1
619	3	50	0
619	4	55	0
619	5	50	0
619	6	65	0
620	1	65	0
620	2	125	2
620	3	60	0
620	4	95	0
620	5	60	0
620	6	105	0
621	1	77	0
621	2	120	2
621	3	90	0
621	4	60	0
621	5	90	0
621	6	48	0
622	1	59	0
622	2	74	1
622	3	50	0
622	4	35	0
622	5	50	0
622	6	35	0
623	1	89	0
623	2	124	2
623	3	80	0
623	4	55	0
623	5	80	0
623	6	55	0
624	1	45	0
624	2	85	1
624	3	70	0
624	4	40	0
624	5	40	0
624	6	60	0
625	1	65	0
625	2	125	2
625	3	100	0
625	4	60	0
625	5	70	0
625	6	70	0
626	1	95	0
626	2	110	2
626	3	95	0
626	4	40	0
626	5	95	0
626	6	55	0
627	1	70	0
627	2	83	1
627	3	50	0
627	4	37	0
627	5	50	0
627	6	60	0
628	1	100	0
628	2	123	2
628	3	75	0
628	4	57	0
628	5	75	0
628	6	80	0
629	1	70	0
629	2	55	0
629	3	75	1
629	4	45	0
629	5	65	0
629	6	60	0
630	1	110	0
630	2	65	0
630	3	105	0
630	4	55	2
630	5	95	0
630	6	80	0
631	1	85	0
631	2	97	0
631	3	66	0
631	4	105	2
631	5	66	0
631	6	65	0
632	1	58	0
632	2	109	0
632	3	112	2
632	4	48	0
632	5	48	0
632	6	109	0
633	1	52	0
633	2	65	1
633	3	50	0
633	4	45	0
633	5	50	0
633	6	38	0
634	1	72	0
634	2	85	2
634	3	70	0
634	4	65	0
634	5	70	0
634	6	58	0
635	1	92	0
635	2	105	0
635	3	90	0
635	4	125	3
635	5	90	0
635	6	98	0
636	1	55	0
636	2	85	1
636	3	55	0
636	4	50	0
636	5	55	0
636	6	60	0
637	1	85	0
637	2	60	0
637	3	65	0
637	4	135	3
637	5	105	0
637	6	100	0
638	1	91	0
638	2	90	0
638	3	129	3
638	4	90	0
638	5	72	0
638	6	108	0
639	1	91	0
639	2	129	3
639	3	90	0
639	4	72	0
639	5	90	0
639	6	108	0
640	1	91	0
640	2	90	0
640	3	72	0
640	4	90	0
640	5	129	3
640	6	108	0
641	1	79	0
641	2	115	3
641	3	70	0
641	4	125	0
641	5	80	0
641	6	111	0
642	1	79	0
642	2	115	3
642	3	70	0
642	4	125	0
642	5	80	0
642	6	111	0
643	1	100	0
643	2	120	0
643	3	100	0
643	4	150	3
643	5	120	0
643	6	90	0
644	1	100	0
644	2	150	3
644	3	120	0
644	4	120	0
644	5	100	0
644	6	90	0
645	1	89	0
645	2	125	0
645	3	90	0
645	4	115	3
645	5	80	0
645	6	101	0
646	1	125	1
646	2	130	1
646	3	90	0
646	4	130	1
646	5	90	0
646	6	95	0
647	1	91	0
647	2	72	0
647	3	90	0
647	4	129	3
647	5	90	0
647	6	108	0
648	1	100	0
648	2	77	0
648	3	77	0
648	4	128	1
648	5	128	1
648	6	90	1
649	1	71	0
649	2	120	1
649	3	95	0
649	4	120	1
649	5	95	0
649	6	99	1
650	1	56	0
650	2	61	0
650	3	65	1
650	4	48	0
650	5	45	0
650	6	38	0
651	1	61	0
651	2	78	0
651	3	95	2
651	4	56	0
651	5	58	0
651	6	57	0
652	1	88	0
652	2	107	0
652	3	122	3
652	4	74	0
652	5	75	0
652	6	64	0
653	1	40	0
653	2	45	0
653	3	40	0
653	4	62	1
653	5	60	0
653	6	60	0
654	1	59	0
654	2	59	0
654	3	58	0
654	4	90	2
654	5	70	0
654	6	73	0
655	1	75	0
655	2	69	0
655	3	72	0
655	4	114	3
655	5	100	0
655	6	104	0
656	1	41	0
656	2	56	0
656	3	40	0
656	4	62	0
656	5	44	0
656	6	71	1
657	1	54	0
657	2	63	0
657	3	52	0
657	4	83	0
657	5	56	0
657	6	97	2
658	1	72	0
658	2	95	0
658	3	67	0
658	4	103	0
658	5	71	0
658	6	122	3
659	1	38	0
659	2	36	0
659	3	38	0
659	4	32	0
659	5	36	0
659	6	57	1
660	1	85	2
660	2	56	0
660	3	77	0
660	4	50	0
660	5	77	0
660	6	78	0
661	1	45	0
661	2	50	0
661	3	43	0
661	4	40	0
661	5	38	0
661	6	62	1
662	1	62	0
662	2	73	0
662	3	55	0
662	4	56	0
662	5	52	0
662	6	84	2
663	1	78	0
663	2	81	0
663	3	71	0
663	4	74	0
663	5	69	0
663	6	126	3
664	1	38	0
664	2	35	0
664	3	40	1
664	4	27	0
664	5	25	0
664	6	35	0
665	1	45	0
665	2	22	0
665	3	60	2
665	4	27	0
665	5	30	0
665	6	29	0
666	1	80	1
666	2	52	0
666	3	50	0
666	4	90	1
666	5	50	0
666	6	89	1
667	1	62	0
667	2	50	0
667	3	58	0
667	4	73	1
667	5	54	0
667	6	72	0
668	1	86	0
668	2	68	0
668	3	72	0
668	4	109	2
668	5	66	0
668	6	106	0
669	1	44	0
669	2	38	0
669	3	39	0
669	4	61	0
669	5	79	1
669	6	42	0
670	1	54	0
670	2	45	0
670	3	47	0
670	4	75	0
670	5	98	2
670	6	52	0
671	1	78	0
671	2	65	0
671	3	68	0
671	4	112	0
671	5	154	3
671	6	75	0
672	1	66	1
672	2	65	0
672	3	48	0
672	4	62	0
672	5	57	0
672	6	52	0
673	1	123	2
673	2	100	0
673	3	62	0
673	4	97	0
673	5	81	0
673	6	68	0
674	1	67	0
674	2	82	1
674	3	62	0
674	4	46	0
674	5	48	0
674	6	43	0
675	1	95	0
675	2	124	2
675	3	78	0
675	4	69	0
675	5	71	0
675	6	58	0
676	1	75	0
676	2	80	0
676	3	60	0
676	4	65	0
676	5	90	0
676	6	102	1
677	1	62	0
677	2	48	0
677	3	54	0
677	4	63	0
677	5	60	0
677	6	68	1
678	1	74	0
678	2	48	0
678	3	76	0
678	4	83	0
678	5	81	0
678	6	104	2
679	1	45	0
679	2	80	0
679	3	100	1
679	4	35	0
679	5	37	0
679	6	28	0
680	1	59	0
680	2	110	0
680	3	150	2
680	4	45	0
680	5	49	0
680	6	35	0
681	1	60	0
681	2	50	0
681	3	150	2
681	4	50	0
681	5	150	1
681	6	60	0
682	1	78	1
682	2	52	0
682	3	60	0
682	4	63	0
682	5	65	0
682	6	23	0
683	1	101	2
683	2	72	0
683	3	72	0
683	4	99	0
683	5	89	0
683	6	29	0
684	1	62	0
684	2	48	0
684	3	66	1
684	4	59	0
684	5	57	0
684	6	49	0
685	1	82	0
685	2	80	0
685	3	86	2
685	4	85	0
685	5	75	0
685	6	72	0
686	1	53	0
686	2	54	1
686	3	53	0
686	4	37	0
686	5	46	0
686	6	45	0
687	1	86	0
687	2	92	2
687	3	88	0
687	4	68	0
687	5	75	0
687	6	73	0
688	1	42	0
688	2	52	1
688	3	67	0
688	4	39	0
688	5	56	0
688	6	50	0
689	1	72	0
689	2	105	2
689	3	115	0
689	4	54	0
689	5	86	0
689	6	68	0
690	1	50	0
690	2	60	0
690	3	60	0
690	4	60	0
690	5	60	1
690	6	30	0
691	1	65	0
691	2	75	0
691	3	90	0
691	4	97	0
691	5	123	2
691	6	44	0
692	1	50	0
692	2	53	0
692	3	62	0
692	4	58	1
692	5	63	0
692	6	44	0
693	1	71	0
693	2	73	0
693	3	88	0
693	4	120	2
693	5	89	0
693	6	59	0
694	1	44	0
694	2	38	0
694	3	33	0
694	4	61	0
694	5	43	0
694	6	70	1
695	1	62	0
695	2	55	0
695	3	52	0
695	4	109	1
695	5	94	0
695	6	109	1
696	1	58	0
696	2	89	1
696	3	77	0
696	4	45	0
696	5	45	0
696	6	48	0
697	1	82	0
697	2	121	2
697	3	119	0
697	4	69	0
697	5	59	0
697	6	71	0
698	1	77	1
698	2	59	0
698	3	50	0
698	4	67	0
698	5	63	0
698	6	46	0
699	1	123	2
699	2	77	0
699	3	72	0
699	4	99	0
699	5	92	0
699	6	58	0
700	1	95	0
700	2	65	0
700	3	65	0
700	4	110	0
700	5	130	2
700	6	60	0
701	1	78	0
701	2	92	2
701	3	75	0
701	4	74	0
701	5	63	0
701	6	118	0
702	1	67	0
702	2	58	0
702	3	57	0
702	4	81	0
702	5	67	0
702	6	101	2
703	1	50	0
703	2	50	0
703	3	150	1
703	4	50	0
703	5	150	1
703	6	50	0
704	1	45	0
704	2	50	0
704	3	35	0
704	4	55	0
704	5	75	1
704	6	40	0
705	1	68	0
705	2	75	0
705	3	53	0
705	4	83	0
705	5	113	2
705	6	60	0
706	1	90	0
706	2	100	0
706	3	70	0
706	4	110	0
706	5	150	3
706	6	80	0
707	1	57	0
707	2	80	0
707	3	91	1
707	4	80	0
707	5	87	0
707	6	75	0
708	1	43	0
708	2	70	1
708	3	48	0
708	4	50	0
708	5	60	0
708	6	38	0
709	1	85	0
709	2	110	2
709	3	76	0
709	4	65	0
709	5	82	0
709	6	56	0
710	1	49	0
710	2	66	0
710	3	70	1
710	4	44	0
710	5	55	0
710	6	51	0
711	1	65	0
711	2	90	0
711	3	122	2
711	4	58	0
711	5	75	0
711	6	84	0
712	1	55	0
712	2	69	0
712	3	85	1
712	4	32	0
712	5	35	0
712	6	28	0
713	1	95	0
713	2	117	0
713	3	184	2
713	4	44	0
713	5	46	0
713	6	28	0
714	1	40	0
714	2	30	0
714	3	35	0
714	4	45	0
714	5	40	0
714	6	55	1
715	1	85	0
715	2	70	0
715	3	80	0
715	4	97	0
715	5	80	0
715	6	123	2
716	1	126	3
716	2	131	0
716	3	95	0
716	4	131	0
716	5	98	0
716	6	99	0
717	1	126	3
717	2	131	0
717	3	95	0
717	4	131	0
717	5	98	0
717	6	99	0
718	1	108	3
718	2	100	0
718	3	121	0
718	4	81	0
718	5	95	0
718	6	95	0
719	1	50	0
719	2	100	0
719	3	150	1
719	4	100	0
719	5	150	2
719	6	50	0
720	1	80	0
720	2	110	0
720	3	60	0
720	4	150	3
720	5	130	0
720	6	70	0
721	1	80	0
721	2	110	0
721	3	120	0
721	4	130	3
721	5	90	0
721	6	70	0
722	1	50	0
722	2	65	0
722	3	107	0
722	4	105	3
722	5	107	0
722	6	86	0
723	1	50	0
723	2	65	0
723	3	107	0
723	4	105	3
723	5	107	0
723	6	86	0
724	1	50	0
724	2	65	0
724	3	107	0
724	4	105	3
724	5	107	0
724	6	86	0
725	1	50	0
725	2	65	0
725	3	107	0
725	4	105	3
725	5	107	0
725	6	86	0
726	1	50	0
726	2	65	0
726	3	107	0
726	4	105	3
726	5	107	0
726	6	86	0
727	1	79	0
727	2	100	0
727	3	80	0
727	4	110	0
727	5	90	0
727	6	121	3
728	1	79	0
728	2	105	0
728	3	70	0
728	4	145	3
728	5	80	0
728	6	101	0
729	1	89	0
729	2	145	3
729	3	90	0
729	4	105	0
729	5	80	0
729	6	91	0
730	1	125	0
730	2	120	0
730	3	90	0
730	4	170	3
730	5	100	0
730	6	95	3
731	1	125	0
731	2	170	3
731	3	100	0
731	4	120	0
731	5	90	0
731	6	95	0
\.


--
-- Data for Name: pokemonsets; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY pokemonsets (id, title, specie, hp, atk, defe, spatk, spdef, spd, item, nature, ability, move1, move2, move3, move4, comment, active, created_at, updated_at, cached_votes_total, cached_votes_score, cached_votes_up, cached_votes_down, cached_weighted_score, cached_weighted_total, cached_weighted_average, creator, lang, formato) FROM stdin;
1	Metal BigMon	115	\N	252	\N	\N	\N	252	714	16	113	252	216	389	280	Brick Break para romper pantallas, lastimar severamente a otros kangas (y rematarlos con sucker), tener daño neutro para mawile (daño decente) y eliminar T-Tar de 1 golpe	\N	2014-11-13 22:23:53	2015-11-27 03:45:18	5	1	3	2	1	5	0	\N	1	VGC15
4	Standard Garchomp	445	4	252	\N	\N	\N	252	134	16	24	337	89	157	182	El Garchomp estandar, sirve para casi todo tipo de equipos	\N	2014-11-13 22:23:53	2015-11-27 03:46:25	2	0	1	1	0	2	0	1	1	VGC15
5	Modest Mega Manectric	310	92	\N	24	252	\N	140	721	3	31	85	237	555	182	IV Spread: 31-30-30-31-31-31 Hidden Power Ice\\r\\nModest para tener un 89% de probabilidad de derrotar a Garchomp de un golpe\\r\\nSnarl para los Aegislash con Substitute\\r\\nVelocidad suficiente para ganarle a Speed Base 105 para abajo	\N	2014-11-13 22:23:53	2014-11-13 22:23:53	0	0	0	0	0	0	0	1	1	VGC15
6	Mixed Aegislash	681	252	4	\N	252	\N	\N	211	23	176	533	588	247	164	Sacred Sword para pegarle super efectivo a Tyranitar, Bisharp y Mega Kangaskhan	\N	2014-11-13 22:23:53	2015-11-27 03:44:09	4	2	3	1	2	4	0	1	1	VGC15
7	Cano's Staraptor	398	212	252	\N	\N	\N	44	264	16	22	413	370	369	515	Evs en Hp suficientes para derrotar a Garchomp con Final Gambit, Velocidad suficiente para ganarle a Timid Mega Manectric, el resto de EVs en Ataque para pegar fuerte con Brave Bird	\N	2014-11-13 22:23:53	2015-11-26 01:58:04	6	4	5	1	4	6	0	1	1	VGC15
9	Standard Mega Ttar	248	4	252	\N	\N	\N	252	708	11	45	349	157	242	182	Despues de un DD es capaz de superar en velocidad a los Speed Base 115 para abajo	\N	2014-11-13 22:23:53	2015-08-26 17:51:21	2	0	1	1	0	2	0	1	1	VGC15
10	Ray Rizzo's Mawile	303	252	52	4	\N	180	20	720	14	22	583	442	389	182	Timid 252 SpAtk Choice Specs Salamence does 85.3 – 100.6 % with Fire Blast (6.3 % chance to OHKO) and Mawile can OHKO back with Play Rough at -1 Atk,\\r\\nModest 252 SpAtk Charizard-Y does 77.7 – 92.9 % with Heat Wave outside of Sun	\N	2014-11-13 22:23:53	2015-11-26 01:57:47	9	5	7	2	5	9	0	1	1	VGC15
12	Bulky Specs Hydreigon	635	252	\N	\N	252	\N	4	274	3	26	399	434	53	430		\N	2014-11-13 22:23:53	2015-03-18 13:43:37	2	-2	0	2	-2	2	0	5	1	VGC15
13	Ray Rizzo's Rotom-W	722	252	\N	116	4	132	4	135	4	26	56	85	261	182	Rotom only has a ~6% chance of being knocked out by Modest 252 SpAtk Charizard-Y’s Solar Beam.	\N	2014-11-13 22:23:53	2015-03-18 13:43:46	2	0	1	1	0	2	0	1	1	VGC15
14	Belly Drum Azumarril	184	248	252	\N	\N	\N	10	135	11	37	187	583	453	276		\N	2014-11-13 22:23:53	2015-03-18 13:43:51	2	-2	0	2	-2	2	0	5	1	VGC15
15	Se Jun Park's Pachirisu (possible)	417	252	\N	156	\N	100	\N	135	12	10	609	162	266	182	Aguanta harto	\N	2014-11-13 22:23:53	2015-03-18 13:44:00	2	0	1	1	0	2	0	1	1	VGC15
17	Scrafty de apoyo	560	252	252	\N	\N	4	\N	134	11	22	252	409	242	269		\N	2014-11-13 22:23:53	2015-11-27 03:46:29	2	0	1	1	0	2	0	1	1	VGC15
18	Special Offensive Rotom-H	723	252	\N	\N	252	\N	\N	135	3	26	182	315	85	261		\N	2014-11-13 22:23:53	2015-03-18 13:39:10	1	-1	0	1	-1	1	0	5	1	VGC15
19	Standard Mega Char-Y 	6	4	\N	\N	252	\N	252	717	3	66	182	257	76	315		\N	2014-11-13 22:23:53	2015-03-18 13:39:18	2	-2	0	2	-2	2	0	5	1	VGC15
20	Choice Band Talon	663	4	252	\N	\N	\N	252	197	11	177	369	413	394	261		\N	2014-11-13 22:23:53	2015-03-18 13:39:28	1	-1	0	1	-1	1	0	5	1	VGC15
21	Offensive Mamoswine	473	4	252	\N	\N	\N	252	247	11	47	182	420	157	89		\N	2014-11-13 22:23:53	2015-04-04 15:29:38	1	1	1	0	1	1	0	5	1	VGC15
22	Special Wall Amoonguss	591	252	\N	100	\N	156	\N	583	4	144	182	476	147	202		\N	2014-11-13 22:23:53	2015-03-18 13:39:52	2	2	2	0	2	2	0	5	1	VGC15
23	Se Jun Park's Talonflame (possible)	663	\N	246	\N	12	\N	252	247	20	177	413	315	269	501	Permite darle OHKO a Mega Mawile 252hp/4spdef	\N	2014-11-13 22:23:53	2015-03-18 13:40:00	1	-1	0	1	-1	1	0	1	1	VGC15
25	Support Raichu	26	4	\N	\N	252	\N	252	252	5	31	521	252	227	237	HP Ice	\N	2014-11-13 22:23:53	2015-03-18 13:40:36	1	1	1	0	1	1	0	1	1	VGC15
26	Doble Flinch Raichu	26	4	\N	\N	252	\N	252	198	5	31	521	252	182	374	Fling para poder hacer un segundo flinch con King's Rock	\N	2014-11-13 22:23:53	2015-03-18 13:41:50	1	-1	0	1	-1	1	0	1	1	VGC15
27	Weakness policy Aegis	681	252	\N	4	180	68	\N	682	23	176	430	247	588	469	En forma escudo aguanta un Dark Pulse de Choice Specs Timid Hydreigon	\N	2014-11-13 22:23:53	2015-03-18 13:38:41	1	1	1	0	1	1	0	1	1	VGC15
28		373	4	\N	\N	252	\N	252	264	5	22	434	126	157	406		\N	2014-11-13 22:23:53	2015-03-18 13:38:34	1	1	1	0	1	1	0	1	1	VGC15
29		94	4	\N	\N	252	\N	252	252	5	26	247	261	182	269		\N	2014-11-13 22:23:53	2015-03-18 13:38:12	1	-1	0	1	-1	1	0	1	1	VGC15
30	Standard M-Manectric	310	4	\N	\N	252	\N	252	721	5	31	521	237	315	182	HP Ice	\N	2014-11-13 22:23:53	2015-03-18 13:38:05	1	-1	0	1	-1	1	0	1	1	VGC15
31	Standard Aerodactyl	142	4	252	\N	\N	\N	252	252	16	127	157	507	182	269	Se puede cambiar Taunt o Sky Drop por Tailwind o Wide Guard	\N	2014-11-13 22:23:53	2015-03-18 13:37:49	1	-1	0	1	-1	1	0	1	1	VGC15
33	Assault Vest Ludicolo	272	252	\N	\N	252	4	\N	683	3	33	252	503	202	58		\N	2014-11-13 22:23:53	2015-03-18 13:37:23	1	1	1	0	1	1	0	1	1	VGC15
35	Cybertron's Gothitelle	576	252	\N	12	\N	244	\N	127	24	23	473	433	321	156	TR setter, se usa tickle por sobre charm para apoyar a los atacantes fisicos compañeros	\N	2014-11-13 22:23:53	2015-04-03 17:51:59	2	0	1	1	0	2	0	1	1	VGC15
36	Cybertron's Hariyama	297	60	100	100	\N	244	4	135	21	62	282	252	370	157		\N	2014-11-13 22:23:53	2015-11-27 03:46:35	2	0	1	1	0	2	0	1	1	VGC15
37		423	252	\N	\N	252	4	\N	135	23	114	330	414	58	182		\N	2014-11-14 15:17:07	2014-11-14 15:17:07	0	0	0	0	0	0	0	3	1	VGC15
38	Vileplume All out Attacker	45	36	\N	220	252	\N	\N	683	3	27	605	202	237	188	Vileplume es un Pokémon que con el apogeo de Mega-Venusaur suele no tener cabida en casi ningún equipo actual pero tiene cualidades ofensivas bastante interesantes. El desconocimiento de alguno de los ataques que puede aprender más la ventaja de que usualmente se le puede considerar un Pokémon defensivo lo hacen una real alternativa para sorprender a tu oponente.\\r\\n\\r\\nDe modo muy suscinto, Vileplume es capaz de aprender dazzling gleam/brillo mágico ; ataque que aún sin poseer bonificación STAB nos permite una interesante cobertura contra Pokémon bastante comunes como Garchomp e Hydreigon. A éste último con un 18.8% de 1OKHO y con un 31,2% de soportar fire blast/llamarada de Hydreigon modest specs (sin contar que soporta el 100% de las veces su draco meteor). También es capaz de soportar un return/retribución de jolly Mega-Kangaskhan y provocar un daño cercano al 50% con sludge bomb/bomba lodo. Azumarrill y en general cualquier hada no inmune al veneno caerá ante nuestro querido Vileplume. \\r\\n\\r\\nPS: Hidden power ice es interesante para cobertura extra, aunque queda a elección del jugador.	\N	2014-11-15 00:06:53	2014-11-15 00:58:57	1	-1	0	1	-1	1	0	7	1	VGC15
215	Bulk Arcanine	59	252	\N	4	92	4	156	139	5	22	53	555	628	182	La speed le permite ganarle en velocidad por un punto a 252 speed Modest Tapu Lele	\N	2017-01-24 05:25:18	2017-01-24 05:25:18	0	0	0	0	0	0	0	5	1	VGC17
42	Porengan's Vivillon	666	\N	\N	\N	252	\N	252	252	5	14	182	476	79	542	Porengan uso este Vivillon en las Nacionales de Alemania. Lo uso acompañado de Mega Gyarados el cual tenia buena Sinergia para atraer Will-o-Wisp y ataques prioritarios y poder hacer Earthquake sin problemas. Sleep Powder practicamente no falla gracias a la Habilidad y Hurricane tiene su factor Hax gracias a la alta probabilidad de confundir al oponente.	\N	2014-11-15 00:38:11	2015-11-26 01:58:06	5	3	4	1	3	5	0	11	1	VGC15
43	Kommander's NoSoyComida	398	4	252	\N	\N	\N	252	197	11	22	370	413	38	369	252+ Atk Choice Band Staraptor Close Combat vs. 252 HP / 4 Def Mega Kangaskhan: 212-250 (100 - 117.9%) -- guaranteed OHKO\\r\\n252+ Atk Choice Band Staraptor U-turn vs. 252 HP / 12 Def Gothitelle: 128-152 (72.3 - 85.8%) -- guaranteed 2HKO\\r\\n252+ Atk Choice Band Staraptor Close Combat vs. 252 HP / 180 Def Mega Tyranitar: 268-316 (129.4 - 152.6%) -- guaranteed OHKO\\r\\n-1 252+ Atk Choice Band Staraptor Double-Edge vs. 4 HP / 0 Def Mega Manectric: 127-151 (86.9 - 103.4%) -- 18.8% chance to OHKO\\r\\n252+ Atk Choice Band Staraptor Brave Bird vs. 252 HP / 188+ Def Amoonguss: 306-362 (138.4 - 163.8%) -- guaranteed OHKO\\r\\n252+ Atk Choice Band Staraptor Double-Edge vs. 252 HP / 108 Def Rotom-W: 135-160 (85.9 - 101.9%) -- 12.5% chance to OHKO (GG Lupin)\\r\\n\\r\\n	\N	2014-11-15 00:54:26	2015-11-27 03:44:02	5	3	4	1	3	5	0	6	1	VGC15
45	Ludi-Loco 	272	244	\N	188	\N	76	\N	135	2	44	252	503	58	298		\N	2014-11-15 04:39:43	2015-11-27 03:46:39	2	0	1	1	0	2	0	19	1	VGC15
46	Follow Me or die!	36	252	\N	152	\N	104	\N	135	2	98	266	322	236	500	Puede llevar Mental Herb para prevenir Taunt y usar Cosmic Power sin fallas y luego Stored Power. Puede volverse también un solo support de Follow Me para ayudar al boost de un compañero, brindandole Sitrus Berry la ventaja de transformar un 2HKO en un 3HKO. Su habilidad le permite ignorar el daño de ataques de estado, hazards y climas, perfecto para un poke support.	\N	2014-11-15 14:31:50	2014-11-18 03:00:50	4	0	2	2	0	4	0	20	1	VGC15
47	Guard Mime	122	252	\N	252	\N	\N	\N	196	2	43	252	469	501	269	Mr. Mime support. Se come un Taunt y lo devuelve fácil, forzando el switch. Compañero perfecto del señor Charizard Y, por los Rock Slide de Tyranitar boosteado y Chomp, y por el Banded Bird de Talonflame.	\N	2014-11-15 14:42:58	2014-12-16 16:33:15	6	0	3	3	0	6	0	20	1	VGC15
48	Llamita	609	188	0	152	166	\N	4	683	3	151	257	247	412	237	Mi set creado de Chandelure, con esos EV en Def y HP aguanta sin problemas un terremoto del Garchomp jolly o una shadow ball de M-gengar\\r\\nal primero lo mata con un Hidden Power Ice y al segundo con una Shadow Ball.\\r\\nSon libres de usarlo y modificarlo a gusto\\r\\nAtte Makise	\N	2014-11-15 15:58:27	2015-11-26 01:58:12	7	3	5	2	3	7	0	21	1	VGC15
49	Set Mega Charizard Y	6	124	0	108	196	76	4	717	3	66	257	237	315	182	Mi set para Mega Charizard Y, lo hice para la EvoPokémon World Cup, este set aguanta muchos golpes el 100% de las veces, tales como Rock Slide de Garchomp standar, Return de Mega Kangaskhan full Atk, Sucker Punch de Mega Mawile, Rock Slide de Salamence, Diversos Thunderbolt, Ancientpower de Mega Charizard, etc. \\r\\nAcaba el 100% de las veces los Mega Kangaskhan con Overheat, los Garchomp con Hidden Power Ice, Mega Manectric no bulky con Heat Wave, además de hacer 1HKO a varios Pokémon con Overheat. \\r\\nSu único defecto es su velocidad, recomiendo usarlo con Speed control para aumentar aun mas su rendimiento pero no es tan necesario, ya que aguanta bastante bien. 	\N	2014-11-15 20:40:46	2015-11-27 03:47:13	4	0	2	2	0	4	0	22	1	VGC15
50	Bone's Exploud	295	168	\N	84	252	4	\N	274	3	113	586	58	126	411	VGC'14 está en su ocaso pero quizás el retorno a Hoenn permita a Exploud demostrar sus habilidades. El set que elegí para él está orientado para provocar el mayor daño posible ya que al ser lento, pocas veces tendrá dos chances de atacar. Sin perjuicio de lo anterior, sin invertir iv's en velocidad, Exploud es capaz de superar a Azumarril y M-Mawile con la posibilidad de provocarle 1OKHO a éste último gracias a fireblast. La distribución de ev's le permite, además, soportar un brave bird life orb de Talonflame adamant 252ivs en ataque y derrotarlo gracias a boomburst (úsese bajo su propio riesgo) e inclusive a través de un ice beam. También es capaz de soportar return de M-Kangaskhan jolly con la posiblidad de dejarlo fuera de combate por medio de focus blast con un 87,5% de posibilidades. Garchomp no será rival para Exploud soportando cualquiera de sus ataques para luego caer derrotado frente a rayo hielo. En general, es capaz de provocar daños considerables y con un compañero adecuado que le proteja de los tipo lucha se convierte en un Pokémon digno de atención.\\r\\n\\r\\nNota: Alternativa a Boomburst es Hyper voice, mientras que en lugar de Fireblast se puede probar con Overheat o Lanzallamas.	\N	2014-11-15 22:19:40	2015-11-27 03:45:27	3	1	2	1	1	3	0	7	1	VGC15
51	♥~Lissa~♥ (MrPenguin93's Mawile)	303	244	60	44	\N	132	28	720	14	22	182	442	583	389	28 EVs outspeeds:\\r\\n-TheBattleRoom's Mawile & una mayoria de Azumarill\\r\\n\\r\\n-Todo Max Speed de base 81 e inferior con Nature favorable (Bajo Tailwind)\\r\\n\\r\\n-Todo Max Speed de base 95 e inferior con Nature Neutral (Bajo Tailwind)\\r\\n\\r\\nDamage Calcs:\\r\\n\\r\\n-1 252 Atk Garchomp Earthquake vs. 244 HP / 44 Def Mega Mawile: 68-84 (43.5 - 53.8%) -- 30.5% chance to 2HKO\\r\\n\\r\\n-1 252+ Atk Choice Band Talonflame Flare Blitz vs. 244 HP / 44 Def Mega Mawile: 132-156 (84.6 - 100%) -- 6.3% chance to OHKO\\r\\n\\r\\n-1 244+ Atk Life Orb Mamoswine Earthquake vs. 244 HP / 44 Def Mega Mawile: 96-117 (61.5 - 75%) -- guaranteed 2HKO\\r\\n\\r\\n+6 252+ Atk Huge Power Azumarill Aqua Jet vs. 244 HP / 44 Def Mega Mawile: 135-159 (86.5 - 101.9%) -- 12.5% chance to OHKO\\r\\n\\r\\n+1 252+ Atk Mold Breaker Mega Gyarados Earthquake vs. 244 HP / 44 Def Mega Mawile: 128-152 (82 - 97.4%) -- guaranteed 2HKO\\r\\n\\r\\n44 SpA Life Orb Talonflame Overheat vs. 244 HP / 132+ SpD Mega Mawile: 133-159 (85.2 - 101.9%) -- 18.8% chance to OHKO (Naughty / Naive)\\r\\n\\r\\n76 SpA Rotom-H Overheat vs. 244 HP / 132+ SpD Mega Mawile: 138-164 (88.4 - 105.1%) -- 37.5% chance to OHKO \\r\\n\\r\\n252+ SpA Choice Specs Hydreigon Earth Power vs. 244 HP / 132+ SpD Mega Mawile: 136-162 (87.1 - 103.8%) -- 25% chance to OHKO\\r\\n\\r\\n252+ SpA Life Orb Salamence Fire Blast vs. 244 HP / 132+ SpD Mega Mawile: 133-159 (85.2 - 101.9%) -- 12.5% chance to OHKO\\r\\n\\r\\n252+ SpA Ludicolo Scald vs. 244 HP / 132+ SpD Mega Mawile in Rain: 73-87 (46.7 - 55.7%) -- 69.9% chance to 2HKO (bajo Rain)\\r\\n\\r\\n252+ SpA Aegislash-Blade Shadow Ball vs. 244 HP / 132+ SpD Mega Mawile: 69-82 (44.2 - 52.5%) -- 20.3% chance to 2HKO\\r\\n\\r\\n252+ SpA Mega Manectric Overheat vs. 244 HP / 132+ SpD Mega Mawile: 138-164 (88.4 - 105.1%) -- 31.3% chance to OHKO\\r\\n\\r\\nNo incluyo calculos de como golpea porque tanto por su poca inversion en Attack como por Nature es de esperarse que no "destruya" lo que toca, de igual manera toma 2HKOs en practicamente todo lo que no lo resista, a cambio del bulk decente y la minima inversion en Speed. Funciona muy bien bajo Rain y bajo Trick Room con Tickle Gothitelle	\N	2014-11-15 22:22:37	2015-11-26 01:57:43	9	7	8	1	7	9	0	23	1	VGC15
52	Mega-Mightyena	262	252	252	4	\N	\N	\N	247	11	22	389	423	424	583	Lista de OHKOS: Ferrothorn Garchomp Scrafty Hydreigon Salamance(Si el no le puso intimidate) Meowstic Alakazam Malamar\\r\\n\\r\\nLa megapiedra esta activada de por si no hace falta equiparla	\N	2014-11-16 01:21:12	2014-12-17 02:08:34	5	1	3	2	1	5	0	27	1	VGC15
55	VacaCuliá...ReCuliá	241	252	6	252	\N	\N	\N	583	12	113	174	182	208	34	Simple,but OP	\N	2014-11-16 19:59:02	2015-11-27 03:45:29	9	1	5	4	1	9	0	30	1	VGC15
57	Sawk Kangaskhan Slayer 	539	4	252	\N	\N	\N	252	264	11	39	370	24	398	157	El perfecto asesino de Kangaskhan mega gracias a su habilidad y el Double Kick para también eliminar a esos molestos Smeargles entonces es perfecto contra esa combinación de los pokemon antes \\r\\nmencionados  no hay mucho que decir es in típico 252 evs spread	\N	2014-11-17 01:14:51	2015-11-27 03:44:23	4	2	3	1	2	4	0	29	1	VGC15
216	90% Standard Muk-A	831	188	244	44	\N	20	12	136	11	82	282	398	53	182	Flamethrower se usa en vez del poco usado Shadow Sneak para lograr un KO sorpresivo en Kartana	\N	2017-01-24 05:28:04	2017-01-24 05:28:04	0	0	0	0	0	0	0	5	1	VGC17
58		713	252	\N	252	\N	4	\N	211	22	20	174	105	419	360	bueno, este pkmn es facil de criar ya que solo requere 4 Ivs perfectos, todos, vel. y atc.esp, la gracia es que sea lento, por eso es buena idea epezar con uno o dos "Curse", si es necesario usar recover, es bastante simple, y eso\\r\\n\\r\\nPD:como saben avalugg tiene + de 500 en def. pero - de 150 en def. sp, así que hay que asegurase de no tirarlo en contra de un atacante esp o mixto	\N	2014-11-17 20:46:13	2014-11-18 02:59:58	2	0	1	1	0	2	0	37	1	VGC15
59	Absoleon #NoEvolucionoDeEevee	359	56	244	\N	48	\N	160	716	20	105	389	58	276	182	Es un set mixto que fue modificado varias veces para counterear al Metagame con algo más bien diferente, Sucker Punch por STAB, Ice Beam para darle OHKO a Garchomp y el Spread de velocidad permite pasarlo por un punto. Superpower para bajarse a M-Kangaskhan y Protect porque sí xD. La idea es pegar siempre por debilidad.\\r\\n\\r\\nSi sacrificamos el STAB de Sucker Punch/Night Slash podemos meter Rock Slide para asegurar OHKO a Talonflame y M-Charizard Y, siempre y cuando tengamos algo para protegerse del Brave Bird. Dejo algunos cálculos.\\r\\n\\r\\nDEFENSIVOS:\\r\\n\\r\\n244 Atk Mega Absol Rock Slide vs. 4 HP / 0 Def Talonflame: 184-220 (119.4 - 142.8%) -- guaranteed OHKO\\r\\n\\r\\nLo destruye, siempre y cuando no reciba el Flare Blitz o Brave Bird.\\r\\n\\r\\n244 Atk Mega Absol Rock Slide vs. 0 HP / 0 Def Mega Charizard Y: 176-208 (115 - 135.9%) -- guaranteed OHKO\\r\\n\\r\\nIdem, salvo que a M-CharY lo outspeedeamos.\\r\\n\\r\\n48 SpA Mega Absol Ice Beam vs. 0 HP / 0 SpD Garchomp: 184-220 (100.5 - 120.2%) -- guaranteed OHKO\\r\\n\\r\\nSalvo que Garchomp esté scarfeado, no tiene nada que hacer. El spread permite outspeedearlo por 1 punto.\\r\\n\\r\\n48 SpA Mega Absol Ice Beam vs. 0 HP / 0 SpD Salamence: 192-228 (112.9 - 134.1%) -- guaranteed OHKO\\r\\n\\r\\nIdem, si no está scarfeado, Absol wins.\\r\\n\\r\\n244 Atk Mega Absol Superpower vs. 4 HP / 0 Def Kangaskhan: 182-216 (100.5 - 119.3%) -- guaranteed OHKO\\r\\n\\r\\nLa prueba de fuego, y la pasa rozando. Ojo que si bien ahora anda mucho Kanga con EVs en HP, no los va a matar, pero les va a hacer un daño bastante considerable.\\r\\n\\r\\nDEFENSIVOS:\\r\\n\\r\\n252 Atk Kangaskhan Return vs. 56 HP / 0 Def Mega Absol: 106-126 (72.1 - 85.7%) -- guaranteed 2HKO\\r\\n\\r\\n252+ Atk Choice Band Talonflame Brave Bird vs. 56 HP / 0 Def Mega Absol: 186-219 (126.5 - 148.9%) -- guaranteed OHKO\\r\\n\\r\\nNada que hacer ahí, solo llamar a Tyranitar.\\r\\n\\r\\n252 SpA Mega Charizard Y Heat Wave vs. 56 HP / 0- SpD Mega Absol in Sun: 177-208 (120.4 - 141.4%) -- guaranteed OHKO\\r\\n\\r\\n252 SpA Mega Charizard Y Focus Blast vs. 56 HP / 0- SpD Mega Absol: 264-312 (179.5 - 212.2%) -- guaranteed OHKO\\r\\n\\r\\nNuevamente, nada que hacer, pero lo matamos antes de que ataque xD\\r\\n\\r\\n252 Atk Life Orb Garchomp Earthquake vs. 56 HP / 0 Def Mega Absol: 125-148 (85 - 100.6%) -- 6.3% chance to OHKO\\r\\n\\r\\nNo está mal.\\r\\n\\r\\nComo vemos, no aguanta mucho, asi que la idea es estar seguro de lo que podemos outspeedear y matar antes que nos maten. Es un buen Anti-Meta para juegos amistosos.\\r\\n	\N	2014-11-17 21:59:59	2015-11-27 03:45:34	5	1	3	2	1	5	0	38	1	VGC15
60	DePTScon♥	373	12	\N	12	228	4	252	264	5	22	157	434	406	126	Pokémon Ganador del 1er Permier de Perú\\r\\n\\r\\n-12 EVs en HP y 12 EVs en defensa para resistir Dragon Claw de Garchomp Life Orb jolly (ya nadie temible usa Lum Berry).\\r\\n-252 EVs en velocidad por si alguien más traía a Salamence y yo no tenía a Azumarill detrás.\\r\\n\\r\\nDebilidades: Rock, Ice x4, Dragon, Fairy\\r\\nResistencias: Water, Grass ¼, Fire, Fighting, Bug\\r\\nInmunidad: Ground\\r\\n\\r\\nDebía utilizarlo alguna vez, es un pokémon muy especial al cual le tengo mucho cariño, ya que para Homero de PTS fue difícil criarlo con 6 ivs, aparte significaba mi aceptación en Pokémon Trainers Santiago a pesar de ser extranjero, gracias cabros. Sin duda el Intimidate para mí en un equipo de control era totalmente necesario, podía otorgarle más resistencia a Tyranitar, el cual gracias a la arena tiene buen special bulky y a Azumarill, el cual podría también ser beneficiado por Intimidate, aparte de ello, me permitía controlar a otros dragones, pues Salamence scarf es el más rápido (no les temo a Garchomp o Noivern scarf, no son muy viables en mi opinión), con el uso aumentado de Hydreigon, por qué no volver al pasado y traer a este majestuoso dragón que pronto tendrá mega?. Rock Slide me sirvió mucho en la final y fue el reemplazo de Sleep Talk, sabía que en un torneo tan importante nadie traería Dark Void, pues es muy tirado a la suerte, a menos que seas el Presi, él sí lo usa muy bien. Me daba cobertura contra Ferrothorn/Scizor y Charizard /Talonflame.\\r\\n\\r\\n-Kommander	\N	2014-11-19 05:07:48	2015-11-26 01:58:13	5	3	4	1	3	5	0	6	1	VGC15
61	Trapito Bonito	354	252	\N	62	\N	196	\N	707	14	119	421	50	182	261	Uno de los pocos nichos de Mega Banette está en el Prankster Disable (el otro importante siendo Prankster Destiny Bond), el cual permite inhabilitar a casi cualquier usuario de Choice Items (con excepción de Talonflame usando Brave Bird). Frisk ayuda a identificar los objetos de los rivales y ayuda con el truco del set. \\r\\n\\r\\nShadow Claw es el único ataque del set, más que nada para no ser arruinado por Taunt (otros ataques pueden ser usados, Phantom Force o Shadow Sneak son buenas opciones con STAB). Protect está aquí por razones obvias y en caso de necesitar un turno para megaevolucionar sin mucho problema. Disable con Prankster es un movimiento bastante útil, sobre todo cuando un oponente está lockeado en un movimiento. Will-O-Wisp ofrece la siempre útil quemadura aunque puede ser remplazado por otro movimiento de así quererse.\\r\\n\\r\\nPor el lado defensivo es capaz de sobrevivir Shadow Ball de Aegislash Max. Sp. Atk un 100% de las veces (y si lo encuentra en Blade Forme logra el OHKO de vuelta con Shadow Claw, lo cual no es imposible dado que en el primer turno Banette es más lento) y el Brave Bird de Choice Band Talonflame sólo tiene un 6.3% de probabilidad de OHKO.\\r\\n\\r\\nEl set carece de recuperación confiable y una verdadera presencia ofensiva por lo que no es tan viable como se quisiera, pero puede rendir como un mega secundario dependiendo de el equipo.	\N	2014-11-19 13:15:47	2014-11-19 13:15:47	0	0	0	0	0	0	0	41	1	VGC15
63	Anti-Garchomp	723	252	\N	48	196	\N	12	247	3	26	237	85	315	182	Este set esta hecho para enfrentarse a dragones, especificamente Garchomp ya que como es muy frecuente que tenga Lum Berry no rinde quemarlo con WoW, sale mucho mas rapido deshacerse de él de un HP Ice. Se quitó Will-o-Wisp ya que contra los dos megas mas usados y Garchomp no rinde tanto.\\r\\nvs Mega Mawile, conviene mas usar Overheat\\r\\nvs Mega Kangaskhan, un doble Power up Punch deja sin efecto la baja en ataque de la quemadura\\r\\nvs Garchomp, se usa HP Ice.\\r\\n\\r\\nLos EVs estan dados justo para darle OHKO a Garchomp con HP Ice\\r\\nlos 12ev en speed son para outspeedear otros Rotom, los evs sobrantes a defensa para aguantar mejor los rock slide.	\N	2014-11-20 19:00:04	2015-11-27 03:45:36	5	1	3	2	1	5	0	5	1	VGC15
64	Supportaque	210	232	4	252	\N	\N	\N	211	11	22	215	339	370	89	Heal Bell (Campana Cura) puede ser sustituida por Toxic(Tóxico) o Thunder Wave (Onda Trueno), preferentemente en los casos que no se cuente con algun pokemon con ataques de modificación de estados. Cabe destacar que este set está pensado para batallas dobles más que para individuales.	\N	2014-11-23 02:58:48	2015-03-18 13:52:25	4	-2	1	3	-2	4	0	43	1	VGC15
65	Swagdevoir al ataque	282	180	\N	\N	176	\N	152	264	3	140	94	585	605	85	Con los 180 ev en speed Outspeedea pokemon de base 110, con esos 180 ev en HP aguanta un sludge bomb de gengar timid 252 Sp.atack y los ev en Sp. Atk son suficientes para hacerle OHKO a garchomp.	\N	2014-11-25 00:06:43	2015-11-27 03:44:33	4	2	3	1	2	4	0	44	1	VGC15
67	EvoPokémon's Mega Slowbro	80	252	\N	\N	44	212	\N	752	2	144	347	126	473	58	252 Atk Parental Bond Mega Kangaskhan Double-Edge vs. 252 HP / 0+ Def Slowbro: 82-99 (40.5 – 49%) — guaranteed 3HKO\\r\\n252+ Atk Huge Power Mega Mawile Play Rough vs. 252 HP / 0+ Def Slowbro: 79-94 (39.1 – 46.5%) — guaranteed 3HKO\\r\\n252 SpA Life Orb Hydreigon Dark Pulse vs. 248 HP / 216 SpD Slowbro: 166-198 (82.5 – 98.5%) — guaranteed 2HKO\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/mega-slowbro-1862\\r\\nEscrito originalmente por Kommander y Jasper	\N	2014-12-13 17:27:40	2015-03-18 13:51:43	1	-1	0	1	-1	1	0	5	1	VGC15
217	Standard Ninetales-A	822	4	\N	\N	252	\N	252	252	5	117	59	573	624	182	No se usan ataques tipo hada ya que el hielo ya le ofrece cobertura contra los tipo dragón	\N	2017-01-24 05:29:39	2017-01-24 05:29:49	0	0	0	0	0	0	0	5	1	VGC17
68	EvoPokémon's Mega Sableye	302	252	\N	44	\N	212	\N	746	24	158	196	269	105	282	252+ SpA Mega-Gardevoir Pixilate Hypervoice vs 252 HP/212+ SpD Mega-Sableye 132 – 156 (84 – 99.3%) Guaranteed 2HKO\\r\\n252+ SpA Choice Specs Hydreigon Draco Meteor vs 252 HP/212+ SpD Mega-Sableye 120 – 142 (76.4 – 90.4%) Guaranteed 2HKO\\r\\n252+ SpA Mega-Charizard Y Heat wave in sun vs 252 HP/212+ SpD Mega-Sableye 79 – 94 (50.3 – 59.8%) 87.5% chance of 2HKO\\r\\n252+ SpA Aegislash-Blade Shadow Ball vs 252 HP/212+ SpD Mega-Sableye 57 – 67 (36.3 – 42.6%) Guaranteed 3HKO\\r\\n252 Atk Mega-Salamence Aerilate Return vs 252 HP/44 Def Mega-Sableye 99 – 117 (63 – 74.5%) Guaranteed 2HKO\\r\\n252 Atk Mega-Salamence Aerilate Double Edge vs 252 HP/44 Def Mega-Sableye 115 – 136 (73.2 – 86.6%) Guaranteed 2HKO\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/road-oras-mega-sableye-1852\\r\\nEscrito originalmente por Ignacio Rolin	\N	2014-12-13 17:36:12	2014-12-13 17:36:12	0	0	0	0	0	0	0	5	1	VGC15
69	EvoPokemon's Mega Glalie físico	362	100	\N	\N	252	\N	156	755	11	39	216	89	420	153	El EV spread permite outspeedear a Timid/Miedoso Smeargle máx speed por un punto con naturaleza Firme/Adamant, y el resto de los EVs van a bulk para poder resistir algo más los golpes, considerando que más speed será mejor entregarlo a través de un compañero dado que por sí solo no outspedeará nada que valga la pena con sus solo 100 de base\\r\\n\\r\\n252+ Atk Mega Glalie Ice Shard vs. 0 HP / 4 Def Garchomp: 148-180 (80.8 – 98.3%) — guaranteed 2HKO\\r\\n252+ Atk Refrigerate Mega Glalie Return vs. 0 HP / 4 Def Garchomp: 492-580 (268.8 – 316.9%) — guaranteed OHKO\\r\\n252+ Atk Mega Glalie Ice Shard vs. 0 HP / 0 Def Mega Sceptile: 184-220 (126.8 – 151.7%) — guaranteed OHKO\\r\\n252+ Atk Refrigerate Mega Glalie Return vs. 252 HP / 0 Def Mega Salamence: 376-448 (186.1 – 221.7%) — guaranteed OHKO\\r\\n252+ Atk Refrigerate Mega Glalie Explosion vs. 252 HP / 0 Def Mega Kangaskhan: 216-255 (101.8 – 120.2%) — guaranteed OHKO\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/road-mega-glalie-1820\\r\\nEscrito originalmente por Eduardo Castro	\N	2014-12-13 17:44:49	2015-03-18 13:51:31	1	-1	0	1	-1	1	0	5	1	VGC15
70	EvoPokemon's Mega Glalie especial	362	100	\N	\N	252	\N	156	755	3	39	58	311	63	182	La idea es tener Día soleado/Sunny Day activo para entregar un mejor coverage frente a los oponentes de acero gracias a Meteorobola/Weather Ball.\\r\\n\\r\\n252+ SpA Mega Glalie Weather Ball (100 BP Fire) vs. 252 HP / 4 SpD Mega Mawile in Sun: 184-218 (117.1 – 138.8%) — guaranteed OHKO\\r\\n252+ SpA Mega Glalie Weather Ball (100 BP Fire) vs. 252 HP / 0 SpD Aegislash-Shield in Sun: 126-150 (75.4 – 89.8%) — guaranteed 2HKO\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/road-mega-glalie-1820\\r\\nEscrito originalmente por Rodrigo Vega	\N	2014-12-13 17:50:29	2014-12-13 19:18:56	0	0	0	0	0	0	0	5	1	VGC15
71	EvoPokemon's Mega Steelix	208	200	252	56	\N	\N	\N	753	11	125	89	157	442	182	Mega Steelix puede ser un buen mega que pueda aguantar a varios del meta actual, sin embargo, esto solo se da por el lado físico, ya que del lado especial es muy difícil que pueda aguantar algo. Esperemos que en el siguiente VGC Tyranitar o Hippowdon sean pokemon disponibles de usar, ya que le permitirian ayudar a M-Steelix a atacar más fuerte gracias a su habilidad.\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/analisis-mega-steelix-1772\\r\\nEscrito originalmente por Diego Aguilera	\N	2014-12-13 18:08:09	2015-03-18 13:50:56	1	1	1	0	1	1	0	5	1	VGC15
72	EvoPokemon's Mega Beedrill	15	4	252	\N	\N	\N	252	760	11	68	404	369	398	529	252+ Atk Adaptability Mega Beedrill Poison Jab vs. 4 HP / 0 Def Mega Charizard Y: 136-162 (88.3 – 105.1%) — 31.3% chance to OHKO\\r\\n252+ Atk Adaptability Mega Beedrill X-Scissor vs. 252 HP / 100 Def Cresselia: 180-212 (79.2 – 93.3%) — guaranteed 2HKO\\r\\n252+ Atk Mega Beedrill Drill Run vs. 4 HP / 0 Def Mega Manectric: 136-160 (93.1 – 109.5%) — 56.3% chance to OHKO\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/analisis-mega-beedrill-1750\\r\\nEscrito originalmente por Lukas Hernández	\N	2014-12-13 18:13:02	2015-03-18 13:50:30	1	1	1	0	1	1	0	5	1	VGC15
73	EvoPokemon's Mega Audino	531	252	\N	244	\N	12	\N	749	2	144	220	270	505	433	El netamente Roomer, su función es settear TR, apoyar con Helping Hand y curar con Heal Pulse cuando sea necesario, Pain Split con una doble función, para no morir en la batalla y quitar HP al rival.\\r\\n\\r\\n252+ Atk Parental Bond Mega Kangaskhan Return vs. 252 HP / 244+ Def Mega Audino: 87-103 (41.4 – 49%) — guaranteed 3HKO\\r\\n252+ Atk Life Orb Protean Greninja Gunk Shot vs. 252 HP / 244+ Def Mega Audino: 148-174 (70.4 – 82.8%) — guaranteed 2HKO\\r\\n252+ Atk Choice Band Reckless Staraptor Brave Bird vs. 252 HP / 244+ Def Mega Audino: 118-141 (56.1 – 67.1%) — guaranteed 2HKO\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/mega-audino-1722\\r\\nEscrito originalmente por FRIKI	\N	2014-12-13 18:31:31	2015-03-18 13:50:16	1	-1	0	1	-1	1	0	5	1	VGC15
74	EvoPokemon's Mega Pidgeot	18	4	252	\N	\N	\N	252	754	5	51	257	542	369	182	252 SpA Pidgeot Hurricane vs. 164 HP / 4 SpD Assault Vest Ludicolo: 132-156 (75 – 88.6%) — guaranteed 2HKO\\r\\n252 SpA Pidgeot Hurricane vs. 252 HP / 0 SpD Mega Venusaur: 168-198 (89.8 – 105.8%) — 31.3% chance to OHKO\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/mega-pidgeot-1714\\r\\nEscrito originalmente por Jorge Tapia	\N	2014-12-13 18:35:10	2015-03-18 13:50:10	1	-1	0	1	-1	1	0	5	1	VGC15
75	EvoPokemon's Mega Loppuny	428	4	252	\N	\N	\N	252	758	16	7	252	136	216	8	El EV Spread es básico, al igual que los movimientos. Su Fake Out es uno de los mas rápidos del juego si es que entra en otro turno ya Mega evolucionada. High Jump Kick es el pequeño regalo que se le dio a Lopunny para aprovechar su buenos stats. Return no conseguirá muchos KO.\\r\\n\\r\\n252 Atk Lopunny High Jump Kick vs. 252 HP / 0 Def Aegislash-Shield: 164-194 (98.2 – 116.1%) — 87.5% chance to OHKO\\r\\n(Siendo Adamant, es OHKO asegurado: 107.7 – 126.9%)\\r\\n\\r\\n252 Atk Lopunny High Jump Kick vs. 252 HP / 0 Def Mega Kangaskhan: 230-272 (108.4 – 128.3%) — guaranteed OHKO\\r\\n252 Atk Lopunny High Jump Kick vs. 6 HP / 0 Def Mega Kangaskhan: 230-272 (127 – 150.2%) — guaranteed OHKO\\r\\n252 Atk Lopunny Ice Punch vs. 6 HP / 0 Def Garchomp: 184-220 (100 – 119.5%) — guaranteed OHKO\\r\\n-1 252+ Atk Lopunny High Jump Kick vs. 252 HP / 0 Def Scrafty: 152-180 (88.3 – 104.6%) — 25% chance to OHKO\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/road-oras-mega-lopunny-1698\\r\\nEscrito originalmente por Ymir Tarzen\\r\\n	\N	2014-12-13 18:40:38	2015-11-27 03:45:40	3	1	2	1	1	3	0	5	1	VGC15
76	EvoPokemon's Mega Altaria	334	252	\N	\N	84	172	\N	747	24	30	304	58	257	538	252 SpA Life Orb Protean Greninja Ice Beam vs. 252 HP / 172+ SpD Mega Altaria: 133-156 (73 – 85.7%) — guaranteed 2HKO\\r\\n\\r\\n252+ SpA Aegislash-Blade Flash Cannon vs. 252 HP / 172+ SpD Mega Altaria: 126-150 (69.2 – 82.4%) — guaranteed 2HKO\\r\\n\\r\\n252 SpA Mega Gengar Sludge Bomb vs. 252 HP / 172+ SpD Mega Altaria: 140-168 (76.9 – 92.3%) — guaranteed 2HKO\\r\\n\\r\\n156 Atk Tough Claws Mega Metagross Bullet Punch vs. 252 HP / 0 Def Mega Altaria: 86-104 (47.2 – 57.1%) — 91.4% chance to 2HKO\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/road-oras-la-esponja-voladora-mega-altaria-1673\\r\\nEscrito originalmente por Miguel Adofacci y Rodrigo Vega	\N	2014-12-13 18:47:53	2015-03-18 13:49:57	1	1	1	0	1	1	0	5	1	VGC15
77	EvoPokemon's Mega Gallade	475	\N	252	4	\N	\N	252	748	16	154	370	428	8	182	Este set se basa en explotar los puntos fuertes de Mega Gallade, a través de un spread de physical sweeper. La habilidad no importa demasiado, ya que en general estaremos mega evolucionando a Gallade de inmediato, sin embargo Justified podría ayudar en un switch contra un predicted Crunch o bien que decidamos NO megaevolucionar en el primer turno intentando absorber un predicted Sucker Punch, pero no lo recomiendo ya que la defensa física de Gallade previo a Mega Evolucionar no es muy alta, y recibiremos mucho daño considerando el spread.\\r\\n\\r\\n252 Atk Mega Gallade Close Combat vs. 4 HP / 0 Def Mega Kangaskhan: 246-290 (135.9 – 160.2%) — guaranteed OHKO\\r\\n252 Atk Mega Gallade Ice Punch vs. 0 HP / 4 Def Garchomp: 212-252 (115.8 – 137.7%) — guaranteed OHKO\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/road-oras-el-ultra-heroe-mega-gallade-1641\\r\\nEscrito originalmente por Rodrigo Vega	\N	2014-12-13 19:03:10	2014-12-16 16:49:46	1	1	1	0	1	1	0	5	1	VGC15
78	EvoPokemon's Mega Sharpedo	319	\N	252	\N	54	\N	204	751	10	3	242	127	58	182	52 SpA Mega Sharpedo Ice Beam vs. 4 HP / 0 SpD Mega Salamence: 172-204 (100.5 – 119.2%) — guaranteed OHKO\\r\\n\\r\\nMega Sharpedo no posee los stats ni la habilidad más impresionante pero definitivamente tiene las herramientas necesarias para hacerse cargo de algunos futuros gigantes del metagame, por supuesto, con el apoyo necesario (como cualquier Pokémon). Aún con algunos incrementos en sus defensas sigue siendo muy frágil y susceptible a la prioridad así que debe ser utilizado con cuidado y énfasis en lo que es bueno. Su velocidad de 105 lo pone por encima de gran parte del meta, incluyendo a Garchomp y gracias a su forma regular puede ir aun más rápido. Lo más probable es que Mega Sharpedo no pase desapercibido en el futuro porque tan “malo” no es.\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/road-oras-mega-sharpedo-1649\\r\\nEscrito originalmente por Yonathan Pérez	\N	2014-12-13 19:17:02	2015-03-18 13:49:24	1	-1	0	1	-1	1	0	5	1	VGC15
79	EvoPokemon's Mega Salamence especial	373	4	\N	\N	252	\N	252	759	3	22	434	304	126	182	Lamentablemente, a diferencia de casi todos los otros megas usados en VGC, Mega-Salamence es INCAPAZ de dañar considerablemente a los megas más comunes de este año; Kangaskhan y Mawile:\\r\\n\\r\\n252+ SpA Aerilate Salamence Hyper Voice vs. 4 HP / 0 SpD Mega Kangaskhan: 78-93 (43 – 51.3%) — 5.5% chance to 2HKO\\r\\n252+ SpA Salamence Draco Meteor vs. 4 HP / 0 SpD Mega Kangaskhan: 117-138 (64.6 – 76.2%) — guaranteed 2HKO\\r\\n252+ SpA Salamence Fire Blast vs. 252 HP / 60 SpD Mega Mawile: 128-152 (81.5 – 96.8%) — guaranteed 2HKO\\r\\nTampoco tiene un buen match-up contra mega Metagross, el cual le da OHKO con Ice Punch y Fire Blast es incapaz de matarlo:\\r\\n\\r\\n252+ SpA Salamence Fire Blast vs. 100 HP / 4 SpD Metagross: 120-142 (71.4 – 84.5%) — guaranteed 2HKO\\r\\n\\r\\n¿Por qué entonces discutir un set que parece ser tan malo? La razón es que Salamence puede ser un late game cleaner, obteniendo los KOs toda vez que el equipo rival haya sido dañado previamente. Si algo nos enseñó Talonflame es que volador es un tipo de ataque muy efectivo en VGC.\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/mega-salamence-oras-1617\\r\\nEscrito originalmente por Lito	\N	2014-12-13 19:24:53	2015-03-18 13:49:17	1	1	1	0	1	1	0	5	1	VGC15
80	EvoPokemon's Mega Salamence físico	373	252	252	\N	\N	4	\N	759	11	22	349	216	89	182	Con un ataque base de 145 lo natural es escoger un set que lo aproveche. Adicionalmente, cuenta con Dragon Dance lo que libera EVs de speed y nos deja usar Adamant sin problemas. En efecto con 0 EVs y un Dragon Dance, Mega-Salamence tiene 210 de velocidad… los suficientes para ganarle a mega Aerodactyl sin problemas (quien tiene “sólo” 202).\\r\\n\\r\\nNo incluyo un ataque Dragon porque 1) todos los dragones mueren de un +1 Return y 2) los ataques Dragon son inmunes por un tipo… no así volador. Los EVs maximizan el bulk general y el ataque. Jamás vivirá un Ice Beam así que es irrelevante intentarlo (no en vano con Nicolás del Campo creemos que Greninja será muy bueno en este meta). A pesar de esto, logra vivir HP ice de mega Manectric Modest:\\r\\n\\r\\n252+ SpA Mega Manectric Hidden Power Ice vs. 252 HP / 4 SpD Salamence: 168-200 (83.1 – 99%) — guaranteed 2HKO\\r\\n\\r\\n+1 252+ Atk Aerilate Salamence Return vs. 4 HP / 0 Def Mega Kangaskhan: 204-240 (112.7 – 132.5%) — guaranteed OHKO\\r\\n+1 252+ Atk Salamence Earthquake vs. 252 HP / 60 Def Mega Mawile: 120-142 (76.4 – 90.4%) — guaranteed 2HKO\\r\\n+1 252+ Atk Salamence Earthquake vs. 100 HP / 0 Def Metagross: 108-128 (64.2 – 76.1%) — guaranteed 2HKO\\r\\nSi bien parece difícil usar Dragon Dance, con buenos compañeros uno siempre puede hallar la ocasión, tal como nos enseñó Mega Tyranitar o Charizard X en VGC14. Este ejercicio nos muestra además que Mawile seguirá más vivo que nunca en VGC15.\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/mega-salamence-oras-1617\\r\\nEscrito originalmente por Lito	\N	2014-12-13 19:28:41	2015-11-27 03:45:42	3	1	2	1	1	3	0	5	1	VGC15
81	EvoPokemon's Mega Sceptile especial	254	4	\N	\N	252	\N	252	745	3	65	437	406	182	237	La idea de este moveset es que siempre tiene que tener un Pokémon que sea el support de Mega Sceptile, por que como verán, Mega Sceptile no tiene muchas defensas, lo que lo hace blanco fácil, por eso siempre es bueno tener al lado su buen compañero. Este podría ser Aerodactyl, ya que entre los 2 pueden deshacerse de sus counters por tipo, la roca derrota 4 debilidades de la planta, al igual que Sceptile puede derrotar a los counters de su compañero, otra opción es tener un Pokémon tipo eléctrico con Discharge, asi activando su habilidad pararrayos atacara a su enemigo y además Sceptile recibirá el Boosteo para atacar todavía mas cerdo.\\r\\n\\r\\nEl Moveset esta pensado para atacar con su mayor potencial de acuerdo a sus tipos y stab. Los Hidden Powers pueden usarse de acuerdo al team que quieran usar, por ejemplo, el HP Ice es funcional con los tipos que son x4 debiles a este tipo, mas que nada dragones, algunos diran: Pero es Dragon, puede derrotarlos de un golpe!... Posiblemente si, pero esta opción es buena para dejarlo totalmente K.O sin tener la duda de que lo matara o no. El HP Fire es para los tipo aceros, si bien los cálculos no aseguran un K.O, si se le acompaña con un Pokemon Helping Hand, el k.o es 100% seguro a cualquier acero o dejándolo en rojo de una, cosa de derrotarlo fácilmente después. Por ultimo el HP Rock para mi al menos es el mejor HP para un tipo planta, por que derrota fácilmente la mayoría de los Pokemon que le ganan al planta, por ejemplo si saliera un Bicho/Volador, el HP Rock lo derrota fácil, si sale un Mega Charizard Y, muere fácil de un solo HP Rock. Cabe destacar que Mega Sceptile funciona en la mayoría de los climas, como el Sol y la Lluvia.\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/road-oras-mega-sceptile-1624\\r\\nEscrito originalmente por Vincent	\N	2014-12-13 20:05:25	2015-11-27 03:45:43	3	1	2	1	1	3	0	5	1	VGC15
108	terrores de los mares	87	150	\N	100	200	60	\N	683	3	115	59	324	252	57	Set apoyado por Mega Abomasnow por su habilidad Nevada le da PS a Dewgong por su habilidad y siempre golpearia Ventisca. Sorpresa aprende por mov.huevo para romper la Banda Focus del rival.Surf por STAB y Doble Rayo para cubrir tipos. En caso de no usar junto a Mega Abomasnow cambia Ventisca por Rayo Hielo	\N	2014-12-21 17:17:40	2015-03-18 13:35:18	4	0	2	2	0	4	0	76	1	VGC15
82	EvoPokemon's Mega Sceptile físico	254	\N	252	\N	\N	4	252	745	11	65	348	337	157	182	Este moveset esta pensado para golpear por stab igualmente, aunque el Dragon Claw lo veo un poco mas opcional mas que nada, ya que con otros movimientos podría quedar mejor, no sale del parámetro que es bueno tener un compañero ojala fake out + Quick Guard, ya que se rumorea de que el pajarito desgraciado llamado Talonflame volverá DDDD;!!!! Asi que, es mejor asegurar el K.O seguro a esa cosa con su buen Fake Out y Rock Slide. El Rock Slide funciona bien ya que funciona igual como el HP Rock revisado anteriormente (claro esta que me refiero a su utilidad por tipo) e incluso mejor por que golpearía mas todavía y golpearía a los 2. \\r\\n\\r\\nOpcionales: Earthquake funciona derrotando ya a muchos pokemons con mega Evoluciones actuales, como Mega Metagross, Mega Manectric y Mega Mawile, ciertamente a ningún derrotaría ya sea por su alta defensa o su habilidad, pero los dejara bastante graves haciendo que no puedan sobrevivir un turno mas. Aerial Ace funciona ya para no fallar los ataques y para dejar a otro compañero planta en desventaja total. Power-Up-Punch funciona de una manera bastante buena ya que compensa la “falta” de poder en el ataque de este Pokemon, además que boostearia completamente a Mega Sceptile.\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/road-oras-mega-sceptile-1624\\r\\nEscrito originalmente por Vincent	\N	2014-12-13 20:11:01	2015-03-18 13:48:36	2	0	1	1	0	2	0	5	1	VGC15
83	EvoPokemon's Mega Metagross	376	100	156	\N	\N	\N	252	750	16	29	418	8	157	182	Este spread sobrevive el Dark Pulse de Timid Greninja Life Orb\\r\\nVive el Flare Blitz de Jolly Talonflame Life Orb\\r\\nGenera el tan odiado Speed Tie Talonflame Adamant\\r\\nVive al Fire Blast de Mega-Salamence Modest\\r\\nPuede hacer OHKO a los Charizard-Y diseñados para resistir Rock Slide de Garchomp\\r\\nResiste Shadow Ball de Aegislash Blade un 50% de las veces, el Mega-Gallade Shadow Claw y Earthquake Critico de Garchomp.\\r\\n\\r\\nArticulo completo en http://www.evopokemon.com/megametagross-1587\\r\\nEscrito originalmente por Sh4dowzon	\N	2014-12-13 20:23:04	2015-11-27 03:44:36	4	2	3	1	2	4	0	5	1	VGC15
84	Pachamama (Pephan's XL Gourgeist)	711	156	\N	212	\N	140	\N	196	22	119	402	567	433	261		\N	2014-12-15 03:30:31	2015-03-18 13:47:46	3	-1	1	2	-1	3	0	49	1	VGC15
86	MSwampert	260	50	252	100	\N	108	\N	744	11	67	89	127	8	182		\N	2014-12-16 14:04:27	2015-01-16 01:54:07	3	1	2	1	1	3	0	52	1	VGC15
87	MegaChompy by Yoyi	445	252	140	52	\N	60	4	722	11	24	337	89	157	182	Logra:\\r\\nVive Dragon Claw de un Garchomp con Life Orb y mata de vuelta con el propio.\\r\\nVive HP Ice de Mega Manectric\\r\\nVive con 87.5% de probabilidad un Moonblast de Gardevoir +252.\\r\\nGana 1 vs 1 contra Mega Kangaskhan, independiente del EV spread que tenga.\\r\\nVive un 62.5% de las veces un Ice Beam de Politoed/Ludicolo +252.\\r\\n\\r\\nAdemás, al Mega Evolucionar permite:\\r\\n\\r\\nOHKO a 252 HP Mega Mawile en arena, y 6,3% de hacerlo sin arena lo que permitía matarlo con la ayuda de algún compañero.\\r\\nOHKO a 4HP Mega Manectric sin arena, estando intimidado tiene un 25% de darle OHKO, y si está intimidado y con arena le hace OHKO. (Sin intimidar y con arena activando la Sand Force, el daño máximo es de 202,7%, es decir, lo mata dos veces)	\N	2014-12-16 14:23:51	2015-03-18 13:47:21	5	3	4	1	3	5	0	50	1	VGC15
88	Ambipom by Noe	424	4	252	\N	\N	\N	252	198	16	101	251	252	458	332		\N	2014-12-16 14:30:36	2015-03-18 13:47:16	6	-6	0	6	-6	6	0	53	1	VGC15
89	Payita	272	10	\N	\N	250	\N	250	230	5	33	58	56	202	411	La gracia es usarlo acompañado de un politoed con llovizna o de un kyogre\\r\\nEs solo para dobles	\N	2014-12-16 16:11:34	2015-03-18 13:47:07	8	-8	0	8	-8	8	0	57	1	VGC15
91	Cuteness is Danger (Milo5789)	573	4	252	\N	\N	\N	252	198	11	92	541	350	331	182	Standard use. Makes use of King's Rock to raise flinch %.\\r\\n\\r\\nUso estándar. Hace uso de King's Rock para aumentar la probabilidad de flinchear.	\N	2014-12-16 18:33:28	2015-11-26 01:57:54	9	5	7	2	5	9	0	62	1	VGC15
92	Full-Out Cuteness (Milo5789)	573	4	252	\N	\N	\N	252	247	16	92	541	350	331	369	Another standard use. Makes use of U-Turn for safe switch.\\r\\n\\r\\nOtro uso estándar. Hace uso de U-Turn para poder regresar.	\N	2014-12-16 18:39:23	2015-03-18 13:46:21	8	-4	2	6	-4	8	0	62	1	VGC15
93	Hocus Pocus, no recoil (Milo5789)	65	4	\N	\N	252	\N	252	247	5	98	605	473	411	447	No recoil damage thanks to Magic Guard\\r\\n\\r\\nSin contradaño gracias a Magic Guard.	\N	2014-12-16 18:46:15	2015-03-18 13:46:08	7	-7	0	7	-7	7	0	62	1	VGC15
94	Sarmi's Mega Beedrill	15	\N	252	\N	\N	4	252	760	16	97	529	282	404	398	Mega Beedrill Ofensivo Físico, gran cobertura de tipos	\N	2014-12-16 20:13:54	2015-03-18 13:45:53	8	-6	1	7	-6	8	0	63	1	VGC15
96	Sci/Maw's best friend	666	4	\N	\N	252	\N	252	252	5	14	542	79	600	182		\N	2014-12-17 00:47:27	2015-11-26 01:57:45	8	6	7	1	6	8	0	68	1	VGC15
97	Chorizord Y	6	4	\N	\N	252	\N	252	717	5	66	76	257	411	182		\N	2014-12-17 00:52:36	2015-03-18 13:45:26	6	-4	1	5	-4	6	0	68	2	VGC15
98		248	252	132	36	\N	88	\N	682	11	45	242	444	8	182	En caso de no tener acceso al tutor de Ice Punch, reemplazarlo por Ice Fang	\N	2014-12-17 01:01:00	2015-11-26 01:58:16	7	3	5	2	3	7	0	68	1	VGC15
99	Offensive Support	678	252	\N	\N	252	\N	4	246	5	158	219	115	94	207		\N	2014-12-17 01:13:57	2015-03-18 13:45:08	5	-5	0	5	-5	5	0	68	1	VGC15
100		303	252	252	\N	\N	4	\N	720	11	22	583	442	424	389		\N	2014-12-17 01:17:15	2015-11-26 01:58:19	7	3	5	2	3	7	0	68	1	VGC15
101		212	248	252	\N	\N	\N	8	247	11	101	17	182	450	418	en caso de no tener acceso a Bug Bite por tutor, reemplazarlo por X-Scissor	\N	2014-12-17 01:22:41	2015-11-27 03:48:48	8	-6	1	7	-6	8	0	68	1	VGC15
102		658	4	\N	\N	252	\N	252	245	5	168	58	561	503	447		\N	2014-12-17 01:26:00	2015-03-18 13:44:43	4	-4	0	4	-4	4	0	68	1	VGC15
103	Rocky Garchompo	445	12	248	\N	\N	\N	248	583	16	24	157	89	182	337		\N	2014-12-17 01:29:48	2015-03-18 13:36:20	5	-5	0	5	-5	5	0	68	1	VGC15
104	Volcabrona	637	4	\N	\N	252	\N	252	172	3	49	552	483	182	405		\N	2014-12-17 01:33:03	2015-03-18 13:36:01	5	-5	0	5	-5	5	0	68	1	VGC15
105	Trolldurus	642	4	\N	\N	252	\N	252	165	5	158	86	85	411	269		\N	2014-12-17 02:29:57	2015-03-18 13:35:48	6	-6	0	6	-6	6	0	68	1	VGC15
106		197	52	6	200	\N	252	\N	583	24	28	185	236	92	109		\N	2014-12-17 17:28:12	2015-03-18 13:35:37	6	-4	1	5	-4	6	0	61	1	VGC15
107	<3~Sakura~<3 (Dieguito's Sylveon)	700	244	\N	112	108	44	\N	135	4	182	270	182	304	473	¡Muy buenas a todos! Soy Diego Aguilera, un jugador no tan reconocido pero que le pone empeño en todo esto del VGC, hoy vengo a dejarles un set que cree junto a Robert (AKA Raichu) de Sylveon. \\r\\nLa gracia de este spread es con un enfoque defensivo y ofensivo a la vez, psyshock puede ser cambiado por Shadow Ball y el objeto también puede ser un Leftovers.\\r\\nEste spread permite aguantar el Return de un M-Kangaskhan el 100% de las veces.\\r\\nCapaz de aguantar un Double-edge de la reina del VGC el 56,2% de las veces.\\r\\nAguanta el Sludge Bomb de un M-Gengar.\\r\\nAguanta el Flash Cannon de un Aegislash 252 SP. Atk Modest.\\r\\nCapaz de hacerle un 40% de daño con Psyshock a un Amoonguss tradicional.\\r\\n¡Eso por ahora! 	\N	2014-12-18 00:14:53	2015-11-26 01:58:21	15	3	9	6	3	15	0	73	1	VGC15
109	BattleBunny	428	4	252	\N	\N	\N	252	758	11	7	136	8	409	252	Hola ^^ \\r\\nBueno aca está mi pequeña Lopunny , obviamente debe tener High Jump Kick , es el movimiento más fuerte del Mega.\\r\\nLuego tenemos los puños , podemos elegir entre cualquier puño , yo ocupo "Ice punch" por los voladores y dragones.\\r\\nLuego tenemos "Drain punch" lo ocupo para tener un poco de "defensa" y proteger a Loppuny de morir rápido.\\r\\nY por ultimo "Fake out" para ser molesto al salir , como cualquier chica:v\\r\\nY ocupenlo shiny que así es más bonito	\N	2014-12-24 04:30:35	2015-03-18 13:35:10	5	1	3	2	1	5	0	77	1	VGC15
110	Serperior La bestia	497	6	\N	\N	252	\N	252	274	5	126	437	202	406	237	Hola^^\\r\\nYa que ahora es legal el HO de Serperior :D aquí una estrategia.\\r\\nBueno el PO puede ser Hielo - Roca - Fuego.\\r\\nEl item tambien puede ser Banda Focus por cualquier pokemon peligroso...Talonflame ¬¬\\r\\nNo hay mucho que explicar... Lluevehojas en vez de bajar SpA te lo subira , y la famosa "Red Viscosa" nos subira la velocidad :D \\r\\nEn sí este pokémon está roto\\r\\nAh y... PO y Pulso Dragón son movimientos para cubrir tipos^^\\r\\nEso adiós	\N	2014-12-24 04:53:49	2015-03-18 13:34:57	8	-6	1	7	-6	8	0	77	1	VGC15
111	sida-senpai	663	\N	140	\N	192	\N	176	247	20	177	413	315	261	269	logra debilitar al mawille 252 HP,al rotom podadora 252 hp,le gana en velocidad al talonflame firme 252 en velocidad....proporciona un buen soporte al equipo podiendo quemar al enemigo y usar taun antes q otros usuarios como por ejemplo gengar.	\N	2014-12-24 20:47:39	2015-03-18 13:34:50	6	0	3	3	0	6	0	78	1	VGC15
112	Infernape de apoyo	392	\N	252	\N	4	\N	252	252	10	66	370	315	252	501	Se corre un set mixto para evitar quedar neutralizado por intimidates enemigos, overheat sigue siendo un ataque potente que permite darle OHKO a Mega mawile standard.\\r\\n\\r\\nInfernape al ser un poke con una velocidad base de 108 permite ser mas rapido que mega kangaskhan y hacerle fake out primero.\\r\\n\\r\\nQuick guard permite ayudar al compañero a bloquear fake outs mas lentos y ataques prioritarios como los de Talonflame o Thundurus.\\r\\n\\r\\nFinalmente debido a su fragilidad casi siempre se le activará la focus sash, y en esos casos se le activará su habilidad Blaze que potenciará su Overheat.\\r\\n\\r\\n252 Atk Infernape Close Combat vs. 4 HP / 0 Def Mega Kangaskhan: 176-210 (97.2 - 116%) -- 81.3% chance to OHKO\\r\\n\\r\\n4 SpA Infernape Overheat vs. 252 HP / 4 SpD Mega Mawile: 158-188 (100.6 - 119.7%) -- guaranteed OHKO	\N	2014-12-28 03:07:09	2015-03-18 13:34:37	3	3	3	0	3	3	0	5	1	VGC15
113	Punky con Chaleco (Tutores Update)	560	252	244	12	\N	\N	\N	683	11	22	252	282	409	162	A falta de creatividad y aumento de pajita para armar un spread nuevo de Scrafty Assault Vest, listo el conocido spread que soporta el Brave Bird de Talonflame Choice Band en -1 (aunque Talonflame no se vea demasiado actualmente). Lo ideal es por supuesto jugar con los EVs si se puede hallar algo mejor. Este pequeño review entonces calza en el pecado de la pereza.\\r\\n\\r\\nLo importante aquí es notar el acceso que tiene Scrafty ahora a movimientos de tutor gracias a ORAS. Knock Off es una enorme herramienta en BO3 al scoutear Items; y en todas las instancias en general, muy útil al anular Leftovers, Sitrus Berry, los Choice, y otros objetos clave. Super Fang es discutible en lugar de Ice Punch en el set estándar de VGC14, ya que Chomp va en bajada y Landorus-T en subida, el cual gracias a su Intimidate recibe daño no tan grande. Mega Salamence con su intimdate previo y excelente defensa física tampoco justifica el uso de Ice Punch.\\r\\n\\r\\nEl aumento de Pokémon Bulky e intimidates en el Metagame de VGC15 pone sobre la mesa la opción de Super Fang, ya que aún con muchos intimidates afectándolo, Scrafty puede mantenerse consistente en daño y poner en Rango de KO a los atacantes que si pueden tener presencia. Objetivos comunes pueden incluir Suicune, Zapdos, Landorus-T o Cresselia en el Switch. Los otros dos moveslots son estándares, y no creo que varíen porque Fake Out y Drain Punch tienen su mérito propio.\\r\\n\\r\\nAhora, ¿es realmente Scrafty un Pokémon óptimo para VGC15? Tal vez no, ya que aún con el Assault Vest, la ofensiva Fairy de Pixilate Hyper Voice de la mano de Sylveon y Gardevoir, que es bastante común actualmente, le resta mucho Staying Power en relación a VGC14.\\r\\n\\r\\nPero ¿será siempre así? Nuevamente, tal vez no. El metagame evoluciona constantemente y en un futuro la ofensiva de Hyper Voice quizá sea menos común. Por ahora son juguetes nuevos y llaman la atención, como en todas las cosas. Hasta que baje la novedad, Scrafty no podrá brillar, porque potencial para adaptarse a un metagame bulky y cada vez más físico, tiene.	\N	2014-12-28 06:40:54	2015-11-26 01:58:23	5	3	4	1	3	5	0	79	1	VGC15
114	NinjaSyao's Milotic	350	148	\N	172	132	4	52	683	3	172	503	58	56	243	Primero que todo, el spread no es mío. Es del usuario de Nugget Bridge NinjaSyao, conocido por ser muy bueno elaborando y optimizando Spreads. Lo comparto porque es básicamente de acceso público por ser un foro y es muy sexy para no probarlo.\\r\\n\\r\\n(Pueden ver el original en el siguiente link: http://nuggetbridge.com/forums/topic/11227-milotic-ev-spread/ )\\r\\n\\r\\n- Le da OHKO al Chomp 12HP/36SpDef con Ice Beam, popularizado en los últimos meses de vida de VGC14.\\r\\n- A Landorus-T no AV y Mence-MegaMence igual. En este caso es más fácil por el intimidate que activa Competitive\\r\\n- Outspeedea a los Rotom bulky\\r\\n- Si puede recibir Giga Drain de Ludicolo o Thunderbolt de Rotom, los pulveriza de vuelta con algo de predicción de la mano de Mirror Coat\\r\\n- Tiene buen chance de sobrevivir Double Edge de la MILF favorita del año 2014, solo para mostrar su bulk físico. 18.8% chance de OHKO\\r\\n- Sobrevive siempre el Leaf Storm de Mega Sceptile Modest\\r\\n- Jolly LO Chomp's Earthquake tiene 15.6% chance de dar un 2HKO.\\r\\n- Modest 252 Rotom tiene 8.6% chance de 2HKO\\r\\n- Puede sobrevivir siempre un Dark Pulse + Draco Meteor de un Hydreigon Specs. Ese Bulk especial es insano.	\N	2014-12-28 07:42:39	2015-03-18 13:34:07	5	1	3	2	1	5	0	80	1	VGC15
115	FRIKI's Salamence	373	196	8	52	\N	\N	252	174	10	22	349	126	337	355	Salamence pseudo bulk cual única función es matar al M-Mawile de Rizzo (por ende cuando me refiera a M-Mawile será con el spread de Rizzo) y sobrevivir otros dragones. Se vale de su habilidad y Dragon Dance. Este Mence lo que hace es:\\r\\n-Sobrevive Play Rough + Sucker Punch de M-Mawile a -1 y lo mata con dos Fire Blast en Sol\\r\\n-37.5% de matar a un M-Mawile 252 HP / 0 SDef con Fire Blast en Sol (pero éste te mata de vuelta de Play Rough)\\r\\n-Sobrevive Outrage +0 Adamant Garchomp Life Orb y lo mata de Dragon Claw post Dragon Dance\\r\\n-Aguanta Draco Meteor de Hydreigon Modest Choice Scarf y lo mata de Dragon Claw post Dragon Dance\\r\\n-Se aplica lo mismo que lo anterior para todos los dragones\\r\\n\\r\\nComo vemos no hace una labor excepcional, nada que otro Salamence no haga, solo radica en que este mata un 100% de las veces al Mawile de Rizzo.\\r\\n\\r\\nY lo último, el cuarto slot puede variar, moves útiles son Rock Tomb o Protect.\\r\\n\\r\\n	\N	2014-12-31 20:20:51	2015-03-18 13:33:52	5	-3	1	4	-3	5	0	81	1	VGC15
116	FRIKI's M-Salamence	373	252	196	16	\N	44	\N	759	11	22	349	38	182	89	Hola, vengo con otro Salamence, y éste es también bulk, pero la gracia... Es que es mega!\\r\\nY lo que hace:\\r\\n\\r\\n-Resiste Ice Beam Ludicolo/Politoed Modest 252 y los mata de vuelta con Double Edge +0\\r\\n-Mata de Double Edge a Hydreigon (hay que inmovilizarlo primero, Fake Out es una opción)\\r\\n-Gana siempre 1 vs 1 contra cualquier Garchomp/M-Kangaskhan/Talonflame\\r\\n-Aguanta Ice Shard de Mamoswine Adamant 252 con Life Orb y lo mata con Double Edge\\r\\n-Aguanta el HP Ice de M-Manectric pero NO lo alcanza a matar de EQ\\r\\n-Resiste HP Ice de Timid Thundurus (Life Orb) el 50% de las veces\\r\\n-Heatran Modest 252 no lo mata de HP Ice\\r\\n-Resiste Rock Slide y Stone Edge (este a -1) de Adamant Life Orb Terrakion y lo mata de vuelta\\r\\n\\r\\nToma muchas más cosas pero deben estar a -1, los cálculos los hice +0 así que resiste gran cantidad de ataques, y el EQ puede ambiar por Rock Slide, es optativo, al igual que Protect por Roost\\r\\n	\N	2014-12-31 20:46:55	2015-03-18 13:33:36	7	-5	1	6	-5	7	0	81	1	VGC15
117	Hongo Pesado	286	4	252	\N	\N	\N	252	249	11	90	147	164	182	264		\N	2015-01-03 01:56:34	2015-03-18 13:33:25	4	-2	1	3	-2	4	0	82	1	VGC15
118	Regi-rock	377	252	52	100	\N	100	\N	211	11	29	89	444	446	182	Regirock es un pokemon  sumamente defensivo y con los EVs en PS al máximo aguantara casi cualquier ataque, Stone edge recibe stab, earthqake para cobertura, protect para recuperas PS con restos.	\N	2015-01-03 03:46:36	2015-03-18 13:33:14	6	-4	1	5	-4	6	0	83	1	VGC15
119	Anti ‘15	589	252	252	\N	\N	\N	\N	252	21	142	224	529	442	182	Un buen counter del lead Ludicolo + Politoed, peligro de gran parte de los setters de TR y un dios dentro del mismo, counter de Cresselia, Sylveon, Gardevoir, Gothitelle y gracias a los tutores, hasta del mismisimo Heatran, aguantando su Heat Wave con Focus Sash y devolviendole un Drill Run con un poco mas de 80% de probabilidad de hacerle OHKO al estandar 252hp/252sp.a, además Overcoat le permite ignorar los polvos de los molestos Amoonguss, Venusaur y demás.	\N	2015-01-06 00:27:47	2015-11-27 03:44:42	6	2	4	2	2	6	0	20	1	VGC15
172	Amoonguss Shyni	591	\N	\N	\N	\N	\N	\N	583	2	27	147	188	202	476		\N	2015-10-30 10:21:39	2015-11-27 03:43:17	2	-2	0	2	-2	2	0	126	1	VGC15
120	Bichito	637	52	\N	\N	252	\N	200	252	3	68	483	405	182	324	La estrategia se basa en utilizar un Quiver Dance, por consiguiente subiendose el Ataque Especial. La idea es que nos bajen la vida hasta el punto en el que se active nuestra habilidad "Enjambre" y para tener precaución de ser debilitado por un 1HKO nos equiparemos con la banda focus. Luego solo basta con "spammear" Bugg Buzz o Signal Beam, uno de ellos pueden, claramente, ser sustituidos por algun ataque de fuego como podría ser Heat Wave o Fiery Dance.	\N	2015-01-06 04:35:31	2015-03-18 13:33:03	4	-2	1	3	-2	4	0	43	1	VGC15
121	Super Sweeper	277	4	252	\N	\N	\N	252	250	11	62	263	182	413	98	Set en teoría standar. Mata casi todo con Imagen que gracias a la quemadura + la habilidad lo hacen un ataque incluso más potente que Brave Bird y sin recoil, se incluye igual Brave Bird en caso de quedar 1vs1 contra algún fantasma, y Ataque Rápido en caso de estar ante algo más rápido que nosotros, como Mega Manetric.	\N	2015-01-09 00:35:40	2015-11-26 01:58:25	5	3	4	1	3	5	0	82	1	VGC15
122	OneUp	591	\N	\N	252	4	252	\N	258	24	144	182	476	202	147	Al ser un pokemon con una base muy alta en vida, intentamos potenciar mas las dos defensas para asi poder aguantar todo tipo de atacantes. La naturaleza tambien puede ser Bold(Osada) para sufrir menos daño de los posibles contoneos, pero al ser un pokemon con muchos ataques de estado no suele recibirlos, por eso preferimos bajarle la velocidad, asi ganamos ventaja ante posibles Trick-roomers.	\N	2015-01-10 14:26:23	2015-07-08 18:14:40	3	-1	1	2	-1	3	0	86	1	VGC15
123	Quetzalcóatl	497	4	\N	252	\N	252	\N	211	3	126	182	73	437	406	Al tener la habilidad de respondon este pokemon puede ir hinchandose gradualmente por lo tanto podemos optar por una mejora defensiva en cuanto a los EVs, que mezclado a restos, drenadoras y proteccion nos daran un aguante mas duradero mientras avanza el combate.\\r\\nPodemos sustituir restos por Coba Berry (Baya Kouba) para asi poder aguantar un Pajaro osado de un talonflame.\\r\\nOtro cambio admisible seria cambiar pulso dragon por PO tipo roca, que mezclado con la baya nos hara quitarnos de encima a ese talonflame sin ningun problema.\\r\\nSi queremos ser mas ofensivos, otra opcion seria cambiar las drenadoras por gigadrenado, que hace mas daño y tambien nos cura.	\N	2015-01-10 14:47:22	2015-03-18 13:32:26	3	1	2	1	1	3	0	86	1	VGC15
124	Estandar Anti-Thundurus	547	252	\N	\N	\N	\N	252	252	5	158	366	269	270	227	El Taunt mas rápido del juego sin contar velocidad base. Hecho sólo para hacer taunt a Thundurus,settear TW y atrapar en protect o boosteos al rival. Helping Hand siempre es útil.	\N	2015-01-12 06:28:37	2015-03-18 13:32:19	2	0	1	1	0	2	0	20	1	VGC15
125	Anti Garchomp-Landorus-Spamflame-Etc.	407	76	\N	136	168	128	\N	258	3	101	311	182	237	390	¡La perfecta ayuda para un equipo tormenta de arena esta aquí!, el movimiento meteorobola de Roserade será suficiente para deshacernos de las debilidades de ella misma y de otros pokémon molestos como Talonflame, Thundurus, Zapdos y todo peligro con alas; y por su puesto, de aún más ayuda, el movimiento Poder Oculto, que en este caso será el de Hielo, que, junto con la habilidad Experto se verá potenciado y será de mucha utilidad para eliminar rápidamente a pokémon aún más molestos, como lo son Ammongus, Garchomp, Landorus y las mismas cosas típicas que vemos en el VGC actual, y para más aún, molestamos a nuestro enemigo con estas infernales púas tóxicas, que si son bien usadas, dejarán al oponente con más de un dolor de cabeza.\\r\\n\\r\\n¡Espero les haya ayudado!, ¡Suerte en la competencia, entrenadores!	\N	2015-01-14 05:49:17	2015-03-18 13:32:05	3	-1	1	2	-1	3	0	82	1	VGC15
126	Seto's Pelipper	279	252	\N	156	\N	100	\N	135	2	44	503	355	366	469	252+ SpA M-Salamence Draco Meteor vs. 252 HP / 100 SpD Pelipper: 135-159 (80.8 - 95.2%) -- guaranteed 2HKO\\r\\n252+ SpA Aerilate Salamence Hyper Voice vs. 252 HP / 100 SpD Pelipper: 91-108 (54.4 - 64.6%) -- guaranteed 2HKO\\r\\n252+ Atk Aerilate Salamence Return vs. 252 HP / 156+ Def Pelipper: 106-126 (63.4 - 75.4%) -- guaranteed 2HKO\\r\\n252+ Atk Tough Claws M-Metagross Zen Headbutt vs. 252 HP / 156+ Def Pelipper: 84-100 (50.2 - 59.8%) -- guaranteed 2HKO\\r\\n252+ Atk Landorus-T Rock Slide vs. 252 HP / 156+ Def Pelipper: 60-72 (35.9 - 43.1%) -- guaranteed 3HKO\\r\\n252 Atk Parental Bond Mega Kangaskhan Return vs. 252 HP / 156+ Def Pelipper: 100-118 (59.8 - 70.6%) -- guaranteed 2HKO\\r\\n252+ Atk Huge Power Mega Mawile Play Rough vs. 252 HP / 156+ Def Pelipper: 114-135 (68.2 - 80.8%) -- guaranteed 2HKO\\r\\n\\r\\nScald con probabilidad de quemar con buen Hax, Roost para aumentar durabilidad, puede ser cambiado con otro ataque que se estime más conveniente dependiendo del team\\r\\nWide Guard ayuda a combatir el Hyper Voice Spam, Rock Slide, etc\\r\\n\\r\\nRain Dish a pesar de que no siempre estará en lluvia es mejor que su otra habilidad.	\N	2015-01-14 22:04:50	2015-07-08 18:14:19	2	0	1	1	0	2	0	88	1	VGC15
127	Ponzoña mortal	335	6	252	\N	\N	\N	252	249	11	137	263	370	8	182	La habilidad Toxic Boos (Impetú tóxico) sube el ataque físico de Zangoose en un 50% cuando está envenenado, lo que equivale a decir que su ataque base de 115, sube a 172, lo cual ya lo hace una amenaza importante. Protect es necesario el primer turno para garantizar el envenenamiento auto infligido.\\r\\n\\r\\nSu movimiento estrella es Facade, que al estar afectado por estado, duplica su fuerza. Con ello se logra el siguiente daño:\\r\\n101.6 - 120.2% - OHKO contra el Garchomp estándar\\r\\n116.6 - 138% - OHKO contra Hydreigon con 4 HP y 0 Def.\\r\\n61.7% - 73.8% - 2HKO contra Mega Audino con 100 HP y 156 Def.\\r\\n119.8 - 141.4% - OHKO contra el Mega Kangaskhan estándar\\r\\n75.1% - 88.5% - 2HKO contra Bulky Gyarados con 248 HP y 252 Def.\\r\\n\\r\\nClose Combat, usado para todo aquello que resiste al tipo normal:\\r\\n134.5 - 158.3% - OHKO contra Hydreigon con 4 HP y 0 Def.\\r\\n141 - 168.1% - OHKO contra Mega Tyranitar con 252 HP y 0 Def.\\r\\n\\r\\nIce Punch, para cobertura principalmente contra dragones:\\r\\n146.4 - 172.6% - OHKO contra el Garchomp estándar\\r\\n103.4% - 123.3% - OHKO contra Mega Salamence con 248HP\\r\\n116.3% - 138.7%  - OHKO contra Mega Garchomp con 100HP\\r\\n\\r\\nPrincipales amenazas:\\r\\nZangoose a pesar de su potencial ofensivo, se usa poco debido a su fragilidad y relativa baja velocidad. No es capaz de sobrevivir por sí mismo los ataques más comunes como el Earthquake de Garchomp o el Return de Mega Salamence. Este set necesita el apoyo de un compañero con Wide Guard o Follow Me para   poder ser aprovechado correctamente. Aún así, es bloqueado fácilmente por Aegislash que es inmune a dos de sus ataques y resiste hielo. Las otras grandes amenazas son Mega Mawile, que en su set estándar  recibe 54.1% - 64.3% de daño con Close Combat, y Mega Metagross que sin EVs en HP o defensa, apenas sufre 46.7% - 55.7% de daño con el mismo ataque.	\N	2015-01-15 15:35:14	2015-03-18 13:31:33	2	2	2	0	2	2	0	85	1	VGC15
128	Mokona Anti Bromistas	547	132	\N	\N	152	\N	224	252	5	158	202	585	269	366	El bromista mas rápido del VGC, superando por un punto al molestoso Thundurus para mofarlo antes que lo haga él, luego poder setear viento a fin para ayudar a tu equipo, los otros ataques es por si te lanzan algún bromista scarf (si, existen) y no quedar totalmente inutil, la focus sash es para resistir un turno mas en caso de que aparezca un talonflame jolly ya que a el no lo superamos, pero si al adamant por 2 puntos, en la parte ofensiva/defensiva logra vencer a gastrodom y M-swamper en un 1vs1.\\r\\nMoonblast es para dañar antes que terminen de matarlo y/o para matar algunos dragones.\\r\\nSon libres de modificarlo para mejor\\r\\nRegistrado por CokeSebas/Makise  ♥	\N	2015-01-19 16:26:38	2015-11-26 01:58:31	5	3	4	1	3	5	0	21	1	VGC15
129	Mega Sableye, el staller definitivo	302	252	\N	148	\N	108	\N	746	2	158	261	347	247	105	Mega sableye es un gran pokémon para tanquear, posee 3 inmunidades y solo una debilidad, mega kangaskhan no lo puede tocar, y gracias a su habilidad nos podemos despreocupar de los taunts, encores, disables, dark void y un sin fin de ataques molestos, lo ideal es tenerlo en el equipo junto a otro pokémon capaz de mega evolucionar, ya que como muy poca gente se espera un mega sableye, en el primer turno nuestros oponentes pueden realizar un movimiento que se les refleje gracias a magic bounce, por ejemplo un dark void o un taunt enemigo\\r\\n\\r\\nPara lograr ganar con mega sableye es necesario previamente eliminar sus amenazas, las cuales son pokémon tipo hada como mega mawile y sylveon y atacantes fisicos de fuego como talonflame (ya que no los podemos quemar), entre otras amenazas menos frecuentes tenemos a los pokémon con Guts y Mega Loppuny\\r\\n\\r\\nUna vez que tenemos controladas las posibles amenazas basta hacer uno o dos calm mind para que los ataques especiales oponentes nos hagan un daño minimo, mientras que a los atacantes fisicos los debemos quemar, despues de eso podemos rematar con shadow ball o recuperarnos energia para que las quemaduras eliminen naturalmente a nuestros oponentes, se elige shadow ball sobre dark pulse ya que el primero le pega neutro a los tipo hada\\r\\n\\r\\nEn torneos sancionados hay que tener cuidado de abusar de los calm mind y recover ya que puede que el tiempo se nos acabe y perdamos automaticamente\\r\\n\\r\\nEl spread esta hecho para hacerlo balanceado y aguantar de mejor manera a sus amenazas mas frecuentes, lo ideal es tenerlo acompañado de compañeros que puedan deshacerse de sus amenazas, por lo que el spread permite aguantar por lo menos un golpe de estos\\r\\n\\r\\nContra mega mawile el calculo se realiza bajo la suposición que lo quemamos con nuestro will o wisp prioritario ya que de otro modo es imposible aguantar el play rough\\r\\n252+ Atk Huge Power burned Mega Mawile Play Rough vs. 252 HP / 148+ Def Mega Sableye: 97-115 (61.7 - 73.2%) -- guaranteed 2HKO\\r\\n\\r\\nContra Sylveon es necesario el calm mind para aguantar un hyper voice choice specs\\r\\n252+ SpA Choice Specs Pixilate Sylveon Hyper Voice vs. +1 252 HP / 108 SpD Mega Sableye: 116-140 (73.8 - 89.1%) -- guaranteed 2HKO\\r\\n\\r\\nContra Talonflame no hay mucho que podamos hacer mas que recuperarnos para que se mate él solo, gracias al recoil de sus movimientos\\r\\n252+ Atk Life Orb Talonflame Brave Bird vs. 252 HP / 148+ Def Mega Sableye: 71-86 (45.2 - 54.7%) -- 49.6% chance to 2HKO\\r\\n\\r\\nOtro pokémon que da problemas es los Mega Charizard, ya que el overheat de Zard Y bajo sol es capaz de dar OHKO a nuestro mega, es necesario un calm mind para aguantarlo, Zard X no se puede quemar por lo que también da problemas\\r\\n252+ SpA Mega Charizard Y Overheat vs. +1 252 HP / 108 SpD Mega Sableye in Sun: 115-136 (73.2 - 86.6%) -- guaranteed 2HKO\\r\\n252+ Atk Tough Claws Mega Charizard X Flare Blitz vs. 252 HP / 148+ Def Mega Sableye: 102-120 (64.9 - 76.4%) -- guaranteed 2HKO\\r\\n\\r\\nContra el resto de los "heavy hitters" del meta, ninguno es capaz de darle un OHKO por lo que si sabemos manejar los recover y calm mind/will o wisp es cuestión de tiempo para que nuestros oponentes caigan\\r\\n\\r\\n252+ Atk Life Orb Landorus-T Earthquake vs. 252 HP / 148+ Def Mega Sableye: 66-78 (42 - 49.6%) -- guaranteed 3HKO\\r\\n\\r\\n252 Atk Aerilate Mega Salamence Double-Edge vs. 252 HP / 148+ Def Mega Sableye: 97-115 (61.7 - 73.2%) -- guaranteed 2HKO\\r\\n252 Atk Aerilate burned Mega Salamence Double-Edge vs. 252 HP / 148+ Def Mega Sableye: 48-57 (30.5 - 36.3%) -- 60.9% chance to 3HKO\\r\\n\\r\\n252+ SpA Choice Specs Hydreigon Dark Pulse vs. 252 HP / 108 SpD Mega Sableye: 88-105 (56 - 66.8%) -- guaranteed 2HKO\\r\\n252+ SpA Choice Specs Hydreigon Dark Pulse vs. +1 252 HP / 108 SpD Mega Sableye: 58-70 (36.9 - 44.5%) -- guaranteed 3HKO\\r\\n\\r\\nOfensivamente lo unico rescatable es que debido a su baja velocidad, con un calm mind es capaz de darle OHKO a aegislash en forma espada\\r\\n+1 0 SpA Mega Sableye Shadow Ball vs. 252 HP / 4 SpD Aegislash-Blade: 200-236 (119.7 - 141.3%) -- guaranteed OHKO	\N	2015-01-21 22:43:27	2015-11-26 01:57:59	7	5	6	1	5	7	0	5	1	VGC15
130	Sapolio~ (Pephan TR Landorus-T)	729	124	132	\N	\N	252	\N	683	21	22	276	89	157	282	Mi Landorus T personal, adaptado para el TR que de vez en cuando uso.\\r\\nPasó de ser el típico Choice Scarf flan a ser un pokemon con gran poder de ataque, variedad de moves y un bulk sorpresivo e impensado.\\r\\nGracias al Chaleco de Asalto y la Intimidación este pokemon reduce el daño de forma impensada a ambos pokes del rival.\\r\\nEl Spread está diseñado para alcanzar el ataque máximo de un pokemon de base 130, 252 adamant, y el bulk permite aguantar el 99,9% de los Hidden Power Ice, siendo derrotado sólo por el Hidden Power ice de Chandelure specs (si, a ese nivel)\\r\\nPuede resistir la mayoría de los ice beam sin stab, como el de ludicolo 252 Modest Life Orb, y puede resistir 2 o 3 vozarrones de sylveon dependiendo de su spread. También puede resistir sin problema alguno el heat wave de Charizard Y en sol y no tiene grandes problemas con mega Kangaskhan, haciendo de este un golpeador letal y resistente	\N	2015-01-21 23:09:55	2015-11-26 16:18:03	5	-1	2	3	-1	5	0	49	1	VGC15
131	Pephan Togekiss	468	200	\N	172	4	40	92	135	5	32	403	266	396	366	Un Soporte útil con buena capacidad ofensiva. La velocidad supera por un punto al máximo de bisharp adamant y darle KO con esfera aural. Las defensas y Hp casi para soportar cualquier golpe super efectivo, o aguantar varios golpes x1. La sitrus para un segundo aire, y tajo aéreo para aumentar el Hax.\\r\\nTambién se puede usar con Afortunado y Brillo mágico si se desea un movimiento de campo.\\r\\nOpté por timid como naturaleza por el hecho de que si usaba otra gastaba muchos evs en velocidad y perdía bulk	\N	2015-01-23 02:59:12	2015-07-08 18:14:00	6	0	3	3	0	6	0	49	1	VGC15
132	Medicham-Planti	308	84	132	252	\N	\N	40	704	11	37	182	8	409	428	Es un pokemon con un buena presencia ofensiva , haciendo un daño considerable a varios pokemon, y siendo el counter de Mega Kangaskhan,Landorus-T,Garchompy una serie de atacantes físicos sin ataques Super-efectivos a Medicham al no hacerñe OHKO....No es un pokemon que funcione solo , necesita un equipo que sepa cubrirlo y hacerlo funcionar de la manera mas apropiada 	\N	2015-01-23 03:17:40	2015-03-18 13:29:13	4	0	2	2	0	4	0	94	1	VGC15
133	Sarmi's Serperior	497	252	\N	252	\N	4	\N	683	2	126	243	406	202	437	Chaleco asalto potencia defensa esp. en un 50%, la repartición de EV's y la naturaleza potencias la salud y defensa, haciendo de superior bastante resistente, con lluevehojas duplica su ataque especial por su habilidad respondón y con manto espejo devolveremos el daño x 2 a pokes que nos quieran bajar con ataques tipo fuego y volador entre otros. gigadrenado para hacer gran daño y curarse a a vez. y pulso dragón para algo de cobertura (puede cambiarse manto espejo por HP fuego para bajar pokes como ferrothorn o HP roca para pokes fuego o volador) 	\N	2015-01-26 19:39:37	2015-03-18 13:31:06	3	-1	1	2	-1	3	0	63	1	VGC15
134	Anti todo	658	\N	252	\N	4	\N	252	247	10	168	441	67	58	182	Gracias a su gran velocidad Greninja logra outspeedear a casi todo el meta y darle OHKO a gran parte de los pokes populares de vgc15, se usa ice beam en lugar de ice punch para evitar ser intimidados y porque aun sin mucho EV logra dar OHKO.\\r\\nObviamente greninja no posee las mejores defensas por lo que tenemos que acompañarlo de un buen compañero que ayude a que permanezca mas tiempo en juego\\r\\n\\r\\nLow kick:\\r\\n252 Atk Life Orb Protean Greninja Low Kick (100 BP) vs. 4 HP / 0 Def Mega Kangaskhan: 179-213 (98.8 - 117.6%) -- 93.8% chance to OHKO\\r\\n252 Atk Life Orb Protean Greninja Low Kick (80 BP) vs. 4 HP / 0 Def Bisharp: 296-348 (209.9 - 246.8%) -- guaranteed OHKO\\r\\n252 Atk Life Orb Protean Greninja Low Kick (120 BP) vs. 252 HP / 0 Def Heatran: 205-244 (103.5 - 123.2%) -- guaranteed OHKO\\r\\n252 Atk Life Orb Protean Greninja Low Kick (120 BP) vs. 4 HP / 0 Def Terrakion: 237-281 (141.9 - 168.2%) -- guaranteed OHKO\\r\\n252 Atk Life Orb Protean Greninja Low Kick (120 BP) vs. 252 HP / 0 Def Mamoswine: 260-307 (119.8 - 141.4%) -- guaranteed OHKO\\r\\n252 Atk Life Orb Protean Greninja Low Kick (100 BP) vs. 252 HP / 0 Def Hydreigon: 198-234 (99.4 - 117.5%) -- 87.5% chance to OHKO\\r\\n\\r\\nGunk Shot:\\r\\n252 Atk Life Orb Protean Greninja Gunk Shot vs. 252 HP / 0 Def Sylveon: 307-361 (151.9 - 178.7%) -- guaranteed OHKO\\r\\n252 Atk Life Orb Protean Greninja Gunk Shot vs. 252 HP / 0 Def Ludicolo: 289-343 (154.5 - 183.4%) -- guaranteed OHKO\\r\\n252 Atk Life Orb Protean Greninja Gunk Shot vs. 252 HP / 0 Def Azumarill: 260-307 (125.6 - 148.3%) -- guaranteed OHKO\\r\\n\\r\\nIce beam:\\r\\n4 SpA Life Orb Protean Greninja Ice Beam vs. 252 HP / 0 SpD Mega Salamence: 302-359 (149.5 - 177.7%) -- guaranteed OHKO\\r\\n4 SpA Life Orb Protean Greninja Ice Beam vs. 252 HP / 0 SpD Assault Vest Landorus-T: 218-265 (111.2 - 135.2%) -- guaranteed OHKO\\r\\n4 SpA Life Orb Protean Greninja Ice Beam vs. 4 HP / 0 SpD Thundurus: 166-198 (107 - 127.7%) -- guaranteed OHKO	\N	2015-01-28 23:02:18	2015-03-18 23:28:13	4	-2	1	3	-2	4	0	5	1	VGC15
135	Firewall	59	252	\N	\N	252	\N	6	211	2	22	315	555	261	270	Un set defensivo para soporte. Arcanine es todo en uno:\\r\\n\\r\\nIntimida y aplica Will-o-wisp (Fuego Fatuo) para mermar a los atacantes físicos y usa Snarl (Alarido ) contra los atacantes especiales. Además aprovecha Helping Hand (Refuerzo) para apoyar a su compañero. Si baja el ataque oponente y ayuda subir al del compañero, ¿qué más se puede pedir? Además lleva Overheat (Sofoco) que siempre golpea duro a los rivales, aunque claro está, este set no está diseñado para atacar, sino para defender. Sin embargo, como todo poke, demos cuidarlo de algunas amenazas serias como el Scald (Escaldar) de Greninja o de Milotic con habilidad Competitive (Tenacidad).\\r\\n\\r\\nCálculos defensivos con el drop de intimidate:\\r\\n-1 252 Atk Life Orb Garchomp Earthquake vs. 252 HP / 0+ Def Arcanine: 120-143 (60.9 - 72.5%) -- guaranteed 2HKO\\r\\n-1 180+ Atk Huge Power Mega Mawile Sucker Punch vs. 252 HP / 0+ Def Arcanine: 60-71 (30.4 - 36%) -- 44.9% chance to 3HKO\\r\\n-1 252+ Atk Gyarados Waterfall vs. 252 HP / 0+ Def Arcanine: 108-128 (54.8 - 64.9%) -- guaranteed 2HKO\\r\\n-1 252+ Atk Mega Swampert Waterfall vs. 252 HP / 0+ Def Arcanine: 122-146 (61.9 - 74.1%) -- guaranteed 2HKO (sin lluvia)\\r\\n-1 252+ Atk Mega Swampert Waterfall vs. 252 HP / 0+ Def Arcanine in Rain: 186-218 (94.4 - 110.6%) -- 62.5% chance to OHKO (bajo la lluvia)\\r\\n252 SpA Vaporeon Scald vs. 252 HP / 0 SpD Arcanine: 150-176 (76.1 - 89.3%) -- guaranteed 2HKO\\r\\n60 SpA Rotom-W Hydro Pump vs. 252 HP / 0 SpD Arcanine: 168-198 (85.2 - 100.5%) -- 6.3% chance to OHKO\\r\\n112 SpA Suicune Scald vs. 252 HP / 0 SpD Arcanine: 114-134 (57.8 - 68%) -- guaranteed 2HKO\\r\\n\\r\\nCálculos ofensivos:\\r\\n252 SpA Arcanine Overheat vs. 252 HP / 36 SpD Mega Mawile: 186-222 (118.4 - 141.4%) -- guaranteed OHKO\\r\\n252 SpA Arcanine Overheat vs. 46 HP / 0 SpD Mega Sceptile: 106-126 (70.1 - 83.4%) -- guaranteed 2HKO\\r\\n252 SpA Arcanine Overheat vs. 252 HP / 0 SpD Thick Fat Mega Venusaur: 84-98 (44.9 - 52.4%) -- 18% chance to 2HKO\\r\\n\\r\\nOpciones:\\r\\nBajo el sol y para evitar el drop en ataque especial, puede usarse Heat Wave (Onda Ígnea). \\r\\nVarios items pueden usarse en este set sin afectar el rendimiento seriamente: \\r\\n- Rocky Helmet  (Casco Dentado) para dañar a los atacantes físicos.\\r\\n- Passho Berry (Baya Pasio) o Shuca Berry (Baya Acardo) para debilitar ataques tipo agua o tierra respectivamente.\\r\\n- White Herb (Hierba blanca) es una artimaña que podemos aplicar si queremos un segundo Overheat sin el drop en ataque especial.\\r\\n	\N	2015-02-10 22:23:23	2015-03-25 20:31:18	4	2	3	1	2	4	0	85	1	VGC15
136	PowerPom	424	4	252	\N	\N	\N	252	228	11	101	252	387	\N	\N	Un set tal vez simple pero poderoso de este makako, primero sorpresa golpeando bastante fuerte y flincheando lo que nos puede joder y rematando con la buena velocidad que aunque no es la maxima de el igual sirve para outspedear a muchos y casi todos caen con una ultima baza.	\N	2015-02-11 20:38:42	2015-11-26 16:17:44	6	4	5	1	4	6	0	100	1	VGC15
137	El Borracho	254	4	\N	\N	252	\N	252	745	5	65	219	197	437	406	Básicamente counter del clásico Thundurus (sin HP Ice), con Safeguard limita el uso de Swagger y con su habilidad detiene los ataques electricos. Con un poderoso STAB que mete miedo a Gastrodon y Rotom-W y Dragon Pulse que si bien no hace 1HKO a un par de dragones hace algo de daño. Por qué no Draco Meteor? Porque tener los únicos dos ataques de daño y que ambos te bajen -2 a SAtk es muy arriesgado. No gana 1vs1 contra los megas más usados y es presa de Talonflame; por lo cual es un mega situacional y controlador de amenazas específicas.	\N	2015-02-13 17:48:04	2015-03-18 18:54:05	2	0	1	1	0	2	0	81	1	VGC15
138	Nidoking mix 	34	\N	44	\N	252	\N	212	264	20	125	414	398	58	85	Este nidoking outspedea a mega sceptile timid y con ese atk puede darle OHKO a sylveon 252 hp 0 def, virizion, gardevoir y otros threads. Thunderbolt es un move filler que puede ser reemplazado por fire blast, flamethrower u otros atk-	\N	2015-03-05 04:58:38	2015-11-27 03:44:57	4	2	3	1	2	4	0	103	1	VGC15
139	Electri Kick	466	5	100	100	104	100	100	219	20	78	8	416	528	87	Mi primer Pokemon competitivo :3 \\r\\nOpinen constructiva mente que le quito/pongo :3	\N	2015-03-09 20:20:09	2015-11-26 16:16:12	11	-11	0	11	-11	11	0	104	1	VGC15
140	Hitmontop Support Ofensivo	237	252	136	60	\N	60	\N	135	11	22	252	370	469	364	Un set visto varias veces en Hitmontop,puede aguantar varias cosas tanto el lado físico (Por la intimidación) y por el especial, ya que su defensa especial es lo que más destaca.\\r\\n\\r\\nLa Baya Zidra se le puede cambiar por la Baya Ziuela.\\r\\n\\r\\nA Bocajarro por Stab y porque puede destrozar varias cosas (Aunque no le asegura al 100% el OHKO a Mega Kangha,aunque le deja bastante débil)\\r\\n\\r\\nVastaguardia por que este VGC esta lleno de Vozarrones,Ondas ígneas,Avalanchas,Terremotos,etc.También se le puede remplazar por Anticipo.\\r\\n\\r\\nAmago para romper protecciones y muchas cosas más,además que tiene prioridad.	\N	2015-03-18 06:50:31	2015-07-08 18:12:57	1	1	1	0	1	1	0	109	1	VGC15
141	Bluffing Lando	729	156	252	4	\N	4	92	245	11	22	89	157	276	182	Un gran problema que tiene Landorus therian, es que no es capaz por si solo de hacerle un OHKO a M-Kangaskhan, es por esto que se usa expert belt para asegurar este golpe\\r\\n\\r\\n252+ Atk Expert Belt Landorus-T Superpower vs. 4 HP / 0 Def Mega Kangaskhan: 197-233 (108.8 - 128.7%) -- guaranteed OHKO\\r\\n\\r\\nSe prefiere expert belt por sobre Life Orb ya que este ultimo revela inmediatamente el objeto que tenemos, por lo que al usar Expert Belt podemos hacer un bluff que tenemos Assault Vest y luego hacer protect cuando el oponente no se lo espere, o incluso si el equipo oponente es mas lento podemos bluffear una choice scarf, tiene la speed suficiente para ganarle en speed al bisharp adamant por un punto, y los EVs en hp y def le permiten aguantar siempre un +1 252+ Sucker Punch de Bisharp	\N	2015-03-18 12:54:25	2015-05-01 01:58:40	3	-1	1	2	-1	3	0	5	1	VGC15
142	Frozen B@%*	478	\N	\N	\N	25	\N	252	244	5	130	85	247	58	324		\N	2015-03-18 13:28:13	2015-07-08 18:12:44	2	2	2	0	2	2	0	110	1	VGC15
143	Ponkachu's Sylveon	700	148	\N	100	252	\N	8	176	3	182	237	304	473	182	Este Sylveon esta eveado para aguantar hasta un Iron Head de M-Mawile +252 Atk junto con la Berry para disminuir ataques tipo acero. Hidden Power Ground para combatir sus amenzas mas recurrentes que son los acero y veneno, en especial a Heatran que lo puede dejar muy tocado (min un 60 % del hp, pensando que el antes mencionado, posee 252 en hp sin la Shuca Berry), esta enfocado en rematar, debido a su incapacidad de darle OHKO a Pokemon que pertenecen al rango de los mas usados, comparada con su version Specs. Es necesario darlo Support de Tailwind o algún Speed Controller para hacer a Sylveon una gran amenaza. Pros: Incapacidad de darle OHKO con un ataque tipo Acero sin Boost. Factor Sorpresa. Versatilidad de movimientos y no estar estancado usando un ataque como su versión Specs. Contras: Incapacidad de Outspeedear a sus mayores amenzas sin un Speed Control. No da OHKO como su versión Specs. 	\N	2015-03-18 19:14:39	2015-03-20 19:16:50	1	1	1	0	1	1	0	111	1	VGC15
144	Heatranman	485	236	\N	148	44	12	70	211	3	18	436	164	414	182	Heatran cumplió uno de mis criterios de trabajo en equipo de tener un fuerte ataque de tipo Fuego. \\r\\n\\r\\nLa difusión EV fue diseñado para permitir Heatran para tomar un Combate Cuerpo a Cuerpo de Infernape y todavía tener suficiente HP para crear un sustituto. Esa cantidad de granel también permite Sustituto de Heatran tomar dos roca Diapositivas de una Adamant Landorus-T. 44 Sp. La inversión Ataque permite Heatran a 2HKO un Escudo-forme Aegislash con 252 HP / 4 Sp.Def, y los EVs restantes se vierten en velocidad.\\r\\n\\r\\nSin embargo, tuve que modificar la propagación EV en mi en el juego Heatran, ya que tenía 30 IVs en HP y 29 IVs en Sp.Def. La difusión fue el cambio para dar Heatran un número impar de su valor de HP para tener mejor Súper Colmillos y crear suplente.	\N	2015-03-28 01:08:07	2015-11-26 16:15:51	2	-2	0	2	-2	2	0	98	1	VGC15
145	Cybertron's Cresselia	488	220	\N	100	188	\N	\N	135	22	26	433	58	94	270	Permite aguantar el Knock Off de un Choice Band Bisharp, el Dark Pulse de Specs Hydreigon y la Shadow Ball de LO Aegislash\\r\\nLos Evs en Sp.Atk son para lograr un OHKO en un 0/0 Landorus-T con Ice Beam\\r\\nFuente: https://www.youtube.com/watch?v=nqWT-9IxHr4	\N	2015-04-03 17:51:01	2015-04-03 17:51:01	0	0	0	0	0	0	0	5	1	VGC15
146	Standard Bisharp	625	4	252	\N	\N	\N	252	247	11	128	389	182	282	442	El tipico Bisharp, algunas personas lo prefieren con Focus Sash pero esa versión pega considerablemente menos	\N	2015-04-03 17:53:49	2015-07-08 18:12:02	2	-2	0	2	-2	2	0	5	1	VGC15
147	14' Kanga	115	4	252	\N	\N	\N	252	714	16	113	252	216	389	612	El clásico kanga de la temporada 2014, aun es viable en este meta pero pega menos que la variable ofensiva, a cambio de poder boostearse con Power up Punch	\N	2015-04-03 17:57:32	2015-07-08 18:11:59	1	-1	0	1	-1	1	0	5	1	VGC15
148	Offensive Kanga	115	4	252	\N	\N	\N	252	714	11	113	252	38	389	67	Un Kanga mas ofensivo, permite darle OHKO a todo lo que esta EVeado para sobrevivir los ataques de los Double Edge Jolly Kanga o Returns de Adamant Kanga	\N	2015-04-03 17:59:27	2015-07-08 18:11:58	1	-1	0	1	-1	1	0	5	1	VGC15
149	gardevoir's lover 	59	252	\N	68	124	\N	60	135	2	22	555	261	234	257	junto con gardevoir.\\r\\nbajas el ataque oponente con intimidación\\r\\ny sus defensas especial con alarido\\r\\nfuego fatuo para parar atacantes fisicos 	\N	2015-04-06 01:33:02	2015-04-06 01:33:47	0	0	0	0	0	0	0	115	1	VGC15
150	Annoying tank	356	252	\N	128	\N	130	\N	581	12	46	611	261	220	101	Acoso/rayo confuso	\N	2015-04-06 01:59:17	2015-04-06 01:59:17	0	0	0	0	0	0	0	115	1	VGC15
151	The True LandoKiller 	461	4	252	\N	\N	\N	252	252	16	46	252	556	67	282	Weavile puede darle KO de forma natural a Landorus-T con un Intimidate encima, ademas puede avisarte por el orden de activación de habilidad (solo si salen al mismo tiempo al campo) si el Lando es Scarf. Tambien es un pokemon viable para la combi TerraCott cambiando Knock Off por Beat Up, que ademas puede darle KO a Gengar con esos 4 golpes. Low Kick para los mas arriesgados de usar este Glass Cannon puede dejar bastante mal a pokemon como Terrakion y Heatran, le da KO a Tyranitar y por su puesto a Bisharp.	\N	2015-04-22 02:11:40	2015-04-22 02:14:42	1	1	1	0	1	1	0	111	1	VGC15
152	Suicune el tanque	245	252	\N	136	92	\N	28	135	2	46	503	58	366	555	Posee el Special Attack justo para darle OHKO a un 4/0 Landorus-T\\r\\n\\r\\nPosee la velocidad necesaria para superar a un Rotom con max 12 Ev en velocidad (y poder usar Snarl para que sus ataques electricos hagan mucho menos daño), estando bajo Tailwind su velocidad le permite superar al tipico Landorus-T adamant scarfed y a max-speed Mega Sceptile\\r\\n\\r\\nEl resto de los EVs se le dieron en bulk fisico para aguantar mejor los ataques por ese lado, especificamente los Double Edge de Jolly Mega Kangaskhan serán 3HKO\\r\\n\\r\\n252 Atk Parental Bond Mega Kangaskhan Double-Edge vs. 252 HP / 136+ Def Suicune: 108-128 (52.1 - 61.8%) -- guaranteed 3HKO after Sitrus Berry recovery	\N	2015-05-13 04:24:57	2015-07-08 18:11:54	1	1	1	0	1	1	0	5	1	VGC15
212	Standard Porygon2	233	244	\N	92	28	140	\N	581	24	88	433	105	58	85	La inversión en Spatk le permite tener un 56.3% de darle OHKO a 4hp Garchomp con ice beam\\r\\nThunderbolt puede ser reemplazado con otras alternativas según lo que necesite el team, como Toxic, TriAttack o incluso Return para aprovechar el boost de Download	\N	2017-01-24 05:18:58	2017-01-24 05:18:58	0	0	0	0	0	0	0	5	1	VGC17
213	Standard Araquanid	766	252	252	\N	\N	4	\N	765	21	224	643	644	469	182		\N	2017-01-24 05:20:13	2017-01-24 05:20:13	0	0	0	0	0	0	0	5	1	VGC17
153	Support Milotic	350	236	\N	156	68	44	4	135	2	172	503	277	196	105	Milotic especialmente diseñado para ayudar en cualquier equipo, incluso es los Trick Room cambiando Viento Hielo por Rayo Hielo u otro movimiento, excelente muralla, suportter y pokémon ofensivo. Aguanta:\\r\\n\\r\\n252+ SpA Mold Breaker Mega Ampharos Thunderbolt vs. 236 HP / 44 SpD Support Milotic: 162-192 (81.4 – 96.4%) — guaranteed 2HKO after Sitrus Berry recovery\\r\\n\\r\\n252+ SpA Mega Sceptile Energy Ball vs. 236 HP / 44 SpD Support Milotic: 146-174 (73.3 – 87.4%) — guaranteed 2HKO after Sitrus Berry recovery.\\r\\n\\r\\n252 Atk Technician Breloom Bullet Seed (3 hits) vs. 236 HP / 156+ Def Support Milotic: 180-216 (90.4 – 108.5%) — guaranteed 2HKO after Sitrus Berry recovery\\r\\n\\r\\n252+ Atk Electivire Wild Charge vs. 236 HP / 156+ Def Support Milotic: 152-180 (76.3 – 90.4%) — guaranteed 2HKO after Sitrus Berry recovery.	\N	2015-05-20 02:32:15	2015-11-27 03:45:04	4	2	3	1	2	4	0	82	1	VGC15
154	Wolfey's Mega Gengar	94	252	\N	44	4	28	180	695	5	26	195	247	50	182	Gengar pensado para un equipo perish trapper, los EV de defensa le permite aguantar sin problemas un EQ de Lando-T intimidado, la velocidad es para superar a Mega Salamence	\N	2015-05-31 17:03:45	2015-07-01 20:37:16	1	1	1	0	1	1	0	5	1	VGC15
155	Kaze's Mega Manectric	310	92	\N	4	252	4	156	721	5	31	521	237	315	182	[HP ICE]	\N	2015-06-20 06:24:15	2015-11-27 03:45:08	4	4	4	0	4	4	0	11	2	VGC15
156	Jordi's TR Mega Tyranitar	248	252	100	148	\N	8	\N	708	21	45	242	182	157	89	Tyranitar especialmente pensado para ser usado en TR. Con los 100 EVs en Ataque iguala el Ataque máximo de Landorus-T(145 Base) Naturaleza Adamant/Firme, por lo cual aún podemos seguir pegando bien. Resiste 2 Mach Punch de Breelom, y la mayoría de los ataques lucha sin STAB. Tiene probabilidades de aguantar un Superpower/Fuerza Bruta de Landorus-T y amplias probabilidades de sobrevivir a un Play Rough/Carantoña de Mega Mawile Adamant/Firme con 252 evs. Avalancha/Rock Slide para pegar como bestia, Triturar/Crunch para Aegislash y Terremoto principalmente para cubrir cosas del meta, se recomienda también Ice Punch/Puño Hielo.	\N	2015-06-25 03:16:33	2015-11-26 01:58:36	5	3	4	1	3	5	0	82	1	VGC15
158	Support Vivillon♥	666	4	\N	\N	252	\N	252	252	5	132	522	182	366	79		\N	2015-06-25 03:25:01	2015-07-01 20:37:08	1	1	1	0	1	1	0	82	1	VGC15
159	Rain Kabutops	141	120	252	40	\N	4	92	134	11	33	127	182	453	157	Con los 92 EVs en Speed sobrepasa a Mega-Aerodactyl Jolly.	\N	2015-06-25 03:30:27	2015-07-13 04:56:04	2	2	2	0	2	2	0	82	1	VGC15
160	Weather Pro: Zapdos	145	252	\N	164	44	28	20	690	4	46	237	85	355	366	Poder Oculto puede ser remplazado por Onda Ígnea si no es un team lluvia, y si es team lluvia se recomienda cambiar rayo por trueno.	\N	2015-06-25 03:36:11	2015-11-27 03:45:50	3	1	2	1	1	3	0	82	1	VGC15
162	Anti 15' Medicham	308	92	156	4	\N	4	252	704	11	74	398	197	409	427	Una Mega perfecta para deshacerse de todas las cosas molestas del meta VGC 15', Puya Nociva tiene garantizado OHKO a Sylveon 252 HP/ 72 Def, Puño Drenaje asesina a Mega Kanga 252 HP/ 60 Def, y Psicocorte sirve para pegar con STAB y bastante fuerte, no le hace OHKO a Ammongus, pero tiene chance de pegar crítico, no falla y además evita el daño del Casco Dentado. Detección por sobre Protección en caso de que nuestro oponente ocupe el combo Imprison + Protect.	\N	2015-06-25 03:42:50	2015-11-27 03:44:07	5	3	4	1	3	5	0	82	1	VGC15
163	Cybertron's M-Venusaur	3	252	\N	124	76	52	4	698	2	34	202	188	73	182	Aguanta casi todo excepto ataques voladores como Talonflame y M-Salamence, este poke estaba en un team armado en torno a él, pueden ver el video analisis aqui: https://www.youtube.com/watch?v=1_rWXuBXLMQ	\N	2015-06-25 04:02:07	2015-07-13 04:55:56	2	0	1	1	0	2	0	5	1	VGC15
164	Life Orb Landorus	729	44	132	76	\N	\N	252	247	11	22	89	276	157	182	Landorus Life Orb que permite lograr el OHKO en practicamente todas las variantes de Kangaskhan. Inversión en HP y Defensa para vivir el Sucker Punch de Bisharp Adamant 252+ LO. Protect es principalmente para "salvar" del Fake Out al compañero, al pensar el oponente que se trata de un Landorus Choice Scarf.	\N	2015-06-29 01:29:26	2015-11-26 16:14:25	5	-1	2	3	-1	5	0	20	1	VGC15
165	Charizard Buddy	142	4	252	\N	\N	\N	252	252	16	127	157	366	469	241	Un buen compañero para CharizardY. La habilidad Unnerve evita que Rotom tome su Sitrus Berry, así como Suicune, Thundurus y similares. Tailwind para Speed Control, Wide Guard protege a Charizard y a si mismo de Rock Slide, así como de Hyper Voice de Sylveon/Salamence. Sunny Day solo si está acompañado de un Charizard. Este movimiento ayuda principalmente en la "guerra de climas", como en la situación de un Tyranitar Mega que vuelve a activar Sand Stream luego del Drought, Politoed Scarf con Rain Dance y etc. También ayuda a recuperar el sol luego de que Politoed entre denuevo a activar la lluvia tras haber sido cambiado, y Charizard ya mega evolucionado o de plano estar en el back.	\N	2015-06-29 01:40:18	2015-11-27 03:45:52	5	1	3	2	1	5	0	20	1	VGC15
166	Dunsparce sweeper 	206	4	252	252	\N	\N	\N	211	11	32	355	157	137	489		\N	2015-07-13 05:02:11	2015-07-13 05:04:14	1	1	1	0	1	1	0	118	1	VGC15
167	Maranga Milotic♥	350	236	\N	156	100	12	4	725	2	172	503	58	105	196		\N	2015-07-22 05:29:11	2015-11-27 03:45:55	3	1	2	1	1	3	0	82	1	VGC15
168	Life Orb Mixed Blaziken	257	\N	52	\N	204	\N	252	247	20	3	182	237	315	276	Anti-Meta Blaziken designed to beat Landorus-T, Kangaskhan, Aegislash, Amoonguss, Heatran, Salamence, Metagross.	\N	2015-08-13 06:10:18	2015-11-27 03:45:57	5	1	3	2	1	5	0	120	2	VGC15
169	Belly Jet	184	196	252	28	\N	20	12	135	11	37	182	187	453	583	Even HP divisible by 4 to get best use of sitrus berry. Play Rough can be replaced with Return if you prefer not to miss, but you do notice the power drop sometimes.	\N	2015-08-13 06:13:34	2015-11-27 03:43:35	3	1	2	1	1	3	0	120	2	VGC15
170	Trick Room Mega	282	252	\N	4	252	\N	\N	696	23	36	182	433	304	94	EV Spread here is basic, so can be adjusted as preferred. Modest is also useable as a semi-TR set. Works well alongside Scrafty, Heatran, Amoonguss.	\N	2015-08-13 06:17:22	2015-11-27 03:43:34	2	0	1	1	0	2	0	120	2	VGC15
171	gastry	423	252	\N	64	124	68	\N	211	23	114	503	414	58	105	Scald y earth power por STAB, Ice beam para cobertura y recover para durar mas en la batalla.\\r\\nOFENSIVO\\r\\n124+ SpA Gastrodon Ice Beam vs. 0 HP / 0 SpD Mega Salamence: 176-208 (103.5 - 122.3%) -- guaranteed OHKO \\r\\n124+ SpA Gastrodon Ice Beam vs. 252 HP / 0 SpD Landorus-T: 192-228 (97.9 - 116.3%) -- 93.8% chance to OHKO \\r\\n124+ SpA Gastrodon Earth Power vs. 252 HP / 252+ SpD Heatran: 168-204 (84.8 - 103%) -- 6.3% chance to OHKO\\r\\n124+ SpA Gastrodon Ice Beam vs. 252 HP / 0 SpD Thundurus: 96-114 (51.6 - 61.2%) -- guaranteed 2HKO \\r\\n124+ SpA Gastrodon Earth Power vs. 0 HP / 120 SpD Aegislash-Shield: 78-92 (57.7 - 68.1%) -- guaranteed 2HKO \\r\\n\\r\\nDEFENSIVO\\r\\n252 Atk Parental Bond Mega Kangaskhan Return vs. 252 HP / 64 Def Gastrodon: 159-189 (72.9 - 86.6%) -- guaranteed 2HKO\\r\\n252+ Atk Landorus-T Earthquake vs. 252 HP / 64 Def Gastrodon: 127-151 (58.2 - 69.2%) -- guaranteed 2HKO\\r\\n252+ SpA Choice Specs Pixilate Sylveon Hyper Voice vs. 252 HP / 68 SpD Gastrodon: 159-187 (72.9 - 85.7%) -- guaranteed 2HKO \\r\\n252+ SpA Aegislash-Blade Shadow Ball vs. 252 HP / 68 SpD Gastrodon: 91-108 (41.7 - 49.5%) -- guaranteed 3HKO\\r\\n252 SpA Aerilate Mega Salamence Hyper Voice vs. 252 HP / 68 SpD Gastrodon: 102-121 (46.7 - 55.5%) -- 71.9% chance to 2HKO\\r\\n252 SpA Mega Salamence Draco Meteor vs. 252 HP / 68 SpD Gastrodon: 114-135 (52.2 - 61.9%) -- guaranteed 2HKO \\r\\n252+ SpA Life Orb Ludicolo Giga Drain vs. 252 HP / 68 SpD Gastrodon: 312-374 (143.1 - 171.5%) -- guaranteed OHKO \\r\\n252+ SpA Mega Venusaur Giga Drain vs. 252 HP / 68 SpD Gastrodon: 292-348 (133.9 - 159.6%) -- guaranteed OHKO\\r\\n\\r\\nComo pueden ver Gastrodon es un pokemon que aguanta muy bien los golpes siendo solo débil al tipo planta (M-Venasaur y Ludicolo) pero teniendo dos inmunidades al tipo eléctrico y gracias a su habilidad al tipo agua, además de que da 0HKO a varias de las amenazas de del meta actual.	\N	2015-09-22 00:35:50	2015-11-27 03:43:19	2	0	1	1	0	2	0	124	1	VGC15
173	greninja support	658	4	\N	\N	252	\N	252	252	5	168	399	182	196	269	La forma más rápida en la que puede ser un greninja. Mofa para sorprender a thundurus o a otro pokemon bromista, protección para cubrirse de los ataques, viento hielo para funcionar como speed controler y pulso umbrío para atacar a cresselia y aegislash y por la potencia no se deberia preocupar porque la habilidad le da stab\\r\\nANOTACIONES:\\r\\n-Debilita de dos viento hielo a landorus standar\\r\\n-Debilita de dos pulsos umbrio a mega metagross standar\\r\\n-Debilita de tres pulsos umbrios a cresselia support o trick room\\r\\n-Debilita de dos viento hielo a mega salamence standar y garchomp standar.\\r\\n-Posibiidad de debilitar a mega gengar miedoso.\\r\\n\\r\\n	\N	2015-11-26 01:08:30	2015-11-26 16:12:15	2	0	1	1	0	2	0	127	1	VGC15
174	physical aegislash	681	252	36	120	\N	100	\N	682	21	176	14	442	425	588	Aegislash físico, (15 ivs speed), casi siempre se podra realizar un danza espada en la partida, siendo uno de los más lentos en el juego podra hacer un buen cover en el trick room. Los ivs en velocidad y la naturaleza los hacen más lentos que un conkeldurr con fiado con 29 ivs en speed, la arma perfecta contra sylveon, en trick room sera primero y atacara antes y si no lo hay, estara en su forma escudo para resistir un bola sombra, para luego activar el seguro debilidad y rematar de un golpe.\\r\\nPOSIBLES resistencias:\\r\\n- Llamarada de un goodra chaleco asalto 252 atq. esp. modesto.\\r\\n- Terremoto de un landorus scarf 252 atq firme.\\r\\n- Bola sombra de gengar banda focus 252 atq.esp miedoso\\r\\n-Pulso umbrío de greninja vidaesfera 252 atq.esp miedoso	\N	2015-11-26 01:18:30	2015-11-27 03:46:09	2	2	2	0	2	2	0	127	1	VGC15
175	the best dragon in the world!	706	124	\N	156	228	\N	\N	683	15	157	58	188	126	276	El mejor dragon que puede existir, la defesa especial se ve reducida por la habilidad pero aun asi es demasiado resistente con el chaleco asalto. Rayo hielo para los dragones mas comunes y para voladores, llamarada para scizor y ferrothorn. Bomba lodo para las hadas y solo por si acaso tipo planta (tambien se puede cambiar por cometa draco u otro movimiento de preferencia). Fuerza bruta para tyranitar , bisharp y kangas (habria que realizar tres de estos) tambien podria ser terremoto para los heatran.\\r\\nPOSIBLES resistencias :\\r\\n-Vozarron de sylveon specs 252 atq.esp modesto\\r\\n-Cometa draco de cualquier tipo dragon modesto 252 (sobretodo de hydreigon modesto con vidaesfera)\\r\\n-Garra dragon de garchomp 252 atq alegre\\r\\n-Retribucion de kangas 252 atq firme	\N	2015-11-26 01:32:01	2015-11-26 16:12:07	2	0	1	1	0	2	0	127	1	VGC15
176	bromas al bromista!	302	252	\N	40	92	124	\N	746	23	158	182	196	399	347	Engañamos a los bromistas para que nos hagan mofa y al megaevolucionar les rebota, viento hielo para el speed control, pulso umbrio por stab y paz mental para tener mejor atq esp y def esp. No hay que decir nada mas, resiste bastante a exepcion de los ataques tipo hada ahi si tener mucho cuidado\\r\\n	\N	2015-11-26 02:08:59	2015-11-26 16:12:01	2	2	2	0	2	2	0	127	1	VGC15
177	Kaze's Linoone VGC 15	264	116	252	4	\N	116	20	135	11	82	245	421	187	182	Evs en Hp para activar la Sitrus luego de usar Belly Drum\\r\\nLuego de Activar la Sitrus Berry:\\r\\n- Aguanta un Flash cannon de Aegislash (No Life Orb)\\r\\n- Probabilidades de aguantar Hyper Voice (Double Damage) de M-Gardevoir\\r\\n\\r\\nOutspedea a Bisharp, luego activar la Sitrus Berry, Knock off pega sin el bonus.\\r\\n- Mata landorus-T 4 hp estando -1 de atack (Una vez hecho Belly Drum y te tiren al Lando en un Switch)\\r\\n-Shadow Claw no solo ayuda contra fantasmas, sino prediciendo Quick Guards.\\r\\n-Shadow Claw a +6 garantiza el OHKO a un Aegislash 252 hp en Modo Escudo	\N	2015-11-26 16:51:00	2015-11-27 03:18:10	4	2	3	1	2	4	0	11	1	VGC15
178	Quash, king	395	156	80	188	\N	86	\N	683	11	128	263	157	127	211		\N	2015-11-27 03:19:38	2016-02-29 03:55:49	3	-1	1	2	-1	3	0	128	1	VGC15
179	Solarzard	6	108	\N	60	164	4	172	717	3	94	182	315	76	257	No hay mucha velocidad por parte de este charizard pero con un viento afin supera a m-manectric miedoso.Sofoco acaba con kangas, thundurus, lando y de 2 a cresselia. Rayo solar para cobertura y onda ignea para atacar a los dos objetivos en la partida.\\r\\nANOTACIONES:\\r\\n-Posibilidad de aguantar el retribucion de kangas firme 252 atq\\r\\n-Aguanta el rayo de thundurus bulky y life orb\\r\\n- Posibilidad de aguantar el rayo de m-manectric modesto 252 atq esp\\r\\n-Si no resiste el avalancha de garchomp y/o landorus standar se pueden modificar los evs de la siguiente manera: ps 172/def 92/atq esp 88/vel 156.\\r\\nEsta reparticion bajara la potencia y la velocidad, pero mejorara su bulk y lo hara resistente	\N	2015-11-27 04:09:47	2016-02-29 03:55:46	2	0	1	1	0	2	0	127	1	VGC15
202	Standard Tapu Koko	799	4	\N	\N	252	\N	252	247	5	196	85	605	435	182	El set standard en el early meta, full speed le permite empatar en velocidad con aerodactyl	\N	2016-12-19 20:01:10	2016-12-19 20:01:10	0	0	0	0	0	0	0	5	1	VGC17
203	Standard Garchomp	445	4	252	\N	\N	\N	252	771	16	24	89	337	398	182	A diferencia de Earthquake que golpea con 75 base power a cada oponente, el movimiento Z de Earthquake le permite golpear a un solo enemigo con potencia de 180 base por lo que es muy util para ciertos casos, además de que su potencia no se ve disminiuda por grassy terrain	\N	2016-12-19 20:03:23	2016-12-19 20:03:23	0	0	0	0	0	0	0	5	1	VGC17
205	El cacheton	826	252	\N	28	4	4	220	723	5	169	555	492	182	252	Supera por 1 en velocidad a los base 110.\\r\\nPuede llevar Ida y vuelta/U-Turn, por protect.\\r\\nBlack Glasses/Gafas De sol, es un buen item, ademas de la baya.\\r\\nAun no esta disponible parting shot/ultima palabra, pero es un buen movimiento para usarlo, en vez de protect.	\N	2016-12-21 17:07:58	2016-12-21 17:54:17	1	1	1	0	1	1	0	32	1	VGC17
207	Standard Lillie	807	4	\N	\N	252	\N	252	247	5	189	188	408	237	182	Nihilego estandar con moves clásicos,bastante anti.meta. (HP Ice)	\N	2016-12-21 20:13:47	2016-12-21 20:13:47	0	0	0	0	0	0	0	20	1	VGC17
208	Standard Sash Kartana	812	4	252	\N	\N	\N	252	252	16	189	658	348	533	182		\N	2017-01-07 00:50:25	2017-01-07 00:50:25	0	0	0	0	0	0	0	5	2	VGC17
209	Kom's Mimikyu	792	4	252	\N	\N	\N	252	776	16	195	421	433	269	583	La idea es usarlo en un team Trick Room puro y usarlo cuando el oponente tiene a Tapu Lele ya que complica poder usar la combinación fakeout + TR en el lead hariyama porygon2, Z-Shadow Claw le da OHKO a Tapu Lele\\r\\nLa speed le permite ser siempre mas rapido que los Lele no-scarf	\N	2017-01-24 05:10:43	2017-01-24 05:10:43	0	0	0	0	0	0	0	5	1	VGC17
210	Kom's Drampa	794	244	\N	12	252	\N	\N	247	23	13	434	126	412	182	Sweeper para Trick Room, su habilidad le permite servir de anti clima y sus ataques le dan cobertura para atacar a gastrodon y celesteela	\N	2017-01-24 05:12:43	2017-01-24 05:12:43	0	0	0	0	0	0	0	5	1	VGC17
211	Kom's Hariyama	297	92	252	164	\N	\N	\N	250	21	62	252	364	370	282	Su gracia es acompañarlo de un Trick Room setter, para poder hacer Fake Out a la amenaza mas grande y settear el Trick Room tranquilo\\r\\nFeint puede ser reemplazado por Wide Guard, Heavy Slam o Poison Jab dependiendo del team	\N	2017-01-24 05:14:44	2017-01-24 05:14:44	0	0	0	0	0	0	0	5	1	VGC17
214	Band Arcanine	59	4	252	\N	\N	\N	252	197	11	22	394	528	245	370		\N	2017-01-24 05:21:07	2017-01-24 05:21:07	0	0	0	0	0	0	0	5	1	VGC17
218	Standard Curselax	143	252	252	4	\N	\N	\N	136	21	82	216	638	174	182	Cuando se usa min speed, Curse le permite ser mas lento que Torkoal y ganarle en velocidad bajo un Trick Room, High Horsepower es un ataque de mucha cobertura que permite atacar super efectivo a pokes tales como Tapu Koko, Nihilego, Marowak, Arcanine y Torkoal	\N	2017-01-24 05:32:34	2017-01-24 05:32:34	0	0	0	0	0	0	0	5	1	VGC17
219	Standard Pelipper	279	4	\N	\N	252	\N	252	252	3	2	503	542	366	182	Se acompaña principalmente de Golduck para darle la lluvia que necesita para activar Swift Swim	\N	2017-01-24 05:33:55	2017-01-24 05:33:55	0	0	0	0	0	0	0	5	1	VGC17
220	Special Pheromosa	809	4	\N	\N	252	\N	252	769	3	189	405	411	58	182	Z-Focus Blast le permite eliminar a Porygon2 sin miedo a fallar, ya que el crystal z ocupa el slot de item no vale la pena invertir en bulk por lo fragil que es	\N	2017-01-24 05:38:02	2017-01-24 05:38:02	0	0	0	0	0	0	0	5	1	VGC17
221	Sekiam's Gastrodon	423	252	\N	48	76	132	\N	725	22	114	503	58	92	105		\N	2017-01-24 05:39:52	2017-01-24 05:39:52	0	0	0	0	0	0	0	5	1	VGC17
222	Sekiam's Gigalith	526	188	148	\N	\N	172	\N	775	11	45	157	469	484	182	El EV spread permite el 88% de las veces aguantar dos thunderbolt de Tapu Koko Life Orb en su terreno y bajo arena	\N	2017-01-24 05:42:27	2017-01-24 05:42:27	0	0	0	0	0	0	0	5	1	VGC17
223	Sekiam' Celesteela	811	252	4	92	\N	116	44	211	14	189	484	182	73	164		\N	2017-01-24 05:44:05	2017-01-24 05:44:05	0	0	0	0	0	0	0	5	1	VGC17
224	Standard Vanilluxe	584	76	\N	\N	252	\N	180	264	5	117	59	573	329	58	Speed justa para pasar a Tapu Koko y Aerodactyl por un punto	\N	2017-01-24 05:47:01	2017-01-24 05:47:26	0	0	0	0	0	0	0	5	1	VGC17
225	Standard Torkoal	324	252	\N	\N	252	4	\N	226	23	70	284	76	53	182	Debe ser acompañado siempre por un Lilligant que pueda hacer After You para que ataque primero, o usarlo bajo Trick Room	\N	2017-01-24 05:49:31	2017-01-24 05:49:31	0	0	0	0	0	0	0	5	1	VGC17
226	Special Salamence	373	4	\N	\N	252	\N	252	777	5	22	434	53	164	182	Z-Draco Meteor le permite atacar muy fuerte una vez sin tener que bajarse el Spatk	\N	2017-01-24 05:51:18	2017-01-24 05:51:18	0	0	0	0	0	0	0	5	1	VGC17
227	SHADEviera's Lele	800	236	\N	212	36	4	20	274	3	209	605	94	585	85	252 SpA Nihilego Sludge Bomb vs. 236 HP / 4 SpD Tapu Lele: 134-162 (76.5 - 92.5%) -- guaranteed 2HKO\\r\\n\\r\\n252+ SpA Nihilego Sludge Bomb vs. 236 HP / 4 SpD Tapu Lele: 150-176 (85.7 - 100.5%) -- 6.3% chance to OHKO	\N	2017-03-02 20:11:49	2017-03-02 20:11:49	0	0	0	0	0	0	0	154	2	VGC17
228	surp Tork	324	116	\N	\N	252	140	\N	767	23	70	182	76	315	257	252+ Atk Gyarados Waterfall vs. 116 HP / 0 Def Torkoal in Sun: 54-66 (33.7 - 41.2%) -- guaranteed 3HKO\\r\\n252+ SpA Torkoal Bloom Doom (190 BP) vs. 252 HP / 44 SpD Tapu Fini: 138-164 (77.9 - 92.6%) -- guaranteed 2HKO\\r\\n252+ SpA Torkoal Overheat vs. 180 HP / 148+ SpD Celesteela in Sun: 216-254 (110.7 - 130.2%) -- guaranteed OHKO	\N	2017-03-02 20:24:40	2017-03-02 20:25:52	0	0	0	0	0	0	0	154	2	VGC17
229	Bewear	774	4	252	\N	\N	252	\N	683	11	198	359	38	8	9	252+ Atk Bewear Hammer Arm vs. 244 HP / 92 Def Eviolite Porygon2: 120-144 (62.8 - 75.3%) -- guaranteed 2HKO\\nbefore trick room outspeed porygon2 and after hammer arm in trick room outspeed porygon2\\n252+ Atk Bewear Ice Punch vs. 28 HP / 4 Def Garchomp: 192-228 (102.6 - 121.9%) -- guaranteed OHKO\\n252+ Atk Bewear Ice Punch vs. 188 HP / 4 Def Garchomp: 192-228 (92.7 - 110.1%) -- 56.3% chance to OHKO (SHADEviera's chomp)	\N	2017-03-02 20:48:38	2017-03-02 20:48:38	0	0	0	0	0	0	0	154	2	VGC17
230	SHADEviera's blim	426	4	\N	132	204	4	164	803	5	84	261	366	240	247		\N	2017-03-02 21:05:50	2017-03-02 21:05:50	0	0	0	0	0	0	0	154	2	VGC17
231	James' blim	426	12	4	252	\N	164	76	804	16	84	50	366	207	512		\N	2017-03-02 21:08:13	2017-03-02 21:08:13	0	0	0	0	0	0	0	154	2	VGC17
232	Articz's Cancer Wea	327	252	252	\N	\N	4	\N	683	21	126	252	276	216	8	+6 252+ Atk Spinda Return vs. 4 HP / 0 Def Primal Groudon: 157-186 (89.2 - 105.6%) -- 31.3% chance to OHKO\\r\\n\\r\\n;)\\r\\n	\N	2017-04-02 23:19:58	2017-04-02 23:21:46	0	0	0	0	0	0	0	145	1	VGC17
233	CB's Pheromosa	809	\N	236	36	\N	\N	236	247	17	189	136	398	58	182	236 Speed es un punto mas rápido que Tapu Koko Timid, con 2 Puntos menos de Ataque los calculos no cambian mucho.\\r\\n\\r\\n252+ Atk Choice Band Arcanine Extreme Speed vs. 0 HP / 36 Def Pheromosa: 130-153 (89 - 104.7%) -- 31.3% chance to OHKO\\r\\n	\N	2017-04-10 20:14:32	2017-04-10 20:14:32	0	0	0	0	0	0	0	20	1	VGC17
\.


--
-- Name: pokemonsets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cano
--

SELECT pg_catalog.setval('pokemonsets_id_seq', 1, false);


--
-- Data for Name: recursos; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY recursos (id, team_id, url, created_at, updated_at, descripcion) FROM stdin;
1	2	https://www.facebook.com/FRIKITR/posts/610634979120340	2016-12-15 03:36:50	2016-12-15 03:36:50	Mini reporte
2	10	https://ub09blog.wordpress.com/2016/12/12/el-toro-pandillero-ha-llegado/	2016-12-15 04:12:33	2016-12-15 04:12:33	Reporte
3	9	https://www.youtube.com/watch?v=WiEL33aQfjk	2016-12-15 04:15:23	2016-12-15 04:15:23	Video de la final
4	10	https://www.youtube.com/watch?v=WiEL33aQfjk	2016-12-15 04:15:36	2016-12-15 04:15:36	Video de la final
\.


--
-- Name: recursos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cano
--

SELECT pg_catalog.setval('recursos_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY schema_migrations (version) FROM stdin;
20141016233555
20141021163619
20141021185543
20141030044728
20141101015723
20141107212618
20141107213207
20141108182105
20141216205627
20161213192032
20161213194840
20161214005502
20161214011135
20161214032457
20161214055243
20161214162238
20161214162245
20161214233556
20161219193134
20161221023626
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY teams (id, player_id, pokemon1_id, pokemon2_id, pokemon3_id, pokemon4_id, pokemon5_id, pokemon6_id, created_at, updated_at, "desc") FROM stdin;
1	2	801	462	186	373	233	831	2016-12-15 03:35:32	2016-12-15 03:35:32	\N
2	3	800	807	235	128	791	764	2016-12-15 03:35:32	2016-12-15 03:35:32	\N
3	1	799	811	445	59	423	94	2016-12-15 03:35:32	2016-12-15 03:35:32	\N
4	4	799	811	445	800	833	233	2016-12-15 03:35:32	2016-12-15 03:35:32	\N
5	5	799	807	822	820	130	833	2016-12-15 03:35:32	2016-12-15 03:35:32	\N
6	6	801	800	279	373	831	55	2016-12-15 03:35:32	2016-12-15 03:35:32	\N
7	7	799	811	445	186	200	737	2016-12-15 03:35:32	2016-12-15 03:35:32	\N
8	8	800	811	350	130	833	737	2016-12-15 03:35:32	2016-12-15 03:35:32	\N
9	9	801	373	831	186	462	233	2016-12-15 03:50:21	2016-12-15 03:50:21	\N
10	16	801	802	807	826	833	133	2016-12-15 03:50:21	2016-12-15 03:50:21	\N
11	10	799	800	833	233	130	445	2016-12-15 03:50:21	2016-12-15 03:50:21	\N
12	11	799	811	810	445	130	94	2016-12-15 03:50:21	2016-12-15 03:50:21	\N
13	12	810	324	779	794	549	787	2016-12-15 03:50:21	2016-12-15 03:50:21	\N
14	13	799	807	811	445	833	130	2016-12-15 03:50:21	2016-12-15 03:50:21	\N
15	14	799	233	94	373	565	526	2016-12-15 03:50:21	2016-12-15 03:50:21	\N
16	15	799	811	833	553	186	766	2016-12-15 03:50:21	2016-12-15 03:50:21	\N
17	23	799	811	791	737	186	553	2016-12-15 04:26:00	2016-12-15 04:26:00	\N
18	17	810	807	324	779	553	279	2016-12-15 04:26:00	2016-12-15 04:26:00	\N
19	18	807	800	833	130	233	445	2016-12-15 04:26:00	2016-12-15 04:26:00	\N
20	19	811	799	800	833	130	445	2016-12-15 04:26:00	2016-12-15 04:26:00	\N
21	14	799	800	330	130	376	526	2016-12-15 04:26:00	2016-12-15 04:26:00	\N
22	20	810	799	801	833	130	445	2016-12-15 04:26:00	2016-12-15 04:26:00	\N
23	21	800	809	94	826	130	169	2016-12-15 04:26:00	2016-12-15 04:26:00	\N
24	22	807	811	833	822	478	350	2016-12-15 04:26:00	2016-12-15 04:26:00	\N
25	1	844	534	729	350	591	723	2016-12-15 16:04:41	2016-12-15 16:04:41	\N
26	17	844	560	576	598	186	609	2016-12-15 16:04:41	2016-12-15 16:04:41	\N
27	27	871	560	681	35	464	488	2016-12-15 16:04:41	2016-12-15 16:04:41	\N
28	23	837	26	729	560	350	681	2016-12-15 16:04:41	2016-12-15 16:04:41	\N
29	26	844	859	145	485	729	591	2016-12-15 16:04:41	2016-12-15 16:04:41	\N
30	24	844	687	700	723	729	591	2016-12-15 16:04:41	2016-12-15 16:04:41	\N
31	28	864	286	663	245	729	700	2016-12-15 16:04:41	2016-12-15 16:04:41	\N
32	25	844	871	235	445	722	663	2016-12-15 16:04:41	2016-12-15 16:04:41	\N
33	35	716	876	844	663	729	591	2016-12-15 16:44:21	2016-12-15 16:44:21	\N
34	29	876	875	844	169	488	591	2016-12-15 16:44:21	2016-12-15 16:44:21	\N
35	30	876	875	844	641	488	591	2016-12-15 16:44:21	2016-12-15 16:44:21	\N
36	31	716	876	844	235	169	598	2016-12-15 16:44:21	2016-12-15 16:44:21	\N
37	16	876	483	844	663	678	235	2016-12-15 16:44:21	2016-12-15 16:44:21	\N
38	32	876	875	861	169	272	421	2016-12-15 16:44:21	2016-12-15 16:44:21	\N
39	33	716	876	844	871	235	663	2016-12-15 16:44:21	2016-12-15 16:44:21	\N
40	34	716	876	871	235	488	591	2016-12-15 16:44:21	2016-12-15 16:44:21	\N
41	9	716	876	844	871	488	663	2016-12-15 20:06:21	2016-12-15 20:06:21	\N
42	28	716	876	844	871	346	169	2016-12-15 20:06:21	2016-12-15 20:06:21	\N
43	29	730	876	864	437	663	235	2016-12-15 20:06:21	2016-12-15 20:06:21	\N
44	26	483	875	861	723	642	711	2016-12-15 20:06:21	2016-12-15 20:06:21	\N
45	14	876	875	843	867	212	145	2016-12-15 20:06:21	2016-12-15 20:06:21	\N
46	35	716	876	844	871	663	235	2016-12-15 20:06:21	2016-12-15 20:06:21	\N
47	36	716	483	844	488	663	235	2016-12-15 20:06:21	2016-12-15 20:06:21	\N
48	37	716	877	872	380	537	593	2016-12-15 20:06:21	2016-12-15 20:06:21	\N
49	25	716	876	844	510	663	235	2016-12-16 00:35:22	2016-12-16 00:35:22	\N
50	37	875	877	844	872	652	380	2016-12-16 00:35:22	2016-12-16 00:35:22	\N
51	23	716	876	373	26	591	663	2016-12-16 00:35:22	2016-12-16 00:35:22	\N
52	12	716	875	871	235	598	663	2016-12-16 00:35:23	2016-12-16 00:35:23	\N
53	1	876	875	844	235	437	576	2016-12-16 00:35:23	2016-12-16 00:35:23	\N
54	22	716	875	844	729	235	683	2016-12-16 00:35:23	2016-12-16 00:35:23	\N
55	24	716	876	844	871	663	235	2016-12-16 00:35:23	2016-12-16 00:35:23	\N
56	38	877	875	844	235	547	169	2016-12-16 00:35:23	2016-12-16 00:35:23	\N
57	26	877	875	861	169	591	145	2016-12-16 01:34:03	2016-12-16 01:34:03	\N
58	39	876	885	871	663	598	461	2016-12-16 01:34:03	2016-12-16 01:34:03	\N
59	3	876	716	871	844	663	488	2016-12-16 01:34:03	2016-12-16 01:34:03	\N
60	20	382	717	871	488	598	145	2016-12-16 01:34:03	2016-12-16 01:34:03	\N
61	40	876	885	844	189	729	437	2016-12-16 01:34:03	2016-12-16 01:34:03	\N
62	10	876	875	861	678	169	132	2016-12-16 01:34:03	2016-12-16 01:34:03	\N
63	31	876	877	235	488	169	461	2016-12-16 01:34:03	2016-12-16 01:34:03	\N
64	41	876	716	844	871	510	169	2016-12-16 01:34:03	2016-12-16 01:34:03	\N
65	42	875	877	844	663	729	707	2016-12-16 01:50:23	2016-12-16 01:50:23	\N
66	16	876	875	844	598	642	436	2016-12-16 01:50:23	2016-12-16 01:50:23	\N
67	14	876	716	844	871	591	886	2016-12-16 01:50:23	2016-12-16 01:50:23	\N
68	2	876	716	871	663	488	235	2016-12-16 01:50:23	2016-12-16 01:50:23	\N
69	43	876	730	843	860	871	547	2016-12-16 01:50:23	2016-12-16 01:50:23	\N
70	22	875	716	844	169	463	302	2016-12-16 01:50:23	2016-12-16 01:50:23	\N
71	26	876	877	461	488	235	700	2016-12-16 01:50:23	2016-12-16 01:50:23	\N
72	44	875	877	26	598	729	169	2016-12-16 01:50:23	2016-12-16 01:50:23	\N
73	3	876	717	871	474	488	510	2016-12-16 01:56:13	2016-12-16 01:56:13	\N
74	39	876	885	871	461	598	642	2016-12-16 01:56:13	2016-12-16 01:56:13	\N
75	25	876	716	844	510	235	663	2016-12-16 01:56:13	2016-12-16 01:56:13	\N
76	17	876	716	843	235	729	169	2016-12-16 01:56:13	2016-12-16 01:56:13	\N
77	45	877	382	461	235	663	642	2016-12-16 01:56:13	2016-12-16 01:56:13	\N
78	40	876	885	844	729	189	437	2016-12-16 01:56:13	2016-12-16 01:56:13	\N
79	46	483	877	861	729	423	169	2016-12-16 01:56:14	2016-12-16 01:56:14	\N
80	4	876	716	844	729	663	235	2016-12-16 01:56:14	2016-12-16 01:56:14	\N
81	14	799	808	831	423	822	820	2016-12-19 20:54:51	2016-12-19 20:54:51	\N
82	16	801	807	809	445	833	791	2016-12-19 20:54:51	2016-12-19 20:54:51	\N
83	48	799	800	812	445	833	130	2016-12-19 20:54:51	2016-12-19 20:54:51	\N
84	1	799	811	445	59	423	94	2016-12-19 20:54:51	2016-12-19 20:54:51	\N
85	47	799	812	445	279	833	628	2016-12-19 20:54:51	2016-12-19 20:54:51	\N
86	28	800	807	324	549	59	373	2016-12-19 20:54:51	2016-12-19 20:54:51	\N
87	21	800	818	376	279	55	143	2016-12-19 20:54:51	2016-12-19 20:54:51	\N
88	49	801	831	445	279	55	462	2016-12-19 20:54:51	2016-12-19 20:54:51	\N
89	56	801	59	445	279	55	791	2016-12-20 06:57:05	2016-12-20 06:57:05	\N
90	57	801	59	376	423	186	233	2016-12-20 06:57:05	2016-12-20 06:57:05	\N
91	58	801	811	833	831	553	350	2016-12-20 06:57:05	2016-12-20 06:57:05	\N
92	59	800	807	474	235	212	764	2016-12-20 06:57:05	2016-12-20 06:57:05	\N
93	60	801	324	831	779	373	423	2016-12-20 07:00:18	2016-12-20 07:00:18	\N
94	61	800	324	764	779	130	747	2016-12-20 07:00:18	2016-12-20 07:00:18	\N
95	56	801	462	59	445	186	55	2016-12-20 07:00:18	2016-12-20 07:00:18	\N
96	62	801	799	59	445	186	233	2016-12-20 07:00:18	2016-12-20 07:00:18	\N
97	63	800	801	324	779	445	812	2016-12-20 07:02:46	2016-12-20 07:02:46	\N
98	60	800	831	373	822	423	812	2016-12-20 07:02:46	2016-12-20 07:02:46	\N
99	65	802	734	791	59	143	567	2016-12-20 07:02:46	2016-12-20 07:02:46	\N
100	64	801	831	186	55	445	233	2016-12-20 07:02:46	2016-12-20 07:02:46	\N
101	67	801	791	59	445	279	55	2016-12-20 07:07:17	2016-12-20 07:07:17	\N
102	66	801	799	59	445	423	812	2016-12-20 07:07:17	2016-12-20 07:07:17	\N
103	68	811	799	59	445	833	233	2016-12-20 07:07:17	2016-12-20 07:07:17	\N
104	69	801	799	130	779	833	760	2016-12-20 07:07:17	2016-12-20 07:07:17	\N
105	83	799	59	423	526	812	800	2016-12-20 13:51:25	2016-12-20 13:51:25	\N
106	74	822	350	833	809	233	801	2016-12-20 13:51:25	2016-12-20 13:51:25	\N
107	79	822	130	833	462	809	800	2016-12-20 13:51:25	2016-12-20 13:51:25	\N
108	87	799	130	833	233	826	811	2016-12-20 13:51:25	2016-12-20 13:51:25	\N
109	86	445	130	833	807	826	801	2016-12-20 13:51:25	2016-12-20 13:51:25	\N
110	88	799	822	423	233	812	59	2016-12-20 13:51:25	2016-12-20 13:51:25	\N
111	89	799	59	445	526	764	818	2016-12-20 13:51:25	2016-12-20 13:51:25	\N
112	72	373	186	831	233	462	801	2016-12-20 13:51:25	2016-12-20 13:51:25	\N
113	81	799	801	59	233	526	831	2016-12-20 14:20:42	2016-12-20 14:20:42	\N
114	76	799	423	445	811	809	833	2016-12-20 14:20:42	2016-12-20 14:20:42	\N
115	82	801	423	59	233	526	831	2016-12-20 14:20:42	2016-12-20 14:20:42	\N
116	78	799	376	445	373	779	324	2016-12-20 14:20:42	2016-12-20 14:20:42	\N
117	83	801	279	55	462	233	373	2016-12-20 14:20:42	2016-12-20 14:20:42	\N
118	84	799	279	55	445	376	546	2016-12-20 14:20:42	2016-12-20 14:20:42	\N
119	85	799	801	811	445	130	833	2016-12-20 14:20:42	2016-12-20 14:20:42	\N
120	86	801	807	826	130	445	833	2016-12-20 14:20:42	2016-12-20 14:20:42	\N
121	73	799	801	279	55	143	445	2016-12-20 14:40:12	2016-12-20 14:40:12	\N
122	74	800	350	833	811	59	233	2016-12-20 14:40:12	2016-12-20 14:40:12	\N
123	80	800	772	766	142	779	812	2016-12-20 14:40:12	2016-12-20 14:40:12	\N
124	76	799	808	833	811	130	445	2016-12-20 14:40:12	2016-12-20 14:40:12	\N
125	77	799	826	833	811	130	233	2016-12-20 14:40:12	2016-12-20 14:40:12	\N
126	72	799	801	279	376	59	553	2016-12-20 14:40:12	2016-12-20 14:40:12	\N
127	78	799	549	324	376	779	373	2016-12-20 14:40:12	2016-12-20 14:40:12	\N
128	79	800	809	833	82	130	553	2016-12-20 14:40:12	2016-12-20 14:40:12	\N
129	57	876	716	871	642	235	663	2016-12-20 17:04:50	2016-12-20 17:04:50	\N
130	90	875	716	844	678	142	598	2016-12-20 17:04:50	2016-12-20 17:04:50	\N
131	60	876	875	871	663	598	26	2016-12-20 17:04:50	2016-12-20 17:04:50	\N
132	63	876	875	844	642	485	488	2016-12-20 17:04:50	2016-12-20 17:04:50	\N
133	68	875	716	844	235	663	488	2016-12-20 17:04:50	2016-12-20 17:04:50	\N
134	69	876	716	871	844	547	35	2016-12-20 17:04:50	2016-12-20 17:04:50	\N
135	91	876	875	844	729	488	547	2016-12-20 17:04:50	2016-12-20 17:04:50	\N
136	66	876	716	871	861	169	678	2016-12-20 17:04:50	2016-12-20 17:04:50	\N
137	92	876	484	844	598	488	729	2016-12-20 17:29:19	2016-12-20 17:29:19	\N
138	69	876	716	844	235	663	35	2016-12-20 17:29:19	2016-12-20 17:29:19	\N
139	66	876	716	871	678	94	169	2016-12-20 17:29:19	2016-12-20 17:29:19	\N
140	60	876	875	871	26	663	598	2016-12-20 17:29:19	2016-12-20 17:29:19	\N
141	61	876	716	871	547	591	658	2016-12-20 17:29:19	2016-12-20 17:29:19	\N
142	93	876	875	871	642	212	235	2016-12-20 17:29:19	2016-12-20 17:29:19	\N
143	70	875	716	871	598	663	235	2016-12-20 17:29:19	2016-12-20 17:29:19	\N
144	94	876	716	844	598	663	488	2016-12-20 17:29:19	2016-12-20 17:29:19	\N
145	72	861	877	875	461	169	591	2016-12-20 17:56:33	2016-12-20 17:56:33	\N
146	95	844	876	716	663	488	598	2016-12-20 17:56:33	2016-12-20 17:56:33	\N
147	78	871	876	382	642	488	94	2016-12-20 17:56:33	2016-12-20 17:56:33	\N
148	84	844	876	717	642	598	547	2016-12-20 17:56:33	2016-12-20 17:56:33	\N
149	96	844	875	716	510	598	437	2016-12-20 17:56:33	2016-12-20 17:56:33	\N
150	82	871	875	717	26	94	591	2016-12-20 17:56:33	2016-12-20 17:56:33	\N
151	83	871	876	875	26	437	235	2016-12-20 17:56:33	2016-12-20 17:56:33	\N
152	73	844	871	876	875	642	488	2016-12-20 17:56:33	2016-12-20 17:56:33	\N
153	81	844	383	717	663	26	189	2016-12-20 18:23:15	2016-12-20 18:23:15	\N
154	73	844	871	876	716	642	189	2016-12-20 18:23:15	2016-12-20 18:23:15	\N
155	78	871	876	875	642	488	94	2016-12-20 18:23:15	2016-12-20 18:23:15	\N
156	77	871	875	716	488	461	598	2016-12-20 18:23:15	2016-12-20 18:23:15	\N
157	97	871	876	875	145	94	598	2016-12-20 18:23:15	2016-12-20 18:23:15	\N
158	98	844	864	876	730	547	302	2016-12-20 18:23:15	2016-12-20 18:23:15	\N
159	99	871	875	717	461	598	547	2016-12-20 18:23:15	2016-12-20 18:23:15	\N
160	100	844	871	876	716	235	35	2016-12-20 18:23:15	2016-12-20 18:23:15	\N
161	101	740	812	800	831	833	663	2016-12-21 03:18:32	2016-12-21 03:18:32	1er lugar 2016 European International Championships - Juniors
162	102	800	807	811	59	233	423	2016-12-21 03:22:11	2016-12-21 03:22:11	Top8 2016 European International Championships - Seniors
163	27	880	728	681	473	722	468	2016-12-21 03:24:04	2016-12-21 03:24:04	Worlds 2015 Day 1
164	27	859	837	639	547	722	681	2016-12-21 03:25:09	2016-12-21 03:25:09	Worlds 2015 Day 2
165	103	844	843	235	560	184	575	2016-12-21 03:33:55	2016-12-21 03:33:55	1er lugar Premier Challenge 19-12-15
166	103	877	875	843	26	237	437	2016-12-21 03:35:07	2016-12-21 03:35:07	1er lugar Premier Challenge Concepcion 8-10-16
167	25	716	876	844	549	145	729	2016-12-21 03:36:42	2016-12-21 03:36:42	1er lugar Premier Challenge 28-05-16
168	21	844	609	68	342	398	591	2016-12-21 03:38:46	2016-12-21 03:38:46	2do Premier Challenge Octubre 2014 (VGC14)
169	21	844	609	358	342	68	398	2016-12-21 03:39:49	2016-12-21 03:39:49	3ro Premier Challenge 2015
170	2	716	877	844	642	591	663	2016-12-21 03:42:17	2016-12-21 03:42:17	Top8 Invitacional Chileno 2016
171	2	717	876	844	843	547	437	2016-12-21 03:48:52	2016-12-21 03:48:52	1er lugar Premier Challenge 05/11/2016 
172	2	487	876	844	663	547	437	2016-12-21 03:49:39	2016-12-21 03:49:39	1er lugar Premier Challenge 26/11/2016
173	17	880	576	598	560	186	272	2016-12-21 03:54:21	2016-12-21 03:54:21	Worlds 2015 Day 1
174	4	861	445	635	652	723	131	2016-12-21 04:29:46	2016-12-21 04:29:46	2do Pokémon Deathmatch 2014
175	4	844	729	722	485	591	488	2016-12-21 04:31:42	2016-12-21 04:31:42	1er lugar Desafío Sudamericano 2015
176	68	799	811	445	833	350	233	2016-12-23 04:19:06	2016-12-23 04:19:06	\N
177	105	801	810	445	324	549	779	2016-12-23 04:19:06	2016-12-23 04:19:06	\N
178	67	801	791	445	59	279	55	2016-12-23 04:19:06	2016-12-23 04:19:06	\N
179	104	799	811	553	59	807	822	2016-12-23 04:19:06	2016-12-23 04:19:06	\N
180	54	801	55	462	279	373	831	2016-12-24 08:32:07	2016-12-24 08:32:07	\N
181	111	799	811	526	445	59	423	2016-12-24 08:32:07	2016-12-24 08:32:07	\N
182	109	800	811	810	233	59	553	2016-12-24 08:32:07	2016-12-24 08:32:07	\N
183	108	800	807	130	233	373	831	2016-12-24 08:32:07	2016-12-24 08:32:07	\N
184	50	800	811	130	445	833	801	2016-12-24 08:32:07	2016-12-24 08:32:07	\N
185	106	801	186	462	233	373	831	2016-12-24 08:32:07	2016-12-24 08:32:07	\N
186	107	800	799	130	445	59	811	2016-12-24 08:32:07	2016-12-24 08:32:07	\N
187	110	800	799	811	764	59	423	2016-12-24 08:32:07	2016-12-24 08:32:07	\N
188	61	800	779	324	764	423	59	2017-01-08 03:45:17	2017-01-08 03:45:17	\N
189	112	801	799	279	55	297	831	2017-01-08 03:45:17	2017-01-08 03:45:17	\N
190	60	801	810	279	55	445	59	2017-01-08 03:45:17	2017-01-08 03:45:17	\N
191	56	800	799	812	445	423	59	2017-01-08 03:45:17	2017-01-08 03:45:17	\N
192	61	800	764	324	779	59	423	2017-01-08 22:35:07	2017-01-08 22:35:07	\N
193	63	799	297	324	779	553	812	2017-01-08 22:35:07	2017-01-08 22:35:07	\N
194	70	800	526	350	59	553	812	2017-01-08 22:35:07	2017-01-08 22:35:07	\N
195	56	800	799	445	59	766	812	2017-01-08 22:35:07	2017-01-08 22:35:07	\N
196	68	799	811	233	445	833	350	2017-01-09 17:00:43	2017-01-09 17:00:43	\N
197	113	462	526	233	297	423	794	2017-01-09 17:00:43	2017-01-09 17:00:43	\N
198	115	799	811	792	297	833	831	2017-01-09 17:00:43	2017-01-09 17:00:43	\N
199	104	799	811	807	822	59	553	2017-01-09 17:00:43	2017-01-09 17:00:43	\N
200	68	799	811	233	445	833	350	2017-01-09 17:02:29	2017-01-09 17:02:29	\N
201	93	799	801	779	445	549	324	2017-01-09 17:02:29	2017-01-09 17:02:29	\N
202	104	799	811	807	553	59	822	2017-01-09 17:02:29	2017-01-09 17:02:29	\N
203	114	799	811	235	423	59	833	2017-01-09 17:02:29	2017-01-09 17:02:29	\N
204	27	802	799	812	445	59	584	2017-01-12 01:37:33	2017-01-12 01:37:33	\N
205	35	799	445	811	94	423	59	2017-01-12 01:37:33	2017-01-12 01:37:33	\N
206	33	802	235	133	94	462	553	2017-01-12 01:37:33	2017-01-12 01:37:33	\N
207	37	802	801	811	233	59	423	2017-01-12 01:37:33	2017-01-12 01:37:33	\N
208	116	802	812	233	766	59	831	2017-01-12 01:37:33	2017-01-12 01:37:33	\N
209	22	802	801	833	59	423	831	2017-01-12 01:37:33	2017-01-12 01:37:33	\N
210	117	802	812	584	59	423	831	2017-01-12 01:37:33	2017-01-12 01:37:33	\N
211	20	799	801	810	445	833	130	2017-01-12 01:37:33	2017-01-12 01:37:33	\N
212	61	811	807	833	526	423	373	2017-01-16 02:43:56	2017-01-16 02:43:56	\N
213	120	799	807	812	526	445	59	2017-01-16 02:43:56	2017-01-16 02:43:56	\N
214	56	799	800	376	766	445	59	2017-01-16 02:43:56	2017-01-16 02:43:56	\N
215	70	799	812	508	526	423	59	2017-01-16 02:43:56	2017-01-16 02:43:56	\N
216	63	799	800	812	766	445	59	2017-01-16 02:43:56	2017-01-16 02:43:56	\N
217	118	799	748	833	785	782	233	2017-01-16 02:43:56	2017-01-16 02:43:56	\N
218	121	799	812	779	766	794	59	2017-01-16 02:43:56	2017-01-16 02:43:56	\N
219	119	808	800	462	186	445	59	2017-01-16 02:43:56	2017-01-16 02:43:56	\N
220	37	801	802	811	59	233	423	2017-01-22 03:29:40	2017-01-22 03:29:40	\N
221	27	799	802	809	812	59	445	2017-01-22 03:29:40	2017-01-22 03:29:40	\N
222	35	799	94	59	376	445	423	2017-01-22 03:29:40	2017-01-22 03:29:40	\N
223	122	799	802	809	833	831	584	2017-01-22 03:29:40	2017-01-22 03:29:40	\N
224	123	799	809	59	142	350	445	2017-01-22 03:29:40	2017-01-22 03:29:40	\N
225	16	799	800	809	812	142	186	2017-01-22 03:29:40	2017-01-22 03:29:40	\N
226	14	799	808	811	186	764	747	2017-01-22 03:29:40	2017-01-22 03:29:40	\N
227	6	802	59	831	233	376	798	2017-01-22 03:29:40	2017-01-22 03:29:40	\N
228	63	799	800	812	324	445	779	2017-01-23 14:54:27	2017-01-23 14:54:27	\N
229	67	810	800	807	59	445	547	2017-01-23 14:54:27	2017-01-23 14:54:27	\N
230	61	811	812	526	833	423	373	2017-01-23 14:54:27	2017-01-23 14:54:27	\N
231	69	800	812	297	832	12	143	2017-01-23 14:54:27	2017-01-23 14:54:27	\N
232	124	799	812	59	831	350	474	2017-01-24 02:31:38	2017-01-24 02:31:38	\N
233	9	801	811	59	233	706	764	2017-01-24 02:31:38	2017-01-24 02:31:38	\N
234	1	802	812	59	233	526	297	2017-01-24 02:31:38	2017-01-24 02:31:38	\N
235	17	811	810	807	445	526	423	2017-01-24 02:31:38	2017-01-24 02:31:38	\N
236	116	802	812	59	831	233	445	2017-01-24 02:31:38	2017-01-24 02:31:38	\N
237	22	800	811	831	373	526	423	2017-01-24 02:31:38	2017-01-24 02:31:38	\N
238	103	802	811	59	143	445	748	2017-01-24 02:31:38	2017-01-24 02:31:38	\N
239	11	800	807	59	445	324	549	2017-01-24 02:31:38	2017-01-24 02:31:38	\N
240	37	802	801	233	59	423	811	2017-01-24 02:43:26	2017-01-24 02:43:26	\N
241	125	799	445	706	376	130	302	2017-01-24 02:43:26	2017-01-24 02:43:26	\N
242	126	812	811	445	373	59	423	2017-01-24 02:43:26	2017-01-24 02:43:26	\N
243	127	800	799	811	59	445	423	2017-01-24 02:43:26	2017-01-24 02:43:26	\N
244	128	799	802	812	445	59	831	2017-01-24 02:43:26	2017-01-24 02:43:26	\N
245	129	59	777	445	526	766	478	2017-01-24 02:43:26	2017-01-24 02:43:26	\N
246	130	799	812	811	445	833	766	2017-01-24 02:43:26	2017-01-24 02:43:26	\N
247	131	800	812	373	792	791	233	2017-01-24 02:43:26	2017-01-24 02:43:26	\N
248	17	802	811	807	810	445	526	2017-01-24 02:50:31	2017-01-24 02:50:31	\N
249	9	801	373	833	831	233	350	2017-01-24 02:50:31	2017-01-24 02:50:31	\N
250	132	800	808	833	831	445	584	2017-01-24 02:50:31	2017-01-24 02:50:31	\N
251	133	799	802	812	59	445	630	2017-01-24 02:50:31	2017-01-24 02:50:31	\N
252	23	799	802	812	59	445	198	2017-01-24 02:50:31	2017-01-24 02:50:31	\N
253	135	800	802	812	59	445	752	2017-01-24 02:50:31	2017-01-24 02:50:31	\N
254	134	799	811	833	130	445	474	2017-01-24 02:50:31	2017-01-24 02:50:31	\N
255	13	799	812	233	831	445	766	2017-01-24 02:50:31	2017-01-24 02:50:31	\N
256	56	799	800	376	766	59	445	2017-01-28 22:45:21	2017-01-28 22:45:21	\N
257	63	800	807	811	423	59	445	2017-01-28 22:45:21	2017-01-28 22:45:21	\N
258	60	799	811	779	142	324	445	2017-01-28 22:45:21	2017-01-28 22:45:21	\N
259	119	809	373	752	789	833	186	2017-01-28 22:45:21	2017-01-28 22:45:21	\N
260	136	584	423	831	59	812	802	2017-01-31 19:37:56	2017-01-31 19:37:56	\N
261	137	233	831	59	373	812	802	2017-01-31 19:37:56	2017-01-31 19:37:56	\N
262	138	526	59	445	811	799	802	2017-01-31 19:37:56	2017-01-31 19:37:56	\N
263	99	526	143	350	811	810	807	2017-01-31 19:37:56	2017-01-31 19:37:56	\N
264	140	706	59	445	809	799	802	2017-01-31 19:37:56	2017-01-31 19:37:56	\N
265	141	233	59	350	376	807	802	2017-01-31 19:37:56	2017-01-31 19:37:56	\N
266	142	233	831	59	445	812	802	2017-01-31 19:37:56	2017-01-31 19:37:56	\N
267	143	822	779	766	764	59	807	2017-01-31 19:37:56	2017-01-31 19:37:56	\N
268	144	628	526	59	233	812	800	2017-01-31 19:50:16	2017-01-31 19:50:16	\N
269	145	748	350	59	233	445	800	2017-01-31 19:50:16	2017-01-31 19:50:16	\N
270	146	68	831	423	445	811	799	2017-01-31 19:50:16	2017-01-31 19:50:16	\N
271	147	764	233	59	812	802	799	2017-01-31 19:50:16	2017-01-31 19:50:16	\N
272	148	198	526	59	445	812	799	2017-01-31 19:50:16	2017-01-31 19:50:16	\N
273	149	831	233	59	812	802	800	2017-01-31 19:50:16	2017-01-31 19:50:16	\N
274	150	474	831	59	423	812	802	2017-01-31 19:50:16	2017-01-31 19:50:16	\N
275	151	820	822	831	130	445	799	2017-01-31 19:50:16	2017-01-31 19:50:16	\N
276	152	802	812	59	445	143	584	2017-01-31 20:11:08	2017-01-31 20:11:08	\N
277	153	799	812	59	831	766	233	2017-01-31 20:11:08	2017-01-31 20:11:08	\N
278	154	800	809	59	445	752	630	2017-01-31 20:11:08	2017-01-31 20:11:08	\N
279	155	800	801	811	445	130	833	2017-01-31 20:11:08	2017-01-31 20:11:08	\N
280	156	802	807	808	553	143	663	2017-01-31 20:11:08	2017-01-31 20:11:08	\N
281	157	799	800	812	553	279	747	2017-01-31 20:11:08	2017-01-31 20:11:08	\N
282	158	799	811	59	445	130	423	2017-01-31 20:11:08	2017-01-31 20:11:08	\N
283	159	799	132	376	445	279	663	2017-01-31 20:11:08	2017-01-31 20:11:08	\N
284	154	799	812	233	766	94	297	2017-01-31 20:23:32	2017-01-31 20:23:32	\N
285	160	799	802	818	822	59	143	2017-01-31 20:23:32	2017-01-31 20:23:32	\N
286	156	802	812	233	445	59	831	2017-01-31 20:23:32	2017-01-31 20:23:32	\N
287	153	799	812	233	766	59	831	2017-01-31 20:23:32	2017-01-31 20:23:32	\N
288	161	801	810	826	279	55	831	2017-01-31 20:23:32	2017-01-31 20:23:32	\N
289	162	801	779	474	324	94	794	2017-01-31 20:23:32	2017-01-31 20:23:32	\N
290	163	802	812	584	445	59	143	2017-01-31 20:23:32	2017-01-31 20:23:32	\N
291	164	802	130	233	547	59	831	2017-01-31 20:23:32	2017-01-31 20:23:32	\N
292	165	807	809	811	233	445	526	2017-01-31 20:31:56	2017-01-31 20:31:56	\N
293	23	799	807	811	59	445	198	2017-01-31 20:31:56	2017-01-31 20:31:56	\N
294	19	799	800	811	59	445	423	2017-01-31 20:31:56	2017-01-31 20:31:56	\N
295	166	801	350	297	233	553	324	2017-01-31 20:31:56	2017-01-31 20:31:56	\N
296	16	800	807	809	59	445	547	2017-01-31 20:31:56	2017-01-31 20:31:56	\N
297	27	799	802	812	59	445	630	2017-01-31 20:31:56	2017-01-31 20:31:56	\N
298	26	799	800	47	445	584	663	2017-01-31 20:31:56	2017-04-02 23:37:42	\N
299	21	799	812	59	233	373	831	2017-01-31 20:31:56	2017-01-31 20:31:56	\N
300	103	799	811	233	373	143	831	2017-01-31 20:37:15	2017-01-31 20:37:15	\N
301	9	799	802	812	59	445	630	2017-01-31 20:37:15	2017-01-31 20:37:15	\N
302	10	799	800	508	445	526	130	2017-01-31 20:37:15	2017-01-31 20:37:15	\N
303	27	811	807	233	59	766	795	2017-01-31 20:37:15	2017-01-31 20:37:15	\N
304	23	808	810	740	734	445	59	2017-01-31 20:37:16	2017-01-31 20:37:16	\N
305	48	800	802	448	445	59	547	2017-01-31 20:37:16	2017-01-31 20:37:16	\N
306	29	807	812	764	779	324	130	2017-01-31 20:37:16	2017-01-31 20:37:16	\N
307	124	802	812	822	373	59	820	2017-01-31 20:37:16	2017-01-31 20:37:16	\N
308	110	799	812	59	764	233	766	2017-02-01 14:40:13	2017-02-01 14:40:13	\N
309	167	799	812	445	423	59	526	2017-02-01 14:40:13	2017-02-01 14:40:13	\N
310	168	801	59	792	764	423	233	2017-02-01 14:40:13	2017-02-01 14:40:13	\N
311	169	799	811	812	826	474	526	2017-02-01 14:40:13	2017-02-01 14:40:13	\N
312	106	802	812	59	445	630	143	2017-02-01 14:45:16	2017-02-01 14:45:16	\N
313	107	799	800	812	818	59	766	2017-02-01 14:45:16	2017-02-01 14:45:16	\N
314	170	799	802	812	59	445	233	2017-02-01 14:45:16	2017-02-01 14:45:16	\N
315	53	800	810	547	297	59	143	2017-02-01 14:45:16	2017-02-01 14:45:16	\N
316	168	801	792	59	764	423	233	2017-02-01 15:09:49	2017-02-01 15:09:49	\N
317	110	799	812	59	764	233	766	2017-02-01 15:09:49	2017-02-01 15:09:49	\N
318	171	802	812	59	423	831	474	2017-02-01 15:09:49	2017-02-01 15:09:49	\N
319	111	799	800	812	59	423	198	2017-02-01 15:09:49	2017-02-01 15:09:49	\N
320	54	799	800	811	445	59	423	2017-02-01 15:09:49	2017-02-01 15:09:49	\N
321	173	799	802	812	445	59	630	2017-02-01 15:09:49	2017-02-01 15:09:49	\N
322	172	800	812	59	831	297	233	2017-02-01 15:09:49	2017-02-01 15:09:49	\N
323	170	802	812	59	445	831	233	2017-02-01 15:09:49	2017-02-01 15:09:49	\N
324	51	802	800	809	812	833	59	2017-02-01 15:21:31	2017-02-01 15:21:31	\N
325	168	801	811	59	764	423	233	2017-02-01 15:21:31	2017-02-01 15:21:31	\N
326	174	799	800	811	59	445	423	2017-02-01 15:21:31	2017-02-01 15:21:31	\N
327	170	802	800	812	59	445	831	2017-02-01 15:21:31	2017-02-01 15:21:31	\N
328	175	802	812	376	373	833	143	2017-02-01 15:21:31	2017-02-01 15:21:31	\N
329	176	802	833	376	143	584	798	2017-02-01 15:21:31	2017-02-01 15:21:31	\N
330	55	799	818	812	445	279	55	2017-02-01 15:21:31	2017-02-01 15:21:31	\N
331	177	800	812	628	766	526	59	2017-02-01 15:21:31	2017-02-01 15:21:31	\N
332	178	802	811	59	748	445	233	2017-02-01 18:09:12	2017-02-01 18:09:12	\N
333	51	800	802	809	812	59	831	2017-02-01 18:09:12	2017-02-01 18:09:12	\N
334	179	802	812	59	831	423	474	2017-02-01 18:09:12	2017-02-01 18:09:12	\N
335	111	802	812	59	831	423	474	2017-02-01 18:09:12	2017-02-01 18:09:12	\N
336	110	799	800	811	94	423	59	2017-02-01 18:09:12	2017-02-01 18:09:12	\N
337	180	799	130	445	792	833	831	2017-02-01 18:09:12	2017-02-01 18:09:12	\N
338	181	800	811	445	59	233	423	2017-02-01 18:09:12	2017-02-01 18:09:12	\N
339	182	799	812	59	764	766	233	2017-02-01 18:09:12	2017-02-01 18:09:12	\N
340	111	802	812	59	831	423	812	2017-02-01 18:13:02	2017-02-01 18:13:02	\N
341	183	812	445	94	279	748	35	2017-02-01 18:13:03	2017-02-01 18:13:03	\N
342	184	812	169	833	766	297	792	2017-02-01 18:13:03	2017-02-01 18:13:03	\N
343	55	800	820	822	445	792	774	2017-02-01 18:13:03	2017-02-01 18:13:03	\N
344	185	799	811	445	59	423	526	2017-02-01 18:26:04	2017-02-01 18:26:04	\N
345	186	802	812	59	831	423	474	2017-02-01 18:26:04	2017-02-01 18:26:04	\N
346	52	807	812	279	55	445	461	2017-02-01 18:26:04	2017-02-01 18:26:04	\N
347	182	799	94	445	59	423	526	2017-02-01 18:26:04	2017-02-01 18:26:04	\N
348	187	801	811	706	186	553	233	2017-02-01 18:26:04	2017-02-01 18:26:04	\N
349	188	787	376	324	792	782	143	2017-02-01 18:26:04	2017-02-01 18:26:04	\N
350	111	799	812	818	130	526	233	2017-02-01 18:26:04	2017-02-01 18:26:04	\N
351	178	801	831	462	297	279	55	2017-02-01 18:26:04	2017-02-01 18:26:04	\N
352	170	799	802	812	833	373	826	2017-02-01 18:35:15	2017-02-01 18:35:15	\N
353	174	801	831	186	55	373	462	2017-02-01 18:35:15	2017-02-01 18:35:15	\N
354	178	834	834	834	834	834	834	2017-02-01 18:35:15	2017-02-01 18:35:15	\N
355	54	799	800	811	373	764	233	2017-02-01 18:35:15	2017-02-01 18:35:15	\N
356	187	801	811	553	186	706	233	2017-02-01 18:35:15	2017-02-01 18:35:15	\N
357	189	799	811	373	833	423	233	2017-02-01 18:35:15	2017-02-01 18:35:15	\N
358	175	800	94	373	59	462	526	2017-02-01 18:35:15	2017-02-01 18:35:15	\N
359	188	799	787	376	792	782	143	2017-02-01 18:35:15	2017-02-01 18:35:15	\N
360	51	800	818	59	706	779	766	2017-02-01 18:45:31	2017-02-01 18:45:31	\N
361	52	807	812	445	461	279	55	2017-02-01 18:45:31	2017-02-01 18:45:31	\N
362	53	808	628	820	822	423	737	2017-02-01 18:45:31	2017-02-01 18:45:31	\N
363	55	799	801	818	279	445	788	2017-02-01 18:45:31	2017-02-01 18:45:31	\N
364	110	799	812	279	55	833	461	2017-02-01 18:52:40	2017-02-01 18:52:40	\N
365	190	801	800	811	833	130	445	2017-02-01 18:52:40	2017-02-01 18:52:40	\N
366	106	800	801	373	549	324	779	2017-02-01 18:52:40	2017-02-01 18:52:40	\N
367	52	807	812	130	445	461	833	2017-02-01 18:52:40	2017-02-01 18:52:40	\N
368	107	799	800	811	818	130	445	2017-02-01 18:52:40	2017-02-01 18:52:40	\N
369	168	799	373	833	212	350	779	2017-02-01 18:52:40	2017-02-01 18:52:40	\N
370	175	799	809	811	833	350	831	2017-02-01 18:52:40	2017-02-01 18:52:40	\N
371	191	799	811	130	445	833	233	2017-02-01 18:52:40	2017-02-01 18:52:40	\N
372	194	799	811	59	423	833	822	2017-02-02 23:08:57	2017-02-02 23:08:57	\N
373	195	799	130	149	279	831	791	2017-02-02 23:08:57	2017-02-02 23:08:57	\N
374	196	799	800	811	833	445	350	2017-02-02 23:08:57	2017-02-02 23:08:57	\N
375	197	799	801	186	833	445	766	2017-02-02 23:08:57	2017-02-02 23:08:57	\N
376	198	800	811	130	833	233	826	2017-02-02 23:08:57	2017-02-02 23:08:57	\N
377	199	799	812	130	233	445	791	2017-02-02 23:08:57	2017-02-02 23:08:57	\N
378	200	799	800	811	423	833	792	2017-02-02 23:08:57	2017-02-02 23:08:57	\N
379	201	800	811	59	445	423	526	2017-02-02 23:08:57	2017-02-02 23:08:57	\N
380	202	801	800	462	279	55	553	2017-02-02 23:20:16	2017-02-02 23:20:16	\N
381	199	799	812	130	233	445	791	2017-02-02 23:20:16	2017-02-02 23:20:16	\N
382	198	799	800	811	423	233	831	2017-02-02 23:20:16	2017-02-02 23:20:16	\N
383	203	801	373	462	186	233	831	2017-02-02 23:20:16	2017-02-02 23:20:16	\N
384	194	799	811	59	423	833	822	2017-02-02 23:20:16	2017-02-02 23:20:16	\N
385	195	799	130	445	279	831	791	2017-02-02 23:20:16	2017-02-02 23:20:16	\N
386	204	801	810	831	779	794	760	2017-02-02 23:20:16	2017-02-02 23:20:16	\N
387	205	734	774	130	445	758	833	2017-02-02 23:20:16	2017-02-02 23:20:16	\N
388	203	802	812	59	474	831	423	2017-02-02 23:28:17	2017-02-02 23:28:17	\N
389	201	802	584	376	798	833	143	2017-02-02 23:28:17	2017-02-02 23:28:17	\N
390	198	445	822	233	423	831	737	2017-02-02 23:28:17	2017-02-02 23:28:17	\N
391	194	802	800	445	143	233	59	2017-02-02 23:28:17	2017-02-02 23:28:17	\N
392	199	799	812	130	233	445	791	2017-02-02 23:28:17	2017-02-02 23:28:17	\N
393	195	799	831	445	279	55	791	2017-02-02 23:28:17	2017-02-02 23:28:17	\N
394	204	801	810	831	59	766	785	2017-02-02 23:28:17	2017-02-02 23:28:17	\N
395	206	802	812	59	445	818	787	2017-02-02 23:28:17	2017-02-02 23:28:17	\N
396	198	800	812	59	350	526	508	2017-02-02 23:38:14	2017-02-02 23:38:14	\N
397	203	799	812	321	792	279	25	2017-02-02 23:38:14	2017-02-02 23:38:14	\N
398	207	801	807	130	462	766	751	2017-02-02 23:38:14	2017-02-02 23:38:14	\N
399	208	801	802	809	445	423	59	2017-02-02 23:38:14	2017-02-02 23:38:14	\N
400	199	799	812	121	233	445	791	2017-02-02 23:38:14	2017-02-02 23:38:14	\N
401	195	802	376	186	59	233	630	2017-02-02 23:38:14	2017-02-02 23:38:14	\N
402	194	799	811	445	833	766	233	2017-02-02 23:38:14	2017-02-02 23:38:14	\N
403	209	799	445	59	94	423	833	2017-02-02 23:38:14	2017-02-02 23:38:34	\N
404	210	802	812	59	474	831	423	2017-02-02 23:48:27	2017-02-02 23:48:27	\N
405	211	792	794	423	811	233	833	2017-02-02 23:48:27	2017-02-02 23:48:27	\N
406	212	526	445	766	59	831	794	2017-02-02 23:48:27	2017-02-02 23:48:27	\N
407	213	772	376	822	142	833	800	2017-02-02 23:48:27	2017-02-02 23:48:27	\N
408	214	811	445	782	799	740	737	2017-02-02 23:48:27	2017-02-02 23:48:27	\N
409	215	706	130	376	800	807	94	2017-02-02 23:48:27	2017-02-02 23:48:27	\N
410	216	233	800	121	59	94	812	2017-02-02 23:48:27	2017-02-02 23:48:27	\N
411	217	791	799	792	833	831	766	2017-02-02 23:48:27	2017-02-02 23:48:27	\N
412	60	811	799	445	833	423	822	2017-02-12 00:56:24	2017-02-12 00:56:24	\N
413	70	812	799	553	324	766	779	2017-02-12 00:56:24	2017-02-12 00:56:24	\N
414	63	811	800	445	59	423	807	2017-02-12 00:56:24	2017-02-12 00:56:24	\N
415	218	811	799	445	833	350	233	2017-02-12 00:56:24	2017-02-12 13:29:59	\N
416	160	802	59	818	799	822	143	2017-02-15 22:00:24	2017-02-15 22:00:24	\N
417	219	802	59	445	628	630	831	2017-02-15 22:00:24	2017-02-15 22:00:24	\N
418	220	802	59	445	233	822	831	2017-02-15 22:00:24	2017-02-15 22:00:24	\N
419	221	799	818	812	233	279	760	2017-02-15 22:00:24	2017-02-15 22:00:24	\N
420	222	801	59	130	818	822	831	2017-02-15 22:00:24	2017-02-15 22:00:24	\N
421	223	799	59	812	233	766	143	2017-02-15 22:00:24	2017-02-15 22:00:24	\N
422	224	800	833	445	233	324	831	2017-02-15 22:00:24	2017-02-15 22:00:24	\N
423	153	802	59	445	233	822	831	2017-02-15 22:00:24	2017-02-15 22:00:24	\N
424	225	799	59	233	812	766	807	2017-02-15 22:09:01	2017-02-15 22:09:01	\N
425	226	800	833	233	811	526	297	2017-02-15 22:09:01	2017-02-15 22:09:01	\N
426	227	802	809	233	764	706	831	2017-02-15 22:09:01	2017-02-15 22:09:01	\N
427	228	350	833	233	811	706	831	2017-02-15 22:09:01	2017-02-15 22:09:01	\N
428	229	800	818	792	376	373	553	2017-02-15 22:09:01	2017-02-15 22:09:01	\N
429	230	800	59	233	811	766	831	2017-02-15 22:09:01	2017-02-15 22:09:01	\N
430	231	802	59	547	810	799	445	2017-02-15 22:09:01	2017-02-15 22:09:01	\N
431	232	799	833	474	812	766	831	2017-02-15 22:09:01	2017-02-15 22:09:01	\N
432	233	822	799	766	59	445	831	2017-02-15 22:18:54	2017-02-15 22:18:54	\N
433	234	373	799	812	233	766	831	2017-02-15 22:18:54	2017-02-15 22:18:54	\N
434	235	799	445	811	818	59	474	2017-02-15 22:18:54	2017-02-15 22:18:54	\N
435	236	233	812	55	279	800	376	2017-02-15 22:18:54	2017-02-15 22:18:54	\N
436	237	822	748	831	445	802	59	2017-02-15 22:18:54	2017-02-15 22:18:54	\N
437	238	350	800	59	812	584	706	2017-02-15 22:18:54	2017-02-15 22:18:54	\N
438	239	59	812	445	818	800	130	2017-02-15 22:18:54	2017-02-15 22:18:54	\N
439	240	526	445	811	799	663	36	2017-02-15 22:18:54	2017-02-15 22:18:54	\N
440	241	799	445	186	831	630	233	2017-02-15 22:28:05	2017-02-15 22:28:05	\N
441	242	818	800	279	376	706	369	2017-02-15 22:28:05	2017-02-15 22:28:05	\N
442	243	799	800	59	831	801	764	2017-02-15 22:28:05	2017-02-15 22:28:05	\N
443	244	799	445	59	812	766	233	2017-02-15 22:28:05	2017-02-15 22:28:05	\N
444	245	831	423	811	526	799	373	2017-02-15 22:35:17	2017-02-15 22:35:17	\N
445	246	445	822	807	59	831	812	2017-02-15 22:35:17	2017-02-15 22:35:17	\N
446	247	59	423	526	800	811	764	2017-02-15 22:35:17	2017-02-15 22:35:17	\N
447	230	812	800	55	279	799	833	2017-02-15 22:35:17	2017-02-15 22:35:17	\N
448	248	445	143	799	802	812	59	2017-02-15 22:35:17	2017-02-15 22:35:17	\N
449	249	663	779	822	811	445	423	2017-02-15 22:35:17	2017-03-29 21:58:31	\N
450	250	445	423	812	59	800	233	2017-02-15 22:35:17	2017-02-15 22:35:17	\N
451	251	779	807	760	324	584	820	2017-02-15 22:35:17	2017-02-15 22:35:17	\N
452	252	802	812	94	445	59	186	2017-02-15 22:43:39	2017-02-15 22:43:39	\N
453	253	822	474	820	826	833	350	2017-02-15 22:43:39	2017-02-15 22:43:39	\N
454	254	59	831	812	423	474	799	2017-02-15 22:43:39	2017-02-15 22:43:39	\N
455	100	809	59	445	811	799	423	2017-02-15 22:43:39	2017-02-15 22:43:39	\N
456	255	831	809	233	376	802	801	2017-02-15 22:43:39	2017-02-15 22:43:39	\N
457	256	423	445	799	526	59	811	2017-02-15 22:43:39	2017-02-15 22:43:39	\N
458	257	784	807	812	766	800	330	2017-02-15 22:43:39	2017-02-15 22:43:39	\N
459	258	822	799	831	766	792	197	2017-02-15 22:43:39	2017-02-15 22:43:39	\N
460	225	799	812	59	233	36	766	2017-02-15 22:55:13	2017-02-15 22:55:13	\N
461	259	799	812	800	553	811	423	2017-02-15 22:55:13	2017-02-15 22:55:13	\N
462	260	553	196	235	133	35	350	2017-02-15 22:55:13	2017-02-15 22:55:13	\N
463	261	812	802	799	59	831	445	2017-02-15 22:55:13	2017-02-15 22:55:13	\N
464	262	802	233	800	376	143	584	2017-02-15 22:55:13	2017-02-15 22:55:13	\N
465	263	812	802	831	59	445	745	2017-02-15 22:55:13	2017-02-15 22:55:13	\N
466	264	802	831	59	445	822	474	2017-02-15 22:55:13	2017-02-15 22:55:13	\N
467	265	812	802	831	822	445	833	2017-02-15 22:55:13	2017-02-15 22:55:13	\N
468	157	800	811	59	445	350	748	2017-02-24 01:33:23	2017-02-24 01:33:23	\N
469	154	800	812	59	233	818	526	2017-02-24 01:33:23	2017-02-24 01:33:23	\N
470	266	799	809	59	445	198	831	2017-02-24 01:33:23	2017-02-24 01:33:23	\N
471	267	802	445	59	233	822	831	2017-02-24 01:33:23	2017-02-24 01:33:23	\N
472	156	802	812	59	233	297	831	2017-02-24 01:33:23	2017-02-24 01:33:23	\N
473	155	799	59	812	233	445	766	2017-02-24 01:33:23	2017-02-24 01:33:23	\N
474	268	802	812	324	445	779	143	2017-02-24 01:33:23	2017-02-24 01:33:23	\N
475	269	802	812	706	233	822	831	2017-02-24 01:33:23	2017-02-24 01:33:23	\N
476	270	59	799	233	812	423	831	2017-02-24 01:46:40	2017-02-24 01:46:40	\N
477	225	59	799	233	812	766	807	2017-02-24 01:46:40	2017-02-24 01:46:40	\N
478	271	324	799	461	811	800	445	2017-02-24 01:46:40	2017-02-24 01:46:40	\N
479	272	59	802	812	233	526	445	2017-02-24 01:46:40	2017-02-24 01:46:40	\N
480	273	737	801	807	812	350	445	2017-02-24 01:46:40	2017-02-24 01:46:40	\N
481	274	59	799	233	802	584	706	2017-02-24 01:46:40	2017-02-24 01:46:40	\N
482	230	59	800	233	811	423	831	2017-02-24 01:46:40	2017-02-24 01:46:40	\N
483	259	59	799	630	812	800	445	2017-02-24 01:46:40	2017-02-24 01:46:40	\N
484	16	800	809	426	121	833	445	2017-02-24 01:52:33	2017-02-24 01:52:33	\N
485	103	799	802	812	198	59	445	2017-02-24 01:52:33	2017-02-24 01:52:33	\N
486	27	802	812	748	376	59	445	2017-02-24 01:52:33	2017-02-24 01:52:33	\N
487	275	799	811	279	55	833	445	2017-02-24 01:52:33	2017-02-24 01:52:33	\N
488	17	802	811	810	807	445	526	2017-02-24 02:02:12	2017-02-24 02:02:12	\N
489	210	802	799	812	59	445	630	2017-02-24 02:02:12	2017-02-24 02:02:12	\N
490	276	800	811	94	59	445	350	2017-02-24 02:02:12	2017-02-24 02:02:12	\N
491	9	792	143	324	549	297	233	2017-02-24 02:02:12	2017-02-24 02:02:12	\N
492	10	800	812	807	59	445	426	2017-02-24 02:02:12	2017-02-24 02:02:12	\N
493	277	799	811	772	59	445	233	2017-02-24 02:02:12	2017-02-24 02:02:12	\N
494	278	800	811	807	809	766	663	2017-02-24 02:02:12	2017-02-24 02:02:12	\N
495	279	801	812	94	766	59	233	2017-02-24 02:02:12	2017-02-24 02:02:12	\N
496	49	802	812	59	822	143	445	2017-02-24 02:13:23	2017-02-24 02:13:23	\N
497	16	799	807	809	324	766	779	2017-02-24 02:13:23	2017-02-24 02:13:23	\N
498	2	143	233	297	324	549	792	2017-02-24 02:13:23	2017-02-24 02:13:23	\N
499	26	799	800	47	445	584	663	2017-02-24 02:13:23	2017-02-24 02:13:23	\N
500	33	802	812	59	143	628	445	2017-02-24 02:13:23	2017-02-24 02:13:23	\N
501	14	802	812	59	426	445	474	2017-02-24 02:13:23	2017-02-24 02:13:23	\N
502	281	799	812	59	233	766	764	2017-02-24 02:13:23	2017-02-24 02:13:23	\N
503	280	799	802	812	808	59	445	2017-02-24 02:13:23	2017-02-24 02:13:23	\N
504	63	811	802	630	445	59	526	2017-02-25 17:33:55	2017-02-25 17:33:55	\N
505	283	811	802	799	445	59	831	2017-02-25 17:33:55	2017-02-25 17:33:55	\N
506	282	811	800	818	445	59	198	2017-02-25 17:33:55	2017-02-25 17:33:55	\N
507	70	812	799	508	423	59	526	2017-02-25 17:33:55	2017-02-25 17:33:55	\N
508	226	799	818	822	233	764	831	2017-02-27 04:32:11	2017-02-27 04:32:11	\N
509	225	799	59	812	233	766	807	2017-02-27 04:32:11	2017-02-27 04:32:11	\N
510	229	802	584	833	812	766	445	2017-02-27 04:32:11	2017-02-27 04:32:11	\N
511	227	802	833	233	143	748	212	2017-02-27 04:32:11	2017-02-27 04:32:11	\N
512	284	802	553	706	812	809	831	2017-02-27 04:32:11	2017-02-27 04:32:11	\N
513	285	822	820	833	233	766	807	2017-02-27 04:32:11	2017-02-27 04:32:11	\N
514	228	130	833	233	812	445	831	2017-02-27 04:32:11	2017-02-27 04:32:11	\N
515	286	423	737	80	94	808	822	2017-02-27 04:32:11	2017-02-27 04:32:11	\N
516	125	800	802	812	324	233	445	2017-02-27 04:40:09	2017-02-27 04:40:09	\N
517	287	802	812	59	833	233	766	2017-02-27 04:40:09	2017-02-27 04:40:30	\N
518	17	802	807	810	811	445	526	2017-02-27 04:40:09	2017-02-27 04:40:09	\N
519	288	799	802	807	822	820	59	2017-02-27 04:40:09	2017-02-27 04:40:09	\N
520	27	802	807	811	59	445	426	2017-02-27 04:40:09	2017-02-27 04:40:09	\N
521	26	799	800	47	445	584	663	2017-02-27 04:40:09	2017-02-27 04:40:09	\N
522	37	801	59	143	233	376	423	2017-02-27 04:40:09	2017-02-27 04:40:09	\N
523	289	799	812	59	831	423	445	2017-02-27 04:40:09	2017-02-27 04:40:09	\N
524	70	800	812	779	553	766	324	2017-02-28 20:06:54	2017-02-28 20:06:54	\N
525	57	799	810	373	811	423	833	2017-02-28 20:06:54	2017-02-28 20:06:54	\N
526	64	800	799	812	423	445	59	2017-02-28 20:06:54	2017-02-28 20:06:54	\N
527	218	811	799	445	833	350	233	2017-02-28 20:06:54	2017-02-28 20:06:54	\N
528	275	445	802	812	59	807	426	2017-03-01 02:10:35	2017-03-01 02:10:35	\N
529	290	279	55	818	799	812	766	2017-03-01 02:10:35	2017-03-01 02:10:35	\N
530	20	445	809	800	462	130	426	2017-03-01 02:10:35	2017-03-01 02:10:35	\N
531	291	628	807	818	737	808	811	2017-03-01 02:10:35	2017-03-01 02:10:35	\N
532	14	807	808	324	549	445	779	2017-03-07 19:48:59	2017-03-07 19:48:59	\N
533	49	799	801	802	59	376	547	2017-03-07 19:48:59	2017-03-07 19:48:59	\N
534	292	799	809	811	833	279	445	2017-03-07 19:48:59	2017-03-07 19:48:59	\N
535	10	800	802	810	59	198	445	2017-03-07 19:48:59	2017-03-07 19:48:59	\N
536	293	802	822	831	59	233	445	2017-03-07 19:54:41	2017-03-07 19:54:41	\N
537	33	800	811	143	59	445	426	2017-03-07 19:54:41	2017-03-07 19:54:41	\N
538	2	799	800	809	445	324	779	2017-03-07 19:54:41	2017-03-07 19:54:41	\N
539	17	235	764	324	549	474	423	2017-03-07 19:54:41	2017-03-07 19:54:41	\N
540	16	800	809	47	445	791	426	2017-03-07 19:54:41	2017-03-07 19:54:41	\N
541	26	799	800	47	445	584	663	2017-03-07 19:54:41	2017-03-07 19:54:41	\N
542	103	799	802	812	59	445	198	2017-03-07 19:54:41	2017-03-07 19:54:41	\N
543	1	799	802	811	59	445	630	2017-03-07 19:54:41	2017-03-07 19:54:41	\N
544	27	800	810	811	143	445	663	2017-03-07 20:03:12	2017-03-07 20:03:12	\N
545	14	800	812	59	445	630	793	2017-03-07 20:03:12	2017-03-07 20:03:12	\N
546	25	800	809	324	445	752	549	2017-03-07 20:03:12	2017-03-07 20:03:12	\N
547	46	802	68	59	233	376	445	2017-03-07 20:03:12	2017-03-07 20:03:12	\N
548	292	799	809	811	833	279	445	2017-03-07 20:03:12	2017-03-07 20:03:12	\N
549	49	800	810	811	143	445	663	2017-03-07 20:03:12	2017-03-07 20:03:12	\N
550	3	233	324	297	462	766	792	2017-03-07 20:03:12	2017-03-07 20:03:12	\N
551	122	799	811	807	445	547	766	2017-03-07 20:03:12	2017-03-07 20:03:12	\N
552	110	59	766	812	233	799	764	2017-03-07 20:18:35	2017-03-07 20:18:35	\N
553	170	143	802	822	59	445	831	2017-03-07 20:18:35	2017-03-07 20:18:35	\N
554	294	831	445	811	802	59	233	2017-03-07 20:18:35	2017-03-07 20:18:35	\N
555	175	799	800	445	59	130	426	2017-03-07 20:18:35	2017-03-07 20:18:35	\N
556	174	799	811	792	324	350	445	2017-03-07 20:18:35	2017-03-07 20:18:35	\N
557	167	799	802	812	59	233	831	2017-03-07 20:18:35	2017-03-07 20:18:35	\N
558	106	143	822	802	445	831	59	2017-03-07 20:18:35	2017-03-07 20:18:35	\N
559	52	143	584	802	812	59	445	2017-03-07 20:18:35	2017-03-07 20:18:35	\N
560	264	802	812	59	748	445	831	2017-03-07 20:37:36	2017-03-07 20:37:36	\N
561	272	802	812	59	799	445	526	2017-03-07 20:37:36	2017-03-07 20:37:36	\N
562	226	799	818	233	822	764	831	2017-03-07 20:37:36	2017-03-07 20:37:36	\N
563	295	800	807	59	766	822	630	2017-03-07 20:37:36	2017-03-07 20:37:36	\N
564	296	800	807	779	324	445	297	2017-03-07 20:37:36	2017-03-07 20:37:36	\N
565	297	799	802	812	59	233	526	2017-03-07 20:37:36	2017-03-07 20:37:36	\N
566	298	297	792	462	794	766	233	2017-03-07 20:37:36	2017-03-07 20:37:36	\N
567	299	799	802	59	822	445	297	2017-03-07 20:37:36	2017-03-07 20:37:36	\N
576	70	799	812	526	508	373	423	2017-03-12 18:21:12	2017-03-12 18:21:12	\N
577	301	799	628	795	186	445	59	2017-03-12 18:21:12	2017-03-12 18:21:12	\N
578	94	800	812	630	350	59	445	2017-03-12 18:21:12	2017-03-12 18:21:12	\N
579	302	800	799	811	818	59	445	2017-03-12 18:21:12	2017-03-12 18:28:45	\N
580	301	799	628	795	186	445	59	2017-03-12 18:30:22	2017-03-22 21:24:00	\N
581	63	802	811	445	822	59	630	2017-03-12 18:30:22	2017-03-12 18:30:22	\N
582	302	800	799	811	818	59	445	2017-03-12 18:30:22	2017-03-12 18:30:22	\N
583	70	802	812	584	143	445	59	2017-03-12 18:30:22	2017-03-12 18:30:22	\N
680	321	812	800	809	233	445	59	2017-04-15 23:26:35	2017-04-15 23:26:35	\N
584	14	877	875	861	144	65	233	2017-03-15 17:04:53	2017-03-15 17:04:53	1er Lugar Pokemon Party 16/05/16
585	14	877	875	861	729	169	593	2017-03-15 17:05:45	2017-03-15 17:05:45	1er Lugar Premier Challenge 13/02/16
586	16	800	807	811	809	445	426	2017-03-15 17:16:36	2017-03-15 17:16:36	\N
587	293	800	822	831	233	445	426	2017-03-15 17:16:36	2017-03-15 17:16:36	\N
588	33	800	462	59	143	445	426	2017-03-15 17:16:36	2017-03-15 17:16:36	\N
589	48	800	799	811	130	445	791	2017-03-15 17:16:36	2017-03-15 17:16:36	\N
590	23	800	799	59	143	445	630	2017-03-15 17:16:36	2017-03-15 17:16:36	\N
591	46	802	376	59	233	445	68	2017-03-15 17:16:36	2017-03-15 17:16:36	\N
592	304	800	812	59	233	445	831	2017-03-15 17:16:36	2017-03-15 17:16:36	\N
593	303	799	807	59	143	373	302	2017-03-15 17:16:36	2017-03-15 17:16:36	\N
594	152	799	94	831	59	709	547	2017-03-22 21:10:03	2017-03-22 21:10:03	\N
595	157	801	807	822	833	130	462	2017-03-22 21:10:03	2017-03-22 21:10:03	\N
596	220	799	802	812	59	143	826	2017-03-22 21:10:03	2017-03-22 21:10:03	\N
597	267	799	811	831	59	233	445	2017-03-22 21:10:03	2017-03-22 21:10:03	\N
598	154	799	812	59	233	766	764	2017-03-22 21:16:51	2017-03-22 21:16:51	\N
599	153	802	812	59	445	822	143	2017-03-22 21:16:51	2017-03-22 21:16:51	\N
600	223	799	812	59	233	766	143	2017-03-22 21:16:51	2017-03-22 21:16:51	\N
601	305	799	818	59	445	822	68	2017-03-22 21:16:51	2017-03-22 21:16:51	\N
602	1	799	818	822	831	766	764	2017-03-25 21:19:54	2017-05-28 19:50:30	\N
603	12	800	779	549	324	764	297	2017-03-25 21:19:54	2017-03-25 21:19:54	\N
604	306	799	802	812	59	706	474	2017-03-25 21:19:54	2017-03-25 21:19:54	\N
605	290	799	812	818	279	55	766	2017-03-25 21:19:54	2017-03-25 21:19:54	\N
606	304	800	59	831	130	233	445	2017-03-25 22:31:58	2017-03-25 22:31:58	\N
607	16	143	235	474	549	324	774	2017-03-25 22:31:58	2017-03-25 22:31:58	\N
608	35	799	812	59	826	143	526	2017-03-25 22:31:58	2017-03-25 22:31:58	\N
609	308	799	807	186	831	198	445	2017-03-25 22:31:58	2017-03-25 22:31:58	\N
610	133	799	812	59	233	766	764	2017-03-25 22:31:58	2017-03-25 22:31:58	\N
611	307	350	324	376	526	779	764	2017-03-25 22:31:58	2017-03-25 22:31:58	\N
612	23	799	811	198	59	445	94	2017-03-25 22:31:58	2017-03-25 22:31:58	\N
613	14	811	833	279	369	445	777	2017-03-25 22:31:58	2017-03-25 22:31:58	\N
614	14	801	59	233	373	526	565	2017-03-25 22:37:27	2017-03-25 22:37:27	\N
615	3	799	812	279	55	297	233	2017-03-25 22:37:27	2017-03-25 22:37:27	\N
616	48	799	808	279	55	376	233	2017-03-25 22:37:27	2017-03-26 02:47:38	\N
617	135	800	802	812	630	59	445	2017-03-25 22:37:27	2017-03-25 22:37:27	\N
618	125	802	811	833	233	297	445	2017-03-25 22:43:00	2017-03-25 22:43:00	\N
619	309	802	807	812	59	233	445	2017-03-25 22:43:00	2017-03-25 22:43:00	\N
620	310	799	800	130	822	445	630	2017-03-25 22:43:00	2017-03-25 22:43:00	\N
621	311	800	812	59	426	445	526	2017-03-25 22:43:00	2017-03-25 22:43:00	\N
622	3	800	324	549	752	809	445	2017-03-30 01:38:17	2017-03-30 01:38:17	\N
623	107	800	59	799	130	143	812	2017-03-30 01:38:17	2017-03-30 01:38:17	\N
624	173	802	445	822	812	143	59	2017-03-30 01:38:17	2017-03-30 01:38:17	\N
625	106	802	791	130	831	59	445	2017-03-30 01:38:17	2017-03-30 01:38:17	\N
626	168	799	526	811	445	130	233	2017-03-30 01:38:17	2017-03-30 01:38:17	\N
627	187	800	426	445	812	59	143	2017-03-30 01:38:17	2017-03-30 01:38:17	\N
628	109	800	426	445	809	462	130	2017-03-30 01:38:17	2017-03-30 01:38:17	\N
629	167	800	426	445	143	462	130	2017-03-30 01:38:17	2017-03-30 01:38:17	\N
630	154	802	812	59	826	143	799	2017-03-30 01:46:50	2017-03-30 01:46:50	\N
631	220	59	800	233	445	831	822	2017-03-30 01:46:50	2017-03-30 01:46:50	\N
632	170	799	802	811	59	445	143	2017-03-30 01:46:50	2017-03-30 01:46:50	\N
633	17	800	811	807	445	526	628	2017-03-30 01:46:50	2017-03-30 01:46:50	\N
634	312	130	800	233	445	143	799	2017-03-30 01:46:50	2017-03-30 01:46:50	\N
635	162	130	800	462	445	831	426	2017-03-30 01:46:50	2017-03-30 01:46:50	\N
636	313	800	812	59	445	143	426	2017-03-30 01:46:50	2017-03-30 01:46:50	\N
637	224	802	812	59	445	233	833	2017-03-30 01:46:50	2017-03-30 01:46:50	\N
638	167	799	802	831	233	812	59	2017-04-04 18:17:54	2017-04-04 18:17:54	\N
639	110	799	764	766	233	812	59	2017-04-04 18:17:54	2017-04-04 18:17:54	\N
640	51	799	802	445	143	811	59	2017-04-04 18:17:54	2017-04-04 18:17:54	\N
641	168	799	297	766	233	812	59	2017-04-04 18:17:54	2017-04-04 18:17:54	\N
642	314	799	800	766	233	812	59	2017-04-04 18:17:54	2017-04-04 18:17:54	\N
643	52	802	445	584	143	812	59	2017-04-04 18:17:54	2017-04-04 18:17:54	\N
644	111	802	826	792	143	812	59	2017-04-04 18:17:54	2017-04-04 18:17:54	\N
645	107	799	800	130	143	812	59	2017-04-04 18:17:54	2017-04-04 18:17:54	\N
646	56	800	799	812	59	233	766	2017-04-09 02:18:16	2017-04-09 02:18:16	\N
647	121	801	121	462	59	233	297	2017-04-09 02:18:16	2017-04-09 02:18:16	\N
648	70	800	426	462	59	445	143	2017-04-09 02:18:16	2017-04-09 02:18:16	\N
649	301	800	799	462	630	445	130	2017-04-09 02:18:16	2017-04-09 02:18:16	\N
650	276	800	822	59	376	445	426	2017-04-10 03:22:04	2017-04-10 03:22:04	\N
651	48	799	800	812	55	445	279	2017-04-10 03:22:04	2017-04-10 03:22:04	\N
652	1	799	818	822	831	766	764	2017-04-10 03:22:04	2017-05-28 19:50:08	\N
653	49	799	811	833	831	445	130	2017-04-10 03:22:04	2017-04-10 03:22:04	\N
654	17	800	807	811	526	445	628	2017-04-10 03:22:04	2017-04-11 01:21:40	\N
655	44	799	800	59	143	445	792	2017-04-10 03:22:04	2017-04-10 03:22:04	\N
656	315	799	807	59	766	764	233	2017-04-10 03:22:04	2017-04-10 03:22:04	\N
657	12	800	812	59	233	445	426	2017-04-10 03:22:04	2017-04-10 03:22:04	\N
658	316	799	802	445	59	233	526	2017-04-10 19:18:18	2017-04-10 19:18:18	\N
659	317	801	186	55	462	94	373	2017-04-10 19:18:18	2017-04-10 19:18:18	\N
660	237	800	426	445	130	462	143	2017-04-10 19:18:18	2017-04-10 19:18:18	\N
661	234	801	807	59	766	462	233	2017-04-10 19:18:18	2017-04-10 19:18:18	\N
662	264	799	59	812	766	233	297	2017-04-10 19:25:07	2017-04-10 19:25:07	\N
663	138	799	802	445	233	130	143	2017-04-10 19:25:07	2017-04-10 19:25:07	\N
664	298	792	766	462	297	233	768	2017-04-10 19:25:07	2017-04-10 19:25:07	\N
665	270	799	445	59	423	811	831	2017-04-10 19:25:07	2017-04-10 19:25:07	\N
666	63	799	800	59	766	233	811	2017-04-10 19:25:07	2017-04-10 19:27:23	\N
667	272	802	812	59	445	233	526	2017-04-10 19:25:07	2017-04-10 19:25:07	\N
668	318	800	812	445	59	811	426	2017-04-10 19:25:07	2017-04-10 19:25:07	\N
669	299	799	802	445	59	297	822	2017-04-10 19:25:07	2017-04-10 19:25:07	\N
670	160	800	809	59	628	772	526	2017-04-11 17:19:56	2017-04-11 17:19:56	\N
671	154	802	812	59	791	233	526	2017-04-11 17:19:56	2017-04-11 17:19:56	\N
672	319	801	119	241	121	136	628	2017-04-11 17:19:56	2017-04-11 17:19:56	\N
673	162	800	130	426	445	462	526	2017-04-11 17:19:56	2017-04-11 17:19:56	\N
674	156	799	812	59	766	764	233	2017-04-11 17:19:56	2017-04-11 17:19:56	\N
675	220	799	812	59	766	526	233	2017-04-11 17:19:56	2017-04-11 17:19:56	\N
676	320	802	59	445	822	831	143	2017-04-11 17:19:56	2017-04-11 17:19:56	\N
677	152	799	802	811	630	445	792	2017-04-11 17:19:56	2017-04-11 17:19:56	\N
678	70	812	799	526	508	423	373	2017-04-15 23:26:35	2017-04-16 03:43:09	\N
679	56	800	799	426	143	445	59	2017-04-15 23:26:35	2017-04-15 23:26:35	\N
681	322	800	799	807	811	766	59	2017-04-15 23:26:35	2017-04-15 23:26:35	\N
682	69	799	812	445	59	233	766	2017-04-16 01:31:48	2017-04-16 01:31:48	\N
683	323	802	812	445	59	822	143	2017-04-16 01:31:48	2017-04-16 01:38:26	\N
684	113	462	80	297	526	233	831	2017-04-16 01:31:48	2017-04-16 01:31:48	\N
685	68	799	811	445	833	55	279	2017-04-16 01:31:48	2017-04-16 01:31:48	\N
686	324	799	812	820	59	233	831	2017-04-16 01:31:48	2017-04-16 01:31:48	\N
687	93	800	812	445	59	233	831	2017-04-16 01:31:48	2017-04-16 01:31:48	\N
688	114	800	811	445	59	423	12	2017-04-16 01:31:48	2017-04-16 01:31:48	\N
689	66	799	800	445	59	233	822	2017-04-16 01:31:48	2017-04-16 01:38:44	\N
690	69	799	812	59	508	423	526	2017-04-16 01:37:35	2017-04-16 01:37:35	\N
691	325	799	811	59	445	423	233	2017-04-16 01:37:35	2017-04-16 01:37:35	\N
692	323	802	812	59	445	426	526	2017-04-16 01:37:35	2017-04-16 01:37:35	\N
693	66	802	143	59	445	426	233	2017-04-16 01:37:35	2017-04-16 01:37:35	\N
694	293	800	822	59	831	233	445	2017-04-16 03:57:56	2017-04-16 03:57:56	\N
695	14	801	59	233	373	423	526	2017-04-16 03:57:56	2017-04-16 03:57:56	\N
696	33	143	235	324	474	764	792	2017-04-16 03:57:56	2017-04-16 03:57:56	\N
697	29	807	809	812	113	324	779	2017-04-16 03:57:56	2017-04-16 03:57:56	\N
698	27	800	812	59	426	445	782	2017-04-16 03:57:56	2017-04-16 03:57:56	\N
699	326	799	802	812	59	445	630	2017-04-16 03:57:56	2017-04-16 03:58:55	\N
700	37	802	59	829	233	423	376	2017-04-16 03:57:56	2017-04-16 03:57:56	\N
701	48	799	55	279	297	376	445	2017-04-16 03:57:56	2017-04-16 03:57:56	\N
702	327	800	811	59	445	792	198	2017-04-22 23:29:56	2017-04-22 23:29:56	\N
703	1	799	818	822	831	766	764	2017-04-22 23:29:56	2017-04-22 23:29:56	\N
704	328	801	812	474	235	526	426	2017-04-22 23:29:56	2017-04-22 23:29:56	\N
705	329	799	831	324	764	131	779	2017-04-22 23:29:56	2017-04-22 23:29:56	\N
706	291	807	808	818	737	706	628	2017-04-22 23:29:56	2017-04-22 23:29:56	\N
707	28	799	826	297	526	324	779	2017-04-22 23:29:56	2017-04-22 23:29:56	\N
708	20	802	59	748	831	143	233	2017-04-22 23:29:56	2017-04-22 23:29:56	\N
709	306	799	802	812	59	706	474	2017-04-22 23:29:56	2017-04-22 23:29:56	\N
710	69	799	802	59	812	826	143	2017-04-23 01:28:51	2017-04-23 01:28:51	\N
711	68	799	818	764	36	779	143	2017-04-23 01:28:51	2017-04-23 01:28:51	\N
712	115	799	811	445	553	297	233	2017-04-23 01:28:51	2017-04-23 01:28:51	\N
713	93	800	426	445	812	59	233	2017-04-23 01:28:51	2017-04-23 01:28:51	\N
714	16	799	800	809	59	445	426	2017-04-24 01:33:30	2017-04-24 01:33:30	\N
715	29	801	94	831	233	91	791	2017-04-24 01:33:30	2017-04-24 01:33:30	\N
716	23	799	800	445	59	630	143	2017-04-24 01:33:30	2017-04-24 01:34:36	\N
717	49	802	809	826	59	94	143	2017-04-24 01:33:30	2017-04-24 01:35:56	\N
718	15	799	802	822	59	445	143	2017-04-24 01:33:30	2017-04-24 01:35:05	\N
719	44	799	801	822	59	792	143	2017-04-24 01:33:30	2017-04-24 01:33:30	\N
720	9	799	801	822	59	766	233	2017-04-24 01:33:30	2017-04-24 01:33:30	\N
721	18	799	812	584	59	764	142	2017-04-24 01:33:30	2017-04-24 01:35:42	\N
722	63	800	799	811	445	59	143	2017-04-30 03:51:26	2017-04-30 03:51:26	\N
723	60	799	811	59	445	526	233	2017-04-30 03:51:26	2017-04-30 03:51:26	\N
724	61	799	802	826	59	445	143	2017-04-30 03:51:26	2017-04-30 03:51:26	\N
725	330	812	822	373	831	423	59	2017-04-30 03:51:26	2017-04-30 05:03:34	\N
726	332	802	59	445	812	630	376	2017-05-04 18:02:24	2017-05-04 18:02:24	\N
727	97	802	59	766	809	143	791	2017-05-04 18:02:24	2017-05-04 18:02:24	\N
728	84	799	59	445	812	142	423	2017-05-04 18:02:24	2017-05-04 18:02:24	\N
729	333	799	831	186	812	800	376	2017-05-04 18:02:24	2017-05-04 18:02:24	\N
730	78	799	59	445	526	811	423	2017-05-04 18:02:24	2017-05-04 18:02:24	\N
731	83	799	59	198	812	800	423	2017-05-04 18:02:24	2017-05-04 18:02:24	\N
732	73	802	59	445	812	630	376	2017-05-04 18:02:24	2017-05-04 18:02:24	\N
733	331	802	59	445	791	630	376	2017-05-04 18:02:24	2017-05-04 18:02:24	\N
734	78	799	59	811	445	423	526	2017-05-04 18:24:16	2017-05-04 18:24:16	\N
735	76	802	59	811	445	297	831	2017-05-04 18:24:16	2017-05-04 18:24:16	\N
736	72	799	663	812	445	297	350	2017-05-04 18:24:16	2017-05-04 18:24:16	\N
737	84	799	663	812	445	297	350	2017-05-04 18:24:16	2017-05-04 18:24:16	\N
738	83	802	59	233	445	748	94	2017-05-04 18:24:16	2017-05-04 18:24:16	\N
739	73	800	59	809	445	752	630	2017-05-04 18:24:16	2017-05-04 18:24:16	\N
740	79	799	59	812	445	143	802	2017-05-04 18:24:16	2017-05-04 18:24:16	\N
741	71	802	59	809	376	143	302	2017-05-04 18:24:16	2017-05-04 18:24:16	\N
742	81	802	59	792	822	809	143	2017-05-04 18:36:14	2017-05-04 18:36:14	\N
743	83	802	59	445	812	630	791	2017-05-04 18:36:14	2017-05-04 18:36:14	\N
744	78	799	766	445	812	297	233	2017-05-04 18:36:14	2017-05-04 18:36:14	\N
745	88	799	59	423	812	831	807	2017-05-04 18:36:14	2017-05-04 18:36:14	\N
746	334	800	59	526	508	811	807	2017-05-04 18:36:14	2017-05-04 18:36:14	\N
747	73	800	59	445	547	630	810	2017-05-04 18:36:14	2017-05-04 18:36:14	\N
748	335	800	59	445	812	799	807	2017-05-04 18:36:14	2017-05-04 18:36:14	\N
749	80	802	59	445	812	811	807	2017-05-04 18:36:14	2017-05-04 18:36:14	\N
750	73	800	809	445	549	324	752	2017-05-04 20:12:01	2017-05-04 20:12:01	\N
751	83	802	59	445	812	630	822	2017-05-04 20:12:01	2017-05-04 20:12:01	\N
752	336	802	59	233	812	630	831	2017-05-04 20:12:01	2017-05-04 20:12:01	\N
753	332	802	59	445	812	630	143	2017-05-04 20:12:01	2017-05-04 20:12:01	\N
754	338	802	59	445	812	630	376	2017-05-04 20:12:01	2017-05-04 20:12:01	\N
755	337	799	59	59	812	198	350	2017-05-04 20:12:01	2017-05-04 20:12:01	\N
756	81	802	59	445	811	799	818	2017-05-04 20:12:01	2017-05-04 20:12:01	\N
757	85	799	59	445	811	800	423	2017-05-04 20:12:01	2017-05-04 20:12:01	\N
758	61	799	800	59	445	811	143	2017-05-07 02:48:53	2017-05-07 02:48:53	\N
759	63	802	791	59	445	831	130	2017-05-07 02:48:53	2017-05-07 02:48:53	\N
760	56	799	800	59	764	766	233	2017-05-07 02:48:53	2017-05-07 02:48:53	\N
761	70	799	822	59	445	831	233	2017-05-07 02:48:53	2017-05-07 02:48:53	\N
762	68	799	802	59	143	826	233	2017-05-07 02:52:00	2017-05-07 02:52:00	\N
763	104	799	811	59	553	822	807	2017-05-07 02:52:00	2017-05-07 02:52:00	\N
764	339	800	766	59	831	822	820	2017-05-07 02:52:00	2017-05-07 03:03:55	\N
765	340	799	800	445	130	426	462	2017-05-07 02:52:00	2017-05-07 02:52:00	\N
766	133	809	811	812	833	131	80	2017-05-11 21:05:25	2017-05-11 21:05:25	\N
767	135	802	812	818	445	59	630	2017-05-11 21:05:25	2017-05-11 21:05:25	\N
768	341	800	462	233	526	766	833	2017-05-11 21:05:25	2017-05-11 21:05:25	\N
769	342	800	426	59	748	831	792	2017-05-11 21:05:25	2017-05-11 21:05:25	\N
770	308	799	812	297	198	445	40	2017-05-11 21:05:25	2017-05-11 21:05:25	\N
771	343	801	445	59	462	55	279	2017-05-11 21:05:25	2017-05-11 21:05:25	\N
772	344	799	812	445	779	423	186	2017-05-11 21:05:25	2017-05-11 21:05:25	\N
773	345	233	445	748	59	792	782	2017-05-11 21:05:25	2017-05-11 21:05:25	\N
774	308	799	445	297	584	198	826	2017-05-11 21:10:37	2017-05-11 21:10:37	\N
775	134	799	811	445	233	831	59	2017-05-11 21:10:37	2017-05-11 21:10:37	\N
776	133	799	812	59	766	764	233	2017-05-11 21:10:37	2017-05-11 21:10:37	\N
777	346	802	809	812	445	59	628	2017-05-11 21:10:37	2017-05-11 21:10:37	\N
778	342	799	800	811	426	445	59	2017-05-11 21:20:45	2017-05-11 21:20:45	\N
779	347	799	809	807	811	445	766	2017-05-11 21:20:45	2017-05-11 21:20:45	\N
780	348	802	809	143	376	324	779	2017-05-11 21:20:45	2017-05-11 21:20:45	\N
781	349	801	811	423	565	59	526	2017-05-11 21:20:45	2017-05-11 21:20:45	\N
782	350	811	706	764	35	324	792	2017-05-11 21:20:45	2017-05-11 21:20:45	\N
783	351	799	812	445	59	423	526	2017-05-11 21:20:45	2017-05-11 21:20:45	\N
784	352	801	809	462	212	55	279	2017-05-11 21:20:45	2017-05-11 21:20:45	\N
785	353	445	706	91	423	785	630	2017-05-11 21:20:45	2017-05-11 21:20:45	\N
786	128	549	324	235	474	143	774	2017-05-11 21:26:42	2017-05-11 21:26:42	\N
787	289	800	130	445	822	831	59	2017-05-11 21:26:42	2017-05-11 21:26:42	\N
788	309	799	811	445	59	831	233	2017-05-11 21:26:42	2017-05-11 21:26:42	\N
789	354	800	462	59	445	35	133	2017-05-11 21:26:42	2017-05-11 21:26:42	\N
790	10	799	587	709	143	55	279	2017-05-11 21:32:32	2017-05-11 21:32:32	\N
791	16	800	809	426	91	59	791	2017-05-11 21:32:32	2017-05-11 21:32:32	\N
792	33	474	235	764	143	324	774	2017-05-11 21:32:32	2017-05-11 21:32:32	\N
793	27	792	448	833	143	766	778	2017-05-11 21:32:32	2017-05-11 21:32:32	\N
794	355	799	802	142	59	792	774	2017-05-11 21:32:32	2017-05-11 21:32:32	\N
795	15	799	802	445	59	822	143	2017-05-11 21:32:32	2017-05-11 21:32:32	\N
796	23	799	802	445	59	826	143	2017-05-11 21:32:32	2017-05-11 21:32:32	\N
797	356	799	800	812	59	445	426	2017-05-11 21:32:32	2017-05-11 21:32:32	\N
798	27	800	809	810	59	235	788	2017-05-11 21:37:50	2017-05-11 21:37:50	\N
799	16	779	297	448	734	737	740	2017-05-11 21:37:50	2017-05-11 21:37:50	\N
800	6	809	59	791	831	233	143	2017-05-11 21:37:50	2017-05-11 21:37:50	\N
801	2	800	809	143	59	445	426	2017-05-11 21:37:50	2017-05-11 21:37:50	\N
802	10	800	809	143	324	233	549	2017-05-11 21:37:50	2017-05-11 21:37:50	\N
803	292	800	812	376	59	445	426	2017-05-11 21:37:50	2017-05-11 21:37:50	\N
804	23	799	811	94	445	59	198	2017-05-11 21:37:50	2017-05-11 21:37:50	\N
805	33	474	235	792	143	324	774	2017-05-11 21:37:50	2017-05-11 21:37:50	\N
806	17	811	807	445	526	628	791	2017-05-15 17:28:17	2017-07-12 05:29:56	\N
807	37	809	59	376	233	829	423	2017-05-15 17:28:17	2017-05-15 17:28:17	\N
808	128	474	235	143	792	324	774	2017-05-15 17:28:17	2017-05-15 17:28:17	\N
809	287	799	822	59	831	233	766	2017-05-15 17:28:17	2017-05-15 17:28:17	\N
810	68	807	549	324	779	235	143	2017-05-16 00:13:53	2017-05-16 00:13:53	\N
811	323	800	549	324	233	809	143	2017-05-16 00:13:53	2017-05-16 00:13:53	\N
812	339	800	812	59	822	766	831	2017-05-16 00:13:53	2017-05-16 00:13:53	\N
813	357	799	811	833	818	130	553	2017-05-16 00:13:53	2017-05-16 00:13:53	\N
814	1	799	811	822	831	766	764	2017-05-22 23:39:15	2017-05-22 23:39:15	\N
815	16	779	764	829	734	737	740	2017-05-22 23:39:15	2017-05-22 23:39:15	\N
816	278	800	809	445	752	324	549	2017-05-22 23:39:15	2017-05-22 23:39:15	\N
817	45	799	802	812	59	831	584	2017-05-22 23:39:15	2017-05-22 23:39:15	\N
818	358	799	800	818	59	812	526	2017-05-22 23:39:15	2017-05-22 23:39:15	\N
819	3	800	809	810	59	235	143	2017-05-22 23:39:15	2017-05-22 23:39:15	\N
820	359	799	800	812	445	59	426	2017-05-22 23:39:15	2017-05-22 23:39:15	\N
821	290	799	809	445	748	279	55	2017-05-22 23:39:15	2017-05-22 23:39:15	\N
822	276	799	800	812	59	445	426	2017-05-22 23:47:49	2017-05-22 23:47:49	\N
823	1	799	811	822	831	766	764	2017-05-22 23:47:49	2017-05-22 23:47:49	\N
824	103	800	809	779	68	324	549	2017-05-22 23:47:49	2017-05-22 23:47:49	\N
825	16	799	800	809	811	445	426	2017-05-22 23:47:49	2017-05-22 23:47:49	\N
826	49	799	802	812	822	59	143	2017-05-22 23:47:49	2017-05-22 23:47:49	\N
827	27	800	809	810	59	235	630	2017-05-22 23:47:49	2017-05-22 23:47:49	\N
828	23	799	802	445	59	143	630	2017-05-22 23:47:49	2017-05-22 23:47:49	\N
829	359	799	800	812	445	59	426	2017-05-22 23:47:49	2017-05-22 23:47:49	\N
830	3	800	809	549	324	143	792	2017-05-23 18:05:02	2017-05-23 18:05:02	1er Lugar Premier Challenge Sao Paulo International Championships
831	341	799	802	811	59	445	143	2017-05-23 18:16:08	2017-05-23 18:16:08	\N
832	133	800	462	426	59	445	143	2017-05-23 18:16:08	2017-05-23 18:16:08	\N
833	17	802	826	628	59	791	143	2017-05-23 18:16:08	2017-05-23 18:16:08	\N
834	360	800	809	426	59	445	462	2017-05-23 18:16:08	2017-05-23 18:16:37	\N
835	135	802	812	630	59	445	196	2017-05-23 18:16:08	2017-05-23 18:16:08	\N
836	9	800	809	426	59	445	143	2017-05-23 18:16:08	2017-05-23 18:16:08	\N
837	342	799	812	807	737	445	198	2017-05-23 18:16:08	2017-05-23 18:16:08	\N
838	134	799	811	233	59	445	831	2017-05-23 18:16:08	2017-05-23 18:16:08	\N
839	33	474	235	324	549	143	774	2017-05-23 18:24:13	2017-05-23 18:24:13	\N
840	124	802	812	462	143	474	59	2017-05-23 18:24:13	2017-05-23 18:24:13	\N
841	49	802	799	811	330	198	59	2017-05-23 18:24:13	2017-05-23 18:24:13	\N
842	6	809	233	822	143	445	59	2017-05-23 18:24:13	2017-05-23 18:24:13	\N
843	17	802	791	772	826	143	59	2017-05-23 18:24:13	2017-05-23 18:24:13	\N
844	361	811	445	791	777	279	369	2017-05-23 18:24:13	2017-05-23 18:24:13	\N
845	362	740	628	829	777	196	149	2017-05-23 18:24:13	2017-05-23 18:24:13	\N
846	4	799	800	811	445	59	734	2017-05-23 18:24:13	2017-05-23 18:24:13	\N
847	363	799	818	445	59	198	766	2017-05-25 00:39:59	2017-05-25 00:39:59	\N
848	100	799	445	59	143	811	547	2017-05-25 00:39:59	2017-05-25 00:39:59	\N
849	364	799	445	233	812	831	279	2017-05-25 00:39:59	2017-05-25 00:39:59	\N
850	83	474	779	324	764	235	774	2017-05-25 00:39:59	2017-05-25 00:39:59	\N
851	365	799	445	233	812	800	186	2017-05-25 00:39:59	2017-05-25 00:39:59	\N
852	76	474	779	324	764	235	774	2017-05-25 00:39:59	2017-05-25 00:39:59	\N
853	253	799	59	474	143	826	822	2017-05-25 00:39:59	2017-05-25 00:39:59	\N
854	366	445	59	800	426	791	91	2017-05-25 00:39:59	2017-05-25 00:39:59	\N
855	121	800	810	59	426	233	764	2017-05-25 15:26:39	2017-05-25 15:26:39	\N
856	68	799	802	59	826	233	143	2017-05-25 15:26:39	2017-05-25 15:26:39	\N
857	57	799	800	59	811	445	143	2017-05-25 15:26:39	2017-05-25 15:26:39	\N
858	70	801	807	59	426	811	423	2017-05-25 15:26:39	2017-05-25 15:26:39	\N
859	323	800	809	324	549	233	143	2017-05-25 15:26:39	2017-05-25 15:26:39	\N
860	63	799	800	59	811	233	808	2017-05-25 15:26:39	2017-05-25 15:26:39	\N
861	61	799	792	59	130	445	143	2017-05-25 15:26:39	2017-05-25 15:26:39	\N
862	60	799	800	822	130	445	831	2017-05-25 15:26:39	2017-05-25 15:26:39	\N
863	9	800	809	822	831	59	233	2017-05-30 18:29:36	2017-05-30 18:29:36	\N
864	133	799	812	808	831	279	55	2017-05-30 18:29:36	2017-05-30 18:29:36	\N
865	308	799	809	297	186	445	198	2017-05-30 18:29:36	2017-05-30 18:29:36	\N
866	134	799	802	59	831	445	233	2017-05-30 18:29:36	2017-05-30 18:29:36	\N
867	56	799	812	808	130	772	119	2017-05-31 22:17:41	2017-05-31 22:17:41	\N
868	61	799	812	233	59	764	766	2017-05-31 22:17:41	2017-05-31 22:17:41	\N
869	70	800	426	822	59	445	143	2017-05-31 22:17:41	2017-05-31 22:17:41	\N
870	63	799	812	474	235	324	55	2017-05-31 22:17:41	2017-05-31 22:17:41	\N
871	68	799	809	59	706	233	143	2017-05-31 23:44:54	2017-05-31 23:44:54	\N
872	66	802	426	59	445	233	143	2017-05-31 23:44:54	2017-05-31 23:44:54	\N
873	367	800	426	59	445	811	12	2017-05-31 23:44:54	2017-05-31 23:44:54	\N
874	93	799	826	59	791	130	831	2017-05-31 23:44:54	2017-05-31 23:44:54	\N
875	11	549	324	143	445	59	233	2017-06-02 03:57:15	2017-06-02 03:57:15	\N
876	27	801	186	373	59	233	831	2017-06-02 03:57:15	2017-06-02 03:57:15	\N
877	292	800	812	445	426	376	59	2017-06-02 03:57:15	2017-06-02 03:57:15	\N
878	368	801	462	764	772	233	423	2017-06-02 03:57:15	2017-06-02 03:57:15	\N
879	16	799	809	812	55	279	777	2017-06-02 03:57:15	2017-06-02 03:57:15	\N
880	23	799	800	764	426	65	143	2017-06-02 03:57:15	2017-06-02 03:57:15	\N
881	10	801	235	474	792	324	143	2017-06-02 03:57:15	2017-06-02 03:57:15	\N
882	26	802	547	526	791	59	212	2017-06-02 03:57:15	2017-06-02 03:57:15	\N
883	342	799	800	812	59	445	630	2017-06-02 04:00:36	2017-06-02 04:00:36	\N
884	133	800	811	807	526	758	91	2017-06-02 04:00:36	2017-06-02 04:00:36	\N
885	135	799	802	809	59	584	630	2017-06-02 04:00:36	2017-06-02 04:00:36	\N
886	308	799	809	774	186	831	753	2017-06-02 04:00:36	2017-06-02 04:00:36	\N
887	125	802	811	445	233	297	833	2017-06-05 22:07:01	2017-06-05 22:07:01	\N
888	128	799	800	445	59	233	143	2017-06-05 22:07:01	2017-06-05 22:07:01	\N
889	289	800	802	445	59	233	526	2017-06-05 22:07:01	2017-06-05 22:07:01	\N
890	127	799	811	445	59	820	822	2017-06-05 22:07:01	2017-06-05 22:07:01	\N
891	49	799	802	812	59	822	143	2017-06-05 22:13:39	2017-06-05 22:13:39	\N
892	23	799	802	809	59	445	630	2017-06-05 22:13:39	2017-06-05 22:13:39	\N
893	16	800	809	130	59	791	426	2017-06-05 22:13:39	2017-06-05 22:13:39	\N
894	29	799	80	822	59	445	423	2017-06-05 22:13:39	2017-06-05 22:13:39	\N
895	26	799	802	812	59	143	826	2017-06-05 22:13:39	2017-06-05 22:13:39	\N
896	124	799	802	812	59	143	474	2017-06-05 22:13:39	2017-06-05 22:13:39	\N
897	61	799	811	55	833	445	628	2017-06-05 22:13:39	2017-06-05 22:13:39	\N
898	226	800	811	526	59	445	233	2017-06-05 22:13:39	2017-06-05 22:13:39	\N
899	27	800	807	809	810	59	235	2017-06-05 22:19:37	2017-06-05 22:19:37	\N
900	369	799	807	812	59	766	233	2017-06-05 22:19:37	2017-06-05 22:19:37	\N
901	14	802	792	324	833	227	445	2017-06-05 22:19:37	2017-06-05 22:19:37	\N
902	61	800	809	549	324	792	143	2017-06-05 22:19:37	2017-06-05 22:19:37	\N
903	1	774	764	549	324	474	235	2017-06-05 22:19:37	2017-06-05 22:19:37	\N
904	11	121	59	549	324	445	233	2017-06-05 22:19:37	2017-06-05 22:19:37	\N
905	49	799	802	812	59	143	822	2017-06-05 22:19:37	2017-06-05 22:19:37	\N
906	8	800	811	143	59	445	426	2017-06-05 22:19:37	2017-06-05 22:19:37	\N
907	61	799	811	807	373	833	297	2017-06-11 00:36:17	2017-06-11 00:36:17	\N
908	64	800	809	445	59	792	143	2017-06-11 00:36:17	2017-06-11 00:36:17	\N
909	56	799	800	812	59	233	526	2017-06-11 00:36:17	2017-06-11 00:36:17	\N
910	63	802	811	445	59	630	526	2017-06-11 00:36:17	2017-06-11 00:36:17	\N
911	68	800	474	445	59	630	143	2017-06-12 00:09:13	2017-06-12 00:09:13	\N
912	63	800	474	235	324	549	774	2017-06-12 00:09:13	2017-06-12 00:09:13	\N
913	56	799	800	812	59	233	526	2017-06-12 00:09:13	2017-06-12 00:09:13	\N
914	64	800	809	445	59	792	143	2017-06-12 00:09:13	2017-06-12 00:09:13	\N
915	28	800	807	812	324	549	663	2017-06-13 22:16:02	2017-06-13 22:16:02	\N
916	14	801	809	59	376	233	171	2017-06-13 22:16:02	2017-06-13 22:16:02	\N
917	275	799	800	812	59	233	526	2017-06-13 22:16:02	2017-06-13 22:16:02	\N
918	291	807	808	822	445	791	628	2017-06-13 22:16:02	2017-06-13 22:16:02	\N
919	56	799	800	812	445	833	130	2017-06-25 03:35:42	2017-06-25 03:35:42	\N
920	61	59	799	807	811	373	297	2017-06-25 03:35:42	2017-06-25 03:35:42	\N
921	225	807	233	766	812	799	59	2017-06-25 03:35:42	2017-06-25 03:35:42	\N
922	59	143	782	445	799	709	448	2017-06-25 03:35:42	2017-06-25 03:35:42	\N
923	323	809	800	324	549	792	143	2017-06-25 21:08:15	2017-06-25 21:08:15	\N
924	57	800	799	811	445	59	143	2017-06-25 21:08:15	2017-06-25 21:08:15	\N
925	60	833	445	799	812	130	800	2017-06-25 21:08:15	2017-06-25 21:28:20	\N
926	70	807	811	59	801	426	423	2017-06-25 21:08:15	2017-06-25 21:08:15	\N
927	61	799	59	130	812	764	807	2017-06-26 19:42:34	2017-06-26 19:42:34	\N
928	323	809	800	324	549	233	143	2017-06-26 19:42:34	2017-06-26 19:42:34	\N
929	225	807	233	766	812	799	59	2017-06-26 19:42:34	2017-06-26 19:42:34	\N
930	66	802	426	445	233	59	143	2017-06-26 19:42:34	2017-06-26 19:42:34	\N
931	133	800	445	59	130	795	822	2017-07-12 01:51:34	2017-07-12 01:51:34	\N
932	346	802	445	59	812	809	628	2017-07-12 01:51:34	2017-07-12 01:51:34	\N
933	370	802	445	764	831	198	822	2017-07-12 01:51:34	2017-07-12 01:51:34	\N
934	134	800	445	59	812	799	630	2017-07-12 01:51:34	2017-07-12 01:51:34	\N
935	9	800	809	549	324	445	752	2017-07-12 01:54:52	2017-07-12 01:54:52	\N
936	26	801	186	373	59	831	233	2017-07-12 01:54:52	2017-07-12 01:54:52	\N
937	134	802	799	445	59	831	233	2017-07-12 01:54:52	2017-07-12 01:54:52	\N
938	135	802	808	812	59	630	791	2017-07-12 01:54:52	2017-07-12 01:54:52	\N
939	37	809	807	811	59	233	423	2017-07-12 02:15:46	2017-07-12 02:15:46	Top12 North America International Championships 2017
940	124	820	822	802	812	59	807	2017-07-12 02:39:29	2017-07-12 02:39:29	\N
941	17	811	799	445	55	628	833	2017-07-12 02:39:29	2017-07-12 05:28:51	\N
942	304	799	445	130	59	831	233	2017-07-12 02:39:29	2017-07-13 04:37:58	\N
943	371	737	508	423	831	200	756	2017-07-12 02:39:29	2017-07-13 04:59:44	\N
944	124	799	802	812	474	59	143	2017-07-12 02:46:57	2017-07-12 02:46:57	\N
945	26	799	802	59	212	297	423	2017-07-12 02:46:57	2017-07-12 02:46:57	\N
946	14	800	807	822	791	59	373	2017-07-12 02:46:57	2017-07-12 02:46:57	\N
947	17	811	807	445	526	628	833	2017-07-12 02:46:57	2017-07-12 02:46:57	\N
948	23	799	802	809	445	59	630	2017-07-12 02:46:57	2017-07-12 02:46:57	\N
949	29	799	801	807	373	376	822	2017-07-12 02:46:57	2017-07-13 04:35:49	\N
950	16	800	809	810	807	630	445	2017-07-12 02:46:57	2017-07-12 02:46:57	\N
951	27	800	809	807	810	59	235	2017-07-12 02:46:57	2017-07-13 04:36:31	\N
952	17	811	807	445	526	628	833	2017-07-12 02:51:38	2017-07-12 02:51:38	\N
953	122	799	800	812	809	59	426	2017-07-12 02:51:38	2017-07-12 02:51:38	\N
954	15	799	822	630	59	445	143	2017-07-12 02:51:38	2017-07-12 02:51:38	\N
955	361	474	235	324	549	774	143	2017-07-12 02:51:38	2017-07-12 03:19:50	\N
956	103	799	800	812	549	324	143	2017-07-12 02:53:31	2017-07-12 02:53:31	\N
957	368	801	279	462	233	376	59	2017-07-12 02:53:31	2017-07-12 02:53:31	\N
958	17	811	807	445	526	628	833	2017-07-12 02:59:19	2017-07-12 02:59:19	\N
959	23	799	802	809	445	59	630	2017-07-12 02:59:19	2017-07-12 02:59:19	\N
960	33	474	235	779	324	764	774	2017-07-12 02:59:20	2017-07-12 02:59:20	\N
961	27	799	800	807	373	376	143	2017-07-12 02:59:20	2017-07-12 02:59:20	\N
962	16	800	809	807	810	445	630	2017-07-12 03:06:39	2017-07-12 03:06:39	\N
963	27	800	809	807	810	235	630	2017-07-12 03:06:39	2017-07-12 03:28:36	\N
964	288	800	810	740	547	59	376	2017-07-13 04:34:07	2017-07-13 04:34:07	\N
965	130	800	811	833	445	59	80	2017-07-13 04:34:07	2017-07-13 04:34:07	\N
966	125	799	279	130	706	802	376	2017-07-13 04:34:07	2017-07-13 04:34:07	\N
967	372	799	445	822	324	792	143	2017-07-13 04:34:07	2017-07-13 04:34:35	\N
968	304	799	802	812	811	833	526	2017-07-27 19:25:02	2017-07-27 19:25:02	\N
969	165	799	807	811	808	445	526	2017-07-27 19:25:02	2017-07-27 19:26:16	\N
970	14	799	822	445	130	777	831	2017-07-27 19:25:02	2017-07-27 19:25:02	\N
971	12	799	800	809	549	324	445	2017-07-27 19:25:02	2017-07-27 19:25:02	\N
972	124	799	802	812	59	474	143	2017-07-27 19:25:02	2017-07-27 19:25:02	\N
973	17	807	811	373	628	833	526	2017-07-27 19:25:02	2017-07-27 19:25:02	\N
974	1	706	462	792	143	297	233	2017-07-27 19:25:02	2017-07-27 19:25:02	\N
975	37	809	807	811	59	233	423	2017-07-27 19:25:02	2017-07-27 19:25:02	\N
976	93	799	800	812	376	279	55	2017-09-03 01:14:07	2017-09-03 01:14:07	\N
977	113	80	233	297	324	423	462	2017-09-03 01:14:07	2017-09-03 01:14:07	\N
978	68	799	809	630	445	143	59	2017-09-03 01:14:07	2017-09-03 01:14:07	\N
979	373	799	143	833	445	350	233	2017-09-03 01:14:07	2017-09-03 01:14:07	\N
980	63	799	807	811	59	445	143	2017-09-03 01:26:21	2017-09-03 01:26:21	\N
981	60	799	800	812	59	445	822	2017-09-03 01:26:21	2017-09-03 01:30:49	\N
982	375	799	818	302	113	782	792	2017-09-03 01:26:21	2017-09-03 01:26:21	\N
983	374	799	734	740	59	764	233	2017-09-03 01:26:21	2017-09-03 01:26:21	\N
984	37	807	808	59	376	423	233	2017-09-04 20:46:27	2017-09-04 20:51:47	\N
985	17	807	526	811	833	373	628	2017-09-04 20:46:27	2017-09-04 20:46:27	\N
986	49	799	802	811	833	553	547	2017-09-04 20:46:27	2017-09-04 20:46:27	\N
987	1	799	130	811	833	445	547	2017-09-04 20:46:27	2017-09-04 20:46:27	\N
988	14	799	297	279	55	445	792	2017-09-04 20:46:27	2017-09-04 20:46:27	\N
989	3	801	807	811	59	373	297	2017-09-04 20:46:27	2017-09-04 20:50:29	\N
990	276	802	812	822	59	445	630	2017-09-04 20:46:27	2017-09-04 20:50:41	\N
991	36	799	800	812	59	445	426	2017-09-04 20:46:27	2017-09-04 20:50:54	\N
992	56	799	802	811	833	373	143	2017-09-09 23:15:10	2017-09-09 23:16:31	\N
993	63	799	55	811	833	445	628	2017-09-09 23:15:11	2017-09-09 23:16:11	\N
994	60	799	826	811	833	373	143	2017-09-09 23:15:11	2017-09-09 23:17:11	\N
995	283	799	802	811	833	445	547	2017-09-09 23:15:11	2017-09-09 23:17:47	\N
996	323	799	811	130	833	143	822	2017-09-09 23:52:08	2017-09-09 23:52:08	\N
997	93	799	800	831	233	764	59	2017-09-09 23:52:08	2017-09-09 23:52:08	\N
998	340	130	324	549	235	79	445	2017-09-09 23:52:08	2017-09-09 23:52:08	\N
999	90	800	810	59	142	445	822	2017-09-09 23:52:08	2017-09-09 23:52:08	\N
1000	125	802	811	233	297	833	376	2017-09-10 16:23:08	2017-09-10 17:12:36	\N
1001	289	59	297	811	799	423	792	2017-09-10 16:23:08	2017-09-10 16:23:08	\N
1002	127	826	812	799	802	59	143	2017-09-10 16:23:08	2017-09-10 16:23:08	\N
1003	376	807	799	376	373	808	423	2017-09-10 16:23:08	2017-09-10 16:23:08	\N
1004	315	799	802	59	826	143	792	2017-09-10 19:13:48	2017-09-10 19:13:48	\N
1005	355	799	802	59	811	445	423	2017-09-10 19:13:48	2017-09-10 19:13:48	\N
1006	290	799	376	130	362	55	279	2017-09-10 19:13:48	2017-09-10 19:13:48	\N
1007	377	799	818	94	826	143	811	2017-09-10 19:13:48	2017-09-10 19:13:48	\N
1008	291	800	809	807	445	791	628	2017-09-10 19:13:48	2017-09-10 19:13:48	\N
1009	358	802	807	811	445	833	630	2017-09-10 19:13:48	2017-09-10 19:13:48	\N
1010	1	799	811	833	445	143	547	2017-09-10 19:13:48	2017-09-10 19:13:48	\N
1011	275	799	800	445	59	376	630	2017-09-10 19:13:48	2017-09-10 19:13:48	\N
1012	17	807	526	628	373	811	833	2017-09-11 02:14:49	2017-09-11 02:17:58	\N
1013	3	800	809	752	445	549	324	2017-09-11 02:14:49	2017-09-11 02:18:55	\N
1014	37	799	350	233	297	812	59	2017-09-11 02:14:49	2017-09-11 02:14:49	\N
1015	379	799	630	800	445	812	59	2017-09-11 02:14:49	2017-09-11 02:19:31	\N
1016	361	802	792	143	791	812	59	2017-09-11 02:14:49	2017-09-11 02:14:49	\N
1017	124	799	143	474	802	812	59	2017-09-11 02:14:49	2017-09-11 02:14:49	\N
1018	378	471	822	474	764	807	59	2017-09-11 02:14:49	2017-09-11 02:22:48	\N
1019	22	801	350	831	297	811	833	2017-09-11 02:14:49	2017-09-11 02:21:05	\N
1020	380	799	811	822	59	445	143	2017-09-12 00:38:36	2017-09-12 00:38:36	\N
1021	133	799	811	807	833	445	130	2017-09-12 00:38:36	2017-09-12 00:38:36	\N
1022	134	799	811	807	59	445	792	2017-09-12 00:38:36	2017-09-12 00:38:36	\N
1023	381	799	811	807	812	445	526	2017-09-12 00:38:36	2017-09-12 00:38:36	\N
1024	93	799	376	779	526	373	445	2017-09-16 23:00:42	2017-09-16 23:00:42	\N
1025	323	799	811	130	833	822	143	2017-09-16 23:00:42	2017-09-16 23:00:58	\N
1026	104	799	811	807	59	822	553	2017-09-16 23:00:42	2017-09-16 23:00:42	\N
1027	382	802	812	831	59	474	423	2017-09-16 23:00:42	2017-09-16 23:00:42	\N
1028	63	799	807	811	445	59	143	2017-09-18 16:28:54	2017-09-18 16:28:54	\N
1029	383	799	802	811	445	833	547	2017-09-18 16:28:54	2017-09-18 16:28:54	\N
1030	56	799	807	811	373	833	794	2017-09-18 16:28:54	2017-09-18 16:28:54	\N
1031	384	800	801	462	553	279	831	2017-09-18 16:28:54	2017-09-18 16:28:54	\N
1032	293	799	445	59	822	811	143	2017-09-19 01:38:17	2017-09-19 01:38:17	\N
1033	355	799	445	59	802	811	423	2017-09-19 01:38:17	2017-09-19 01:38:17	\N
1034	26	799	764	59	801	233	297	2017-09-19 01:38:17	2017-09-19 01:38:17	\N
1035	37	233	812	833	350	811	297	2017-09-19 01:38:17	2017-09-19 01:38:17	\N
1036	49	779	448	324	526	811	297	2017-09-19 01:38:17	2017-09-19 01:38:17	\N
1037	385	779	445	324	549	462	800	2017-09-19 01:38:17	2017-09-19 01:40:06	\N
1038	371	39	706	508	526	811	423	2017-09-19 01:38:17	2017-09-19 01:38:17	\N
1039	386	799	445	59	350	812	800	2017-09-19 01:38:17	2017-09-19 01:40:38	\N
\.


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cano
--

SELECT pg_catalog.setval('teams_id_seq', 1, false);


--
-- Data for Name: tops; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY tops (id, team1_id, team2_id, team3_id, team4_id, team5_id, team6_id, team7_id, team8_id, nombre_torneo, tipo_torneo, country, created_at, updated_at, formato, fecha) FROM stdin;
1	1	2	3	4	5	6	7	8	Premier Challenge Santiago Winter Series #2	Premier	CL	2016-12-15 03:35:32	2016-12-15 03:35:32	VGC17	2016-12-11
2	9	10	11	12	13	14	15	16	Premier Challenge Talca Winter Series #1	Premier	CL	2016-12-15 03:50:21	2016-12-15 03:50:21	VGC17	2016-12-10
3	17	18	19	20	21	22	23	24	Premier Challenge Santiago Winter Series #1	Premier	CL	2016-12-15 04:26:00	2016-12-15 04:26:38	VGC17	2016-12-03
4	25	26	27	28	29	30	31	32	Regional-Nacional 2015	Regional	CL	2016-12-15 16:04:41	2016-12-15 16:04:41	VGC15	2015-06-27
5	33	34	35	36	37	38	39	40	Regional #1 2016	Regional	CL	2016-12-15 16:44:21	2016-12-15 16:44:21	VGC16	2016-01-23
6	41	42	43	44	45	46	47	48	Nacional 2016	Nacional	CL	2016-12-15 20:06:21	2016-12-15 20:06:21	VGC16	2016-06-26
7	49	50	51	52	53	54	55	56	MSS #1 2016	MSS	CL	2016-12-16 00:35:23	2016-12-16 00:35:23	VGC16	2016-04-16
8	57	58	59	60	61	62	63	64	Regional #2 2016	Regional	CL	2016-12-16 01:34:03	2016-12-16 01:34:03	VGC16	2016-05-14
9	65	66	67	68	69	70	71	72	MSS #2 2016	MSS	CL	2016-12-16 01:50:23	2016-12-16 01:50:23	VGC16	2016-04-29
10	73	74	75	76	77	78	79	80	MSS #3 2016	MSS	CL	2016-12-16 01:56:14	2016-12-16 01:56:14	VGC16	2016-04-30
11	81	82	83	84	85	86	87	88	Premier Challenge Santiago Winter Series #3	Premier	CL	2016-12-19 20:54:51	2016-12-19 20:54:51	VGC17	2016-12-17
12	89	90	91	92	\N	\N	\N	\N	Premier Challenge M.A.D.A. Winter Series #1	Premier	EC	2016-12-20 06:57:05	2016-12-20 06:57:05	VGC17	2016-12-03
13	93	94	95	96	\N	\N	\N	\N	Premier Challenge Dojonator Winter Series #1	Premier	EC	2016-12-20 07:00:18	2016-12-20 07:00:18	VGC17	2016-12-11
14	97	98	99	100	\N	\N	\N	\N	Premier Challenge MrPenguin Winter Series #1	Premier	EC	2016-12-20 07:02:46	2016-12-20 07:02:46	VGC17	2016-12-17
15	101	102	103	104	\N	\N	\N	\N	Premier Challenge Dante Winter Series #1	Premier	EC	2016-12-20 07:07:17	2016-12-20 07:07:17	VGC17	2016-12-19
16	105	106	107	108	109	110	111	112	Premier Challenge Costa Rica Winter Series #3	Premier	CR	2016-12-20 13:51:25	2016-12-20 13:51:25	VGC17	2016-12-18
17	113	114	115	116	117	118	119	120	Premier Challenge Costa Rica Winter Series #2	Premier	CR	2016-12-20 14:20:42	2016-12-20 14:20:42	VGC17	2016-12-11
18	121	122	123	124	125	126	127	128	 Premier Challenge Costa Rica Winter Series #1	Premier	CR	2016-12-20 14:40:12	2016-12-20 14:40:12	VGC17	2016-12-04
19	129	130	131	132	133	134	135	136	Regional #1 2016	Regional	EC	2016-12-20 17:04:50	2016-12-20 17:04:50	VGC16	2016-05-22
20	137	138	139	140	141	142	143	144	MSS #1 2016	MSS	EC	2016-12-20 17:29:19	2016-12-20 17:29:19	VGC16	2016-04-09
21	145	146	147	148	149	150	151	152	Regional #1 2016	Regional	CR	2016-12-20 17:56:33	2016-12-20 17:56:33	VGC16	2016-05-15
22	153	154	155	156	157	158	159	160	Regional #2 2016	Regional	CR	2016-12-20 18:23:15	2016-12-20 18:23:15	VGC16	2016-05-29
23	176	177	178	179	\N	\N	\N	\N	Premier Challenge Kyo Winter Series #1	Premier	EC	2016-12-23 04:19:06	2016-12-23 04:19:06	VGC17	2016-12-20
24	180	181	182	183	184	185	186	187	Premier Challenge Winter Series PKMN Perú #3	Premier	PE	2016-12-24 08:32:07	2016-12-24 08:32:07	VGC17	2016-12-18
25	188	189	190	191	\N	\N	\N	\N	Premier Challenge Kyo Winter Series #2	Premier	EC	2017-01-08 03:45:17	2017-01-08 03:45:17	VGC17	2017-01-07
26	192	193	194	195	\N	\N	\N	\N	Premier Challenge Dante Winter Series #2	Premier	EC	2017-01-08 22:35:07	2017-01-08 22:35:07	VGC17	2017-01-08
27	196	197	198	199	\N	\N	\N	\N	Premier Challenge MrPenguin Winter Series #2	Premier	EC	2017-01-09 17:00:43	2017-01-09 17:00:43	VGC17	2017-01-07
28	200	201	202	203	\N	\N	\N	\N	Premier Challenge Dojonator Winter Series #2	Premier	EC	2017-01-09 17:02:29	2017-01-09 17:02:29	VGC17	2017-01-08
29	204	205	206	207	208	209	210	211	Premier Challenge Santiago Anibal Winter Series #2	Premier	CL	2017-01-12 01:37:33	2017-01-12 01:37:33	VGC17	2017-01-07
30	212	213	214	215	216	217	218	219	2017 MidSeason Showdown [Kyo Winter Series] #1	MSS	EC	2017-01-16 02:43:56	2017-01-16 02:43:56	VGC17	2017-01-14
31	220	221	222	223	224	225	226	227	MSS Marcelo Winter Series	MSS	CL	2017-01-22 03:29:40	2017-01-22 03:29:40	VGC17	2017-01-14
32	228	229	230	231	\N	\N	\N	\N	2017 MidSeason Showdown [MrPenguin Winter Series] #1	MSS	EC	2017-01-23 14:54:27	2017-01-23 14:54:27	VGC17	2017-01-21
33	232	233	234	235	236	237	238	239	Premier Challenge Santiago Marcelo Winter Series #2	Premier	CL	2017-01-24 02:31:38	2017-01-24 02:31:38	VGC17	2017-01-15
34	240	241	242	243	244	245	246	247	Premier Antofagasta Winter Series #1	Premier	CL	2017-01-24 02:43:26	2017-01-24 02:43:26	VGC17	2017-01-20
35	248	249	250	251	252	253	254	255	Premier Talca Winter Series #2	Premier	CL	2017-01-24 02:50:31	2017-01-24 02:50:31	VGC17	2017-01-21
36	256	257	258	259	\N	\N	\N	\N	Premier Challenge M.A.D.A. Winter Series #2	Premier	EC	2017-01-28 22:45:21	2017-01-28 22:45:21	VGC17	2017-01-28
37	260	261	262	263	264	265	266	267	MSS CDMX Winter Series	MSS	MX	2017-01-31 19:37:56	2017-01-31 19:37:56	VGC17	2017-01-29
38	268	269	270	271	272	273	274	275	Premier Challenge CDMX Winter Series #1	Premier	MX	2017-01-31 19:50:16	2017-01-31 19:50:16	VGC17	2017-01-14
39	276	277	278	279	280	281	282	283	Premier Challenge Buenos Aires Winter Series 	Premier	AR	2017-01-31 20:11:08	2017-01-31 20:11:08	VGC17	2017-01-21
40	284	285	286	287	288	289	290	291	MSS Buenos Aires - Muy Lejano Winter Series	MSS	AR	2017-01-31 20:23:32	2017-01-31 20:23:32	VGC17	2017-01-29
41	292	293	294	295	296	297	298	299	MSS Santiago - Liga pop Winter Series	MSS	CL	2017-01-31 20:31:56	2017-01-31 20:31:56	VGC17	2017-01-28
42	300	301	302	303	304	305	306	307	Premier Challenge Santiago - Liga pop Winter Series	Premier	CL	2017-01-31 20:37:16	2017-01-31 20:37:16	VGC17	2017-01-29
43	308	309	310	311	\N	\N	\N	\N	Premier Challenge N-Sports Winter Series #2	Premier	PE	2017-02-01 14:40:13	2017-02-01 14:40:13	VGC17	2017-01-28
44	312	313	314	315	\N	\N	\N	\N	Premier Challenge PKMN Perú Winter Series #6	Premier	PE	2017-02-01 14:45:16	2017-02-01 14:45:16	VGC17	2017-01-29
45	316	317	318	319	320	321	322	323	Premier Challenge PPL Winter Series #2	Premier	PE	2017-02-01 15:09:49	2017-02-01 15:09:49	VGC17	2017-01-27
46	324	325	326	327	328	329	330	331	Premier Challenge Winter Series PPE #2	Premier	PE	2017-02-01 15:21:31	2017-02-01 15:21:31	VGC17	2017-01-21
47	332	333	334	335	336	337	338	339	Premier Challenge Winter Series PPL #1	Premier	PE	2017-02-01 18:09:12	2017-02-01 18:09:12	VGC17	2017-01-20
48	340	341	342	343	\N	\N	\N	\N	Premier Challenge Winter Series Poketrainers Trujillo	Premier	PE	2017-02-01 18:13:03	2017-02-01 18:13:03	VGC17	2017-01-14
49	344	345	346	347	348	349	350	351	Premier Challenge Winter Series PKMN Perú #5	Premier	PE	2017-02-01 18:26:04	2017-02-01 18:26:04	VGC17	2016-12-30
50	352	353	354	355	356	357	358	359	Premier Challenge Winter Series PKMN Perú #4	Premier	PE	2017-02-01 18:35:15	2017-02-01 18:35:15	VGC17	2016-12-26
51	360	361	362	363	\N	\N	\N	\N	Premier Challenge Winter Series PPE #1	Premier	PE	2017-02-01 18:45:31	2017-02-01 18:45:31	VGC17	2016-12-17
52	364	365	366	367	368	369	370	371	Premier Challenge Winter Series ENE #1	Premier	PE	2017-02-01 18:52:41	2017-02-01 18:52:41	VGC17	2016-12-10
53	372	373	374	375	376	377	378	379	Torneo Premier #1 - VGC2017	Premier	BO	2017-02-02 23:08:57	2017-02-02 23:08:57	VGC17	2016-12-11
54	380	381	382	383	384	385	386	387	Torneo Premier #2 Winter Series, La Paz-Bolivia	Premier	BO	2017-02-02 23:20:16	2017-02-02 23:20:16	VGC17	2016-12-12
55	388	389	390	391	392	393	394	395	Torneo Premier - La Paz, Bolivia	Premier	BO	2017-02-02 23:28:17	2017-02-02 23:28:17	VGC17	2017-01-15
56	396	397	398	399	400	401	402	403	Torneo Premier - La Paz, Bolivia	Premier	BO	2017-02-02 23:38:14	2017-02-02 23:38:14	VGC17	2017-01-18
57	404	405	406	407	408	409	410	411	2017 Premier Challenge #2 - Cochabamba, Bolivia	Premier	BO	2017-02-02 23:48:27	2017-02-02 23:48:27	VGC17	2017-01-28
58	412	413	414	415	\N	\N	\N	\N	Premier Challenge Kyo Winter Series #3	Premier	EC	2017-02-12 00:56:24	2017-02-12 00:56:24	VGC17	2017-02-11
59	416	417	418	419	420	421	422	423	MSS Liga Fancross Winter Series	MSS	AR	2017-02-15 22:00:24	2017-02-15 22:00:24	VGC17	2017-02-12
60	424	425	426	427	428	429	430	431	MSS Medellín Winter Series	MSS	CO	2017-02-15 22:09:01	2017-02-15 22:09:01	VGC17	2017-02-12
61	432	433	434	435	436	437	438	439	MSS Paraguay Winter Series	MSS	PY	2017-02-15 22:18:54	2017-02-15 22:18:54	VGC17	2017-01-29
62	440	441	442	443	\N	\N	\N	\N	Premier Challenge Rio de Janeiro	Premier	BR	2017-02-15 22:28:05	2017-02-15 22:28:05	VGC17	2017-02-04
63	444	445	446	447	448	449	450	451	Premier Challenge Cali Winter Series	Premier	CO	2017-02-15 22:35:17	2017-02-15 22:35:17	VGC17	2017-01-28
64	452	453	454	455	456	457	458	459	MSS El Salvador	MSS	SV	2017-02-15 22:43:39	2017-02-15 22:43:39	VGC17	2017-01-21
65	460	461	462	463	464	465	466	467	Premier Challenge Bogotá Winter Series	Premier	CO	2017-02-15 22:55:13	2017-02-15 22:55:13	VGC17	2017-01-21
66	468	469	470	471	472	473	474	475	MSS Buenos Aires - Dima Games	MSS	AR	2017-02-24 01:33:23	2017-02-24 01:33:23	VGC17	2017-02-18
67	476	477	478	479	480	481	482	483	MSS Bogotá - Maloka Mundo Geek	MSS	CO	2017-02-24 01:46:40	2017-02-24 01:46:40	VGC17	2017-02-19
68	484	485	486	487	\N	\N	\N	\N	Premier Challenge Viña del Mar Winter Series	Premier	CL	2017-02-24 01:52:33	2017-02-24 01:52:33	VGC17	2017-02-18
69	488	489	490	491	492	493	494	495	Premier Challenge Talca Febrero	Premier	CL	2017-02-24 02:02:12	2017-02-24 02:02:12	VGC17	2017-02-19
70	496	497	498	499	500	501	502	503	Premier Challenge Santiago - Pokeñoños Febrero	Premier	CL	2017-02-24 02:13:23	2017-02-24 02:13:23	VGC17	2017-02-12
71	504	505	506	507	\N	\N	\N	\N	Premier Challenge MrPenguin Winter Series #3	Premier	EC	2017-02-25 17:33:55	2017-02-25 17:33:55	VGC17	2017-02-24
72	508	509	510	511	512	513	514	515	MSS Medellín #2	MSS	CO	2017-02-27 04:32:11	2017-02-27 04:32:11	VGC17	2017-02-26
73	516	517	518	519	520	521	522	523	MSS Antofagasta Winter Series	MSS	CL	2017-02-27 04:40:09	2017-02-27 04:40:09	VGC17	2017-02-25
74	524	525	526	527	\N	\N	\N	\N	Premier Challenge Dojonator Winter Series #3	Premier	EC	2017-02-28 20:06:54	2017-02-28 20:06:54	VGC17	2017-02-28
75	528	529	530	531	\N	\N	\N	\N	Premier Challenge Viña del Mar Febrero	Premier	CL	2017-03-01 02:10:35	2017-03-01 02:10:35	VGC17	2017-02-28
76	532	533	534	535	\N	\N	\N	\N	Premier Challenge Big Box #3 Winter Series	Premier	CL	2017-03-07 19:48:59	2017-03-07 19:48:59	VGC17	2017-02-24
77	536	537	538	539	540	541	542	543	MSS The Big Box Winter Series	MSS	CL	2017-03-07 19:54:41	2017-03-07 19:54:41	VGC17	2017-03-04
78	544	545	546	547	548	549	550	551	Premier Challenge Big Box #4 Winter Series	Premier	CL	2017-03-07 20:03:12	2017-03-07 20:03:12	VGC17	2017-03-05
79	552	553	554	555	556	557	558	559	MSS Cyber Plaza	MSS	PE	2017-03-07 20:18:35	2017-03-07 20:18:35	VGC17	2017-03-04
80	560	561	562	563	564	565	566	567	MSS Mangalianza Winter Series	MSS	CO	2017-03-07 20:37:36	2017-03-07 20:37:36	VGC17	2017-03-04
83	576	577	578	579	\N	\N	\N	\N	Premier Challenge Dojonator Winter Series #4	Premier	EC	2017-03-12 18:21:12	2017-03-12 18:21:12	VGC17	2017-03-11
84	580	581	582	583	\N	\N	\N	\N	2017 MidSeason Showdown [Monitos Winter Series] #1	MSS	EC	2017-03-12 18:30:22	2017-03-12 18:30:22	VGC17	2017-03-11
85	586	587	588	589	590	591	592	593	Premier Challenge Marzo Lerion Winter Series	Premier	CL	2017-03-15 17:16:36	2017-03-15 17:16:36	VGC17	2017-03-12
86	594	595	596	597	\N	\N	\N	\N	Premier Challenge Dima Game Winter Series Marzo	Premier	AR	2017-03-22 21:10:03	2017-03-22 21:10:03	VGC17	2017-03-11
87	598	599	600	601	\N	\N	\N	\N	MSS Buenos Aires - Urza Comics	MSS	AR	2017-03-22 21:16:51	2017-03-22 21:16:51	VGC17	2017-03-04
88	602	603	604	605	\N	\N	\N	\N	Premier Challenge Viña del Mar Winter #2	Premier	CL	2017-03-25 21:19:54	2017-03-25 21:19:54	VGC17	2017-03-25
89	606	607	608	609	610	611	612	613	MSS Talca -Metalblast- Winter Series	MSS	CL	2017-03-25 22:31:58	2017-03-25 22:31:58	VGC17	2017-03-18
90	614	615	616	617	\N	\N	\N	\N	Premier challenge Talca #3	Premier	CL	2017-03-25 22:37:27	2017-03-25 22:37:27	VGC17	2017-03-19
91	618	619	620	621	\N	\N	\N	\N	Premier Challenge Antofagasta #3	Premier	CL	2017-03-25 22:43:00	2017-03-25 22:43:00	VGC17	2017-03-18
92	622	623	624	625	626	627	628	629	MSS Lima Marzo	MSS	PE	2017-03-30 01:38:17	2017-03-30 01:38:17	VGC17	2017-03-26
93	630	631	632	633	634	635	636	637	Regional '17 Argentina	Regional	AR	2017-03-30 01:46:50	2017-03-30 01:46:50	VGC17	2017-03-25
94	638	639	640	641	642	643	644	645	Open Peru #1	Special Event	PE	2017-04-04 18:17:54	2017-04-04 18:17:54	VGC17	2017-03-25
95	646	647	648	649	\N	\N	\N	\N	MidSeason Showdown [Kyo Spring Series]	MSS	EC	2017-04-09 02:18:16	2017-04-09 02:18:16	VGC17	2017-04-08
96	650	651	652	653	654	655	656	657	Chile Open #1	Special Event	CL	2017-04-10 03:22:04	2017-04-10 03:22:04	VGC17	2017-04-08
97	658	659	660	661	\N	\N	\N	\N	Paraguay Open	Special Event	PY	2017-04-10 19:18:18	2017-04-10 19:18:18	VGC17	2017-04-09
98	662	663	664	665	666	667	668	669	Colombia Open	Special Event	CO	2017-04-10 19:25:07	2017-04-10 19:25:07	VGC17	2017-04-08
99	670	671	672	673	674	675	676	677	Argentina Open	Special Event	AR	2017-04-11 17:19:56	2017-04-11 17:19:56	VGC17	2017-04-08
100	678	679	680	681	\N	\N	\N	\N	2017 Premier Challenge [Kyo Spring Series] #1	Premier	EC	2017-04-15 23:26:35	2017-04-15 23:26:35	VGC17	2017-04-15
101	682	683	684	685	686	687	688	689	MidSeason Showdown [Dojonator Winter Series] #2	MSS	EC	2017-04-16 01:31:48	2017-04-16 01:31:48	VGC17	2017-03-25
102	690	691	692	693	\N	\N	\N	\N	Premier Challenge [Dante Spring Series] #1	Premier	EC	2017-04-16 01:37:35	2017-04-16 01:37:35	VGC17	2017-04-15
103	694	695	696	697	698	699	700	701	Premier Challenge The Big Box Spring Series #1	Premier	CL	2017-04-16 03:57:56	2017-04-16 03:57:56	VGC17	2017-04-01
104	702	703	704	705	706	707	708	709	Premier Challenge, Viña del Mar Spring Series #1	Premier	CL	2017-04-22 23:29:56	2017-04-22 23:29:56	VGC17	2017-04-22
105	710	711	712	713	\N	\N	\N	\N	Premier Challenge [MrPenguin Spring Series] #1	Premier	EC	2017-04-23 01:28:51	2017-04-23 01:28:51	VGC17	2017-04-22
106	714	715	716	717	718	719	720	721	Premier Challenge, Daisuki Spring Series #1	Premier	CL	2017-04-24 01:33:30	2017-04-24 01:33:30	VGC17	2017-04-23
107	722	723	724	725	\N	\N	\N	\N	Premier Challenge [MADA Spring Series] #1	Premier	EC	2017-04-30 03:51:26	2017-04-30 03:51:26	VGC17	2017-04-29
108	726	727	728	729	730	731	732	733	Midseason Showdown Costa Rica Winter Series #1	MSS	CR	2017-05-04 18:02:24	2017-05-04 18:02:24	VGC17	2017-01-08
109	734	735	736	737	738	739	740	741	 Midseason Showdown Costa Rica Winter Series #2	MSS	CR	2017-05-04 18:24:16	2017-05-04 18:24:16	VGC17	2017-01-15
110	742	743	744	745	746	747	748	749	Premier Challenge Costa Rica Winter Series #4	Premier	CR	2017-05-04 18:36:14	2017-05-04 18:36:14	VGC17	2017-01-19
111	750	751	752	753	754	755	756	757	Premier Challenge Costa Rica Winter Series #5	Premier	CR	2017-05-04 20:12:01	2017-05-04 20:12:01	VGC17	2017-01-22
112	758	759	760	761	\N	\N	\N	\N	MidSeason Showdown [Potato Spring Series]	MSS	EC	2017-05-07 02:48:53	2017-05-07 02:48:53	VGC17	2017-05-06
113	762	763	764	765	\N	\N	\N	\N	Premier Challenge [MrPenguin Spring Series] #2	Premier	EC	2017-05-07 02:52:00	2017-05-07 02:52:00	VGC17	2017-05-06
114	766	767	768	769	770	771	772	773	Premier Challenge Eon Winter Series #1	Premier	CL	2017-05-11 21:05:25	2017-05-11 21:05:25	VGC17	2017-03-26
115	774	775	776	777	\N	\N	\N	\N	Premier Challenge Eon Spring Series #1	Premier	CL	2017-05-11 21:10:37	2017-05-11 21:10:37	VGC17	2017-04-30
116	778	779	780	781	782	783	784	785	Premier Challenge Eon Spring Series #2 Valdivia	Premier	CL	2017-05-11 21:20:45	2017-05-11 21:20:45	VGC17	2017-05-06
117	786	787	788	789	\N	\N	\N	\N	Premier Challenge Antofagasta Spring Series #2	Premier	CL	2017-05-11 21:26:42	2017-05-11 21:26:42	VGC17	2017-05-06
118	790	791	792	793	794	795	796	797	Premier Challenge The Big Box Spring Series #2	Premier	CL	2017-05-11 21:32:32	2017-05-11 21:32:32	VGC17	2017-05-06
119	798	799	800	801	802	803	804	805	Premier Challenge Daisuki Spring Series #2	Premier	CL	2017-05-11 21:37:50	2017-05-11 21:37:50	VGC17	2017-05-07
120	806	807	808	809	\N	\N	\N	\N	MSS AES Antofagasta Spring Series	MSS	CL	2017-05-15 17:28:17	2017-05-15 17:28:17	VGC17	2017-05-13
121	810	811	812	813	\N	\N	\N	\N	MidSeason Showdown [MrPenguin Spring Series]	MSS	EC	2017-05-16 00:13:53	2017-05-16 00:13:53	VGC17	2017-05-13
122	814	815	816	817	818	819	820	821	Premier Challenge BarQuest Quilpué Spring Series #2	Premier	CL	2017-05-22 23:39:15	2017-05-22 23:39:15	VGC17	2017-05-21
123	822	823	824	825	826	827	828	829	MSS BarQuest Quilpué Spring Series	MSS	CL	2017-05-22 23:47:49	2017-05-22 23:47:49	VGC17	2017-05-20
124	831	832	833	834	835	836	837	838	Premier Challenge MetalBlast Spring Series #1	Premier	CL	2017-05-23 18:16:08	2017-05-23 18:16:08	VGC17	2017-04-29
125	839	840	841	842	843	844	845	846	Premier Challenge Lerion Spring Series #1	Premier	CL	2017-05-23 18:24:13	2017-05-23 18:24:13	VGC17	2017-04-30
126	847	848	849	850	851	852	853	854	El Salvador Open	Special Event	SV	2017-05-25 00:39:59	2017-05-25 00:39:59	VGC17	2017-05-21
127	855	856	857	858	859	860	861	862	2017 VGC Ecuador Open Challenge #1	Special Event	EC	2017-05-25 15:26:39	2017-05-25 15:26:39	VGC17	2017-05-21
128	863	864	865	866	\N	\N	\N	\N	MSS MetalBlast Spring Series	Premier	CL	2017-05-30 18:29:36	2017-05-30 18:29:36	VGC17	2017-05-27
129	867	868	869	870	\N	\N	\N	\N	Premier Challenge [Dante Spring Series] #2	Premier	EC	2017-05-31 22:17:41	2017-05-31 22:17:41	VGC17	2017-05-29
130	871	872	873	874	\N	\N	\N	\N	Premier Challenge [Dojonator Spring Series] #2	Premier	EC	2017-05-31 23:44:54	2017-05-31 23:44:54	VGC17	2017-05-29
131	875	876	877	878	879	880	881	882	Premier Challenge Lerion Spring Series #2	Premier	CL	2017-06-02 03:57:15	2017-06-02 03:57:15	VGC17	2017-05-28
132	883	884	885	886	\N	\N	\N	\N	Premier Challenge MetalBlast Spring Series #2	Premier	CL	2017-06-02 04:00:36	2017-06-02 04:00:36	VGC17	2017-05-28
133	887	888	889	890	\N	\N	\N	\N	Premier Challenge Antofagasta AES Spring Series #2	Premier	CL	2017-06-05 22:07:01	2017-06-05 22:07:01	VGC17	2017-05-27
134	891	892	893	894	895	896	897	898	Regional Chile VGC17	Regional	CL	2017-06-05 22:13:39	2017-06-05 22:13:39	VGC17	2017-06-03
135	899	900	901	902	903	904	905	906	MSS Big Bang Spring Series	MSS	CL	2017-06-05 22:19:37	2017-06-05 22:19:37	VGC17	2017-06-04
136	907	908	909	910	\N	\N	\N	\N	2017 Ecuador Open Challenge #2	Special Event	EC	2017-06-11 00:36:17	2017-06-11 00:36:17	VGC17	2017-06-10
137	911	912	913	914	\N	\N	\N	\N	MidSeason Showdown [Dante Spring Series]	MSS	EC	2017-06-12 00:09:13	2017-06-12 00:09:13	VGC17	2017-06-11
138	915	916	917	918	\N	\N	\N	\N	Premier Challenge Viña del Mar Spring Series #3	Premier	CL	2017-06-13 22:16:02	2017-06-13 22:16:02	VGC17	2017-06-11
139	919	920	921	922	\N	\N	\N	\N	2017 Ecuador Open Challenge #4	Special Event	EC	2017-06-25 03:35:42	2017-06-25 03:35:42	VGC17	2017-06-24
140	923	924	925	926	\N	\N	\N	\N	2017 Ecuador Open Challenge #5	Special Event	EC	2017-06-25 21:08:15	2017-06-25 21:08:15	VGC17	2017-06-25
141	927	928	929	930	\N	\N	\N	\N	2017 Ecuador Open Challenge #3	Special Event	EC	2017-06-26 19:42:34	2017-06-26 19:42:34	VGC17	2017-06-17
142	931	932	933	934	\N	\N	\N	\N	Premier Challenge Eon Spring Series #3	Premier	CL	2017-07-12 01:51:34	2017-07-12 01:51:34	VGC17	2017-06-25
143	935	936	937	938	\N	\N	\N	\N	Premier Challenge MetalBlast Spring Series #3	Premier	CL	2017-07-12 01:54:52	2017-07-12 01:54:52	VGC17	2017-06-24
144	940	941	942	943	\N	\N	\N	\N	Premier Challenge Big Box Spring Series #3	Premier	CL	2017-07-12 02:39:29	2017-07-12 02:39:29	VGC17	2017-06-10
145	944	945	946	947	948	949	950	951	Chile Open #2	Special Event	CL	2017-07-12 02:46:57	2017-07-12 02:46:57	VGC17	2017-06-17
146	952	953	954	955	\N	\N	\N	\N	Premier Challenge Lerion Spring Series #3	Premier	CL	2017-07-12 02:51:38	2017-07-12 02:51:38	VGC17	2017-06-11
147	956	957	\N	\N	\N	\N	\N	\N	Premier Challenge Daisuki Spring Series #3	Premier	CL	2017-07-12 02:53:31	2017-07-12 02:53:31	VGC17	2017-06-26
148	958	959	960	961	\N	\N	\N	\N	MSS Lerion Spring Series	MSS	CL	2017-07-12 02:59:20	2017-07-12 02:59:20	VGC17	2017-06-24
149	962	963	\N	\N	\N	\N	\N	\N	MSS Big Box Spring Series	MSS	CL	2017-07-12 03:06:39	2017-07-12 03:06:39	VGC17	2017-06-18
150	964	965	966	967	\N	\N	\N	\N	Premier Challenge Mitrox Spring Series #3	Premier	CL	2017-07-13 04:34:07	2017-07-13 04:34:07	VGC17	2017-07-13
151	968	969	970	971	972	973	974	975	Invitacional Chile 2017	Otro	CL	2017-07-27 19:25:02	2017-07-27 19:25:02	VGC17	2017-07-22
152	976	977	978	979	\N	\N	\N	\N	Midseason Showdown - [Dojonator Autumn Series]	MSS	EC	2017-09-03 01:14:07	2017-09-03 01:14:07	VGC17	2017-09-02
153	980	981	982	983	\N	\N	\N	\N	Premier Challenge, Guayaquil [Kyo Autumn Series] #1	Premier	EC	2017-09-03 01:26:21	2017-09-03 01:26:21	VGC17	2017-09-02
154	984	985	986	987	988	989	990	991	MSS House of Cards Autumn Series	MSS	CL	2017-09-04 20:46:27	2017-09-04 20:46:27	VGC17	2017-09-03
155	992	993	994	995	\N	\N	\N	\N	MidSeason Showdown, Guayaquil [Kyo Autumn Series]	MSS	EC	2017-09-09 23:15:11	2017-09-09 23:15:11	VGC17	2017-09-09
156	996	997	998	999	\N	\N	\N	\N	Premier Challenge, Quito [Dojonator Autumn Series] #1	Premier	EC	2017-09-09 23:52:08	2017-09-09 23:52:08	VGC17	2017-09-09
157	1000	1001	1002	1003	\N	\N	\N	\N	Premier Challenge #1 AES Autumn Series - Antofagasta	Premier	CL	2017-09-10 16:23:08	2017-09-10 16:23:08	VGC17	2017-09-10
158	1004	1005	1006	1007	1008	1009	1010	1011	Premier Challenge PTV Autumn Series #1	Premier	CL	2017-09-10 19:13:48	2017-09-10 19:13:48	VGC17	2017-09-09
159	1012	1013	1014	1015	1016	1017	1018	1019	Premier Challenge Autumn Series - The Big Box #1	Premier	CL	2017-09-11 02:14:49	2017-09-11 02:14:49	VGC17	2017-09-10
160	1020	1021	1022	1023	\N	\N	\N	\N	Autumn Series - Curicó #1	Premier	CL	2017-09-12 00:38:36	2017-09-12 00:38:36	VGC17	2017-09-09
161	1024	1025	1026	1027	\N	\N	\N	\N	MidSeason Showdown, Quito [MrPenguin Autumn Series]	MSS	EC	2017-09-16 23:00:42	2017-09-16 23:00:42	VGC17	2017-09-16
162	1028	1029	1030	1031	\N	\N	\N	\N	Premier Challenge, Guayaquil [RedFury Autumn Series] #1	Premier	EC	2017-09-18 16:28:54	2017-09-18 16:28:54	VGC17	2017-09-17
163	1032	1033	1034	1035	1036	1037	1038	1039	Premier Challenge Autumn Series - Imperio Games #1	Premier	CL	2017-09-19 01:38:17	2017-09-19 01:38:17	VGC17	2017-09-16
\.


--
-- Name: tops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cano
--

SELECT pg_catalog.setval('tops_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY users (id, provider, uid, name, image, token, expires_at, created_at, updated_at, banned, admin, mod) FROM stdin;
1	twitter	64297652	Alejandro Díaz	http://pbs.twimg.com/profile_images/889617978869895168/UPrwkZHG_normal.jpg	64297652-S0o2icy7fg4HC6Og2yBYEFQFacBY5NfVAwqZpnHFR	\N	2017-09-22 02:27:19.516831	2017-09-22 02:27:19.516831	\N	\N	f
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cano
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: cano
--

COPY votes (id, votable_type, votable_id, voter_type, voter_id, vote_flag, vote_scope, vote_weight, created_at, updated_at) FROM stdin;
\.


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cano
--

SELECT pg_catalog.setval('votes_id_seq', 1, false);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: cano
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: cano
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: pokemonsets_pkey; Type: CONSTRAINT; Schema: public; Owner: cano
--

ALTER TABLE ONLY pokemonsets
    ADD CONSTRAINT pokemonsets_pkey PRIMARY KEY (id);


--
-- Name: recursos_pkey; Type: CONSTRAINT; Schema: public; Owner: cano
--

ALTER TABLE ONLY recursos
    ADD CONSTRAINT recursos_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: cano
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: public; Owner: cano
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: tops_pkey; Type: CONSTRAINT; Schema: public; Owner: cano
--

ALTER TABLE ONLY tops
    ADD CONSTRAINT tops_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: cano
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: votes_pkey; Type: CONSTRAINT; Schema: public; Owner: cano
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: index_pokemonsets_on_cached_votes_down; Type: INDEX; Schema: public; Owner: cano
--

CREATE INDEX index_pokemonsets_on_cached_votes_down ON pokemonsets USING btree (cached_votes_down);


--
-- Name: index_pokemonsets_on_cached_votes_score; Type: INDEX; Schema: public; Owner: cano
--

CREATE INDEX index_pokemonsets_on_cached_votes_score ON pokemonsets USING btree (cached_votes_score);


--
-- Name: index_pokemonsets_on_cached_votes_total; Type: INDEX; Schema: public; Owner: cano
--

CREATE INDEX index_pokemonsets_on_cached_votes_total ON pokemonsets USING btree (cached_votes_total);


--
-- Name: index_pokemonsets_on_cached_votes_up; Type: INDEX; Schema: public; Owner: cano
--

CREATE INDEX index_pokemonsets_on_cached_votes_up ON pokemonsets USING btree (cached_votes_up);


--
-- Name: index_pokemonsets_on_cached_weighted_average; Type: INDEX; Schema: public; Owner: cano
--

CREATE INDEX index_pokemonsets_on_cached_weighted_average ON pokemonsets USING btree (cached_weighted_average);


--
-- Name: index_pokemonsets_on_cached_weighted_score; Type: INDEX; Schema: public; Owner: cano
--

CREATE INDEX index_pokemonsets_on_cached_weighted_score ON pokemonsets USING btree (cached_weighted_score);


--
-- Name: index_pokemonsets_on_cached_weighted_total; Type: INDEX; Schema: public; Owner: cano
--

CREATE INDEX index_pokemonsets_on_cached_weighted_total ON pokemonsets USING btree (cached_weighted_total);


--
-- Name: index_votes_on_votable_id_and_votable_type_and_vote_scope; Type: INDEX; Schema: public; Owner: cano
--

CREATE INDEX index_votes_on_votable_id_and_votable_type_and_vote_scope ON votes USING btree (votable_id, votable_type, vote_scope);


--
-- Name: index_votes_on_voter_id_and_voter_type_and_vote_scope; Type: INDEX; Schema: public; Owner: cano
--

CREATE INDEX index_votes_on_voter_id_and_voter_type_and_vote_scope ON votes USING btree (voter_id, voter_type, vote_scope);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

