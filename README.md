# 🧩 modernistCaseApp

SwiftUI ile geliştirilen, kullanıcı listeleme ve favori yönetimi özelliklerine sahip modern bir örnek uygulama.

## 📱 Özellikler

- Kullanıcıları listeleme
- Detay ekranında kullanıcı bilgilerini görüntüleme
- Arama ile filtreleme (hem tüm kullanıcılar hem de favoriler için)
- Favorilere ekleme ve çıkarma
- Yerel veri saklama (UserDefaults) (Not: Proje küçük olduğu için UserDefaults seçildi çünkü küçük işler için daha kullanışlı ve hızlı ama json dosyası ya da kullanıcı ekleme gibi başka bir özellik de kullanılacak olsaydı burada tercihimiz coreData olacaktı.)
- Local JSON ile mock veri kullanımı
- Resim desteği (URL üzerinden `AsyncImage` ile)
- Kaydırma özelliği ile birlikte;
    - Favoriler ekranında kullanıcıyı sağdan sola kaydırarak favorilerden çıkarılabilme
    - Kullanıcıların olduğu ekranda soldan sağa kaydırılarak;
        - Eğer ki kullanıcı favorilerde ekli ise favorilerden çıkarma ikonu ile birlikte favorilerden çıkarılabilme
        - Favorilerde ekli değilse favorilere ekleme ikonu ile birlikte kullanıcıyı burada hızlı şekilde favorilere eklenilebilme
- iPhone'da yalnızca dikey kullanım

---

## 🏛 Mimari

Uygulamada modern bir MVVM (Model - View - ViewModel) mimarisi tercih edilmiştir. Bu yapı sayesinde;

- **Kod ayrıştırması** daha net olur.
- **Test edilebilirlik** kolaylaşır.
- **Sürdürülebilirlik** ve **ölçeklenebilirlik** sağlanır.

### Katmanlar:

| Katman      | Açıklama |
|-------------|----------|
| `Model`     | `User` ve `Address` gibi veri yapıları burada tanımlanır. Codable desteği ile JSON'dan kolayca parse edilir. |
| `ViewModel` | `UsersViewModel` tüm veri işleme, filtreleme ve favori yönetimi gibi iş mantığını barındırır. |
| `View`      | SwiftUI arayüzleri burada yer alır. Her ekran ayrı dosyadadır ve MVVM prensiplerine uygun şekilde `ViewModel` ile haberleşir. |

---
