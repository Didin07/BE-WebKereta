/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     4/30/2023 1:06:16 PM                         */
/*==============================================================*/

create database kai;

use kai;

/*==============================================================*/
/* Table: DETAIL_PEMBAYARAN                                     */
/*==============================================================*/
create table DETAIL_PEMBAYARAN
(
   ID_DETAIL_PEMBAYARAN varchar(20) not null  comment '',
   ID_TRANSAKSI         varchar(20)  comment '',
   WAKTU                timestamp not null  comment '',
   STATUS               varchar(50)  comment '',
   primary key (ID_DETAIL_PEMBAYARAN)
);

/*==============================================================*/
/* Table: DETAIL_TRANSAKSI                                      */
/*==============================================================*/
create table DETAIL_TRANSAKSI
(
   ID_DETAL_TRANSAKSI   varchar(20) not null  comment '',
   ID_TRANSAKSI         varchar(20)  comment '',
   ID_PENUMPANG         varchar(20)  comment '',
   primary key (ID_DETAL_TRANSAKSI)
);

/*==============================================================*/
/* Table: JADWAL_KERETA                                         */
/*==============================================================*/
create table JADWAL_KERETA
(
   ID_JADWAL_KERETA     varchar(20) not null  comment '',
   ID_KERETA            varchar(20)  comment '',
   ID_KELAS             varchar(20)  comment '',
   KODE_STASIUN_ASAL    varchar(100) not null  comment '',
   KODE_STASIUN_TUJUAN  varchar(100) not null  comment '',
   WAKTU_BERANGKAT      datetime not null  comment '',
   WAKTU_TIBA           datetime not null  comment '',
   HARGA                bigint not null  comment '',
   primary key (ID_JADWAL_KERETA)
);

/*==============================================================*/
/* Table: KELAS                                                 */
/*==============================================================*/
create table KELAS
(
   ID_KELAS             varchar(20) not null  comment '',
   NAMA_KELAS           varchar(100) not null  comment '',
   primary key (ID_KELAS)
);

/*==============================================================*/
/* Table: KERETA                                                */
/*==============================================================*/
create table KERETA
(
   ID_KERETA            varchar(20) not null  comment '',
   NAMA_KERETA_         varchar(100) not null  comment '',
   primary key (ID_KERETA)
);

/*==============================================================*/
/* Table: METODE_PEMBAYARAN                                     */
/*==============================================================*/
create table METODE_PEMBAYARAN
(
   KODE_BANK            varchar(20) not null  comment '',
   NAMA_BANK            varchar(100) not null  comment '',
   primary key (KODE_BANK)
);

/*==============================================================*/
/* Table: PENUMPANG                                             */
/*==============================================================*/
create table PENUMPANG
(
   ID_PENUMPANG         varchar(20) not null  comment '',
   NIK                  bigint not null  comment '',
   NAMA                 varchar(100) not null  comment '',
   primary key (ID_PENUMPANG)
);

/*==============================================================*/
/* Table: STASIUN                                               */
/*==============================================================*/
create table STASIUN
(
   ID_STASIUN           varchar(20) not null  comment '',
   NAMA_STASIUN         varchar(100) not null  comment '',
   KEPALA_STASIUN       varchar(50) not null  comment '',
   ALAMAT_STASIUN       varchar(200) not null  comment '',
   primary key (ID_STASIUN)
);

/*==============================================================*/
/* Table: TRANSAKSI                                             */
/*==============================================================*/
create table TRANSAKSI
(
   ID_TRANSAKSI         varchar(20) not null  comment '',
   ID_JADWAL_KERETA     varchar(20)  comment '',
   ID_USER              varchar(12)  comment '',
   KODE_BANK            varchar(20)  comment '',
   WAKTU_PEMESANAN      timestamp not null  comment '',
   HARGA                bigint not null  comment '',
   primary key (ID_TRANSAKSI)
);

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
create table USER
(
   ID_USER              varchar(12) not null  comment '',
   USERNAME             varchar(50) not null  comment '',
   NO_HP                varchar(20) not null  comment '',
   PASSWORD             varchar(50) not null  comment '',
   ALAMAT               varchar(200) not null  comment '',
   primary key (ID_USER)
);

--alter table

alter table DETAIL_PEMBAYARAN add constraint FK_DETAIL_P_RELATIONS_TRANSAKS foreign key (ID_TRANSAKSI)
      references TRANSAKSI (ID_TRANSAKSI) on delete restrict on update restrict;

alter table DETAIL_TRANSAKSI add constraint FK_DETAIL_T_RELATIONS_TRANSAKS foreign key (ID_TRANSAKSI)
      references TRANSAKSI (ID_TRANSAKSI) on delete restrict on update restrict;

alter table DETAIL_TRANSAKSI add constraint FK_DETAIL_T_RELATIONS_PENUMPAN foreign key (ID_PENUMPANG)
      references PENUMPANG (ID_PENUMPANG) on delete restrict on update restrict;

alter table JADWAL_KERETA add constraint FK_JADWAL_K_RELATIONS_KERETA foreign key (ID_KERETA)
      references KERETA (ID_KERETA) on delete restrict on update restrict;

alter table JADWAL_KERETA add constraint FK_JADWAL_K_RELATIONS_KELAS foreign key (ID_KELAS)
      references KELAS (ID_KELAS) on delete restrict on update restrict;

alter table TRANSAKSI add constraint FK_TRANSAKS_RELATIONS_JADWAL_K foreign key (ID_JADWAL_KERETA)
      references JADWAL_KERETA (ID_JADWAL_KERETA) on delete restrict on update restrict;

alter table TRANSAKSI add constraint FK_TRANSAKS_RELATIONS_USER foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table TRANSAKSI add constraint FK_TRANSAKS_RELATIONS_METODE_P foreign key (KODE_BANK)
      references METODE_PEMBAYARAN (KODE_BANK) on delete restrict on update restrict;


--drop table

DROP TABLE user2;




      -- CRUD

      -- CREATE/INSERT

      -- user

      INSERT INTO `user` (`ID_USER`, `USERNAME`, `NO_HP`, `PASSWORD`, `ALAMAT`) VALUES ('U02', 'Didin07', '082281649815', 'Anakbasket07*', 'Babakan sari cibiru, Manisi'), ('U01', 'farhan02', '086533514213', 'anakbasket07*', 'bogor jawa barat');

      -- kereta

      INSERT INTO `kereta` (`ID_KERETA`, `NAMA_KERETA_`) VALUES ('KA-AP01', 'Argo Parahiyangan 01 ');

      INSERT INTO `kereta` (`ID_KERETA`, `NAMA_KERETA_`) VALUES ('KA-KB02', 'KebumenRail');

      -- kelas 

      INSERT INTO `kelas` (`ID_KELAS`, `NAMA_KELAS`) VALUES ('KE01', 'Eksekutif'), ('KE02', 'Ekonomi'), ('KE03', 'Bisnis');

      -- penumpang

      INSERT INTO `penumpang` (`ID_PENUMPANG`, `NIK`, `NAMA`) VALUES ('PE01', '166123172361231623', 'Ahmad Maulidi Roofiad'), ('PE02', '1237123123718231', 'Andriyan Rp');

      -- stasiun
      INSERT INTO `stasiun` (`ID_STASIUN`, `NAMA_STASIUN`, `KEPALA_STASIUN`, `ALAMAT_STASIUN`) VALUES ('STA01', 'Kiara condong', 'Rubiyanto', 'Kiara condong,kota bandung, jawa barat'), ('STA02', 'Bandung', 'Hermansyah', 'siliwangi');

      --metode pembayaran
      INSERT INTO `metode_pembayaran` (`KODE_BANK`, `NAMA_BANK`) VALUES ('KB01', 'BNI'), ('KB02', 'BRI');

      --jadwal kereta

      INSERT INTO `jadwal_kereta` (`ID_JADWAL_KERETA`, `ID_KERETA`, `ID_KELAS`, `KODE_STASIUN_ASAL`, `KODE_STASIUN_TUJUAN`, `WAKTU_BERANGKAT`, `WAKTU_TIBA`, `HARGA`) VALUES ('JK01', 'KA-AP01', 'KE01', 'STA01', 'STA02', '2023-04-19 13:50:26', '2023-04-19 20:00', '80000');

      INSERT INTO `jadwal_kereta` (`ID_JADWAL_KERETA`, `ID_KERETA`, `ID_KELAS`, `KODE_STASIUN_ASAL`, `KODE_STASIUN_TUJUAN`, `WAKTU_BERANGKAT`, `WAKTU_TIBA`, `HARGA`) VALUES ('JK02', 'KA-KB02', 'KE02', 'STA02', 'STA01', '2023-04-30 09:00', '2023-04-30 16:00', '120000');

      INSERT INTO `jadwal_kereta` (`ID_JADWAL_KERETA`, `ID_KERETA`, `ID_KELAS`, `KODE_STASIUN_ASAL`, `KODE_STASIUN_TUJUAN`, `WAKTU_BERANGKAT`, `WAKTU_TIBA`, `HARGA`) VALUES ('JK03', 'KA-KB02', 'KE02', 'STA02', 'STA01', '2023-04-30 09:31:16.000000', '2023-04-30 22:50:16', '150000');

      --transaksi

      INSERT INTO `transaksi` (`ID_TRANSAKSI`, `ID_JADWAL_KERETA`, `ID_USER`, `KODE_BANK`, `WAKTU_PEMESANAN`, `HARGA`) VALUES ('TR01', 'JK01', 'U01', 'KB01', '2023-04-30 14:03:01', '80000');

      INSERT INTO `transaksi` (`ID_TRANSAKSI`, `ID_JADWAL_KERETA`, `ID_USER`, `KODE_BANK`, `WAKTU_PEMESANAN`, `HARGA`) VALUES ('TR02', 'JK02', 'U02', 'KB02', '2023-04-19 14:01:44', '120000');

      --detail transaksi
      INSERT INTO `detail_transaksi` (`ID_DETAL_TRANSAKSI`, `ID_TRANSAKSI`, `ID_PENUMPANG`) VALUES ('DTR01', 'TR01', 'PE01'), ('DTR02', 'TR02', 'PE02');
      INSERT INTO `detail_transaksi` (`ID_DETAL_TRANSAKSI`, `ID_TRANSAKSI`, `ID_PENUMPANG`) VALUES ('DTR03', 'TR01', 'PE02');

      --detail pembayaran
      INSERT INTO `detail_pembayaran` (`ID_DETAIL_PEMBAYARAN`, `ID_TRANSAKSI`, `WAKTU`, `STATUS`) VALUES ('DPE01', 'TR01', '2023-04-12 14:04:46', 'Belum dibayar');

      INSERT INTO `detail_pembayaran` (`ID_DETAIL_PEMBAYARAN`, `ID_TRANSAKSI`, `WAKTU`, `STATUS`) VALUES ('DPE02', 'TR01', '2023-04-12 14:07:44', 'Sudah dibayar');

      -- READ
      SELECT * FROM `kereta`


      -- UPDATE
      UPDATE `kereta` SET `NAMA_KERETA_` = 'Argo Perambanan 01 ' WHERE `kereta`.`ID_KERETA` = 'KA-AP01';

      -- DELETE
      DELETE FROM `kereta` WHERE `kereta`.`ID_KERETA` = 'KA-AP01'

      -- 1. Berapa keuntungan penjualan tiket dalam 1 tahun ?

      SELECT date(WAKTU_PEMESANAN), sum(HARGA) AS 'pemasukkan' FROM transaksi GROUP BY date (WAKTU_PEMESANAN);

      --2.Berapa jumlah tiket yang terjual dalam 1 hari ?

      SELECT date(transaksi.WAKTU_PEMESANAN), COUNT(id_detail_transaksi) FROM transaksi inner JOIN detail_transaksi ON transaksi.ID_TRANSAKSI=detail_transaksi.ID_TRANSAKSI GROUP BY date(transaksi.WAKTU_PEMESANAN);
        

      -- 3. Kereta mana yang jumlah pembelian tiket paling banyak ?

      SELECT kereta.NAMA_KERETA_, COUNT(detail_transaksi.ID_DETAIL_TRANSAKSI) AS'jumlah pembelian tiket' FROM detail_transaksi inner JOIN transaksi ON transaksi.ID_TRANSAKSI=detail_transaksi.ID_TRANSAKSI inner JOIN jadwal_kereta ON transaksi.ID_JADWAL_KERETA = jadwal_kereta.ID_JADWAL_KERETA inner JOIN kereta ON jadwal_kereta.ID_KERETA=kereta.ID_KERETA GROUP BY kereta.NAMA_KERETA_ ORDER BY COUNT(detail_transaksi.ID_DETAIL_TRANSAKSI) DESC LIMIT 1;

      --4 Kereta mana yang jumlah pembelian tiket paling sedikit ?
      SELECT kereta.NAMA_KERETA_, COUNT(detail_transaksi.ID_DETAIL_TRANSAKSI) AS'jumlah pembelian tiket' FROM detail_transaksi inner JOIN transaksi ON transaksi.ID_TRANSAKSI=detail_transaksi.ID_TRANSAKSI inner JOIN jadwal_kereta ON transaksi.ID_JADWAL_KERETA = jadwal_kereta.ID_JADWAL_KERETA inner JOIN kereta ON jadwal_kereta.ID_KERETA=kereta.ID_KERETA GROUP BY kereta.NAMA_KERETA_ ORDER BY COUNT(detail_transaksi.ID_DETAIL_TRANSAKSI) ASC LIMIT 1;

      --5. Nama penumpang pada 1 transaksi ?
      SELECT a.ID_DETAIL_TRANSAKSI, b.ID_PENUMPANG, b.NIK,b.NAMA FROM detail_transaksi AS a inner JOIN penumpang AS b ON a.ID_PENUMPANG = b.ID_PENUMPANG WHERE a.ID_TRANSAKSI LIKE 'TR02';

     
     