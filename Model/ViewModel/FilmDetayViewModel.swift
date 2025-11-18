//
//  FilmDetayViewModel.swift
//  FilmAraSwiftUI
//
//  Created by İlayda Çelikkaya on 17.11.2025.
//

import Foundation
import SwiftUI
import Combine

class FilmDetayViewModel : ObservableObject{
    
    @Published var filmDetayi:FilmDetaylariViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbId : String) {
        downloaderClient.filmDetayiniIndir(imdbId: imdbId) { (sonuc) in
            switch sonuc{
            case .failure(let hata):
                print(hata)
            case .success(let filmDetay):
                DispatchQueue.main.async {
                    self.filmDetayi=FilmDetaylariViewModel(detay:filmDetay)
                }
               
                
            }
        }
    }
    
}

struct FilmDetaylariViewModel{
    let detay:FilmDetay
    
    var title:String{
        detay.title
    }
    var poster:String{
        detay.poster
    }
    var year:String{
        detay.year
    }
    var imdbId:String{
        detay.imdbId
    }
    var director:String{
        detay.director
    }
    var writer:String{
        detay.writer
    }
    var awards:String{
        detay.awards
    }
    var plot:String{
        detay.plot
    }
    var genre:String{
        detay.genre
    }
}

