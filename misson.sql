PGDMP                       |            mission    15.4 (Debian 15.4-1.pgdg120+1)    16.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16447    mission    DATABASE     r   CREATE DATABASE mission WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE mission;
                postgres    false                        2615    16448 	   seguranca    SCHEMA        CREATE SCHEMA seguranca;
    DROP SCHEMA seguranca;
                postgres    false            �            1259    16450 	   contracts    TABLE     �   CREATE TABLE seguranca.contracts (
    id integer NOT NULL,
    empresa character varying NOT NULL,
    data_inicio date NOT NULL
);
     DROP TABLE seguranca.contracts;
    	   seguranca         heap    postgres    false    6            �            1259    16449    contracts_id_seq    SEQUENCE     �   CREATE SEQUENCE seguranca.contracts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE seguranca.contracts_id_seq;
    	   seguranca          postgres    false    6    216                       0    0    contracts_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE seguranca.contracts_id_seq OWNED BY seguranca.contracts.id;
       	   seguranca          postgres    false    215            �           2604    16453    contracts id    DEFAULT     r   ALTER TABLE ONLY seguranca.contracts ALTER COLUMN id SET DEFAULT nextval('seguranca.contracts_id_seq'::regclass);
 >   ALTER TABLE seguranca.contracts ALTER COLUMN id DROP DEFAULT;
    	   seguranca          postgres    false    215    216    216                      0    16450 	   contracts 
   TABLE DATA           @   COPY seguranca.contracts (id, empresa, data_inicio) FROM stdin;
 	   seguranca          postgres    false    216   �                  0    0    contracts_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('seguranca.contracts_id_seq', 2, true);
       	   seguranca          postgres    false    215            �           2606    16457    contracts contracts_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY seguranca.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY seguranca.contracts DROP CONSTRAINT contracts_pkey;
    	   seguranca            postgres    false    216               5   x�3�JLO,I�KO�4202�50�54�2�t*�I�-M΀	��p��qqq Z
     