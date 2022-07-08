create database db_arackiralama
use db_arackiralama

create table tbl_araclar
(
aracID int primary key,
arac_marka varchar(20),
arac_model nvarchar(20),
uretim_yili smallint,
arac_kiralama_fiyati smallint
)

create table tbl_kategoriler
(
kategoriID int,
arac_siniflari char(10) primary key
)

ALTER TABLE tbl_kategoriler
ADD  UNIQUE (kategoriID)

create table tbl_aracozellikleri
(
aracID int foreign key references tbl_araclar(aracID),
arac_siniflari char(10) foreign key references tbl_kategoriler(arac_siniflari),
yakýt_turu char(10),
kasa_tipi char(10),
motor_gucu char(15)
)

create table tbl_kiralama_istasyonlari
(
istasyonID int primary key,
il nvarchar(30),
ilce nvarchar(40)
)

create table tbl_kiralama_istasyonlari_telefonlari
(
istasyonID int foreign key references tbl_kiralama_istasyonlari (istasyonID),
iletisim_numarasi varchar(11)
)

alter table tbl_kiralama_istasyonlari_telefonlari
alter column iletisim_numarasi varchar(14);

create table tbl_musteriler
(
musteriID int primary key,
musteri_ad nvarchar(15),
musteri_soyad nvarchar(25),
dogum_tarihi date,
mail nvarchar(40),
kayit_tarihi date
)

create table tbl_rezervasyonlar
(
aracID int foreign key references tbl_araclar(aracID),
rezervasyonID int primary key,
musteriID int foreign key references tbl_musteriler(musteriID),
rezervasyon_tarihi date,
rezervasyon_yapilan_istasyonID int
)

create table tbl_musteriodemeler
(
odeme_turu char(10),
odeme_aciklamasi nvarchar(max),
banka_adi char(15)
)

alter table tbl_musteriodemeler 
add musteriID int foreign key references tbl_musteriler(musteriID);

alter table tbl_musteriodemeler
alter column odeme_turu char(20);

alter table tbl_musteriodemeler
alter column banka_adi char(40);

create table tbl_musteriindirimleri
(
indirim_kodu nvarchar(30),
indirim_aciklamasi nvarchar(max)
)

alter table tbl_musteriindirimleri 
add musteriID int foreign key references tbl_musteriler(musteriID);

create table tbl_kiralama_noktasi
(
istasyonID int foreign key references tbl_kiralama_istasyonlari (istasyonID),
bulundugu_ilin_postakodu int
)

alter table tbl_kiralama_noktasi
add musteriID int foreign key references tbl_musteriler(musteriID);

alter table tbl_kiralama_noktasi
alter column bulundugu_ilin_postakodu varchar(5);

/*Araçlar kategorisinin kayýtlarý*/

insert into tbl_araclar (aracID, arac_marka, arac_model, uretim_yili, arac_kiralama_fiyati)
values ('1', 'Chevrolet', 'Impala', '1967', '3000');
insert into tbl_araclar (aracID, arac_marka, arac_model, uretim_yili, arac_kiralama_fiyati)
values ('2', 'Chevrolet', 'Belair', '1957', '5000');
insert into tbl_araclar (aracID, arac_marka, arac_model, uretim_yili, arac_kiralama_fiyati)
values ('3', 'Dodge', 'Charger', '1969', '3000');
insert into tbl_araclar (aracID, arac_marka, arac_model, uretim_yili, arac_kiralama_fiyati)
values ('4', 'Chevrolet', 'Chevelle', '1970', '2500');
insert into tbl_araclar (aracID, arac_marka, arac_model, uretim_yili, arac_kiralama_fiyati)
values ('5', 'Ford', 'Torino', '1970', '3500');
insert into tbl_araclar (aracID, arac_marka, arac_model, uretim_yili, arac_kiralama_fiyati)
values ('6', 'Plymouth', 'Barracuda', '1970', '2000');
insert into tbl_araclar (aracID, arac_marka, arac_model, uretim_yili, arac_kiralama_fiyati)
values ('7', 'Dodge', 'Challenger', '1970', '4000');
insert into tbl_araclar (aracID, arac_marka, arac_model, uretim_yili, arac_kiralama_fiyati)
values ('8', 'Chevrolet', 'Corvette Stingray', '1960', '5000');
insert into tbl_araclar (aracID, arac_marka, arac_model, uretim_yili, arac_kiralama_fiyati)
values ('9', 'Ford', 'Mustang', '1965', '2500');
insert into tbl_araclar (aracID, arac_marka, arac_model, uretim_yili, arac_kiralama_fiyati)
values ('10', 'Ford', 'Thunderbird', '1963', '4500');

/* Kategoriler tablosunun kayýtlarý*/

insert into tbl_kategoriler (kategoriID, arac_siniflari)
values ('1', 'A');
insert into tbl_kategoriler (kategoriID, arac_siniflari)
values ('2', 'B');
insert into tbl_kategoriler (kategoriID, arac_siniflari)
values ('3', 'C');
insert into tbl_kategoriler (kategoriID, arac_siniflari)
values ('4', 'D');
insert into tbl_kategoriler (kategoriID, arac_siniflari)
values ('5', 'E');
insert into tbl_kategoriler (kategoriID, arac_siniflari)
values ('6', 'F');
insert into tbl_kategoriler (kategoriID, arac_siniflari)
values ('7', 'M');
insert into tbl_kategoriler (kategoriID, arac_siniflari)
values ('8', 'J');
insert into tbl_kategoriler (kategoriID, arac_siniflari)
values ('9', 'S');
insert into tbl_kategoriler (kategoriID, arac_siniflari)
values ('10', 'PICK-UP');

/* Araç özellikleri tablosunun kayýtlarý*/

insert into tbl_aracozellikleri (aracID, arac_siniflari, yakýt_turu, kasa_tipi, motor_gucu)
values ('1', 'E', 'Benzin', 'Sedan', '385HP');
insert into tbl_aracozellikleri (aracID, arac_siniflari, yakýt_turu, kasa_tipi, motor_gucu)
values ('2', 'E', 'Benzin', 'Coupe', '180HP');
insert into tbl_aracozellikleri (aracID, arac_siniflari, yakýt_turu, kasa_tipi, motor_gucu)
values ('3', 'S', 'Benzin', 'Coupe', '375HP');
insert into tbl_aracozellikleri (aracID, arac_siniflari, yakýt_turu, kasa_tipi, motor_gucu)
values ('4', 'S', 'Benzin', 'Coupe', '450HP');
insert into tbl_aracozellikleri (aracID, arac_siniflari, yakýt_turu, kasa_tipi, motor_gucu)
values ('5', 'S', 'Benzin', 'Coupe', '370HP');
insert into tbl_aracozellikleri (aracID, arac_siniflari, yakýt_turu, kasa_tipi, motor_gucu)
values ('6', 'S', 'Benzin', 'Coupe', '147HP');
insert into tbl_aracozellikleri (aracID, arac_siniflari, yakýt_turu, kasa_tipi, motor_gucu)
values ('7', 'S', 'Benzin', 'Coupe', '425HP');
insert into tbl_aracozellikleri (aracID, arac_siniflari, yakýt_turu, kasa_tipi, motor_gucu)
values ('8', 'S', 'Benzin', 'Coupe', '270HP');
insert into tbl_aracozellikleri (aracID, arac_siniflari, yakýt_turu, kasa_tipi, motor_gucu)
values ('9', 'E', 'Benzin', 'Coupe', '120HP');
insert into tbl_aracozellikleri (aracID, arac_siniflari, yakýt_turu, kasa_tipi, motor_gucu)
values ('10', 'S', 'Benzin', 'Coupe', '300HP');

/*Kiralama yapýlan istasyonlarýn kayýtlarý*/

insert into tbl_kiralama_istasyonlari (istasyonID, il, ilce)
values ('1', 'Ýstanbul', 'Kadýköy');
insert into tbl_kiralama_istasyonlari (istasyonID, il, ilce)
values ('2', 'Ýstanbul', 'Bakýrköy');
insert into tbl_kiralama_istasyonlari (istasyonID, il, ilce)
values ('3', 'Ýstanbul', 'Beylikdüzü');
insert into tbl_kiralama_istasyonlari (istasyonID, il, ilce)
values ('4', 'Ýzmir', 'Menderes');
insert into tbl_kiralama_istasyonlari (istasyonID, il, ilce)
values ('5', 'Ýzmir', 'Konak');
insert into tbl_kiralama_istasyonlari (istasyonID, il, ilce)
values ('6', 'Malatya', 'Yeþilyurt');
insert into tbl_kiralama_istasyonlari (istasyonID, il, ilce)
values ('7', 'Trabzon', 'Akçaabat');
insert into tbl_kiralama_istasyonlari (istasyonID, il, ilce)
values ('8', 'Aydýn', 'Kuþadasý');
insert into tbl_kiralama_istasyonlari (istasyonID, il, ilce)
values ('9', 'Mersin', 'Erdemli');
insert into tbl_kiralama_istasyonlari (istasyonID, il, ilce)
values ('10', 'Sakarya', 'Adapazarý');

/* Kiralama istasyonlarýnýn telefonlarýnýn kayýtlarý */

insert into tbl_kiralama_istasyonlari_telefonlari (istasyonID, iletisim_numarasi)
values ('1', '0212-136-96-24');
insert into tbl_kiralama_istasyonlari_telefonlari (istasyonID, iletisim_numarasi)
values ('2', '0212-134-48-41');
insert into tbl_kiralama_istasyonlari_telefonlari (istasyonID, iletisim_numarasi)
values ('3', '0212-132-77-81');
insert into tbl_kiralama_istasyonlari_telefonlari (istasyonID, iletisim_numarasi)
values ('4', '0212-131-11-05');
insert into tbl_kiralama_istasyonlari_telefonlari (istasyonID, iletisim_numarasi)
values ('5', '0212-133-02-64');
insert into tbl_kiralama_istasyonlari_telefonlari (istasyonID, iletisim_numarasi)
values ('6', '0212-135-00-17');
insert into tbl_kiralama_istasyonlari_telefonlari (istasyonID, iletisim_numarasi)
values ('7', '0212-137-03-44');
insert into tbl_kiralama_istasyonlari_telefonlari (istasyonID, iletisim_numarasi)
values ('8', '0212-130-19-00');
insert into tbl_kiralama_istasyonlari_telefonlari (istasyonID, iletisim_numarasi)
values ('9', '0212-138-93-10');
insert into tbl_kiralama_istasyonlari_telefonlari (istasyonID, iletisim_numarasi)
values ('10', '0212-139-56-28');

/* Müþteriler kategorisinin kayýtlarý */

insert into tbl_musteriler (musteriID, musteri_ad, musteri_soyad, dogum_tarihi, mail, kayit_tarihi)
values ('1', 'Yusuf', 'ER', '1998.02.27', 'yusufbruh@gmail.com', '2021.01.10');
insert into tbl_musteriler (musteriID, musteri_ad, musteri_soyad, dogum_tarihi, mail, kayit_tarihi)
values ('2', 'Osman', 'MÜCEVHER', '1993.12.14', 'osman93@gmail.com', '2020.11.12');
insert into tbl_musteriler (musteriID, musteri_ad, musteri_soyad, dogum_tarihi, mail, kayit_tarihi)
values ('3', 'Ahmet', 'ÇELÝK', '1995.06.09', 'otakuking@gmail.com', '2021.01.07');
insert into tbl_musteriler (musteriID, musteri_ad, musteri_soyad, dogum_tarihi, mail, kayit_tarihi)
values ('4', 'Harun', 'BAKIR', '2002.04.01', 'rapperharun@gmail.com', '2020.09.17');
insert into tbl_musteriler (musteriID, musteri_ad, musteri_soyad, dogum_tarihi, mail, kayit_tarihi)
values ('5', 'Soner', 'ATSIZ', '2000.01.18', 'yasasinirkimiz@gmail.com', '2019.05.25');
insert into tbl_musteriler (musteriID, musteri_ad, musteri_soyad, dogum_tarihi, mail, kayit_tarihi)
values ('6', 'Fuat', 'FIRAT', '1998.03.15', 'hunterfuat@gmail.com', '2019.04.28');
insert into tbl_musteriler (musteriID, musteri_ad, musteri_soyad, dogum_tarihi, mail, kayit_tarihi)
values ('7', 'Kazým', 'GÜNDOÐDU', '1996.06.19', 'bmwyavuz@gmail.com', '2020.09.13');
insert into tbl_musteriler (musteriID, musteri_ad, musteri_soyad, dogum_tarihi, mail, kayit_tarihi)
values ('8', 'Serkan', 'SUCU', '1991.12.13', 'tekstilustasi@gmail.com', '2020.11.08');
insert into tbl_musteriler (musteriID, musteri_ad, musteri_soyad, dogum_tarihi, mail, kayit_tarihi)
values ('9', 'Emircan', 'AKYÜZ', '2001.12.14', 'astronotemir@gmail.com', '2020.10.30');
insert into tbl_musteriler (musteriID, musteri_ad, musteri_soyad, dogum_tarihi, mail, kayit_tarihi)
values ('10', 'Furkan', 'KIZIL', '2000.02.03', 'kýrtlatgelsin@gmail.com', '2020.11.08');

/* Rezevasyon tablolarýnýn kayýtlarý */

insert into tbl_rezervasyonlar (aracID, rezervasyonID, musteriID, rezervasyon_tarihi, rezervasyon_yapilan_istasyonID)
values ('2', '1', '3', '2021.02.14', '3');
insert into tbl_rezervasyonlar (aracID, rezervasyonID, musteriID, rezervasyon_tarihi, rezervasyon_yapilan_istasyonID)
values ('4', '2', '4', '2021.04.23', '3');
insert into tbl_rezervasyonlar (aracID, rezervasyonID, musteriID, rezervasyon_tarihi, rezervasyon_yapilan_istasyonID)
values ('5', '3', '2', '2021.02.21', '2');
insert into tbl_rezervasyonlar (aracID, rezervasyonID, musteriID, rezervasyon_tarihi, rezervasyon_yapilan_istasyonID)
values ('1', '4', '6', '2021.01.28', '1');
insert into tbl_rezervasyonlar (aracID, rezervasyonID, musteriID, rezervasyon_tarihi, rezervasyon_yapilan_istasyonID)
values ('3', '5', '1', '2021.03.14', '7');
insert into tbl_rezervasyonlar (aracID, rezervasyonID, musteriID, rezervasyon_tarihi, rezervasyon_yapilan_istasyonID)
values ('8', '6', '5', '2021.01.29', '8');
insert into tbl_rezervasyonlar (aracID, rezervasyonID, musteriID, rezervasyon_tarihi, rezervasyon_yapilan_istasyonID)
values ('10', '7', '8', '2021.05.08', '6');
insert into tbl_rezervasyonlar (aracID, rezervasyonID, musteriID, rezervasyon_tarihi, rezervasyon_yapilan_istasyonID)
values ('9', '8', '9', '2021.03.11', '4');
insert into tbl_rezervasyonlar (aracID, rezervasyonID, musteriID, rezervasyon_tarihi, rezervasyon_yapilan_istasyonID)
values ('7', '9', '10', '2021.03.17', '5');
insert into tbl_rezervasyonlar (aracID, rezervasyonID, musteriID, rezervasyon_tarihi, rezervasyon_yapilan_istasyonID)
values ('6', '10', '7', '2021.02.19', '5');

/* Ödemeler tablosunun kayýlarý */

insert into tbl_musteriodemeler (odeme_turu, odeme_aciklamasi, banka_adi, musteriID)
values ('Kredi Kartý', '6 ay taksit', 'Garanti Bankasý', '1');
insert into tbl_musteriodemeler (odeme_turu, odeme_aciklamasi, banka_adi, musteriID)
values ('Kredi Kartý', '9 ay taksit', 'Yapý Kredi', '2');
insert into tbl_musteriodemeler (odeme_turu, odeme_aciklamasi, banka_adi, musteriID)
values ('Kredi Kartý', '3 ay taksit', 'Türkiye Ýþ Bankasý', '3');
insert into tbl_musteriodemeler (odeme_turu, odeme_aciklamasi, banka_adi, musteriID)
values ('Kredi Kartý', '2 ay taksit', 'DenizBank', '4');
insert into tbl_musteriodemeler (odeme_turu, odeme_aciklamasi, banka_adi, musteriID)
values ('Kredi Kartý', 'Tek Çekim', 'Ziraat Bankasý', '5');
insert into tbl_musteriodemeler (odeme_turu, odeme_aciklamasi, banka_adi, musteriID)
values ('Nakit', 'Direk elden verilecek', 'Nakit olucak', '6');
insert into tbl_musteriodemeler (odeme_turu, odeme_aciklamasi, banka_adi, musteriID)
values ('Kredi Kartý', 'Tek Çekim', 'Garanti Bankasý', '7');
insert into tbl_musteriodemeler (odeme_turu, odeme_aciklamasi, banka_adi, musteriID)
values ('Kredi Kartý', '6 ay taksit', 'HalkBank', '8');
insert into tbl_musteriodemeler (odeme_turu, odeme_aciklamasi, banka_adi, musteriID)
values ('Kredi Kartý', '3 ay taksit', 'VakýfBank', '9');
insert into tbl_musteriodemeler (odeme_turu, odeme_aciklamasi, banka_adi, musteriID)
values ('Kredi Kartý', '2 ay taksit', 'Kuveyt Türk', '10');

/* Ýndirimler tablosunun kayýtlarý */

insert into tbl_musteriindirimleri (indirim_kodu, indirim_aciklamasi, musteriID)
values ('BRUHSJ', 'Ýndirim kodu sayesinde %20 indirim', '1');
insert into tbl_musteriindirimleri (indirim_kodu, indirim_aciklamasi, musteriID)
values ('HIKOBABA', 'Ýndirim kodu sayesinde %10 indirim', '2');
insert into tbl_musteriindirimleri (indirim_kodu, indirim_aciklamasi, musteriID)
values ('ARELUNI', 'Ýndirim kodu sayesinde %15 indirim', '3');
insert into tbl_musteriindirimleri (indirim_kodu, indirim_aciklamasi, musteriID)
values ('MALATYA', 'Ýndirim kodu sayesinde %5 indirim', '4');
insert into tbl_musteriindirimleri (indirim_kodu, indirim_aciklamasi, musteriID)
values ('TRABZON', 'Ýndirim kodu sayesinde %40 indirim', '5');
insert into tbl_musteriindirimleri (indirim_kodu, indirim_aciklamasi, musteriID)
values ('MUTLU', 'Ýndirim kodu sayesinde %30 indirim', '6');
insert into tbl_musteriindirimleri (indirim_kodu, indirim_aciklamasi, musteriID)
values ('MOTÖRHEAD', 'Ýndirim kodu sayesinde %50 indirim', '7');
insert into tbl_musteriindirimleri (indirim_kodu, indirim_aciklamasi, musteriID)
values ('CHEVYIMPALA', 'Ýndirim kodu sayesinde %80 indirim', '8');
insert into tbl_musteriindirimleri (indirim_kodu, indirim_aciklamasi, musteriID)
values ('MÖTLEYCRÜE', 'Ýndirim kodu sayesinde %45 indirim', '9');
insert into tbl_musteriindirimleri (indirim_kodu, indirim_aciklamasi, musteriID)
values ('OVERKILL', 'Ýndirim kodu sayesinde %35 indirim', '10');

/* Kiralanma noktasýnýn (arabanýn teslim alýnacaðý yerin) kayýtlarý */

insert into tbl_kiralama_noktasi (istasyonID, bulundugu_ilin_postakodu, musteriID)
values ('7', '61300', '1');
insert into tbl_kiralama_noktasi (istasyonID, bulundugu_ilin_postakodu, musteriID)
values ('2', '34158', '2');
insert into tbl_kiralama_noktasi (istasyonID, bulundugu_ilin_postakodu, musteriID)
values ('3', '34520', '3');
insert into tbl_kiralama_noktasi (istasyonID, bulundugu_ilin_postakodu, musteriID)
values ('3', '34520', '4');
insert into tbl_kiralama_noktasi (istasyonID, bulundugu_ilin_postakodu, musteriID)
values ('8', '09400', '5');
insert into tbl_kiralama_noktasi (istasyonID, bulundugu_ilin_postakodu, musteriID)
values ('1', '34734', '6');
insert into tbl_kiralama_noktasi (istasyonID, bulundugu_ilin_postakodu, musteriID)
values ('5', '35220', '7');
insert into tbl_kiralama_noktasi (istasyonID, bulundugu_ilin_postakodu, musteriID)
values ('6', '44915', '8');
insert into tbl_kiralama_noktasi (istasyonID, bulundugu_ilin_postakodu, musteriID)
values ('4', '35471', '9');
insert into tbl_kiralama_noktasi (istasyonID, bulundugu_ilin_postakodu, musteriID)
values ('5', '35220', '10');

-------------------------------------------------------

/* select sorgularý */


use db_arackiralama
/*þirkette fiyata 3000 TL den az olan araçlarý kiralamak isteyen müþteriler için sorgu*/

select * from tbl_araclar where arac_kiralama_fiyati<3000

/*þirkette araç fiyatlarý pahalý olan araclarý listeleyen sorgu*/

select * from tbl_araclar where arac_kiralama_fiyati>=3500

/*arabayý istanbul ve izmirden alýcak olan müþterileri listeleyen sorgu*/

select * from tbl_kiralama_noktasi where istasyonID<=5 

/*araçlarýn ortalama fiyatýný listeleyen sorgu*/

select avg(arac_kiralama_fiyati) as [ortalama kiralama fiyatý] from tbl_araclar

/*hangi müþterinin hangi indirim kodundan ne kadar indirim saðlayacaðýný listeleyen sorgu*/

select * from tbl_musteriindirimleri

----------------------------------------------------------

/*Saklý yordam boþ queryden eklenmiþtir*/

create procedure arackiralamafiyatgetir (@fiyat smallint)
as
select * from tbl_araclar where arac_kiralama_fiyati=@fiyat

exec arackiralamafiyatgetir '3000' 

------------------------------------------------------------

/*Trigger komutu boþ queryden eklenmiþtir*/

create trigger yenimusterikaydi
on tbl_musteriler
after insert
as
begin
  select 'Yeni müþteri kaydý yapýldý'
end

insert into tbl_musteriler values(12, 'Salih', 'TARÝ', '1991.05.23', 'salih@gmail.com', '2021.01.27')

------------------------------------------------------------

/*Skaler deðerli fonksiyon (boþ queryden eklenmiþtir)*/

create function arac_kiralama_fiyati (@gelenfiyat smallint)
returns smallint 
as
begin
declare @fiyat smallint
select @fiyat=count(arac_kiralama_fiyati) from tbl_araclar where arac_kiralama_fiyati=@gelenfiyat
return @fiyat
end

select dbo.arac_kiralama_fiyati('3500')

/*Tablo deðerli fonksiyon (boþ queryden eklenmiþtir)*/

create function motor_gucu (@gelenbeygirgucu char(15))
returns table
as
return (select * from tbl_aracozellikleri where motor_gucu>@gelenbeygirgucu)

select motor_gucu from dbo.motor_gucu(150)

------------------------------------------------------------