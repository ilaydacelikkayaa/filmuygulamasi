//
//  OzelImage.swift
//  FilmAraSwiftUI
//
//  Created by İlayda Çelikkaya on 30.10.2025.
//

import SwiftUI

struct OzelImage: View {
    let url:String
    @ObservedObject var imagedownloaderclient=ImageDownloaderClient()
    init(url:String){
        self.url=url
        self.imagedownloaderclient.GorselIndır(url: self.url){sonuc in
            switch sonuc{
            case .success(let data):
                print("Gorsel indirildi")
            case .failure(let hata):
                   switch hata {
                   case .yanlisurl:
                       print(" URL hatalı.")
                   case .yanlisgorsel:
                       print("Görsel indirilemedi.")
                   }
                
            }
            
        }
    }
    
    var body: some View {
        if let data = self.imagedownloaderclient.Indirilengorsel,//veri geldi mi
           let uiImage = UIImage(data: data) { /// o veri gerçekten resim mi?
            return Image(uiImage: uiImage)//uikit to swiftui
                .resizable()
        } else {
            return Image("placeholder")
                .resizable()
        }
    }
}

#Preview {
    OzelImage(url:"https://example.com/image.jpg")
}
