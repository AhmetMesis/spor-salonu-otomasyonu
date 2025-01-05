-- Veritabanı oluşturma
--CREATE DATABASE SporSalonu;
--GO
USE SporSalonu;
GO

-- "Üyeler" tablosu
CREATE TABLE Uyeler (
    uye_id INT IDENTITY(1,1) PRIMARY KEY,
    isim NVARCHAR(100) NOT NULL,
    tel NVARCHAR(15),
    agirlik FLOAT,
    boy FLOAT,
    yag_orani FLOAT,
    cinsiyet NVARCHAR(10) CHECK (cinsiyet IN ('Erkek', 'Kadın')) NOT NULL,
    kayit_tarihi DATE NOT NULL,
    dogum_trihi DATE,
    uyelik_durumu NVARCHAR(10) CHECK (uyelik_durumu IN ('Aktif', 'Pasif')) DEFAULT 'Pasif'
);

-- "Antrenörler" tablosu
CREATE TABLE Antrenorler (
    ant_id INT IDENTITY(1,1) PRIMARY KEY,
    isim NVARCHAR(100) NOT NULL,
    tel_no NVARCHAR(15),
    uzmanlik NVARCHAR(100) NOT NULL
);

-- "Programlar" tablosu
CREATE TABLE Programlar (
    program_id INT IDENTITY(1,1) PRIMARY KEY,
    program_isim NVARCHAR(100) NOT NULL,
    ant_id INT,
    aciklama NVARCHAR(255),
    FOREIGN KEY (ant_id) REFERENCES Antrenorler(ant_id)
);

-- "Program Fiyatları" tablosu
CREATE TABLE ProgramFiyatlari (
    fiyat_id INT IDENTITY(1,1) PRIMARY KEY,
    program_id INT,
    sure_ay INT CHECK (sure_ay IN (1, 3, 6, 12)) NOT NULL,
    fiyat DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (program_id) REFERENCES Programlar(program_id)
);

-- "Maaşlar" tablosu
CREATE TABLE Maaslar (
    maas_id INT IDENTITY(1,1) PRIMARY KEY,
    ant_id INT,
    miktar DECIMAL(10, 2) NOT NULL,
    odenen_ay DATE NOT NULL,
    FOREIGN KEY (ant_id) REFERENCES Antrenorler(ant_id)
);

-- "Ödeme Detayları" tablosu
CREATE TABLE OdemeDetaylari (
    odeme_id INT IDENTITY(1,1) PRIMARY KEY,
    uye_id INT,
    program_id INT,
    tutar DECIMAL(10, 2) NOT NULL,
    odeme_tarihi DATE NOT NULL,
    odeme_yontemi NVARCHAR(20) CHECK (odeme_yontemi IN ('Nakit', 'Kredi Kartı', 'Havale')) NOT NULL,
    durum NVARCHAR(20) CHECK (durum IN ('Odenmis', 'Odenmemis')) NOT NULL,
    FOREIGN KEY (uye_id) REFERENCES Uyeler(uye_id),
    FOREIGN KEY (program_id) REFERENCES Programlar(program_id)
);

-- "Ekipmanlar" tablosu
CREATE TABLE Ekipmanlar (
    ekipman_id INT IDENTITY(1,1) PRIMARY KEY,
    isim NVARCHAR(100) NOT NULL,
    durum NVARCHAR(20) CHECK (durum IN ('Kullanımda', 'Bozuk')) NOT NULL,
    bakim_tarihi DATE,
    aciklama NVARCHAR(255)
);

-- EkipmanProgram tablosu oluşturma 

CREATE TABLE EkipmanProgram (
ekipman_id INT,
program_id INT,
FOREIGN KEY (ekipman_id) REFERENCES Ekipmanlar(ekipman_id),
FOREIGN KEY (program_id) REFERENCES Programlar(program_id) );

-- "Kampanyalar" tablosu
CREATE TABLE Kampanyalar (
    kampanya_id INT IDENTITY(1,1) PRIMARY KEY,
    isim NVARCHAR(100) NOT NULL,
    indirim_orani FLOAT NOT NULL,
    baslangic_tarihi DATE NOT NULL,
    bitis_tarihi DATE NOT NULL
);

-- "Üye Katılım" tablosu
CREATE TABLE UyeKatilim (
    katilim_id INT IDENTITY(1,1) PRIMARY KEY,
    uye_id INT,
    program_id INT,
    baslangic_tarihi DATE,
    bitis_tarihi DATE,
    FOREIGN KEY (uye_id) REFERENCES Uyeler(uye_id),
    FOREIGN KEY (program_id) REFERENCES Programlar(program_id)
);


CREATE TABLE Roller (
    rol_id INT PRIMARY KEY,
    rol_adi NVARCHAR(50)
);

CREATE TABLE admins (
    admin_id INT IDENTITY(1,1) PRIMARY KEY,
    isim NVARCHAR(100),
    sifre NVARCHAR(100),
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES Roller(rol_id)
);





