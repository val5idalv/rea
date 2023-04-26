PGDMP         7                {            Shop    14.5    14.5 5    )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ,           1262    16781    Shop    DATABASE     c   CREATE DATABASE "Shop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Shop";
                postgres    false            �            1259    16783    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16782    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    210            -           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    209            �            1259    16790    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    16789    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    212            .           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    211            �            1259    16797    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16796    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    214            /           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    213            �            1259    16804    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    16803    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    216            0           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    215            �            1259    16813    product    TABLE     �  CREATE TABLE public.product (
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
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16823    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    16822    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    220            1           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    219            �            1259    16812    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    218            2           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    217            u           2604    16786    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            v           2604    16793    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            w           2604    16800 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            x           2604    16807 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            y           2604    16816 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            {           2604    16826    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220                      0    16783    category 
   TABLE DATA                 public          postgres    false    210   X9                 0    16790    image 
   TABLE DATA                 public          postgres    false    212   �9                  0    16797    orders 
   TABLE DATA                 public          postgres    false    214   �@       "          0    16804    person 
   TABLE DATA                 public          postgres    false    216   �A       $          0    16813    product 
   TABLE DATA                 public          postgres    false    218   5C       &          0    16823    product_cart 
   TABLE DATA                 public          postgres    false    220   �W       3           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 9, true);
          public          postgres    false    209            4           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 65, true);
          public          postgres    false    211            5           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 2, true);
          public          postgres    false    213            6           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 4, true);
          public          postgres    false    215            7           0    0    product_cart_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.product_cart_id_seq', 4, true);
          public          postgres    false    219            8           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 13, true);
          public          postgres    false    217            }           2606    16788    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    210                       2606    16795    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    212            �           2606    16802    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    214            �           2606    16811    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    216            �           2606    16828    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    220            �           2606    16821    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    218            �           2606    16830 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    218            �           2606    16836 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    216    3203    214            �           2606    16846 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    218    210    3197            �           2606    16841 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    3205    218    214            �           2606    16831 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    218    3205    212            �           2606    16856 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    220    218    3205            �           2606    16851 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    216    220    3203               x   x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0�®��/l��6\l�ح�i��I�Q� ��_l��hLӅ6]�ua��qa3�\\ ȆPy         �  x���M�]�E��o�0�AQ:� (\i�$��(�HR�h�����2?wh�����������?|���������6_�~�O�囷���~Y?�f��/�����}������_��O����|x��g�e� mE��6��׺ʐe���������퟾�x��Aܣ�h�����
��){+3������,��8z깴AUy��䓅jҤj�F��Y�bn8���kޤ�
uY<:��,bN@�n��+�ę���ռ���Ѻ���ڞ��@��jJ�h"$@'��Q�^�m�<����A���r�S��D�ِ6_4|-CXc%)����G֓ך=�)咍F^����SNs$��s�@���8�f �M��w�#s[15_�l@��<"��q����3�my�5㹮��G�̹SOMi�w<��4�ĭJ�_�6�v��o#�{;�a��1�nk��X=-�����}�����By���CwZ+��yՕK��s��~K)!T\Ȇ�u9�^�n�]�,�>b]V�B^u��Hw	+mL�^��+>���>ڻV�jǮ4�.c�Sp]���W|�m�O6��;����j^;��#�r�wt����~
��GVNj\�3N��倂xp���y#>�B�Ԃ��dĸ�+�3<��`$������c��Y�òe������08h����G�/+��j>��S�.#Q4ݚET�^��_����c�Y6�L�+�ϴ���R�o�\/��G��;����ܾ�-���J�Q�&��>���>��j����1��IR���"�񹍬�>�f���P�)���5�Q���Z���G�L�;;�ۧ�q��4�;h�}�m䱏s*�#��3�}�T­t�����:����c��
9�`dՑ0����%Qj᥵�q*W|�#�}�ҽG���RQ�Z>�؍�ş{^�O��Tv�=g� m�J:{�H&y��v�9�ǲ�F@��3::�I.(}�Ҏ�M����m�q���k�2��y�N�Ҵ��;;6��ЎnR�r�m;e�h�q��uOn��sh��ء#����p��J2�������P�b��ո�\o���$�V��4�z��%��6:��'&bx����,�_��1���4n#�_�,����qZ��_��t��#.��G��7��� ��3'$c�s>ѱ�r|y�Җa��N�=N�_W�C�{�-N�OC����V���}�<���·��F�q����c���J)���}�SC1v��Wϗir��<��k���O{���M���L`��t����C8���4�)����g�
-X�
��G;S�2�L�Pr�� Aa�=|�d�J�}f;�I����4���ϰ������ܤ;F��'0���"����W�������4�>���������;��$���7=;��C�����O`>>����e)ι&:r��^�{i��!C���B,:���
�pNM���$h��=C������2��΄�^���%�Hˊ�{�2t��h<�e�W�:O�kXy��͖b�V�+C�?K����:d�6�Y6�v��O8�H.�����#<���y�C`�$߸J�6�
k�x�ا�=�D}���'�4��8ƙHIgfj����ON��W�Y�x:�S�:�s��c'�'��c��ƒ�	��J�`���Q2~�������r�33֪M�y5���Q����ȗ_�>��&�re�^�8hG�����`	y�_�*�4VT;����r�bg�"�Y�#�����d=��b8�&���\�/�W_�j          �   x���=k�@�w�
mI�g�:��ܩCCH�I�ߝ��6���Gm����WBO{�?�О�0o�>�lZ/+쇐���1��ȷ8<8�q{8^R���K��.n���2����y�����~?}/��S�P�Q����h���X�2�ɴ`�{���w����rd��>Ή�W�ֿ�D��������!�T��A�L�LW)���7������1���E@� $��Ln�      "   L  x���Ko�@ཿ����tZ ]!;��
�4�ԑ����ח&Mcҥ]ޓ��/m��d���2i��i��4a�83�^p2fR7�k�uAFI8blI��3cf`7�9q�Aw�gnL�v+�����R��S,�$*�?�>�+Q� �G^���������~��VG��z�)۬�s�'�
`qέ1�)��@I������r�K��s���݄-$�r�uI�m���n���<�
�.�JWn/�S�+uɧ㌢
JEY��U�y\ؓf%��ø���o��s�w��
��s�"ݲ�F�Ԩ:I�������2N�Ezmt��`��`~��      $      x��[[o׵~7���]�"�Ë(�ʓ|i��v�(IV"b"ePt���RYv�Hq��qr��C���H#^F���/��������^��<8=-�P��={�˷�u�;��o���y���?5�b���}��X}��43�մY�4�?o�֫����Ҩ=l�6�i�Q[��6�kk�F�4k�5��W�F��ƣM��B~�����Ք�p�����L1m~T����l�0g
����b)��͗�s?�����p+�v��������Ý�E_uÖ�ϙ_Ԛf��Q���n5j�����z����-����c/����pτ>�K7����<��f�V�	�zt��_�2K���	��ӭ>��٣�3�w��I�J���6����^����;�uZ��g���ҙ���`���FZ�ݍweM�;���o����o/�{Ha��>c�@�ң��� ��.���������U9��WG�N:X���H���4߮�W����"�.=>��W�j���]|�m��m��O�����Ī�I��g����So]{獚���s��R�P*��
��d �tl�J�4�ԡ���'���1}R���$�G�XЀD���Z���f�@v�߼&drL��V]���I�m�7Ꟛ��5�s�N�6+��z��L~	)H��c+��U�ŀ;X��f��b��u}����Й_�yQVIw��~#'���B ������g����'�1z�o.�_��])}`���Sސ��r�F�␴e�C�s�7��3�qyx�v �t��|��9SK�� ��)��@0���~x?�{�Zb+?�c�ç������KO�>����'r�-�!�Ϛ\��5E���7�U��V�>ॿ�xn��)i��ō��\�ln�V�߷^Z�{�M�0!��F�W���˲d�x@<��׽����M�]͌��I��]�"fy%��̖�͈<�Ʞ¦�/�4_D��jc�wH.;l�mޖ�Fl���'�
�`���|)���=�,F�'ùZ<��ã/��e��'wڸ(N���Q��hO����PG`��-��w��m4o
�d��,f��0�X�T�;���"�A�-5�oa>b:�ț��r ������1x�oic{.x�E�I���*'��b�y�Ul�ۧ�3I�ǘ��U}:4�~�̈o��v�i�d/=����)�n_IM���0-��"U����+����q���if@���!/�3�}_��SO�J�7��a�X0�a�'��eN�*���xL��ݠ�Ljh��A%_���M�R�g>E�O��8L꫃H����'��ci��a�$pڏ�k��q� F��2��e���V�M���.49���D ��@*g��d������[:�L���|�����U�Y����p"Y��}�m^��1�ϖ�~�-����\�vg
��o�����Y+�ژl��_ ���I��ׯ��*��>�?k?
~�$lƃ�Z]�Z�U��p�s>hF�AÎ��,T�1?8����zt����9�9t�<;J�'���;�o � -��� ]�ǩ����bi>���s�Xق32b�����_�&��	_����E�6|�a���6x�y��H=`��\��]a����p�9I��2l`Av.@-(��/B��B)g@�n��.2����}&�m��
Q�E�yH�cz5}����~V !i����Ǩ
[P���(,|��h����v:|3V�7�t�>`:�%M͗�2�г)nj��a֝�Ԅ���C�����h<Z��;ժ)����R�_*�/M$o�l���v���/dg��Y�������+������5�S�h��3�R^Z���ɡeOE�$�?]�V����r�H�1�%�nxh-�E��(; .@�4�a^#taR&��3��!�fg�8|�Z@�QNEn�׽�����S�<�I j�Ȋ�M2�Z� ����X6�w��)^B�,�+��W�9<\�5/�4ștW6hs�V��/�
&���h�0�]�@��B�$m��8f�����<�y���c�Y��-$��̈́�:���f�$�#��e,r�jX"���*`��n߾��;ʩ s�����;	g�G$��j�V1���1�ٴ|�/�U	�j���ω�	�i�������d��I�e&��2�jkP u���W[N�R����؅@���l�u�Ӣ�.�?~��9���n�t�g�A0���0qN��q�	1��&�>�@�	��F����ԨL�v@���X�z���K2X���v8��s�6G�)	 Yt�Z��0阀7�
��Y0J6��AՍ���-�qB��#J�O��=n�-�K�+������-[�:�B�A��:{��6��#���+�f�;��F�4��O���[ze��ǒxF
�'}l��ekpJ8�x�A��.Z�;R�y�0iM�Q;���TE�`�j�Dbz���f�$G�2O)ItQ����H�� �c_8O��fcD [�6'�&¿]&����!ll6��6k�g��*��7�I ϙ�l����
is�;wxO�Ə��?���s9��H"�����,d�0Q���9B���G��F�$޳���Hw'Y�<Ǧfed��BH���a��j/%1�
'S��4g��*W���ʖ~C��7S6�ku� >�1�P�fq�<lI3�d�V(䢍�!!v)D�1�>L�&��
潛K��7e�J�	���붜����(�_d߽��]��L��Wb��兵Y����`b�ڽ�>���Wj�=�V?֒K_�!7Q��s=��h 0�B�c�w΂@�9I'n����W%̶r����rD6p�ڸ���"����.��MҢ�6�m��]F����Xm�����C�)}��_�����GҚ�bqv�T̖�E�<)����$0$�D�PHϒR^�J_��Ii�߾�Aļ]�W7k��5��8,���?����h�~5칎�H��֩	�2���n��~VkTת���)�r��"�����-��C�s�O���s݃���<�������j:	�<�ƍ�t�'�}s�N�I�m����
Q���B4��C�h�	+�-� ���/�J��.��H�̉�-���%-�z~D\GԟVJh�����K0��g˅��Y�� ���we�����!i��9�_ITD9%!�w+��8�3o�iWN�*�8��5�2�+�L����?R�"@/M�^�yE�~ck�n���Ѷ��hG��;`����{���?Xk6*i3���Ż��F=iwL�P�d򷗭�^u}�c�>�+�ė�� �Ǳ��h�s9�(Wݼ�r�X����	ܨ�Ǭ!�^z�Y.߼ܬ4�i3��Q	{I qTw����&�\f���F��=�|^�u�4w��V�r�(��`Z����M���y��ӱ�(����|�=?����"���X��X��V���'�a}F&�R��7��1b1;�XZ���Η��[[���)�^���o����r$��R;�e���X�5���_��8\�F�7Vlչ-���YD�}.����]T2� #��
��n틷��������C��d$��!c�;ZQ�5c���ʼ�<�5�SbR��	+��ɤ���0d7��ȶ�E����X;��/��|����Ǩ��eT���ر�2��5V�a�؂+zQq:��F�bi�$'x#��l �⠠�8��!z���BN�����v�+jpF�W⧮Q�L���m�,��y��=d@��t��طj�u� ��5�����"Z�eJ2oh\�줖:A�&Sڮ�pa����4��O�h2��Q����Ⱦ�d�ʵ���8�-P���F#0��8�1�H�����\�v<����B�I��Js��C���Ĩ�Ow�|�����j�(;_�].���o���gk)����4=����+�cW��F�c_{B]ٵ�;�onT+��fe�c�>��S|�o(�[@�Ӫw_K�Z+�I��+C�Y}�T>��0�1|��r�*�.����`,��n�	�G`���U<YEa R;J�e� ^�܇��~�Lδ�ʖI�5�xKQ�� G  �p�/bc�6J�<D׿Z�3�ۥ�b!�-�Ke�mn&�l��(����yH����i�2;�����g�����W����1�;��=;m�J�6�\X�됲}`�%nڨV��ǵ���marK�et`J�UK�G��@+S�Z�7+W6��&�3�F�+Z=@�	ӹ��Tָ�C�-��Q��1q�J� g�5��Vkd�8�ú�3(B"8��*��$mS/<��젢>�˶��=G]�/��rV%g,Y$��hI��m.� �C�g�'��6<;Ħԁa��c}Oߕ́�q��<v��}m)�Q�Hu�֩"!$v��qV/jUʗ'6�`|QJ�F��d<%�x�S��ިmnԳ�*/\�X��F��w
	33j�f�au�VY37T������H�rܺ�x�= X~����\v6_���þ�q?��8n.q�>��Ε	/z��|-b�ɦg��	]
u��sT���LJ�:~ �r�/�Ȭ�b)C�ݥ`�D�yz��-�s�	��4���x�IHr$���қ�UV\�;�O�@�)"�=ׄ�zפ���r��嵓=@�eKx/O���|q�D �:J�g�F�'%�Pf7>�:kO��C��3�9�,�K�AhM��r�O#p�v��Lm�t¹�Q�v�|���s!{�� ���T��4���'i]�(#�8��ǟl�YZ��U`���h�� �����U;�u��Tr��(����XYF�9��lZ�c�s��c�OF���������_U�&4Dve��F��a�l? �
(�F���3(�B����Q ��{v�CB��>�:nڷ��H1�]��L!��&�n9"��ޮ4�~��X7���y�m�+��r���f��|i�\*�ne����ƛ82a?��FZ��-�Q8���em�	�i�<��Kl�]���-mJ��4�E'��E�O~4$�_�R�^3���s�@�zl��{�W
%�!*�K����hgb]�)�o�J��Ii�h�X����K��������������Z�Y��n�[��N�Ye�����^�#�3�lt�����i�)���j�as��c�����̭�;W�q�]�_�sȏ      &   
   x���         