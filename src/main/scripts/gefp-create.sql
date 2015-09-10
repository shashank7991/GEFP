--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-03-04 14:53:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE gefp;
--
-- TOC entry 2020 (class 1262 OID 16393)
-- Name: gefp; Type: DATABASE; Schema: -; Owner: gefp
--

CREATE DATABASE gefp WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE gefp OWNER TO gefp;



SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2021 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 181 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2023 (class 0 OID 0)
-- Dependencies: 181
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 65536)
-- Name: authorities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE authorities (
    username character varying(255) NOT NULL,
    authority character varying(255)
);


ALTER TABLE public.authorities OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 65542)
-- Name: cells; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cells (
    cellid bigint NOT NULL,
    planid bigint,
    runwayid bigint,
    stageid bigint
);


ALTER TABLE public.cells OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 65545)
-- Name: checkpoints; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE checkpoints (
    checkpointid bigint NOT NULL,
    strdescription character varying(255),
    cellid bigint,
    id bigint
);


ALTER TABLE public.checkpoints OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 65548)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departments (
    id bigint NOT NULL,
    currentplan bigint,
    strname character varying(255)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 65551)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 65553)
-- Name: plans; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE plans (
    planid bigint NOT NULL,
    publisheddate timestamp without time zone,
    strname character varying(255),
    departmentid bigint
);


ALTER TABLE public.plans OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 65556)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    roleid bigint NOT NULL,
    strrolename character varying(255)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 65559)
-- Name: runways; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE runways (
    runwayid bigint NOT NULL,
    strname character varying(255),
    planid bigint
);


ALTER TABLE public.runways OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 65562)
-- Name: stages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stages (
    stageid bigint NOT NULL,
    strname character varying(255),
    planid bigint
);


ALTER TABLE public.stages OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 65565)
-- Name: stu_checkpoint; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stu_checkpoint (
    id bigint NOT NULL,
    checkpointid bigint NOT NULL
);


ALTER TABLE public.stu_checkpoint OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 65660)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    cin character varying(255),
    email character varying(255),
    enabled boolean NOT NULL,
    password character varying(255),
    username character varying(255),
    deptid bigint,
    planid bigint,
    roleid bigint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2005 (class 0 OID 65536)
-- Dependencies: 170
-- Data for Name: authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO authorities (username, authority) VALUES ('Advisor', 'ROLE_ADVISOR');
INSERT INTO authorities (username, authority) VALUES ('Admin', 'ROLE_ADMIN');
INSERT INTO authorities (username, authority) VALUES ('cysun', 'ROLE_ADMIN');
INSERT INTO authorities (username, authority) VALUES ('jdoe1', 'ROLE_STUDENT');
INSERT INTO authorities (username, authority) VALUES ('jdoe2', 'ROLE_STUDENT');
INSERT INTO authorities (username, authority) VALUES ('shashank', 'ROLE_STUDENT');
INSERT INTO authorities (username, authority) VALUES ('pooja', 'ROLE_STUDENT');
INSERT INTO authorities (username, authority) VALUES ('tfox', 'ROLE_ADVISOR');

--
-- TOC entry 2006 (class 0 OID 65542)
-- Dependencies: 171
-- Data for Name: cells; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (1, 1, 1, 1);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (2, 1, 2, 1);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (10, 4, 8, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (12, 4, 8, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (14, 4, 8, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (16, 4, 8, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (18, 4, 8, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (20, 4, 8, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (26, 4, 24, 22);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (28, 4, 24, 25);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (30, 4, 8, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (32, 4, 8, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (34, 4, 23, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (36, 4, 8, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (3, 4, 8, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (5, 4, 23, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (6, 4, 23, 9);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (7, 4, 8, 25);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (8, 1, 1, 1);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (11, 1, 3, 1);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (13, 1, 3, 2);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (15, 1, 1, 1);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (31, 23, 25, 24);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (33, 23, 26, 29);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (35, 23, 26, 28);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (39, 36, 38, 37);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (45, 5, 44, 43);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (47, 5, 44, 43);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (54, 2, 2, 3);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (62, 56, 60, 57);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (64, 56, 61, 59);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (68, 2, 67, 3);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (103, 6, 102, 101);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (114, 6, 112, 101);
INSERT INTO cells (cellid, planid, runwayid, stageid) VALUES (116, 6, 102, 111);


--
-- TOC entry 2007 (class 0 OID 65545)
-- Dependencies: 172
-- Data for Name: checkpoints; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (4, 'dsd', 7, NULL);
INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (9, 'c1', 8, NULL);
INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (12, 'c2', 11, NULL);
INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (14, 'ada', 15, NULL);
INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (32, 'c1', 31, NULL);
INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (34, 'c2', 35, NULL);
INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (40, 'c1', 39, NULL);
INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (46, 'c12', 47, NULL);
INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (63, 'c1', 64, NULL);
INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (55, 'c1', 68, NULL);
INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (104, 'asd', 103, NULL);
INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (115, 'asda', 114, NULL);
INSERT INTO checkpoints (checkpointid, strdescription, cellid, id) VALUES (117, 'afadvc', 116, NULL);


--
-- TOC entry 2008 (class 0 OID 65548)
-- Dependencies: 173
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO departments (id, currentplan, strname) VALUES (41, 0, 'dept3');
INSERT INTO departments (id, currentplan, strname) VALUES (3, 23, 'test1');
INSERT INTO departments (id, currentplan, strname) VALUES (42, 0, 'test');
INSERT INTO departments (id, currentplan, strname) VALUES (48, 0, 'sdfs');
INSERT INTO departments (id, currentplan, strname) VALUES (53, 56, 'maths');
INSERT INTO departments (id, currentplan, strname) VALUES (1, 6, 'CE');


--
-- TOC entry 2024 (class 0 OID 0)
-- Dependencies: 174
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 140, false);


--
-- TOC entry 2010 (class 0 OID 65553)
-- Dependencies: 175
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (6, NULL, 'sdcdsc', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (7, NULL, 'sddss', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (2, NULL, 'plan211', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (16, NULL, 'dfsfds', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (17, NULL, 'dfsfds', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (18, NULL, 'tesrrg', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (19, NULL, 'dfdd', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (20, NULL, 'sdfsf', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (21, NULL, 'sdfsf', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (4, NULL, 'dgdgd123', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (1, NULL, 'plan11', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (22, NULL, 'qqqqq', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (23, NULL, 'plan1', 3);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (36, NULL, 'plan2', 3);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (5, NULL, 'sdcd123', 1);
INSERT INTO plans (planid, publisheddate, strname, departmentid) VALUES (56, NULL, 'maths1', 53);


--
-- TOC entry 2011 (class 0 OID 65556)
-- Dependencies: 176
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO roles (roleid, strrolename) VALUES (1, 'ROLE_ADMIN');
INSERT INTO roles (roleid, strrolename) VALUES (3, 'ROLE_STUDENT');
INSERT INTO roles (roleid, strrolename) VALUES (2, 'ROLE_ADVISOR');


--
-- TOC entry 2012 (class 0 OID 65559)
-- Dependencies: 177
-- Data for Name: runways; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO runways (runwayid, strname, planid) VALUES (1, 'runway1', 1);
INSERT INTO runways (runwayid, strname, planid) VALUES (2, 'runway2', 2);
INSERT INTO runways (runwayid, strname, planid) VALUES (3, 'runway3', 1);
INSERT INTO runways (runwayid, strname, planid) VALUES (8, 'r1', 4);
INSERT INTO runways (runwayid, strname, planid) VALUES (23, 'r2', 4);
INSERT INTO runways (runwayid, strname, planid) VALUES (24, 'r3', 4);
INSERT INTO runways (runwayid, strname, planid) VALUES (25, 'r1', 23);
INSERT INTO runways (runwayid, strname, planid) VALUES (26, 'r2', 23);
INSERT INTO runways (runwayid, strname, planid) VALUES (27, 'r3', 23);
INSERT INTO runways (runwayid, strname, planid) VALUES (38, 'r1', 36);
INSERT INTO runways (runwayid, strname, planid) VALUES (44, 'r1', 5);
INSERT INTO runways (runwayid, strname, planid) VALUES (50, 'r2', 5);
INSERT INTO runways (runwayid, strname, planid) VALUES (52, 'r3', 5);
INSERT INTO runways (runwayid, strname, planid) VALUES (60, 'r1', 56);
INSERT INTO runways (runwayid, strname, planid) VALUES (61, 'r2', 56);
INSERT INTO runways (runwayid, strname, planid) VALUES (67, 'r1', 2);
INSERT INTO runways (runwayid, strname, planid) VALUES (102, 'asd', 6);
INSERT INTO runways (runwayid, strname, planid) VALUES (112, 'adcxa', 6);
INSERT INTO runways (runwayid, strname, planid) VALUES (113, 'afwer', 6);


--
-- TOC entry 2013 (class 0 OID 65562)
-- Dependencies: 178
-- Data for Name: stages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO stages (stageid, strname, planid) VALUES (1, 'stage1', 1);
INSERT INTO stages (stageid, strname, planid) VALUES (2, 'stage2', 1);
INSERT INTO stages (stageid, strname, planid) VALUES (3, 'stage3', 2);
INSERT INTO stages (stageid, strname, planid) VALUES (9, 's1', 4);
INSERT INTO stages (stageid, strname, planid) VALUES (22, 's2', 4);
INSERT INTO stages (stageid, strname, planid) VALUES (25, 's3', 4);
INSERT INTO stages (stageid, strname, planid) VALUES (24, 's1', 23);
INSERT INTO stages (stageid, strname, planid) VALUES (28, 's2', 23);
INSERT INTO stages (stageid, strname, planid) VALUES (29, 's3', 23);
INSERT INTO stages (stageid, strname, planid) VALUES (37, 's1', 36);
INSERT INTO stages (stageid, strname, planid) VALUES (43, 's1', 5);
INSERT INTO stages (stageid, strname, planid) VALUES (49, 're', 5);
INSERT INTO stages (stageid, strname, planid) VALUES (51, 's3', 5);
INSERT INTO stages (stageid, strname, planid) VALUES (57, 's1', 56);
INSERT INTO stages (stageid, strname, planid) VALUES (58, 's2', 56);
INSERT INTO stages (stageid, strname, planid) VALUES (59, 's3', 56);
INSERT INTO stages (stageid, strname, planid) VALUES (65, 's2', 2);
INSERT INTO stages (stageid, strname, planid) VALUES (66, 's3', 2);
INSERT INTO stages (stageid, strname, planid) VALUES (101, 'asd', 6);
INSERT INTO stages (stageid, strname, planid) VALUES (110, 'asdasd', 6);
INSERT INTO stages (stageid, strname, planid) VALUES (111, 'werwerwer', 6);


--
-- TOC entry 2014 (class 0 OID 65565)
-- Dependencies: 179
-- Data for Name: stu_checkpoint; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO stu_checkpoint (id, checkpointid) VALUES (3, 63);
INSERT INTO stu_checkpoint (id, checkpointid) VALUES (3, 117);
INSERT INTO stu_checkpoint (id, checkpointid) VALUES (3, 115);
INSERT INTO stu_checkpoint (id, checkpointid) VALUES (5, 34);
INSERT INTO stu_checkpoint (id, checkpointid) VALUES (5, 32);


--
-- TOC entry 2015 (class 0 OID 65660)
-- Dependencies: 180
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, cin, email, enabled, password, username, deptid, planid, roleid) VALUES (1, '123', 'admin@csula.com', true, 'abcd', 'Admin', 1, 1, 1);
INSERT INTO users (id, cin, email, enabled, password, username, deptid, planid, roleid) VALUES (2, '1234', 'advisor@csula.com', true, 'abcd', 'Advisor', 1, 1, 2);
INSERT INTO users (id, cin, email, enabled, password, username, deptid, planid, roleid) VALUES (4, '321', 'cysun@csula.com', true, 'abcd', 'cysun', 1, 1, 1);
INSERT INTO users (id, cin, email, enabled, password, username, deptid, planid, roleid) VALUES (3, '12345', 'jdoe1@csula.com', true, 'abcd', 'jdoe1', 3, 1, 3);
INSERT INTO users (id, cin, email, enabled, password, username, deptid, planid, roleid) VALUES (7, '213', 'shashank@csula.com', true, 'abcd', 'shashank', 1, 1, 3);
INSERT INTO users (id, cin, email, enabled, password, username, deptid, planid, roleid) VALUES (5, '231', 'jdoe2@csula.com', true, 'abcd', 'jdoe2', 3, 2, 3);
INSERT INTO users (id, cin, email, enabled, password, username, deptid, planid, roleid) VALUES (6, '132', 'pooja@csula.com', true, 'abcd', 'pooja', 3, 1, 3);
INSERT INTO users (id, cin, email, enabled, password, username, deptid, planid, roleid) VALUES (8, '1321', 'tfox@csula.com', true, 'abcd', 'tfox', 1, 1, 2);



--
-- TOC entry 1866 (class 2606 OID 65575)
-- Name: cells_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT cells_pkey PRIMARY KEY (cellid);


--
-- TOC entry 1868 (class 2606 OID 65577)
-- Name: checkpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY checkpoints
    ADD CONSTRAINT checkpoints_pkey PRIMARY KEY (checkpointid);


--
-- TOC entry 1880 (class 2606 OID 65688)
-- Name: constraintname; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT constraintname UNIQUE (username);


--
-- TOC entry 1862 (class 2606 OID 65581)
-- Name: constraintname1; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authorities
    ADD CONSTRAINT constraintname1 UNIQUE (username);


--
-- TOC entry 1864 (class 2606 OID 65690)
-- Name: constraintname2; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authorities
    ADD CONSTRAINT constraintname2 UNIQUE (username);


--
-- TOC entry 1882 (class 2606 OID 65692)
-- Name: constraintname4; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT constraintname4 UNIQUE (cin);


--
-- TOC entry 1884 (class 2606 OID 65694)
-- Name: constraintname5; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT constraintname5 UNIQUE (email);


--
-- TOC entry 1870 (class 2606 OID 65583)
-- Name: departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 1872 (class 2606 OID 65585)
-- Name: plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (planid);


--
-- TOC entry 1874 (class 2606 OID 65587)
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);


--
-- TOC entry 1876 (class 2606 OID 65589)
-- Name: runways_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY runways
    ADD CONSTRAINT runways_pkey PRIMARY KEY (runwayid);


--
-- TOC entry 1878 (class 2606 OID 65591)
-- Name: stages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY stages
    ADD CONSTRAINT stages_pkey PRIMARY KEY (stageid);


--
-- TOC entry 1886 (class 2606 OID 65667)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 1896 (class 2606 OID 65673)
-- Name: fk_300612tbjw6a76tka9hbyj5kj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_300612tbjw6a76tka9hbyj5kj FOREIGN KEY (planid) REFERENCES plans(planid);


--
-- TOC entry 1893 (class 2606 OID 65604)
-- Name: fk_7how2bwdk7ldqhei0mn29jik9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stages
    ADD CONSTRAINT fk_7how2bwdk7ldqhei0mn29jik9 FOREIGN KEY (planid) REFERENCES plans(planid);


--
-- TOC entry 1890 (class 2606 OID 65609)
-- Name: fk_882s8plmqjoo8i6u8958ak2a4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY checkpoints
    ADD CONSTRAINT fk_882s8plmqjoo8i6u8958ak2a4 FOREIGN KEY (cellid) REFERENCES cells(cellid);


--
-- TOC entry 1892 (class 2606 OID 65614)
-- Name: fk_bkfr33r6yo1uoqtqstctpjbdr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY runways
    ADD CONSTRAINT fk_bkfr33r6yo1uoqtqstctpjbdr FOREIGN KEY (planid) REFERENCES plans(planid);


--
-- TOC entry 1894 (class 2606 OID 65619)
-- Name: fk_e5tdy2jt957q5hsh6k7c0dbrn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stu_checkpoint
    ADD CONSTRAINT fk_e5tdy2jt957q5hsh6k7c0dbrn FOREIGN KEY (checkpointid) REFERENCES checkpoints(checkpointid);


--
-- TOC entry 1891 (class 2606 OID 65624)
-- Name: fk_gnj1uex6wja7s8snvyvpgwpkj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans
    ADD CONSTRAINT fk_gnj1uex6wja7s8snvyvpgwpkj FOREIGN KEY (departmentid) REFERENCES departments(id);


--
-- TOC entry 1887 (class 2606 OID 65629)
-- Name: fk_icmptxvqjt7g6xtuqrvxbeyc7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT fk_icmptxvqjt7g6xtuqrvxbeyc7 FOREIGN KEY (runwayid) REFERENCES runways(runwayid);


--
-- TOC entry 1895 (class 2606 OID 65668)
-- Name: fk_kreg3i9tw5ofo63pke970yt3l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_kreg3i9tw5ofo63pke970yt3l FOREIGN KEY (deptid) REFERENCES departments(id);


--
-- TOC entry 1888 (class 2606 OID 65644)
-- Name: fk_rftivuufqf20k8g5sgpke6ejl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT fk_rftivuufqf20k8g5sgpke6ejl FOREIGN KEY (stageid) REFERENCES stages(stageid);


--
-- TOC entry 1897 (class 2606 OID 65678)
-- Name: fk_rin8hpeky1j0qj4mwj1lcc6mb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rin8hpeky1j0qj4mwj1lcc6mb FOREIGN KEY (roleid) REFERENCES roles(roleid);


--
-- TOC entry 1889 (class 2606 OID 65654)
-- Name: fk_sb05rqxga5v6uhxlbe429yked; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT fk_sb05rqxga5v6uhxlbe429yked FOREIGN KEY (planid) REFERENCES plans(planid);


--
-- TOC entry 2022 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-03-04 14:53:38

--
-- PostgreSQL database dump complete
--

