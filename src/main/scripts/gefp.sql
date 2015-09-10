
    create table cells (
        cellId int8 not null,
        planId int8,
        runwayId int8,
        stageId int8,
        primary key (cellId)
    );

    create table checkpoints (
        checkpointId int8 not null,
        strDescription varchar(255),
        cellId int8,
        primary key (checkpointId)
    );

    create table departments (
        id int8 not null,
        currentPlan int8,
        strName varchar(255),
        primary key (id)
    );

    create table plans (
        planId int8 not null,
        publishedDate timestamp,
        strName varchar(255),
        departmentId int8,
        primary key (planId)
    );

    create table roles (
        roleId int8 not null,
        strRoleName varchar(255),
        primary key (roleId)
    );

    create table runways (
        runwayId int8 not null,
        strName varchar(255),
        planId int8,
        primary key (runwayId)
    );

    create table stages (
        stageId int8 not null,
        strName varchar(255),
        planId int8,
        primary key (stageId)
    );

    create table stu_checkpoint (
        id int8 not null,
        checkpointId int8 not null
    );

    create table users (
        id int8 not null,
        cin varchar(255),
        email varchar(255),
        enabled boolean not null,
        password varchar(255),
        username varchar(255),
        deptId int8,
        planId int8,
        roleId int8,
        primary key (id)
    );

    alter table cells 
        add constraint FK_sb05rqxga5v6uhxlbe429yked 
        foreign key (planId) 
        references plans;

    alter table cells 
        add constraint FK_icmptxvqjt7g6xtuqrvxbeyc7 
        foreign key (runwayId) 
        references runways;

    alter table cells 
        add constraint FK_rftivuufqf20k8g5sgpke6ejl 
        foreign key (stageId) 
        references stages;

    alter table checkpoints 
        add constraint FK_882s8plmqjoo8i6u8958ak2a4 
        foreign key (cellId) 
        references cells;

    alter table plans 
        add constraint FK_gnj1uex6wja7s8snvyvpgwpkj 
        foreign key (departmentId) 
        references departments;

    alter table runways 
        add constraint FK_bkfr33r6yo1uoqtqstctpjbdr 
        foreign key (planId) 
        references plans;

    alter table stages 
        add constraint FK_7how2bwdk7ldqhei0mn29jik9 
        foreign key (planId) 
        references plans;

    alter table stu_checkpoint 
        add constraint FK_e5tdy2jt957q5hsh6k7c0dbrn 
        foreign key (checkpointId) 
        references checkpoints;

    alter table stu_checkpoint 
        add constraint FK_2pu9jxwfxybhr2hcvsyre7d6j 
        foreign key (id) 
        references users;

    alter table users 
        add constraint FK_kreg3i9tw5ofo63pke970yt3l 
        foreign key (deptId) 
        references departments;

    alter table users 
        add constraint FK_300612tbjw6a76tka9hbyj5kj 
        foreign key (planId) 
        references plans;

    alter table users 
        add constraint FK_rin8hpeky1j0qj4mwj1lcc6mb 
        foreign key (roleId) 
        references roles;

    create sequence hibernate_sequence;
