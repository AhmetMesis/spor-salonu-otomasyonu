-- Antrenör ekleme
-- Yeni antrenör eklemek için saklı yordamı çağırma
INSERT INTO Roller (rol_id, rol_adi)
VALUES 
(2, 'Antrenör'),
(1, 'Yönetici');

INSERT INTO admins ( isim, sifre, rol_id)
VALUES 
( 'Mehmet', 'sifre123', 3); -- Yönetici



EXEC AntrenorEkle 
    @isim = 'Ali Veli',
    @tel_no = '555-1234',
    @uzmanlik = 'Fitness',
    @sifre = '9845'; 
EXEC AntrenorEkle 
    @isim = 'Ayşe yılmaz',
    @tel_no = '555-6765',
    @uzmanlik = 'Yoga',
    @sifre = '9845'; 
EXEC AntrenorEkle 
    @isim = 'Fatma Çelik',
    @tel_no = '556-1234',
    @uzmanlik = 'Pilates',
    @sifre = '9845'; 
EXEC AntrenorEkle 
    @isim = 'Cem Demir',
    @tel_no = '555-6542',
    @uzmanlik = 'CrossFit',
    @sifre = '9845'; 


---------------------------------------------------------

-- Program ekleme
INSERT INTO Programlar (program_isim, ant_id, aciklama)
VALUES ('Yoga', 2, 'Rahatlama ve esneme programı');

INSERT INTO Programlar (program_isim, ant_id, aciklama)
VALUES ('Fitness', 1, 'Genel vücut geliştirme ve kondisyon programı');

INSERT INTO Programlar (program_isim, ant_id, aciklama)
VALUES ('Pilates', 3, 'Esneklik ve core güçlendirme programı');

INSERT INTO Programlar (program_isim, ant_id, aciklama)
VALUES ('CrossFit', 4, 'Yüksek yoğunluklu fonksiyonel antrenman programı');

INSERT INTO Programlar (program_isim, ant_id, aciklama)
VALUES ('Zumba', 3, 'Dans ve kardiyo kombinasyonu ile eğlenceli bir antrenman');

---------------------------------------------------

-- Kampanya ekleme
INSERT INTO Kampanyalar (isim, indirim_orani, baslangic_tarihi, bitis_tarihi)
VALUES ('Yeni Yıl İndirimi', 20.0, '2025-01-01', '2025-01-31');

INSERT INTO Kampanyalar (isim, indirim_orani, baslangic_tarihi, bitis_tarihi)
VALUES ('Yaz Kampanyası', 15.0, '2025-06-01', '2025-08-31');

INSERT INTO Kampanyalar (isim, indirim_orani, baslangic_tarihi, bitis_tarihi)
VALUES ('Kış Kampanyası', 10.0, '2025-12-01', '2025-12-31');


-------------------------------------------
-- Program Fiyatları ekleme
INSERT INTO ProgramFiyatlari (program_id, sure_ay, fiyat)
VALUES (1, 1, 1500.00), -- Yoga, 1 ay
       (1, 3, 4000.00), -- Yoga, 3 ay
       (1, 6, 7500.00), -- Yoga, 6 ay
       (1, 12, 14000.00), -- Yoga, 12 ay
       (2, 1, 1800.00), -- Fitness, 1 ay
       (2, 3, 5000.00), -- Fitness, 3 ay
       (2, 6, 9000.00), -- Fitness, 6 ay
       (2, 12, 17000.00), -- Fitness, 12 ay
       (3, 1, 1600.00), -- Pilates, 1 ay
       (3, 3, 4500.00), -- Pilates, 3 ay
       (3, 6, 8500.00), -- Pilates, 6 ay
       (3, 12, 16000.00), -- Pilates, 12 ay
       (4, 1, 2000.00), -- CrossFit, 1 ay
       (4, 3, 5500.00), -- CrossFit, 3 ay
       (4, 6, 10000.00), -- CrossFit, 6 ay
       (4, 12, 19000.00), -- CrossFit, 12 ay
       (5, 1, 1300.00), -- Zumba, 1 ay
       (5, 3, 3500.00), -- Zumba, 3 ay
       (5, 6, 6500.00), -- Zumba, 6 ay
       (5, 12, 12000.00); -- Zumba, 12 ay

-----------------------------------------


--------------------------------------------
-- ANTRENÖR MAAŞLARI EKLEME 
-- MAAŞ ÖDENDİĞİNDE BU TABLOYA EKLEME YAPILMALI
INSERT INTO Maaslar (ant_id, miktar, odenen_ay)
VALUES (1, 5000.00, '2025-01-01'), 
       (2, 4500.00, '2025-01-01'), 
       (3, 4800.00, '2025-01-01'), 
       (4, 5200.00, '2025-01-01'); 

INSERT INTO Maaslar (ant_id, miktar, odenen_ay)
VALUES (1, 5000.00, '2025-02-01'), 
       (2, 4500.00, '2025-02-01'), 
       (3, 4800.00, '2025-02-01'), 
       (4, 5200.00, '2025-02-01'); 

------------------------------------------------
-- EKİPMANLAR TABLOSUNA BU ŞEKİLDE EKLEME YAPILIR 
-- DAHA SONRA HANGİ EKİPMANIN HANGİ PROGRAMDA KULLANILDIĞININ BİLGİSİNİ AYRI BİR TABLODA TUTACAĞIZ
INSERT INTO Ekipmanlar (isim, durum, bakim_tarihi, aciklama)
VALUES 
('Koşu Bandı', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Dambıl Seti', 'Kullanımda', '2025-01-01', 'Yeni set.'),
('Bench Press', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Leg Press', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Squat Rack', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Kettlebell Seti', 'Kullanımda', '2025-01-01', 'Yeni set.'),
('Yoga Matı', 'Kullanımda', '2025-01-01', 'Yeni mat.'),
('Pilates Topu', 'Kullanımda', '2025-01-01', 'Yeni top.'),
('CrossFit Halatı', 'Kullanımda', '2025-01-01', 'Yeni halat.'),
('Zumba Step Platformu', 'Kullanımda', '2025-01-01', 'Yeni platform.'),
('Eliptik Bisiklet', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Rowing Machine', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Treadmill', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Stationary Bike', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Smith Machine', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Lat Pulldown Machine', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Cable Crossover Machine', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Leg Curl Machine', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Leg Extension Machine', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Chest Press Machine', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Shoulder Press Machine', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Bicep Curl Machine', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Tricep Extension Machine', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Ab Crunch Machine', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.'),
('Dip Station', 'Kullanımda', '2025-01-01', 'Yeni bakım yapıldı.');


-- EkipmanProgram tablosuna bilgi ekleme
INSERT INTO EkipmanProgram (ekipman_id, program_id)
VALUES 
(1, 2), 
(2, 2), 
(3, 2), 
(4, 2), 
(5, 2), 
(6, 2), 
(7, 1),
(8, 3), 
(9, 4), 
(10, 5), 
(11, 2), 
(12, 2), 
(13, 2), 
(14, 2), 
(15, 2), 
(16, 2), 
(17, 2), 
(18, 2), 
(19, 2), 
(20, 2), 
(21, 2), 
(22, 2), 
(23, 2), 
(24, 2), 
(25, 2); 


--bir ekipmanın durumunu bu şekilde güncelleyebiliriz
UPDATE Ekipmanlar
SET durum = 'Bozuk', bakim_tarihi = GETDATE()
WHERE ekipman_id = 1; 

-----------------------------------------



-- ÜYE EKLEME İŞLEMLERİ: 

DECLARE @yeni_uye_id INT;

INSERT INTO Uyeler (isim, tel, agirlik, boy, yag_orani, cinsiyet, kayit_tarihi, dogum_trihi)
VALUES ('Ahmet Yılmaz', '05551234567', 75.0, 1.80, 18.5, 'Erkek', GETDATE(), '1995-05-15');

SET @yeni_uye_id = SCOPE_IDENTITY();


EXEC UyeKayitVeOdeme @uye_id = @yeni_uye_id, @program_id = 1, @sure_ay = 6, @odeme_yontemi = 'Nakit', @kampanya_id = 1;


 ------------------------------------------
--ÜYE BİLGİLERİ BU ŞEKİLDE GÖSTERİLECEK
SELECT 
    U.uye_id,
    U.isim as isim_soyisim,
    U.tel as telefon_numarası,
    U.uyelik_durumu,
    P.program_isim,
    UK.baslangic_tarihi,
    UK.bitis_tarihi
FROM 
    UyeKatilim UK
JOIN 
    Uyeler U ON UK.uye_id = U.uye_id
JOIN 
    Programlar P ON UK.program_id = P.program_id;



