//
//  DownloaderClient.swift
//  FilmAraSwiftUI
//
//  Created by İlayda Çelikkaya on 29.10.2025.
//

import Foundation //Swift’te bazı işlemler (örneğin ağ bağlantısı, tarih, URL işlemleri) için Foundation kütüphanesi gerekir.
import Combine
import SwiftUI


/*/
 struct ve class farkı :
 struct veri modellemek için örneğin film
 class iş yapan fonksiyon içeren yapılar için*/
class DownloaderClient{
    
    func filmleriIndir(search:String, completion: @escaping (Result<[Film]?,DownloaderError>) -> Void){
        /* fonksiyona dışarıdan bir arama terimi gonderiyorum search
         network işlemleri zaman alan işlemler olduğu için birkaç saniye sürebilir.
         Swift bu durumda iş bitince bana haber ver der ve bunu completion yapar
         if let    Değer varsa o blokta kullan    “Koşullu aç”
         guard let    Değer yoksa hemen çık    “Erken çıkış”
         failure İşlem hatalı durumda
         .failure(.hataTürü)
         */
        guard let url=URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=bdf56d0c")
        else{
            return completion(.failure(.yanlisurl))
        }
        URLSession.shared.dataTask(with: url){(data,response,error) in
            /*/“Belirtilen URL’e git, veriyi indir, sonra bu veriyi (veya hatayı) bana geri getir.”
             dataTask(with:) → verilen URL için bir veri indirme görevi (task) oluşturur.
             response Sunucunun cevabı (HTTP kodu, başlıklar vs.)
             
             */
            guard let data=data,error==nil else{
                return completion(.failure(.verigelmedi))
            }
            
            guard let filmcevabi=try? JSONDecoder().decode(GelenFilmler.self, from: data) else{
                return completion(.failure(.verislenmedi))
                //JSON → FilmCevap modeline dönüştürür
// jsondecoder->JSON verisini senin Codable modeline çevirmek.
                
            }
                completion(.success(filmcevabi.filmler))
        }.resume() //bunu demezsen başlatmaz
    }
    
}
enum DownloaderError:Error{
    case verigelmedi
    case yanlisurl
    case verislenmedi
}
