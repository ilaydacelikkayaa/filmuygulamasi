//
//  Film.swift
//  FilmAraSwiftUI
//
//  Created by İlayda Çelikkaya on 29.10.2025.
//struct verileri bir arada tutmak icin kullanılan veri tipidir
//enum, önceden belirlenmiş sabit değerleri bir arada tutar.
//CodingKeys, JSON’daki anahtar isimleri ile struct’taki değişken isimlerini eşleştirmek için kullanılır.


import Foundation
//codable kullanıldıgı icin foundation import

struct Film:Codable{ //gelen veriyi anlamamıza title year olarak ayırmamıza işe yarar
    /**encode (örneğin JSON’a çevirme) hem de decode (örneğin JSON’dan nesneye çevirme)**/
    //Decodable → JSON ➜ Swift nesnesi
    //Encodable → Swift nesnesi ➜ JSON
    //JSON (metin) ➜ Film & GelenFilmler (Swift struct) ➜ ViewModel ➜ View

    let title:String
    let year:String
    let imdbId:String
    let type:String
    let poster:String

    
    private enum CodingKeys: String, CodingKey {
        //swiftte camelcase kullanılır bunları eslestiriyoruz
        case title="Title"
        case year="Year"
        case imdbId="imdbID"
        case type="Type"
        case poster="Poster"
        
    }
}
struct GelenFilmler:Codable{
    let filmler:[Film]
    
    private enum CodingKeys:String,CodingKey{
        case filmler="Search"
    }
}

