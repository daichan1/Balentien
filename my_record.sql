--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO daichan;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: daichan
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO daichan;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daichan
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO daichan;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: daichan
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO daichan;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daichan
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO daichan;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: daichan
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO daichan;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daichan
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO daichan;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO daichan;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: daichan
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO daichan;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daichan
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: daichan
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO daichan;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daichan
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO daichan;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: daichan
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO daichan;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daichan
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: diary_diary; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.diary_diary (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    body text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.diary_diary OWNER TO daichan;

--
-- Name: diary_diary_id_seq; Type: SEQUENCE; Schema: public; Owner: daichan
--

CREATE SEQUENCE public.diary_diary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diary_diary_id_seq OWNER TO daichan;

--
-- Name: diary_diary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daichan
--

ALTER SEQUENCE public.diary_diary_id_seq OWNED BY public.diary_diary.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO daichan;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: daichan
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO daichan;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daichan
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO daichan;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: daichan
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO daichan;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daichan
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO daichan;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: daichan
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO daichan;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daichan
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO daichan;

--
-- Name: timer_timer; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.timer_timer (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    elapsed_time integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.timer_timer OWNER TO daichan;

--
-- Name: timer_timer_id_seq; Type: SEQUENCE; Schema: public; Owner: daichan
--

CREATE SEQUENCE public.timer_timer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timer_timer_id_seq OWNER TO daichan;

--
-- Name: timer_timer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daichan
--

ALTER SEQUENCE public.timer_timer_id_seq OWNED BY public.timer_timer.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: daichan
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    username character varying(150) NOT NULL,
    email character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    is_admin boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users_user OWNER TO daichan;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: daichan
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO daichan;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daichan
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: diary_diary id; Type: DEFAULT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.diary_diary ALTER COLUMN id SET DEFAULT nextval('public.diary_diary_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: timer_timer id; Type: DEFAULT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.timer_timer ALTER COLUMN id SET DEFAULT nextval('public.timer_timer_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add diary	8	add_diary
30	Can change diary	8	change_diary
31	Can delete diary	8	delete_diary
32	Can view diary	8	view_diary
33	Can add timer	9	add_timer
34	Can change timer	9	change_timer
35	Can delete timer	9	delete_timer
36	Can view timer	9	view_timer
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$M5mjPWgnrkf6$fMR9IcbGS4+pfAU3z6mdQA3LsOIQf6sdSxTLwaQWbFU=	2020-07-18 10:40:21.917487+09	t	daichan			chansa6225@gmail.com	t	t	2020-07-14 17:19:52.441078+09
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: diary_diary; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.diary_diary (id, title, body, created_at, updated_at, user_id) FROM stdin;
10	7月22日の日記	## 今日やったこと\r\n***\r\n- アプリ開発\r\n\t- Markdownの拡張機能の詳細を調査\r\n\t- HTMLエスケープについて調査\t\t\r\n\t- 詳細画面作成 \r\n\t- プレビュー機能の作成\r\n- 読書\r\n- 部屋掃除\r\n- 風呂掃除\r\n\r\n### アプリ開発\r\n***\r\n進捗：0/1 9/7\r\n今日はまずPythonのMarkdownの拡張機能について調べて、extraには複数の拡張機能が含まれていることがわかった。今回はそのextra・目次・改行・コードハイライトの拡張機能を追加した。Qiitaとかで使用しているMarkdown記法より機能は全然少ないが、これに凝りすぎると他の機能の作成に支障が出てくるためMarkdown記法の拡張は一旦このままにする。\r\n\r\n日記機能はほぼほぼ完成！\r\nFooterの作成をしたらトップページ(タイマー)の作成に入る\r\n\r\n### HTMLエスケープ\r\n***\r\nHTMLエスケープをちゃんと知っていなかったので、調査するいい機会になった。\r\nHTMLエスケープはHTMLの特殊記号(<, >, &, ©︎)を文字として認識するために別の文字列に変換する処理のこと。\r\nこれをすることでscriptタグが書いてあってもスクリプトは実行されずただの文字列としてHTMLに表示され、意図しないスクリプトが発火しないように制御できる。\r\n今回のアプリは、自分用の日記にしか使用ないが自由に記述できるようにしているため、HTMLエスケープを行った。\r\n\r\n### 詳細画面作成\r\n***\r\nこれはHTMLエスケープした日記本文を表示するのと、CSSでマージンとかを設定したぐらいなんでそこまで時間は掛からなかった。\r\nこれで日記の全ページの作成は完了した。細かいデザインや処理の修正は今後あると思うが一旦はミニマムで作成するのでここまででOK!\r\n\r\n### プレビュー機能\r\n***\r\nMarkdown記法でフォームに書いて表示するところまではすんなり実装できたが、プレビューはかなり苦戦した。色々調べてライブラリのバージョンの違いかな？とかAdminのプレビューを確認しに行ったりと紆余曲折あったが、原因は「form.media」をテンプレート内に記述するのを忘れていただけだった。(笑)\r\nまぁそのおかげでMarkdownのGitHubを調べたり、ドキュメント読みに行ったりして一次情報に触れることができた。やっぱりいろんな人も言ってるけど使い方やオプションを調べるにはドキュメントを見た方が早いかもしれん。(Qiitaとかはタイムラグある)\r\n※widget.htmlはまさにそれ	2020-07-23 00:35:37.939046+09	2020-07-23 11:44:38.318792+09	1
11	7月23日の日記	## 今日やったこと\r\n***\r\n- アプリ開発\r\n\t- Footerの作成\r\n\t- Statusカラムの削除\r\n- 読書\r\n- 洗濯\r\n- 風呂掃除\r\n\r\n### アプリ開発\r\n***\r\n進捗：0/1 10/7\r\n日記作成画面、編集画面のFooterを作成をするためにはテキストエリアとプレビュー欄の高さを固定するのとページがスクロールしないようにする必要があったため先にそちらを実装。\r\nそこからFooterを作成し、ユーザー選択と保存、更新ボタンを配置した。その結果、1ページに収めることができた。これで日記を長文で書いた時にいちいちページをスクロールする必要はなくなった。\r\nまた、日記にStatusカラムを追加していたけど、アプリの性質上自分だけの日記だからステータスをつける必要はないと判断したため削除。\r\nここまでは午前中で完了。\r\n次からはタイマー機能の作成に入る。\r\n\r\n### 1日を振り返って\r\n***\r\n今日は少し自分の行動に対して焦りが見えた。理由は最近自分が決めたことを守れていなかったから。\r\n\r\n睡眠習慣の改善をしていたのに、夜寝るのが1時になってしまうことが多くなってしまい、そこから他の作業に対しても集中して打ち込めず進みが遅いと感じてしまい焦りが出始めてきた。その影響で自分の情けなさを思い出してきてしまい、前みたいに焦りで自分の物足りなさにだけ目がいってしまう状況に戻りつつある。\r\n\r\n睡眠の改善を始めたことろは良い変化があってそれが嬉しくてモチベーションが上がっていたが、慣れてしまうと新鮮な気持ちにはどうしてもなれず自分の成長に繋がっているかを疑ってしまう。\r\n\r\n焦りが根本の原因であることはわかっているので、その焦りとうまく付き合っていくにはどうしたら良いか考えよう。\r\nまずはどんな時に焦りを感じているか。\r\n\r\n- 自分が決めた事柄、行動をまっとうできなかった時に自分はダメだと思っている\r\n- 目の前の作業に集中できていない時に自分はダメだと思っている\r\n- 作業の進みが遅いときに自分はダメだと思っている\r\n- 新しい変化がないと自分が成長していないと感じている\r\n\r\n①おそらくできなかった時に原因と改善を行っていないから徐々に焦りが出てくるのだと思う(仮説)。人間わからないことには不安が出てくるものなので、今回はそれに近いのかな？と思った。\r\nなので、目標通りに行動できた時の理由とできなかった時の理由を毎日振り返り記録する。\r\nそして原因に対して改善策を出して仮説検証を行う。仮説を立てることで訳もわからない不安な状態から抜け出す。そうすれば仮説検証に視点を向けることができて不安や焦りを感じる暇がなくなるのではないか。\r\n今自分が生活改善で行っているのは、「睡眠」と「運動」なので、まずはこの2点の仮説検証を行う。\r\n\r\n上記の検証を行うことで、「目の前の作業に集中できない」という悩みも解消されると思う。\r\nなぜなら、作業中に焦りの元となっている自分の行動をちゃんとできないという悩みを抱えているから。そこに気を取られているため目の前の作業に集中できていない。\r\n\r\n「作業の進みが遅い」のも同じ問題で、なぜ進みが遅いのかわからないからなんとなく自分はダメだと思い込んでいる。根本的な原因がわかればなんとなく自分のせいと思うのではなく、改善策を考え実行することに視点が向く\r\n\r\n振り返ってみて思ったが、自分は基本的にはわからないことに対して不安や焦りを感じているパターンが多い気がする。\r\nわからないから、「怖い」「不安」「焦り」が出てくる。わかれば「余裕」「ゆとり」が生まれる。だからうまくいかないことがあった時に闇雲に自分を責めるのではなく、何でできないんだろうと新しい発見をした感覚で考えてみると面白いかも。\r\n\r\nちょっとスッキリした	2020-07-23 22:36:18.855511+09	2020-07-24 00:09:46.401812+09	1
12	7月24日の日記	## 今日やったこと\r\n***\r\n- アプリ開発\r\n\t- Timerモデルの作成\r\n\t- TimerモデルをAdminに登録\r\n- ネットワーク勉強\r\n- 読書\r\n- 部屋掃除\r\n- 風呂掃除\r\n- 散歩\r\n- ゲーム\r\n\r\n### アプリ開発\r\n***\r\n進捗：0/1 11/7\r\n今日はTimerアプリを作成する準備をした。\r\n30分くらいでモデルの作成とAdminへの登録は完了した。少しずつDjangoの開発に慣れてきたかも。\r\nそして、明日はTimerのデザイン部分を作っていこうと思っている。\r\n\r\n### ネットワークの勉強\r\n***\r\n昨日の反省を踏まえてわからないことに対して不安だけを感じるのではなく、原因を追求することで目の前の問題にだけ視点を向かせる意識をした。\r\nそのおかげで、今日は本の内容に対してつまりどういうことなのかを自分の言葉で考えることができた。そしてそれをメモに残すことした。これで忘れてもいつでも振り返りができる状態を作れた。(これはでかい)\r\nだがまだ安心はできない。これを毎日継続することで原因の追求、メモを習慣化させる。そうすれば成長していく自分を感じられると思う。大事なのは継続すること。\r\n\r\nあと今日は読む参考書を変えてみた。前まで読んでいた参考書は難易度が高く今の自分では理解するまで時間がかかりすぎるため、初心者用の参考書を読んでからまた読むようにする。そうすれば少しは読む時間が短縮され、深い知識が得られると思う。\r\n実際に本を変えてみて感じたのは、1日で3分の1までは読み終えた。少し知っていることもあったので前の参考書に比べると大分早く読めている。\r\n\r\nTCP/IPはPC間のデータの送受信を行う時に用いられる通信のルールである。\r\nそしてTCP/IPは5階層に分かれてそれぞれがデータの送受信を行うための役割がある。(分業性のイメージ)\r\nアプリケーション層・トランスポート層・ネットワーク層・データリンク層・物理層の5つ\r\n各層には通信の目的よって異なるプロトコルが存在しており、そのプロトコルの組み合わせによって「何をするか」が決まる(目的によってアクションが異なる)\r\nこれはすごい仕組みだと思った。分業制にしているからこそプロトコルの一部を変えるだけで色んなアプリケーションが生まれる。	2020-07-24 23:50:27.856072+09	2020-07-25 00:10:03.983556+09	1
13	7月25日の日記	## 今日やったこと\r\n***\r\n- ネットワーク勉強\r\n- 読書\r\n- ゲーム\r\n- 買い物\r\n\r\n### ネットワーク勉強\r\n***\r\nアプリケーション層は「誰に何をするか？」を決める場所でそれ以降のトランスポート層・ネットワーク層・データリンク層・物理層は「通信を実現する」場所ということがわかった。\r\n自分の解釈だと、アプリケーション層は「設計図」でそれ以降の層は「実装」をする。\r\n\r\n色んな本を並行読みして色んな人の解釈に触れてその中から自分の解釈を見つけるようにしよう。本によって難易度が異なり自分には合わない本と出会うかもしれないが、それも一つの発見なので視野を広げて色んな発見をしていこう。そうすることで自分の考えを徐々にアップデートしていく。\r\n\r\nマスタリングTCP/IPやWebを支える技術、ネットワークはなぜ繋がるのか？の読破を目指す。(これでネットワークに対して最低限の知識は身につくはず)\r\n\r\n### 読書\r\n***\r\n「ビブリア古書堂の事件手帖II」を読み終わった。\r\n「ビブリア古書堂の事件手帖I」があったみたいで、先にIIを読んでしまったのは盲点。\r\nまた暇な時に本屋行って買いに行こう。\r\n\r\n最近推理小説を数多く読むようになってから、伏線に気付くようになってきた。おそらく文字から状況を想像できるようになってきたからだと思う。そしてその状況で違和感を覚えるときがあるが、その違和感は意外と物語の核心に迫るところでもある。状況を想像しながら本を読むようにすると理解度が高まり、面白さも増すことに気づいた。	2020-07-25 22:02:52.29447+09	2020-07-25 22:02:52.2945+09	1
14	7月26日の日記	## 今日やったこと\r\n***\r\n- ネットワーク勉強\r\n- 読書\r\n- ゲーム\r\n- 部屋掃除\r\n- 風呂掃除\r\n\r\n## ネットワーク勉強\r\n***\r\n「TCP/IPの絵本」を読み終わった(3日かかった)\r\nネットワークに対して概要をわかりやすく絵で伝えてくれてくれる技術書なので、イメージを掴むことは少しできたが、所々の技術が何のために使用する技術なのかという説明はあまりなかった印象。\r\n\r\nネットワークはこういう風にできていますよ！と教えてくれる技術書だったので、浮かんだ質問に対しての回答はあまりなかった。(ブロードキャストアドレスの使用用途や通信を確立するタイミング、通信形式の具体例、ケーブルが違うと通信の何が変わるなど)詳しい内容は違う技術書で読むことにする。\r\n\r\nだが、ネットワークに関して知識がほぼない自分に取っては新しい知識が多く、メモの量も多くなった。これでいつでも振り返るができるので、忘れた頃に復讐を行う。\r\n\r\n次読む本は「マスタリングTCP/IP入門編」かな。こっちの方がより詳しくネットワークに関して説明されているっぽいので、またメモを残しながら読んでいく。\r\n\r\n## ゲーム\r\n***\r\nマキブONを今日もやったが、やっぱり友達とプレイした方が面白いわ。\r\nゲームの予約は申したが、購入しても1人ではプレイしないと思う。プレイするときは必ず友達を誘ってやる。\r\n\r\n## 今の自分に\r\n***\r\n今やれることに一生懸命取り組んでいればいずれ花開くときはくるはず。\r\nだから今成果が出なくてもめげずに勉強をして、継続して勉強できる自分を確立する。\r\n\r\nこの世界で最も重要な能力は知識でもなければスキルでもない。一番大事な能力は「継続力」だと俺は思う。\r\nなぜなら、何事も継続できなければ成長できないから。楽に生きるためには成長することが必要、成長するためには継続力が必要という理屈。\r\n\r\nたまに初めてやることをすぐにできる人がいるが、それは過去に似たような経験をしているまたは見ているからであって、本当に初見ですぐできる人はほとんどいない。つまり過去に継続して行ってきた経験があるからできることである。なので、自分が継続すると決めたことは継続すること。それが後の人生で役に立ってくることだと信じて。\r\n\r\n今は我慢の時期だと思う。辛いかもしれないが焦らず踏ん張ろう。	2020-07-27 00:15:28.173673+09	2020-07-27 00:15:28.173704+09	1
15	7月27日の日記	## 今日やったこと\r\n***\r\n- Webの勉強\r\n- 読書\r\n- 部屋掃除\r\n- 風呂掃除\r\n- 洗濯\r\n\r\n### Webの勉強\r\n***\r\n「Webを支える技術」を読み始めた。\r\nWebを構成している技術を勉強することは、Webの仕組みを知ることに繋がるのでWebエンジニアを目指している自分にとっては必要な知識。\r\nWebの裏側を知ってもWeb開発に直接関係あることはあまりないと思うが、運用・保守の観点からだと知っておくべき知識だと思うので、ちゃんと学ぶ。\r\n\r\n### 今日の振り返り\r\n***\r\n俺は30代で1人で生活できるくらいまでお金を稼げるようになるのが目標なので、そのための必要なスキルを身に着けるための行動をすべきじゃないかと今日ふと思った。\r\n目的があった方が勉強のモチベーションが上がるし、学ぶべきものが明確になる。\r\n方向性をはっきりしないと実用性がない知識だけが身についてしまう。(豆知識的なものもあった方が良いが優勢度的には実用性から)\r\nそう考えるとWeb開発、運用・保守ができる会社で働いた方が合理的だな。\r\n\r\n学ぶべきスキルを洗い出してから勉強をしよう。\r\n\r\n目標を達成することだけを考えていらない気遣いは捨てる。	2020-07-27 22:32:50.124519+09	2020-07-27 22:32:50.124557+09	1
16	7月28日の日記	## 今日やったこと\r\n***\r\n- アプリ開発\r\n\t- タイマー画面の作成\r\n\t- タイマー起動・停止\r\n\t- 非同期でコントローラーと通信(レコード登録はまだ)\r\n- Web勉強\r\n- 読書\r\n- 部屋掃除\r\n- 買い物\r\n- 風呂掃除\r\n\r\n### アプリ開発\r\n***\r\n今日はタイマー機能に取り掛かった。\r\n実装できる状態まで設計ができていなかったため、実装中に方針が二転三転してしまった。具体的には、設計段階でどういう動作をすればやりたいことができるかまで考えられていなかったのが原因。なので、次からは求めている機能までの道筋を示してから実装に取り掛かる。今回はメモにボタンをクリックしたらコレをすると一つ一つ書き、道筋を決めたので後は実装するだけ。\r\n\r\n道筋を決めるためには、実装手順を知っておかなければいけないので、知識を増やすまたはその場で調査、誰かに質問するしかない。\r\n\r\n### 今日の振り返り\r\n***\r\n暇な時間が多いほど焦りや不安が大きくなることに気づいた。\r\n俺はバイトをしていた時も遊びに行った時も暇な時間があると何をしていいか分からず、周りばかり見てしまう。周りばかり見ていると嫌でも人の視線が気になってしまう。なので、暇な時間を作らない生活をして行った方が良い。暇な時間とは、何をするか迷ったり目的を持って行動していない時を指す。暇な時間は思考が良い方向に向かない傾向があるので、なるべくなくし、勉強や読書など目の前の行動に思考を巡らせる。未来のことや過去のことを考えて不安になるより、今やるべきことをやるために脳を使った方が合理的。\r\n\r\nつまるとこ、Webエンジニアとして今やるべきことに集中して取り組む。ただそれだけやれば良い。	2020-07-28 23:09:42.031501+09	2020-07-28 23:09:42.031525+09	1
17	7月29日の日記	## 今日やったこと\r\n***\r\n- Web勉強\r\n- 読書\r\n- 部屋掃除\r\n- 風呂掃除\r\n- 失業保険認定日\r\n\r\n### 今日の振り返り\r\n***\r\n昨日購入した技術書が届いたので、早速読んだ。\r\n「Web技術入門」と「ハッカーと画家」を少し読んだが、「Web技術入門」の方はかなり優しい導入で用語の解説も所々入っていて、初心者向けに書かれた本であることがわかった。Webの参考書ではなかなか自分に合う技術書がなかったので、この本が少しでも自分の知識を広げてくれるものだと嬉しい。\r\n「ハッカーと画家」はアメリカと日本の得意分野と苦手分野がかなり異なることを述べていた。今のところハッカーと画家がなんなのか？アメリカと日本の違いが何を表しているのか？不明な部分が多いが、いろんな考え方に触れるという意味では良いのかなと思っている。まぁコレから読み進めていけば色々わかってくるかな。\r\n\r\n今日はなんとなく本を読むのに集中できた気がする。無音の空間だと集中できるのかも。ちょっとテストしてみて体感値が変わるかチェックする。	2020-07-29 22:13:11.421609+09	2020-07-29 22:13:11.421847+09	1
18	7月30日の日記	## 今日の行動\r\n***\r\n- 読書\r\n\t- プロになるためにWeb技術入門\r\n\t- ハッカーと画家\r\n\t- 達人プログラマー\r\n\t- 読書嫌いのための図書室案内\r\n- 部屋掃除\r\n- 風呂掃除\r\n\r\n### プロになるためにWeb技術入門\r\n***\r\n今日でWeb誕生から今ままでの歴史を浅くであるが把握できた。\r\n\r\nまず、研修者の研究結果を共有するためにWebが誕生。\r\n\r\nその後、世界でWebを利用するために「HTTP」「HTML」「URL」を開発して、WebクライアントとWebサーバーと分けることで情報を世界で共有できるようになった。\r\n\r\n一般企業等でしようされ始めてから、動的なページが求められるようになりCGIが誕生。(言語はPerl)\r\n\r\nその後、Webの利用者が増加&言語の仕様的にコードの量が多くなり開発が大変になった影響で「Java/サーブレット」が登場。(ここでオブジェクト指向が登場)。\r\n\r\nだが、Java/サーブレットにも問題があった。JavaプログラムでHTMLを書いているため、エンジニアとデザイナーが同じファイルをみなければならない。そうなると作業がしにくいしバグが生まれやすい。\r\n\r\nそこで登場するのが「JSP」で、HTMLの中にJavaプログラムを書くという逆転の発想をした。\r\n\r\nでも、JSPでも問題があり一から開発しなければならない場合、開発者の独自ルールが満映してしまいコードの管理が煩雑になってしまう。\r\n\r\nそこで登場するのが「Webアプリケーションフレームワーク」(コレが現在の開発のベタースタイル)。ログイン機能やルーティングなどWeb開発でよく使用されるものをライブラリ化して簡単に使用できる形にしている。\r\n\r\n### ハッカーと画家\r\n***\r\n1章を読み終わったが、話している内容は基本的に社会システムへの抗議的な意味合いが強いと感じた。子供だけで社会を作るといじめが生まれるのは当たり前。格付けせずにはいられないのが子供など、今の学校に対して良くない所をズバズバ言っていた。\r\n\r\n俺は学生時代はいじめにあったことがないし、学校のシステムを疑うことはなかった。\r\nそれは俺の中で安全に学校生活を送れていた証だと思う。\r\nでも、今となって学生時代の自分に言いたいことは、「学校のルールをきちんと把握して欲しい」。ルールを理解すれば何をして良いか、何をしたらダメかがわかるので、迷わず行動できるはず。ルールを知れば周りの意見に左右されることが減ったかも知れない。\r\n何も知らないから多数派の意見に賛同する。コレが俺の当たり前になってしまったのが少し悔やまれる。\r\n\r\nまぁ今気づければ良いでしょ。コレからの行動を変えていけば良いだけだ。\r\n\r\n### 達人プログラマー\r\n***\r\n良いプログラマーの考え方を教えてくれる本だと行っているがどうなのか読んでみる。\r\n少し読んだが、やっぱり継続することはかなり重要だと言っていた。諦めずに継続して勉強していくことで、なりたい自分になれる。	2020-07-30 21:10:52.308204+09	2020-07-30 21:10:52.308232+09	1
19	7月31日の日記	## 今日の行動\r\n***\r\n- 読書\r\n\t- ハッカーと画家\r\n\t- 達人プログラマー\r\n\t- プロになるためのWeb技術入門\r\n- 部屋掃除\r\n- 風呂掃除\r\n- 買い物\r\n\r\n### ハッカーと画家\r\n***\r\nソフトウェアはユーザーの問題を解決するためにあるものなので、いくらすごいものが作れていてもユーザーが良いと言わなければ世に貢献できることはできない。\r\n\r\nハッカーと画家はものを作るという意味では似たような職業なのかも知れないが、作る先が異なる気がした。画家は自分の頭の中を表現してわかる人だけに良さが伝われば良いと思うのだが(偏見だと思うが)、ハッカーは利用してもらう人がいないと機能しない。ここが大きな差だと感じた。だからこそ俺はユーザーの心理や行動を理解する必要がある。\r\n\r\n### 達人プログラマー\r\n***\r\n達人と呼ばれる人の思考を記述していたが、俺はほとんど満たしていない。\r\n現状はまだまだという感じだが、悲観はしてない。これからその伸びしろの部分を伸ばせば良いだけのことだから。時間はかかるだろうが諦めず自分と向き合い続ける。これができるかできないかで結果は大きく変わる。俺はどちらを選択する？\r\n\r\n### プロになるためのWeb技術入門\r\n***\r\nHTTPについての解説を読んだ。\r\n前に「なぜネットワークは繋がるのか？」を少し読んだり、「TCP/IPの絵本を」読んだからリクエスト、レスポンスについての解説は知っていることが多かった。色んな本を読むと次の本でも生かされることに気づく良い機会だった。これを繰り返して得た知識を定着させていく。\r\n\r\nこれからが大事！未来のために今できることをきちんとやる。後悔しないように	2020-08-01 00:29:28.35558+09	2020-08-01 00:29:28.355608+09	1
20	8月1日の日記	## 今日の行動\r\n***\r\n- 読書\r\n\t- 達人プログラマー\r\n\t- ハッカーと画家\r\n- 風呂掃除\r\n- 洗濯物畳む\r\n- 部屋掃除\r\n- ゲーム\r\n\r\n### 今日の振り返り\r\n***\r\n今日は昨日ほど読書ができなかった。ゲームに時間を使ってしまったため。\r\nだが、「ハッカーと画家」を中心に読み進めた。哲学的な話が多いが、仕事に取り組む姿勢や意識の参考にはなりそう。\r\n\r\n「ハッカーと画家」はハッカーが社会的にどんな立ち位置なのか？そしてハッカーが社会にどれだけ必要ある存在なのか？を色んな話を交えて伝えようとしているのかな？と感じた。\r\n\r\n社会は全体主義(多数決)になるのがどの時代でも起きている。だが全体主義が完全に実現することはなかった。そしてこれからも全体主義にならないようにしないと人間が進化していくことはできなくなる。\r\n\r\n「達人プログラマー」はプログラマーがより成長するための意識やツールについて解説している印象。今日読んだところでは、「DRY原則」が重要であると言っていた。それはコードだけでなく、コメントもそう。知識や情報が二重化すると片方にアップデートが入ると、もう一つにもアップデートを入れなければいけない。しかも手動で。人間は忘れる生き物なので、知識が二重化していることを来月には忘れているかも知れない。そうなるとアプリケーションにクリティカルなエラーとなって自分に降り注ぐ可能性がある。これを「DRY原則」を常に意識しておくことで事前に防ぐことができる。\r\n\r\n読書を習慣づけて当たり前の状態に持っていくと読書の精度を上がってくるので、成長速度も比例するはず。今はまだ始めたばかりなので、成長速度はまだ遅いがこれからも継続することで伸びてくるはず。学習を当たり前の状態に持っていくことはエンジニアとしてのスタートラインに立つことと同義。まずはここからはじめよう。できることが多くなることを楽しみながら。	2020-08-02 00:05:02.710777+09	2020-08-02 00:05:02.710816+09	1
21	8月2日の日記	## 今日の行動\r\n***\r\n- 読書\r\n\t- ハッカーと画家\r\n- 風呂掃除\r\n- ゲーム\r\n\t- スマブラ\r\n\t- MBON\r\n\t- DBD\r\n\r\n### 今日の振り返り\r\n***\r\n今日はゲームの日ということで一日のほとんどをゲームに使った。\r\nやっぱり友達とやるゲームは楽しい。1人でやるのはスマホアプリぐらいな気がする。\r\n何がそんなに良いのかって分析してみると、会話しながら遊べるから色んな話を聴けるし話せる。その中で新しく知ることも多いので、気兼ねなく話せる友達との会話は身になる(関係性が大事)\r\n\r\n読書は「ハッカーと画家」だけ読み進めた。\r\nデスクトップアプリケーションからWebアプリケーションに変化したことにより開発手法やリリース手法などに大きな変化を経験した人の話が書いてあった。サービスを購入したPC内だけに提供するやり方からアップデートを繰り返してサービスを提供するやり方に変わったことから、日々のアイデアをその日に実装できる柔軟性の良さを得たり、ユーザーのフィードバックがすぐに来るので意見を即もらえて即反映させることが可能(エンジニアの実力次第だが)。かなり開発のしやすさに影響を及ぼしたことがわかる。\r\n\r\nあと、フィードバックをもらうことが嬉しいという発想はなかった。フィードバック=バグのイメージがあったから指摘されている感じがあってあまりその感覚を味わいたくないと避けてきたのだが、著者やその同僚は「フィードバックをくれてありがとう」とむしろ歓迎ムードだったのでそこにエンジニアとしての差を感じた。\r\nこの人達は、バグはアプリケーションをよりよくするためのものと認識しているからこそ、指摘されることを歓迎しているのだと思う。ユーザーと共に自分達のアプリケーションをより良くしていこうという気持ちが前面に出ている。最終目的はアプリケーションを良くすることであって、ミスをしないことではない。これは学びだった。\r\n\r\n俺も常に行動の目的を明確にして焦りや不安と言った感情は今必要なのか？を問いかけることによって無駄を排除することができる。よくわからない不安や焦り程自分を見失うものはないから、自分への問いかけは普段から癖をつけておこう。	2020-08-03 00:31:54.820893+09	2020-08-03 00:31:54.820953+09	1
22	8月3日の日記	## 今日の行動\r\n***\r\n- アプリ開発\r\n- 読書\r\n\t- プロになるためのWeb技術入門\r\n- 部屋掃除\r\n- 風呂掃除\r\n- 洗濯\r\n- 買い物\r\n- 映画\r\n\t- ライアーゲーム\r\n\r\n### 今日の振り返り\r\n***\r\n最近お腹や肺あたりが少し痛い。原因はわからないが、前に運動をしたら少し痛みが軽減した気がしたから明日から軽い運動でもいいので継続してみる。\r\n\r\nお腹などの痛みからアプリ開発や読書が少ししかできなかったが、今のところ継続できているのでこのまま進める。\r\nだが、ペースが少し落ちてきている。読書に入る前にめんどくさい作業であることを考えてしてしまっているのがハードルを上げている要因かもしれない。てことは、読書をやろうとした時に頭の中にある優先度の高い考えがそれになってしまっているということ。ならば優先度の高い考えを読書へのメリットへ変換してしまえばいい。\r\n\r\n読書のメリットは、「他人の経験や知識に出会える」「自分の思考を広げられる」「新しい知識を得られる」「暇な時間が減る」「新しい自分が生まれる・気付ける」「他人の考えを知れる」などなど。\r\n上記から考えるに読書は自分が成長できるツールであるということ。そして自分が成長できれば、社会で戦える自分に近づけるということ。社会は厳しいところで実力主義だから、力がないものは相手にされない。俺は力がないから言葉を発しても相手に届かない。説得力もないから。だから戦える人間になるために、楽に生きるためには自分を成長させるしかない。しかもそれは自分にしかできない。つまり、俺が今すべきことは自分が成長するために行動を優先的にとること。それは「読書」であり「アプリ開発」\r\n\r\n自分の成長に繋がる可能性があるものを片っ端からやっていこう。それは映画みるでも小説読むでも運動するでも良い。ただダラダラと無駄な時間を過ごすのはやめよう。	2020-08-04 01:17:37.290014+09	2020-08-04 01:17:37.290038+09	1
23	8月4日の日記	## 今日の行動\r\n***\r\n- アプリ開発\r\n\t- タイマーの追加、更新\r\n\t- タイマーの一覧表示\r\n\t- タイマーの削除\r\n- 風呂掃除\r\n- 外食\r\n- ゲーム\r\n\r\n### 今日の振り返り\r\n***\r\n今日はアプリ開発に全振りしたおかげで、タイマー機能が完成した！\r\n今はミニマムで作っているので、タイマーの検索・追加・更新・削除ができるところまで開発できたのでOK！\r\n\r\n次は、タイマーの経過時間を元に1日毎のグラフを作っていく。どの行動にどのくらい時間を使っているかを可視化するために。\r\n\r\n運動に関しては、腕立て20回・スクワット30回・腹筋10回と軽く運動した。\r\nだけど、あまりチマチマやりすぎても効果が出てこないので、ガッツリ時間を取って運動に力を入れていく。\r\n\r\n運動だけでなく勉強の方も同じで、今は時間がかなりあるので今のうちにやると決めたことはガッツリやっていく。基本的に俺が必要だと思って洗い出した項目って「運動」「睡眠」「勉強」とやれば必ず成長できると決まっているものなので後はやるだけ。\r\n時間がありすぎると逆にダラけてしまうのが今の自分だけど、成長して楽に生きるために今こそ自分にムチを入れる時！頑張ろう	2020-08-05 00:29:38.398486+09	2020-08-05 01:10:41.467992+09	1
24	8月5日の日記	## 今日の行動\r\n***\r\n- アプリ開発\r\n\t- 背景色をページ下部まで伸ばす\r\n\t- 履歴ページにbase.htmlを読み込ませる\r\n\t- グラフの表示(テストデータ)\r\n- 読書\r\n\t- プロになるためのWeb技術入門\r\n- 部屋掃除\r\n- 風呂掃除\r\n- ランニング\r\n- 自己超越目標を考える\r\n\r\n### 今日の振り返り\r\n***\r\n今日はまず自己超越目標について考えた。\r\n自己超越目標は、他人のためになる、役に立つ目標のこと。例えば、「お金持ちになりたい！」は個人の目標であり、この状態では他人のためになっていない。「お金を稼いで親に今までの教育費を返したい」は自分の行動で親(他人)にお金をあげるという影響を与える。これを自己超越目標という。\r\n\r\nそして、俺が考えた自己超越目標は「お金を稼いで父には年金+俺が稼いだ金で生活できる状況を作る」「お金を稼いで母には福島-川崎の移動を躊躇なくできるようにしたい」この2つ。\r\n\r\nこの目標を実現するには、まず俺が生活できるレベルまで稼ぐ必要がある。\r\n余ったお金を両親にあげるようにしないと、両親のことだから受け取ってくれない。\r\n俺が稼ぐには、会社員になることか個人で稼ぐかの2択だと思う。稼ぐ時のルールとして、ギャンブル系でお金を稼ぐのは無し(自分の実力で安定して稼いだ方が未来があるから)\r\n\r\n自分が稼ぐためのアクションはまだ考えられていないので、明日引き続き考えていく。\r\nなるべく小さい単位までアクションを落とし込むことで、取り組みやすくする。\r\n\r\nアプリ開発は、履歴ページの方に取り掛かった。テストデータを使ってグラフの表示はできたが、グラフのライブラリでエラーが出ていたので明日チェックする。\r\n\r\n読書は、Webアプリケーションを構成している要素について読んだ。\r\nあとセッションもか。セッションIDでログインしているかどうか識別することもできるが、確かRailsではdeviceがあるからセッションIDを持たせる必要はないね。セッションIDについては、ログイン状態を保持する一つのやり方として認識\r\nWebサーバーとWebアプリケーションサーバーの違いがよくわかっていないので、明日読んで理解しよう。\r\nDBソフトウェア(MySQLなど)は自動的にDBサーバーと通信する機能が揃っているのは初耳だった。(どうやってできているのか気にしてもいなかった)\r\n\r\n最近思ったがわからないところがあった時はそれが必要である背景を考えると以外と答えが見つかるかもしれないと思った。\r\nWeb技術が日頃からアップデートされているのは、何かしらの問題を改善するためだから。\r\nエラーとかも起きるべくして起きているので、少し前に改善した内容を見直してみたりすると改善点がすぐ見つかるかもしれない。\r\n勉強するときは、なぜそれが必要になったのか？と背景を探ってみる。\r\nエラーが発生したときは、追加したコードを確認してみる。	2020-08-05 23:56:23.108237+09	2020-08-06 00:10:39.681532+09	1
25	8月6日の日記	## 今日の行動\r\n***\r\n- アプリ開発\r\n\t- Timer一覧を今日のものだけ表示\r\n- 読書\r\n\t- プロになるためのWeb技術入門\r\n\t- ハッカーと画家\r\n- 部屋掃除\r\n- 風呂掃除\r\n- 買い物\r\n\r\n### 今日の振り返り\r\n***\r\n高田くんから仕事の誘いがあったので、話を聞いてみようと思う。\r\n聞いてみないと判断できないが、転職活動は労力かかるし、現場に知っている人がいると色々相談もしやすいと思ったので、自分の今の状況からしたら良い話だと思う。\r\n高田くん仕事の誘いをしてきてくれてありがとう。\r\n\r\n父さんは部屋の掃除や洗濯といった家事全般をやってくれているので、自分の時間を確保できている。ありがとう。\r\n\r\n皆んなの行動へ陰ながら恩返しできるように、少しずつ自分を成長させていく。\r\n\r\n後は、タイマー機能をガンガン使ってバグや改善点を見つけていく。	2020-08-06 21:17:27.422498+09	2020-08-06 21:17:27.422533+09	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-07-18 20:02:41.423932+09	1	daichan	2	[]	7	1
2	2020-07-18 20:08:36.467509+09	2	test_user	1	[{"added": {}}]	7	1
3	2020-07-18 20:09:08.947918+09	2	test_user	3		7	1
4	2020-07-18 20:09:37.993166+09	3	test_user	1	[{"added": {}}]	7	1
5	2020-07-18 20:09:54.640583+09	3	test_user	3		7	1
6	2020-07-18 21:09:52.507527+09	1	テスト	1	[{"added": {}}]	8	1
7	2020-07-21 21:33:06.860971+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
8	2020-07-21 21:33:45.900324+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
9	2020-07-21 21:44:50.37061+09	5	初めての投稿	2	[]	8	1
10	2020-07-21 22:16:09.271543+09	5	初めての投稿	2	[]	8	1
11	2020-07-22 10:18:00.96137+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
12	2020-07-22 10:18:56.121302+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
13	2020-07-22 10:19:59.511921+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
14	2020-07-22 10:21:38.702454+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
15	2020-07-22 10:22:29.840601+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
16	2020-07-22 10:23:54.640003+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
17	2020-07-22 10:24:26.250465+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
18	2020-07-22 10:25:24.410623+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
19	2020-07-22 10:34:02.105344+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
20	2020-07-22 10:34:52.430074+09	5	初めての投稿	2	[]	8	1
21	2020-07-22 10:37:40.508224+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
22	2020-07-22 10:42:16.062526+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
23	2020-07-22 11:11:14.387401+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
24	2020-07-22 11:55:53.778102+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
25	2020-07-22 12:15:19.606689+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
26	2020-07-22 12:18:29.798809+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
27	2020-07-22 14:38:39.992229+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
28	2020-07-22 17:26:53.043567+09	5	初めての投稿	2	[{"changed": {"fields": ["\\u672c\\u6587"]}}]	8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	users	user
8	diary	diary
9	timer	timer
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-07-14 17:18:14.885278+09
2	auth	0001_initial	2020-07-14 17:18:14.929034+09
3	admin	0001_initial	2020-07-14 17:18:14.988374+09
4	admin	0002_logentry_remove_auto_add	2020-07-14 17:18:15.004555+09
5	admin	0003_logentry_add_action_flag_choices	2020-07-14 17:18:15.015318+09
6	contenttypes	0002_remove_content_type_name	2020-07-14 17:18:15.041724+09
7	auth	0002_alter_permission_name_max_length	2020-07-14 17:18:15.047655+09
8	auth	0003_alter_user_email_max_length	2020-07-14 17:18:15.060116+09
9	auth	0004_alter_user_username_opts	2020-07-14 17:18:15.069504+09
10	auth	0005_alter_user_last_login_null	2020-07-14 17:18:15.080811+09
11	auth	0006_require_contenttypes_0002	2020-07-14 17:18:15.083359+09
12	auth	0007_alter_validators_add_error_messages	2020-07-14 17:18:15.093134+09
13	auth	0008_alter_user_username_max_length	2020-07-14 17:18:15.10783+09
14	auth	0009_alter_user_last_name_max_length	2020-07-14 17:18:15.119794+09
15	auth	0010_alter_group_name_max_length	2020-07-14 17:18:15.134329+09
16	auth	0011_update_proxy_permissions	2020-07-14 17:18:15.144357+09
17	sessions	0001_initial	2020-07-14 17:18:15.151882+09
18	users	0001_initial	2020-07-18 19:12:08.954023+09
19	diary	0001_initial	2020-07-18 21:05:56.946719+09
20	diary	0002_auto_20200718_2115	2020-07-18 21:15:51.718432+09
21	diary	0003_auto_20200718_2120	2020-07-18 21:20:45.80019+09
22	diary	0004_auto_20200721_2111	2020-07-21 21:12:09.785933+09
23	diary	0005_auto_20200722_1426	2020-07-22 14:27:00.726321+09
24	diary	0006_auto_20200722_1428	2020-07-22 14:28:23.725529+09
25	diary	0007_remove_diary_status	2020-07-23 11:05:45.815737+09
26	timer	0001_initial	2020-07-24 23:21:24.144285+09
27	timer	0002_remove_timer_is_active	2020-08-04 15:25:12.601492+09
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2anyw0qv33azq30aadnzd5f5jgo7louu	MGRiOWExNDg4MDBiMjZiNDI0MTA1NmEwNzVlMDgxNmJkNWJkNDcxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNDYzODQ4MDI2OWEwZjVhMmVlODVhYzkwOWZjN2RkZTUwZjQzMzg4In0=	2020-07-28 17:25:00.136705+09
6p7pzcy131w73zlpmthrkkayv4pzceji	MmIwNDc3YTYxMTViNTRiMzc5MDA2Y2FkNGM5NmEzZmIzYTkxNGUxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTg2ZTAyYThlMGIyMWZjNGIxMDgxZDc1ZDFkMDI4NTk5ZTEzOWRmIn0=	2020-08-01 20:01:05.278248+09
4jwymwdotncyiovw9n5itkc2wxztmvdt	MmIwNDc3YTYxMTViNTRiMzc5MDA2Y2FkNGM5NmEzZmIzYTkxNGUxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTg2ZTAyYThlMGIyMWZjNGIxMDgxZDc1ZDFkMDI4NTk5ZTEzOWRmIn0=	2020-08-02 19:11:23.468952+09
\.


--
-- Data for Name: timer_timer; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.timer_timer (id, name, elapsed_time, created_at, updated_at, user_id) FROM stdin;
16	test	12	2020-08-07 16:49:27.480249+09	2020-08-07 16:49:27.48028+09	1
23	ggggg	123	2020-08-07 17:24:16.392087+09	2020-08-07 17:24:16.392112+09	1
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: daichan
--

COPY public.users_user (id, password, last_login, username, email, is_active, is_admin, created_at, updated_at) FROM stdin;
1	pbkdf2_sha256$180000$GnlHky9mcQjY$7Z0s1PuJRH+Y+MMHWiLQZHKOg2u4Jt+YxDfg2sQ7wnM=	2020-07-19 19:11:23.459898+09	daichan	chansa6225@gmail.com	t	t	2020-07-18 20:00:24.703923+09	2020-07-18 20:02:41.418085+09
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daichan
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daichan
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daichan
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daichan
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daichan
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daichan
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: diary_diary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daichan
--

SELECT pg_catalog.setval('public.diary_diary_id_seq', 25, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daichan
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 28, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daichan
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daichan
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- Name: timer_timer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daichan
--

SELECT pg_catalog.setval('public.timer_timer_id_seq', 23, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daichan
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: diary_diary diary_diary_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.diary_diary
    ADD CONSTRAINT diary_diary_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: timer_timer timer_timer_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.timer_timer
    ADD CONSTRAINT timer_timer_pkey PRIMARY KEY (id);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: diary_diary_user_id_b0cdd544; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX diary_diary_user_id_b0cdd544 ON public.diary_diary USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: timer_timer_user_id_dffdac3f; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX timer_timer_user_id_dffdac3f ON public.timer_timer USING btree (user_id);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: daichan
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: diary_diary diary_diary_user_id_b0cdd544_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.diary_diary
    ADD CONSTRAINT diary_diary_user_id_b0cdd544_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: timer_timer timer_timer_user_id_dffdac3f_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: daichan
--

ALTER TABLE ONLY public.timer_timer
    ADD CONSTRAINT timer_timer_user_id_dffdac3f_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

