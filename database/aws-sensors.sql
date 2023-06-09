PGDMP     9                    {            aws-sensors    15.3    15.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16405    aws-sensors    DATABASE     �   CREATE DATABASE "aws-sensors" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE "aws-sensors";
                postgres    false            �            1259    16452 
   arah_angin    TABLE     s   CREATE TABLE public.arah_angin (
    id bigint NOT NULL,
    value double precision,
    date character varying
);
    DROP TABLE public.arah_angin;
       public         heap    postgres    false            �            1259    16451    arah_angin_id_seq    SEQUENCE     �   ALTER TABLE public.arah_angin ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.arah_angin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16406    curah_hujan    TABLE     u   CREATE TABLE public.curah_hujan (
    id integer NOT NULL,
    value double precision,
    date character varying
);
    DROP TABLE public.curah_hujan;
       public         heap    postgres    false            �            1259    16410    curah_hujan_id_seq    SEQUENCE     �   ALTER TABLE public.curah_hujan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.curah_hujan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    16436    kecepatan_angin    TABLE     x   CREATE TABLE public.kecepatan_angin (
    id bigint NOT NULL,
    value double precision,
    date character varying
);
 #   DROP TABLE public.kecepatan_angin;
       public         heap    postgres    false            �            1259    16435    kecepatan_angin_id_seq    SEQUENCE     �   ALTER TABLE public.kecepatan_angin ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kecepatan_angin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217                      0    16452 
   arah_angin 
   TABLE DATA           5   COPY public.arah_angin (id, value, date) FROM stdin;
    public          postgres    false    219   �                 0    16406    curah_hujan 
   TABLE DATA           6   COPY public.curah_hujan (id, value, date) FROM stdin;
    public          postgres    false    214   �                 0    16436    kecepatan_angin 
   TABLE DATA           :   COPY public.kecepatan_angin (id, value, date) FROM stdin;
    public          postgres    false    217   �                  0    0    arah_angin_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.arah_angin_id_seq', 1, false);
          public          postgres    false    218                       0    0    curah_hujan_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.curah_hujan_id_seq', 1, false);
          public          postgres    false    215                       0    0    kecepatan_angin_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.kecepatan_angin_id_seq', 1, false);
          public          postgres    false    216            t           2606    16458    arah_angin arah_angin_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.arah_angin
    ADD CONSTRAINT arah_angin_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.arah_angin DROP CONSTRAINT arah_angin_pkey;
       public            postgres    false    219            p           2606    16412    curah_hujan curah_hujan_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.curah_hujan
    ADD CONSTRAINT curah_hujan_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.curah_hujan DROP CONSTRAINT curah_hujan_pkey;
       public            postgres    false    214            r           2606    16442 $   kecepatan_angin kecepatan_angin_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.kecepatan_angin
    ADD CONSTRAINT kecepatan_angin_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.kecepatan_angin DROP CONSTRAINT kecepatan_angin_pkey;
       public            postgres    false    217                  x������ � �            x������ � �            x������ � �     