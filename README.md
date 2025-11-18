#  FilmAraSwiftUI – SwiftUI Film Arama Uygulaması

Bu proje, **SwiftUI** kullanılarak geliştirilmiş modern bir film arama uygulamasıdır. Kullanıcıların film adlarını aratmasını, sonuçları görüntülemesini ve seçtikleri filmlerin detaylı bilgilerini incelemesini sağlar.

---

##  Temel Özellikler

* **Kolay Arama:** Kullanıcılar film adını girerek anında arama yapabilir.
* **Detaylı Bilgi:** Film posteri, konusu, oyuncuları, yönetmeni, IMDB puanı gibi detaylı bilgilere erişim.
* **Modern Tasarım:** SwiftUI ile oluşturulmuş temiz ve kullanıcı dostu arayüz.

---

##  Kullanılan Teknolojiler

Bu uygulamanın geliştirilmesinde aşağıdaki ana teknoloji ve yapılar kullanılmıştır:

* **SwiftUI:** Kullanıcı arayüzünü bildirimsel bir şekilde oluşturmak için.
* **MVVM (Model-View-ViewModel):** Uygulama mantığı ve veri yönetimi için temiz bir mimari desen.
* **OMDb API:** Film verilerini çekmek için kullanılan açık film veritabanı API'si.
* **URLSession:** API'ye HTTP istekleri göndermek ve veri çekmek için.
* **Custom Image Loader (ÖzelImage):** Film posterlerini verimli bir şekilde asenkron olarak yüklemek için özel olarak yazılmış görüntü yükleyici.
* **NavigationView + NavigationLink:** Uygulama içi ekranlar arası geçiş ve navigasyon yapısını kurmak için.
* **DisclosureGroup:** Detay ekranında belirli bilgi gruplarını (örneğin oyuncular, puanlar) açıp kapatılabilir hale getirmek için.

---
##  Ekran Görüntüleri

| Arama Ekranı | Detay Ekranı |
| :---: | :---: |
| <img src="assets/Ekran Resmi 2025-11-18 22.54.47.png" width="250" alt="Arama Ekranı Görüntüsü"/> | <img src="assets/Ekran Resmi 2025-11-18 22.55.05.png" width="250" alt="Detay Ekranı Görüntüsü"/> |

---
