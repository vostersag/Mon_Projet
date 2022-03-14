/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de cr�ation :  14/03/2022 10:16:27                      */
/*==============================================================*/


drop table if exists Achat;

drop table if exists Article;

drop table if exists Categorie;

drop table if exists Client;

drop table if exists Fournisseur;

drop table if exists Role_utilisateur;

drop table if exists Utlisateur;

drop table if exists Vente;

/*==============================================================*/
/* Table : Achat                                                */
/*==============================================================*/
create table Achat
(
   id_achat             int not null,
   id_utl               int not null,
   id_four              int not null,
   id_art               int not null,
   Date                 datetime,
   Quantite             int,
   Prix_unitaire        float,
   Prix_total           float,
   primary key (id_achat)
);

/*==============================================================*/
/* Table : Article                                              */
/*==============================================================*/
create table Article
(
   id_art               int not null,
   id_cat               int not null,
   Libelle              varchar(254),
   Description          varchar(254),
   Prix_unitaire        float,
   Quantite             int,
   Categorie            varchar(254),
   primary key (id_art)
);

/*==============================================================*/
/* Table : Categorie                                            */
/*==============================================================*/
create table Categorie
(
   id_cat               int not null,
   Nom                  varchar(254),
   primary key (id_cat)
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   id_clt               int not null,
   Nom                  varchar(254),
   Prenom               varchar(254),
   Adresse              varchar(254),
   Telephone            int,
   Email                varchar(254),
   primary key (id_clt)
);

/*==============================================================*/
/* Table : Fournisseur                                          */
/*==============================================================*/
create table Fournisseur
(
   id_four              int not null,
   Nom                  varchar(254),
   Prenom               varchar(254),
   Adresse              varchar(254),
   Telephone            int,
   Email                varchar(254),
   primary key (id_four)
);

/*==============================================================*/
/* Table : Role_utilisateur                                     */
/*==============================================================*/
create table Role_utilisateur
(
   id_rol               int not null,
   Nom                  varchar(254),
   primary key (id_rol)
);

/*==============================================================*/
/* Table : Utlisateur                                           */
/*==============================================================*/
create table Utlisateur
(
   id_utl               int not null,
   id_rol               int not null,
   Nom                  varchar(254),
   Email                varchar(254),
   Mot_de_passe         varchar(254),
   primary key (id_utl)
);

/*==============================================================*/
/* Table : Vente                                                */
/*==============================================================*/
create table Vente
(
   id_vent              int not null,
   id_art               int not null,
   id_clt               int not null,
   id_utl               int not null,
   date                 datetime,
   Quantite             int,
   Prix_unitaire        float,
   Prix_total           int,
   primary key (id_vent)
);

INSERT INTO article (id_art, id_cat, Libelle, Description,Prix_unitaire, Quantite, Categorie)
        VALUES 
        ('1','2','Ordinateur','Probook', '200000', '20','HP'),
        ('11','21','Souris','Sans_fil', '2000', '20','HP'),
        ('12','22','Disque_dur','Grand', '40000', '50','Samsung'),
        ('13','23','Clavier','Sans_fil', '60000', '60','Kog'),
        ('14','24','Ordinateur','Portable', '600000', '20','Acer');
INSERT INTO categorie (id_cat, nom)
        VALUES 
        ('2','HP'),
        ('21','HP'),
        ('22','Samsung'),
        ('23','Kog'),
        ('24','Acer');
INSERT INTO role_utilisateur (id_rol, nom)
        VALUES 
        ('3','Connecter'),
        ('31','Vendre'),
        ('32','Acheter'),
        ('33','Annuler'),
        ('34','Valider');
INSERT INTO client (id_clt, nom, prenom, adresse, telephone, email)
        VALUES 
        ('4','Devo','bosniak','wemtenga','70545454','dev@gmail.com'),
        ('41','Fabrice','Lavrov','zogona','71545454','lav@gmail.com'),
        ('42','Cheryta','Vladimir','Ouaga','78545454','vla@gmail.com'),
        ('43','Nico','Sarko','Poutenga','76545454','nico@gmail.com'),
        ('44','Leon','kalashnikov','mouscou','79545454','leo@gmail.com');
INSERT INTO fournisseur (id_four, nom, prenom, adresse, telephone, email)
        VALUES 
        ('5','Prisca','Lavril','venise','70000000','pris@gmail.com'),
        ('51','Frank','Bisou','zogona','71645454','frank@gmail.com'),
        ('52','Vladimir','Poutine','Ouaga','78445454','vla@gmail.com'),
        ('53','Nicolas','Sarkozy','Poutenga','56545454','nico@gmail.com'),
        ('54','Gama','kalashnikov','mouscou','69545454','gama@gmail.com');
INSERT INTO utlisateur (id_utl, id_rol, nom, email,mot_de_passe)
        VALUES 
        ('6','3','Ousseni','ous@gmail.com','ouss'),
        ('61','31','Dominique','domi@gmail.com','dom'),
        ('62','32','Edwige','ed@gmail.com','edw'),
        ('63','33','Sophia','sophy@gmail.com','soph'),
        ('64','34','Sara','sara@gmail.com','sara');
INSERT INTO achat (id_achat, id_utl, id_four, id_art, date, Quantite,Prix_unitaire, Prix_total)
        VALUES 
        ('7','6','5','1','2021/10/01','200','15','3000'),
        ('71','61','51','11','2021/12/05','25','1000','25000'),
        ('72','62','52','12','2022/01/15','100','500','50000'),
        ('73','63','53','13','2022/02/20','500','500','250000'),
        ('74','64','54','14','2022/03/01','1000','50','50000');
INSERT INTO vente (id_vent,id_art, id_clt, id_utl , date, Quantite,Prix_unitaire, Prix_total)
        VALUES 
        ('8','1','4','6','2019/10/01','200','15','3000'),
        ('81','11','41','61','2020/12/05','25','1000','25000'),
        ('82','12','42','62','2020/01/15','100','500','50000'),
        ('83','13','43','63','2021/02/20','500','500','250000'),
        ('84','14','44','64','2022/03/01','1000','50','50000');

alter table Achat add constraint FK_Association_3 foreign key (id_art)
      references Article (id_art) on delete restrict on update restrict;

alter table Achat add constraint FK_Association_4 foreign key (id_four)
      references Fournisseur (id_four) on delete restrict on update restrict;

alter table Achat add constraint FK_Association_5 foreign key (id_utl)
      references Utlisateur (id_utl) on delete restrict on update restrict;

alter table Article add constraint FK_Association_1 foreign key (id_cat)
      references Categorie (id_cat) on delete restrict on update restrict;

alter table Utlisateur add constraint FK_Association_7 foreign key (id_rol)
      references Role_utilisateur (id_rol) on delete restrict on update restrict;

alter table Vente add constraint FK_Association_2 foreign key (id_clt)
      references Client (id_clt) on delete restrict on update restrict;

alter table Vente add constraint FK_Association_6 foreign key (id_utl)
      references Utlisateur (id_utl) on delete restrict on update restrict;

alter table Vente add constraint FK_Association_8 foreign key (id_art)
      references Article (id_art) on delete restrict on update restrict;

