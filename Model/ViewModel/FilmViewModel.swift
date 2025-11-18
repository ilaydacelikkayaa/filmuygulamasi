//
//  FilmViewModel.swift
//  FilmAraSwiftUI
//
//  Created by İlayda Çelikkaya on 29.10.2025.
//

import Foundation
import SwiftUI
import Combine

class FilmListeViewModel: ObservableObject { /**ObservableObject → “Benim içimdeki bazı değerler değişirse, lütfen ekranı güncelle” diyen bir sınıf protokolüdür.*/
    @Published var filmler: [FilmViewModel] = []
    //Türü: [Film] → “Film nesnelerinden oluşan bir liste”.
    // published Bu, “bu değişken değiştiğinde herkese haber ver” anlamına gelir.
    
    let downloaderClient=DownloaderClient()
    
    
    func filmaramasiyap(filmismi:String){
        
        downloaderClient.filmleriIndir(search: filmismi){(sonuc) in
            switch sonuc{
            case.failure(let hata):
                print(hata)
                
            case .success(let filmDizisi):
                if let filmDizisi=filmDizisi{
                    DispatchQueue.main.async(){ //Yani “Ana kuyruğa bir iş ekle, uygun zamanda çalıştır.”
                        self.filmler = filmDizisi.map(FilmViewModel.init)
                        //.map() → “Bir dizinin her elemanını başka bir şeye dönüştür” demek.
                    //“for” gibi çalışır ama sonucu yeni bir diziye döndürür
                        //.init tek başına sadece bir “başlatıcı fonksiyon”dur
                        
                    }
                    
                }
            }
        }
    }
    
    }

    
    struct FilmViewModel{
        let film:Film
        var title:String{
            film.title
        }
        var poster:String{
            film.poster
        }
        var year:String{
            film.year
        }
        var imdbID:String{
            film.imdbId
        }
    }

