ALTER TABLE ONLY cells
    DROP CONSTRAINT cells_pkey CASCADE;

ALTER TABLE ONLY checkpoints
    DROP CONSTRAINT checkpoints_pkey CASCADE;


ALTER TABLE ONLY users
    DROP CONSTRAINT constraintname CASCADE;
ALTER TABLE ONLY authorities
    DROP CONSTRAINT constraintname1 CASCADE;


ALTER TABLE ONLY departments
    DROP CONSTRAINT departments_pkey CASCADE;

ALTER TABLE ONLY plans
    DROP CONSTRAINT plans_pkey CASCADE;


ALTER TABLE ONLY roles
    DROP CONSTRAINT roles_pkey CASCADE;



ALTER TABLE ONLY runways
    DROP CONSTRAINT runways_pkey CASCADE;


ALTER TABLE ONLY stages
    DROP CONSTRAINT stages_pkey CASCADE;

ALTER TABLE ONLY users
    DROP CONSTRAINT users_pkey CASCADE;


ALTER TABLE ONLY users
    DROP CONSTRAINT fk_300612tbjw6a76tka9hbyj5kj CASCADE;


ALTER TABLE ONLY stages
    DROP CONSTRAINT fk_7how2bwdk7ldqhei0mn29jik9 CASCADE;

ALTER TABLE ONLY checkpoints
    DROP CONSTRAINT fk_882s8plmqjoo8i6u8958ak2a4 CASCADE;

ALTER TABLE ONLY runways
    DROP CONSTRAINT fk_bkfr33r6yo1uoqtqstctpjbdr CASCADE;
ALTER TABLE ONLY plans
    DROP CONSTRAINT fk_gnj1uex6wja7s8snvyvpgwpkj CASCADE;


ALTER TABLE ONLY cells
    DROP CONSTRAINT fk_icmptxvqjt7g6xtuqrvxbeyc7 CASCADE;

ALTER TABLE ONLY users
    DROP CONSTRAINT fk_kreg3i9tw5ofo63pke970yt3l CASCADE;

ALTER TABLE ONLY checkpoints
    DROP CONSTRAINT fk_ras5wpy04fjpv55kw04d55akx CASCADE;

ALTER TABLE ONLY cells
    DROP CONSTRAINT fk_rftivuufqf20k8g5sgpke6ejl CASCADE;

ALTER TABLE ONLY users
    DROP CONSTRAINT fk_rin8hpeky1j0qj4mwj1lcc6mb CASCADE;

ALTER TABLE ONLY cells
    DROP CONSTRAINT fk_sb05rqxga5v6uhxlbe429yked CASCADE;

DROP TABLE authorities;

DROP TABLE cells;

DROP TABLE checkpoints;

DROP TABLE departments;

DROP TABLE plans;

DROP TABLE roles;

DROP TABLE runways;

DROP TABLE stages;

DROP TABLE users;

DROP TABLE stu_checkpoint;

DROP SEQUENCE hibernate_sequence;
