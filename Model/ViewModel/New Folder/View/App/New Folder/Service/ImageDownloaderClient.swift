//
//  ImageDownloaderClient.swift
//  FilmAraSwiftUI
//
//  Created by İlayda Çelikkaya on 30.10.2025.
//

import Foundation
import Combine

class ImageDownloaderClient:ObservableObject{
    @Published var Indirilengorsel:Data?
    func GorselIndır(url:String,completion: @escaping (Result<Data,ImageDownloaderError>) -> Void){
        
        guard let imageurl=URL(string: url) else{
            return completion(.failure(.yanlisurl))
            
        }
        URLSession.shared.dataTask(with:imageurl){
            (data,response,error) in
            guard let data=data,error==nil else{
                return completion(.failure(.yanlisgorsel))
            }
            DispatchQueue.main.async{
                self.Indirilengorsel=data
                completion(.success(data))
            }
        }.resume() //Sen URLSession.shared.dataTask(with: imageUrl) yazdığında aslında Apple senin için bir “hazır görev (task)” oluşturur. Ama başlatmaz resume bunu başlatır

        
        
                
    }
    
}
enum ImageDownloaderError:Error{
    case yanlisurl
    case yanlisgorsel
    
}
