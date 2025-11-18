//
//  ContentView.swift
//  FilmAraSwiftUI
//
//  Created by İlayda Çelikkaya on 29.10.2025.
//

import SwiftUI

struct FilmListeView: View {
    @ObservedObject var filmListeViewModel:FilmListeViewModel //observedobject gozlemlenebilir deger bunu bilmesi lazım yani publishedle yayınladı ama bunu gozlemlemen de lazım
    @State var aranacakfilm=""
    init(){
        //Bu struct ilk kez oluşturulurken yapılacak işleri belirt
        self.filmListeViewModel=FilmListeViewModel()
        //Yani artık internetten film arayabilen bir ViewModel örneğimiz var.
        
        
        
    }
    var body: some View {
        
        
            
        NavigationView(){
            ZStack {
                // 🔹 ARKA PLAN RENGİN
                Color(red: 7/255, green: 15/255, blue: 26/255)
                    .ignoresSafeArea()
                
                
                VStack{
                    TextField("Aranacak Film",text:$aranacakfilm,onCommit:{
                        self.filmListeViewModel.filmaramasiyap(
                            filmismi: aranacakfilm
                                .trimmingCharacters(in: .whitespacesAndNewlines)
                                .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
                            ?? aranacakfilm
                        )
                        
                        // Bu nesneye “git ve Titanic filmini ara” komutu veriliyor.
                    }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal).cornerRadius(12)
            
                    
                    List(filmListeViewModel.filmler,id:\.imdbID){
                        film in
                        
                        NavigationLink(destination: DetayView(imdbId: film.imdbID), label: {
                            HStack(spacing:16){
                                
                                OzelImage(url:film.poster)
                                    .frame(width: 100,height: 140)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(radius:3)
                                
                                
                                VStack(alignment: .leading,spacing:6){
                                    Text(film.title)
                                        .font(.title2)
                                        .foregroundStyle(.orange)
                                        .bold()

                                        .lineLimit(2)
                                    Text(film.year)
                                        .font(.title3)
                                        .foregroundStyle(.gray)
                                        .bold()
                                }
                                
                      
                            
                            }
                         
                        })
                       
                            .listRowBackground(Color.clear)
                            
                        
                    }
                   
                    .scrollContentBackground(.hidden)     // List'in default background'unu gizle
                    .background(Color.clear)              // Arkadaki ZStack rengi görülsün
            

                    .scrollContentBackground(.hidden)
                    .navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)

                    .toolbar {                                // 3) Kendi başlığımızı çizeceğiz
                        ToolbarItem(placement: .principal) {
                            Text("🍿 Film Kitaplığı")
                                .font(.system(size: 28))
                                .foregroundColor(.white).bold().italic()
                        }
                    }
                }
                
            }
        }
        }
    }

#Preview {
    FilmListeView()
}
