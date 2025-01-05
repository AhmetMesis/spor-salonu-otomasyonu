# Proje Başlığı:
Spor Salonu Otomasyonu

## Proje Ekibindeki Kişiler:
- Ahmet Meşiş
- Ali Erol
- Emin Roni Bingöl

## Gereksinimler:

### Üye Rolündeki Kullanıcılar İçin Gereksinimler:
- **Üye Kayıt ve Güncelleme**: Üyeler, spor salonuna kayıt olabilir ve kişisel bilgilerini güncelleyebilir.
- **Programlara Katılım**: Üyeler, mevcut programlara katılabilir ve katıldıkları programları görüntüleyebilir.
- **Ödeme Yapma**: Üyeler, katıldıkları programlar için ödeme yapabilir ve ödeme geçmişlerini görüntüleyebilir.
- **Ekipman Kullanımı**: Üyeler, spor salonundaki ekipmanları kullanabilir ve ekipmanların durumunu görüntüleyebilir.

### Antrenör Rolündeki Kullanıcılar İçin Gereksinimler:
- **Program Yönetimi**: Antrenörler, spor salonundaki programları oluşturabilir, güncelleyebilir ve silebilir.
- **Üye Takibi**: Antrenörler, programlarına katılan üyeleri takip edebilir ve üyelerin performanslarını değerlendirebilir.
- **Maaş Bilgileri**: Antrenörler, maaş bilgilerini görüntüleyebilir ve maaş ödemelerini takip edebilir.

### Yönetici Rolündeki Kullanıcılar İçin Gereksinimler:
- **Üye ve Antrenör Yönetimi**: Yöneticiler, üyeleri ve antrenörleri ekleyebilir, güncelleyebilir ve silebilir.
- **Program ve Ekipman Yönetimi**: Yöneticiler, spor salonundaki programları ve ekipmanları yönetebilir.
- **Ödeme ve Maaş Yönetimi**: Yöneticiler, üyelerin ödemelerini ve antrenörlerin maaşlarını yönetebilir.
- **Kampanya Yönetimi**: Yöneticiler, indirim kampanyaları oluşturabilir ve yönetebilir.

## Varlıklar ve Nitelikleri:

### Uyeler:
- `uye_id` (PRIMARY KEY)
- `isim`
- `tel`
- `agirlik`
- `boy`
- `yag_orani`
- `cinsiyet`
- `kayit_tarihi`
- `dogum_trihi`
- `uyelik_durumu`

### Antrenorler:
- `ant_id` (PRIMARY KEY)
- `isim`
- `tel_no`
- `uzmanlik`

### Programlar:
- `program_id` (PRIMARY KEY)
- `program_isim`
- `ant_id` (FOREIGN KEY)
- `aciklama`

### ProgramFiyatlari:
- `fiyat_id` (PRIMARY KEY)
- `program_id` (FOREIGN KEY)
- `sure_ay`
- `fiyat`

### Maaslar:
- `maas_id` (PRIMARY KEY)
- `ant_id` (FOREIGN KEY)
- `miktar`
- `odenen_ay`

### OdemeDetaylari:
- `odeme_id` (PRIMARY KEY)
- `uye_id` (FOREIGN KEY)
- `program_id` (FOREIGN KEY)
- `tutar`
- `odeme_tarihi`
- `odeme_yontemi`
- `durum`

### Ekipmanlar:
- `ekipman_id` (PRIMARY KEY)
- `isim`
- `durum`
- `bakim_tarihi`
- `aciklama`

### EkipmanProgram:
- `ekipman_id` (FOREIGN KEY)
- `program_id` (FOREIGN KEY)

### Kampanyalar:
- `kampanya_id` (PRIMARY KEY)
- `isim`
- `indirim_orani`
- `baslangic_tarihi`
- `bitis_tarihi`

### UyeKatilim:
- `katilim_id` (PRIMARY KEY)
- `uye_id` (FOREIGN KEY)
- `program_id` (FOREIGN KEY)
- `baslangic_tarihi`
- `bitis_tarihi`

### Roller:
- `rol_id` (PRIMARY KEY)
- `rol_adi`

### admins:
- `admin_id` (PRIMARY KEY)
- `isim`
- `sifre`
- `rol_id` (FOREIGN KEY)

## İlişkiler ve Sayısal Kısıtlamalar:
- **Uyeler ve UyeKatilim**: 1-N (bir üye birden fazla katılımı olabilir ve bir katılımın bir uyesi vardır)
- **Uyeler ve Kampanyalar**: N-1 (bir üye sadece bir kampanyaya katılabilir ve bir kampanya birden fazla üye tarafından kullanılabilir)
- **Uyeler ve OdemeDetaylari**: 1-N (bir üye birden fazla ödeme yapabilir)
- **Uyeler ve Programlar**: N-N (bir üye birden fazla programa katılabilir ve her programın birden fazla üyesi olabilir)
- **Programlar ve UyeKatilim**: 1-N (bir program birden fazla üye tarafından katılınabilir)
- **Programlar ve OdemeDetaylari**: 1-N (bir program birden fazla ödeme kaydına sahip olabilir)
- **Programlar ve Antrenorler**: N-N (bir antrenörün birden fazla programa bakabilir ve bir programın birden fazla antrenörü olabilir)
- **Programlar ve EkipmanProgram**: N-N (bir ekipman birden fazla programda kullanılabilir ve bir programın birden fazla ekipmanı olabilir)
- **Antrenorler ve Maaslar**: 1-N (bir antrenör birden fazla maaş kaydına sahip olabilir)
- **Ekipmanlar ve EkipmanProgram**: N-N (bir ekipman birden fazla programda kullanılabilir ve bir program birden fazla ekipmana sahip olabilir)
- **Roller ve Admins**: 1-N (bir rol birden fazla admin tarafından kullanılabilir)
