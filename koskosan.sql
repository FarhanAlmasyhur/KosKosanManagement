PGDMP     	    	                x            koskosan    12.4    13.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    33221    koskosan    DATABASE     h   CREATE DATABASE koskosan WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE koskosan;
                postgres    false            �            1259    41460    log_tamu    TABLE     �   CREATE TABLE public.log_tamu (
    id_tamu integer NOT NULL,
    nama character varying(20) NOT NULL,
    tanggal timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    room_no integer NOT NULL
);
    DROP TABLE public.log_tamu;
       public         heap    postgres    false            �            1259    41458    log_tamu_id_tamu_seq    SEQUENCE     �   CREATE SEQUENCE public.log_tamu_id_tamu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.log_tamu_id_tamu_seq;
       public          postgres    false    205                       0    0    log_tamu_id_tamu_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.log_tamu_id_tamu_seq OWNED BY public.log_tamu.id_tamu;
          public          postgres    false    204            �            1259    33302    penyewa    TABLE     �   CREATE TABLE public.penyewa (
    noktp bigint NOT NULL,
    nama character varying(50) NOT NULL,
    asal character varying(20) NOT NULL,
    room_no integer NOT NULL
);
    DROP TABLE public.penyewa;
       public         heap    postgres    false            �            1259    33267    rooms    TABLE     j   CREATE TABLE public.rooms (
    room_no integer NOT NULL,
    room_type character varying(10) NOT NULL
);
    DROP TABLE public.rooms;
       public         heap    postgres    false            �
           2604    41463    log_tamu id_tamu    DEFAULT     t   ALTER TABLE ONLY public.log_tamu ALTER COLUMN id_tamu SET DEFAULT nextval('public.log_tamu_id_tamu_seq'::regclass);
 ?   ALTER TABLE public.log_tamu ALTER COLUMN id_tamu DROP DEFAULT;
       public          postgres    false    204    205    205                      0    41460    log_tamu 
   TABLE DATA           C   COPY public.log_tamu (id_tamu, nama, tanggal, room_no) FROM stdin;
    public          postgres    false    205   �                 0    33302    penyewa 
   TABLE DATA           =   COPY public.penyewa (noktp, nama, asal, room_no) FROM stdin;
    public          postgres    false    203   :                 0    33267    rooms 
   TABLE DATA           3   COPY public.rooms (room_no, room_type) FROM stdin;
    public          postgres    false    202   y                  0    0    log_tamu_id_tamu_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.log_tamu_id_tamu_seq', 12, true);
          public          postgres    false    204            �
           2606    33306    penyewa penyewa_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.penyewa
    ADD CONSTRAINT penyewa_pkey PRIMARY KEY (noktp);
 >   ALTER TABLE ONLY public.penyewa DROP CONSTRAINT penyewa_pkey;
       public            postgres    false    203            �
           2606    33271    rooms rooms_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (room_no);
 :   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_pkey;
       public            postgres    false    202            �
           2606    41465    log_tamu log_tamu_room_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.log_tamu
    ADD CONSTRAINT log_tamu_room_no_fkey FOREIGN KEY (room_no) REFERENCES public.rooms(room_no);
 H   ALTER TABLE ONLY public.log_tamu DROP CONSTRAINT log_tamu_room_no_fkey;
       public          postgres    false    205    2698    202            �
           2606    33307    penyewa penyewa_room_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.penyewa
    ADD CONSTRAINT penyewa_room_no_fkey FOREIGN KEY (room_no) REFERENCES public.rooms(room_no);
 F   ALTER TABLE ONLY public.penyewa DROP CONSTRAINT penyewa_room_no_fkey;
       public          postgres    false    202    203    2698               5   x�34�tK,�H�S�4202�54�50S04�25�24�3654�0�4����� ��         /  x�U��N�0���S�	P�6�qM��	Q�q�XG�e�M��1��b�~�&�VsQz*$75oqF������[�kL`Q�(yO8�5^P�бf»F;��-��~�\�!���DG^�I�CB�E�*㼋q*�,o1�M�Z�mh���,��H�#ʧ�s�8A7|ք��τ�.p&�M��z&�����k��k�"C�i(�\�3%�͵Čam�r�+�9r����	��|��Zm,<V:s�C�-e&�񄗁~QVxm�2�h����>���j��#�!�|-<Z��!�<y=         4   x�3��,��2��`�L��I3N�������<.s���D0�=... t��     