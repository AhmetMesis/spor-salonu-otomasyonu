

---

**Proje Gereksinimi:**
Spor salonu otomasyon sisteminin amacı, üyelerin kayıtlarını ve antrenman programlarını takip etmek, eğitmenlerin görev ve maaş bilgilerini yönetmek, ayrıca üyelerin abone oldukları programlara ait detayları sistemli bir şekilde kaydetmektir. Bu sistem, üyeler ve antrenman programlarının yanı sıra eğitmen ve abonelik bilgilerini de kapsayan kapsamlı bir veri yönetimi sağlamalıdır.

---

**Varlıklar ve Nitelikleri:**

**Üyeler**

- **uye_id (PK)**: Üyelere özgü bir kimlik numarası.
- **isim**: Üyenin adı.
- **tel**: Üyenin telefon numarası.
- **ağırlık**: Üyenin ağırlık bilgisi.
- **boy**: Üyenin boy bilgisi.
- **yağ oranı**: Üyenin vücut yağ oranı.
- **kas oranı**: Üyenin vücut kas oranı.
- **cinsiyet**: Üyenin cinsiyeti.
- **kayıt_tarihi**: Üyenin sisteme kayıt olduğu tarih.

**Antrenörler**

- **ant_id (PK)**: Antrenörlere özgü kimlik numarası.
- **uzmanlık**: Antrenörün uzmanlık alanı.
- **isim**: Antrenörün adı.
- **tel_no**: Antrenörün telefon numarası.

**Programlar**

- **program_id (PK)**: Programlara özgü kimlik numarası.
- **program_isim**: Programın adı.
- **ant_id (FK)**: Programdan sorumlu antrenörün kimlik numarası.
- **fiyat**: Programın ücreti.

**Abonelik**

- **abo_id (PK)**: Abonelik kimlik numarası.
- **sure**: Aboneliğin süresi (ay olarak).
- **program_id (FK)**: Aboneliğe dahil olan programın kimlik numarası.
- **abo_ucreti**: Aboneliğin ücreti.

**Üye Kayıt**

- **uye_id (FK)**: Üyenin kimlik numarası.
- **abo_id (FK)**: Üyenin abone olduğu abonelik kimlik numarası.
- **Başlangıç_tarihi**: Aboneliğin başlangıç tarihi.
- **Bitiş_tarihi**: Aboneliğin bitiş tarihi.

**Maaşlar**

- **maas_id (PK)**: Maaş kimlik numarası.
- **ant_id (FK)**: Maaşın ödeneceği antrenörün kimlik numarası.
- **miktar**: Maaş miktarı.
- **odenen_ay**: Maaşın ödendiği ay bilgisi.

--- 

