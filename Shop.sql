PGDMP         4                {            Shop    14.5    14.5 (    )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
   TABLE DATA           ,   COPY public.category (id, name) FROM stdin;
    public          postgres    false    210   &)                 0    16790    image 
   TABLE DATA           :   COPY public.image (id, file_name, product_id) FROM stdin;
    public          postgres    false    212   x)                  0    16797    orders 
   TABLE DATA           d   COPY public.orders (id, count, date_time, number, price, status, person_id, product_id) FROM stdin;
    public          postgres    false    214   '/       "          0    16804    person 
   TABLE DATA           ;   COPY public.person (id, login, password, role) FROM stdin;
    public          postgres    false    216   �/       $          0    16813    product 
   TABLE DATA           k   COPY public.product (id, date_time, description, price, seller, title, warehouse, category_id) FROM stdin;
    public          postgres    false    218   l0       &          0    16823    product_cart 
   TABLE DATA           A   COPY public.product_cart (id, person_id, product_id) FROM stdin;
    public          postgres    false    220   �C       3           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 9, true);
          public          postgres    false    209            4           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 60, true);
          public          postgres    false    211            5           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 1, true);
          public          postgres    false    213            6           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 3, true);
          public          postgres    false    215            7           0    0    product_cart_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.product_cart_id_seq', 2, true);
          public          postgres    false    219            8           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 12, true);
          public          postgres    false    217               B   x�3�0�®��/l��6\l���e�ya�ņ;�BM6\�taׅ\F�f\������� Vt!�         �  x�=V9�����\|�"d�r ����[��Ysz�,$���^��i�\���u������i?����?V�����KܢnI-��:�����2�Z�2i8O�Z�r�Ҩ^�Ce��/|�&8��qq&��K>z��骇��/��"�-I�F��)F;��ӱ-��J�g�:�X?�b�=�K\6^d���e|Z/���ní ʑ�f^�h�>U;ߗ-���ѲN�=�ނf;B��omu͚/]��p�5q�e�UyE�������x)�殝V^�?�ڷѽ�n����^�Z�Z��i��q�c��~����?���D�m��P3��8���c���l/_�\S��:���̈́|�f|��i�^��c�(A�V�C'S�I�{f�q16y��עaz�P��X�!Oԏ�_������7�6�|�s�B�b�y�3bޗ�|z/-�ӭ��%���h�]OBZ������?��V=x���o�mc�<y�����2:������۩��I��c�j��^��KQcW���z8E�َ����O�����'�6��=ܥ����ů7Uwy������[A�-|7�6���Eg[	�IJ�;_��@�k�!��_n��i��EX,�|��Z �|c��IZw���T�嫟Q��w�L0�|��g�$�g��gx���B6�#���7[O>\�{C=�B ���>���ڇ�+�x;���8�m�%/_�GYH�e
�Y�g��M+U��E�З/�\��{���ěBo3'�s�[;?T���e���	轃|Y�]C�
#�B� ��*�$ZC���
k�EM���/K�+7a��'a@�H�+*���H�ꥎ��(��cX�*�l���e��ֿP����>i>ZǨi�t�ݬ}���\�t$�!(�ږHͪ*#F��/��Z+Rd=bZP���	{`�u�W��ýT=������[��E!�W�H��� �pJ,�J�/������=\�7���"'��e$�E��*�b).��i�b���U$��|�lu,z6٨،s�W��k�p.�ֱ���ng�QB+y���l��V�Y��#�k�[v�T��+�%��H#!���93d�����90�y����,_'�1���,MPƾ}�U��3k��2H-���l	�Î��@T��m������9�JĮϺ��`���v8N7]P�k���/�����l�/R��]�I)�����m���9�E�$h��;��,�Vz�L,���&�\{VEc�2��Ϝ�Uᵉ����AI�OA��؅OvŴ��-Ͷ�M���}�,>֓�l��.G��:��%�?bx�L�+_�^x�|�� �<T�X,�[ն�ņ���(_C�F�K)�_�Y�����j�,q<G����K���.��jż66���}Ԭ�;�W�y��������ƀ�          N   x�̻�0 ��p����Y��������Ո�4��6�ǭ�!p�����k��I�3�"�����3�F�����n      "   �   x�M��n�0  �sy�h�[�l��11�8�Q~
�O��b���A�ɢ�,F`څ	�f�W��茪�"�	g��r,��p�I$).����P�u����@��S���a���E��Fa�ȿ��1W���>?���T��O�7���ga�4�5���Vd����|�oh����_mN�8}y���
a��v�F�S��$�\�C6�����2���J�      $      x��[[o[ױ~��r�"I���$�O���	�s���}�+5Y
(�'yӥ�����=M�8iZ�}(�R�����_���K:�ͬ�/$��6A�{�u��7��,Ws^٫˵��l�򚷼V/��+���j.�2:��FaԏzӮ�.�K0ݛ�G=�i�Le����c�~�4w��۝�/Z�N{�m���<�y<&�I4�M�(�yi =?��/�qtIshƥ�O�O�'�d���n7M�/LC�99�a٥�;��4���:?�^l&:��Nh�m癡W|~tn��L�H���X�d�_ӷ!~�7���^��N�3�������!����]L�3���U9��O3��Vk�r����;o7�r�W4�HjH�MD)��t4W9�i�G�}�
}�K.�#+�#�O��ꢋ\�Z-c1��Z�^��������%�������!��0 �Oh��d�2ôv�����@��P�?���O��4w�[�������	M���X���&4'�����������ÏvZ��&���lo>lm�/BbR��X��PJ_�g��XmL��8��r�g�c�M~ I�>��F���"'��B(�0�������	o��}ƛ�V<��@EJX��2�r��E���L�wy���x#zfҲ�5h�	L?�Yz�3��\��6�P�{�z�������p>�D�Ķv�׎�O�%Z����I��1-�/j��vBd	J�������:~H��L��l@���.�X<��`�~Ҡ̭���v{��}��U�����3
��ilj�4.9-Kw��׎y��� a�s#��_&ɍ��@�-�©L��}#r!�{[�Ǵ�|;	���h8 ����y[���|y���5�F	��Q�5�A�larO ��|�K52�@ pȮ�O�IQ���/{�#1 >���`�>�# o��#2���yS@&k��	'8�a���خB�\|�KH�dA��-�HLh{֐f�W�:�>���R[tq��L��DPGf9e�� ��/)�b��8�ΐ$�wozFg�����4!Y�ۼ�8t�$Ӊ�S
3ܾҐ����qAd���`�!N&�V�+`�P,��L�&9b@^0i�ݱ>�>���Z��0�ڥa�0�e����Ȓq����E<F���Їq�54ߒƆ`��WV4�[Y�C���=��4��"3�;�S�ݾ��@�6O�����!}�
pĽ��
��I�o`��Թ�`�J���N���v6=p���@6?��g�z8����ś䚍�Y>�d����͚]��? msI�}َ�,��5��cg�q�T������.|��ϡ�%/��[xj�j~�Q���8#���/ bc˵����M�R�ή�֨�(��y�V��n����J�"���(R!�a�q��`!�C��Zu6��k;?�������x�s�/@Y�L.��<��z�4���WJ��r�\�iV��@��~~E��u�7��>�~C_~�*�ix�C���NF�P�t���;��@H�o�$	�Ӯ`��=���&_ؤyb�8U8t(8���F�$���Ѷ}�JH3�9
��JH1X5����Ѹ{i�®���0	V)�����(A�<;�@
"���s6}���+�v7a�Xʭ�˹�"��lۜ�a�j���9}=fp�-�@f�f�����V�xy����r��K����t˻������V�J��j�Vͽ�QG��n��p�L�W�:c�!�O?#���
�[�O���+?UOZ�Z��z�	�[i4�F�����U����-�<D����/��������	��^):#o:B���0�{=*�%��8�s)�r�����y#���@-~�b��<"i/p1R�����CI����/�dRRx��W�A�7��ACn�C)���,d!��4p���S��m��:�����b ��y���0�	�]iXh�E�,1�����e?�8.O��%��+^�u�$p�l�;P��#1?D�K^���I8o�T��[�\$�b���?�D�|P��)�)M����&��pqNY�@�������I�y� �ծ��T�vA�&,v�U�8i�c�zƂ(|���;Gv�Ó���	�,�ģ����5�s�k<��]�r��ʈ�D��R�b���Wb5�A�3/���f~B3�2��pt��,8���!RR@������1o�.� �`�lb%��[��[f���G��:�r�l��{\�P6���!N�[�u��`�
'ju0$���6�#���+�d�;��F�4'�O�F�ze�'R\F
ʹl��e+UJ��xO@��.Z��Ǽ[��&����FP�!S�d-u"1=Bd��gR)U`ٗ$�CT� 0��'�1D�?�!�����l!�6[;sb���_��f�P����1?��lܧ(�
�WF��r�g���������l~�M��:�J&,���fN:cV�l�/Hfp4��G����I���8~��.R�ϱ��T�SC�P����$o�|/%g����N����Cp=�,�x�M�4���f��<��8����Xyc>��)]:e�rrs�O)@�r�?Ig�n��y�����7�\�	�I$�����q7E�宱���s��� H������@YO��p��cn��G}�����ZG��q��S�z?�3-\�z>aQ�����sV v�Y#j�=~*1�g�C��Հ.��J�n�py�+�!�:��.��W���r���d�e������ݗ��-�h~e�Z[�WK��Օj5�5�Tye�P!@�� ��W��T^DL#Q�x�=����j�nm�����kI������_#�}�/ �G�:}&}�UM`L1�	�&	��Nk���]X8�G�ݠ8Y�VL
Z���(���Ar�{Ѭ�ܭ����$�fj��F�� ��rO����&}��hux%Q�7���VP�f 2j+�	�-��X`�WM�KH�~ r��33'�UL��0V)�Ɯ*#���#��=�⍄#[�,,qIk��5��8!S��&�ia�]�F��}̆�+�ڊ&%N�kL{�*]m�H%\��]�ۼόT�,����� ڭp]��[�t�狷�ƍ�Ͷ�%�gQ�_�׼����;�f�\�0g��;[�[��ص������߯������I#1b�D�Q0�ٽ5SY.���>��ʷ%K�� �#p��0c'��I�Φy�fg�`�������Z�5;����QD�c">��T��
3M��a�V�W	��^��6Y�z�a�Ps����:�vb,Β1��j9WY._��vhot֛�[�N��Ř�$U�p�Z#�k�k��R����Vsw���>�%6�MJV_X/r-�웘���b�v�L�5~��In��.&�tzkA�l6��]��+����ǅ3��B4˹�+�M��r(&?Ӱ�Rn��E!���ы�s��m�&�둩�L�zFjBCP6EH�����Cv����|F\�C�7�?ieV�r�?ƥ�/ゆUNlu2L�Z��Ebu([�E�T5�ψ�Ra�xM]���5�7�����P�^�Z�WV���p`|��Rĕ�����+���Jgh��l�a�H�EJ���g��Ns��v{{�<@���T>�!��s:R/w�B���#QH ��~ߕ�/m}��>E�bI/���UQ���%�Ⱦ2���+�,��#���!��k8�
I��4)r�� ���~����rJ�:��K��	��
�8fqq��FU�<JX�c~u6�,/��kT�<����:��zJ��G>��`��+��Uǆq�1�~�Pv-#���Vss{���?�����2�QheSuhYW|��3�*z�2�3ƥ�g1Se[ƁO�F,�K��,Y�,L�Y[�>-�՚�/��P�Ǚ�4c��4KB�I�L&�)y�m�V@��+O��K��q_$���@�2�ZW4�*�L䬗׼J����9���Ĵ������H;�'a�:�^A�s�>���p~6�E[ �@\B��r%�6�Q�>���������9P�Z���1?l��_)��w�zFo���h���=L��q1��v�����Â�� N  +�KsF��� �9����q9��1���
�x�Qp�A���Fɞ4	�S�OJfFac�E�ف^z�֨�@u���ȶ�5=Gl,7��ʏX�H�$�N�M�؛}�/�0Z/ٞgOx�m��f�Fo>��<�hY��
PM��~�Ӊ�b6�n�k�K3a(�1-�'��{G���$?�Zǝ,�)W0r�B��ɞ��N�f{{k�/�X�2��ٳƔ�mc�,e�|������nn�[�?�;o�o�]�����AH%!յr�T�x+��9
V�&���S�S�����jW��K�!�#��n�h�P�Ho�����a�K-U/�A����U�6�#&4��~���/��it�Z��mל)O�s�7&E�D��Z�	��Z.J"1���d�e�㘚*Z�>�]�	
����� ���ppw�O(	��
�#�ID���\�p#e��
��گ�L�O����a���S�#{�����(O#�N����,{�5ߏaBJL�b�-���A*�6�q��:�O�*��� ~k��[���Z08*Ĺ n[ɵ7{I��٪�.	GW�ٿm���Z1B��Z,hO S�#����U=�8J �g����u"K����FW�S<�5�H4�<���Gh��|v��` �rт��8n�J/ӷ=p�7>��k�h��_�b4���xe��3��˅P�fg���nu�w���N�/��=����#�[���z�Qo��k�o��sow&{��\'��q�,��ŕ���^�[������?'��]�d��4v�!�6�
�o6�PL|�o��dF�$�s�G #���#��^�� �����7�劶0?��[��~�ڵk� �^��      &      x������ � �     