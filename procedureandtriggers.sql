CREATE PROCEDURE UyeKayitVeOdeme 
    @uye_id INT, 
    @program_id INT, 
    @sure_ay INT, 
    @odeme_yontemi NVARCHAR(20),
    @kampanya_id INT = NULL -- Kampanya ID'si opsiyonel
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Fiyat bilgisi alma
        DECLARE @fiyat DECIMAL(10, 2);
        SELECT @fiyat = fiyat 
        FROM ProgramFiyatlari 
        WHERE program_id = @program_id AND sure_ay = @sure_ay;

        -- Kampanya indirimi uygulama
        IF @kampanya_id IS NOT NULL
        BEGIN
            DECLARE @indirim_orani FLOAT;
            SELECT @indirim_orani = indirim_orani 
            FROM Kampanyalar 
            WHERE kampanya_id = @kampanya_id;

            -- İndirimli fiyat hesaplama
            SET @fiyat = @fiyat - (@fiyat * @indirim_orani / 100);
        END

        -- Ödeme ekleme
        INSERT INTO OdemeDetaylari (uye_id, program_id, tutar, odeme_tarihi, odeme_yontemi, durum)
        VALUES (@uye_id, @program_id, @fiyat, GETDATE(), @odeme_yontemi, 'Odenmis');

        -- Üyelik güncelleme
        UPDATE Uyeler
        SET uyelik_durumu = 'Aktif'
        WHERE uye_id = @uye_id;

        -- Katılım ekleme
        INSERT INTO UyeKatilim (uye_id, program_id, baslangic_tarihi, bitis_tarihi)
        VALUES (@uye_id, @program_id, GETDATE(), DATEADD(MONTH, @sure_ay, GETDATE()));

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE AntrenorEkle
    @isim NVARCHAR(100),
    @tel_no NVARCHAR(15),
    @uzmanlik NVARCHAR(100),
    @sifre NVARCHAR(100) 
AS
BEGIN
    DECLARE @ant_id INT;

     --Yeni antrenörü Antrenorler tablosuna ekle
    INSERT INTO Antrenorler (isim, tel_no, uzmanlik)
    VALUES (@isim, @tel_no, @uzmanlik);

    INSERT INTO admins ( isim, sifre, rol_id)
    VALUES ( @isim, @sifre, 2);
END;




-- Tetikleyici: Üyelik Durumu Güncelleme

CREATE TRIGGER UyeDurumuGuncelle
ON UyeKatilim
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE Uyeler
    SET uyelik_durumu = 'Pasif'
    WHERE uye_id IN (
        SELECT uye_id
        FROM UyeKatilim
        WHERE bitis_tarihi < GETDATE()
    );
END;
GO




 --Yeni tetikleyici: Üye Silindiğinde Katılım ve Ödeme Bilgilerini Silme
CREATE TRIGGER UyeSilmeTrigger
ON Uyeler
INSTEAD OF DELETE
AS
BEGIN
    -- Önce OdemeDetaylari tablosundan ilgili kayıtları sil
    DELETE FROM OdemeDetaylari
    WHERE uye_id IN (SELECT uye_id FROM DELETED);

     --Sonra UyeKatilim tablosundan ilgili kayıtları sil
    DELETE FROM UyeKatilim
    WHERE uye_id IN (SELECT uye_id FROM DELETED);

     --En son Uyeler tablosundan ilgili kayıtları sil
    DELETE FROM Uyeler
    WHERE uye_id IN (SELECT uye_id FROM DELETED);
END;
GO





