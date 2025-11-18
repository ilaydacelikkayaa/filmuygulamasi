//
//  DetayView.swift
//  FilmAraSwiftUI
//
//  Created by İlayda Çelikkaya on 17.11.2025.
//

import SwiftUI

struct DetayView: View {
    let imdbId:String
    @ObservedObject var filmDetayViewModel=FilmDetayViewModel()
    @State private var isFavorite = false
    var body: some View {
        ZStack{ Color(red: 7/255, green: 15/255, blue: 26/255)
                .ignoresSafeArea() // çentik, home bar falan dahil
            
            ScrollView{
                VStack{
                    
                    
                    OzelImage(url:filmDetayViewModel.filmDetayi?.poster ?? "").frame(width: UIScreen.main.bounds.width*0.9,height: UIScreen.main.bounds.height*0.5,alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 10).padding()
                    
                    
                    
                    Text(filmDetayViewModel.filmDetayi?.title ?? "Film ismi gösterilecek").foregroundColor(.orange).font(.system(size: 30, weight: .semibold)).frame(maxWidth: .infinity,alignment:.leading).italic()
                    
                    Divider()
                        .background(Color.white.opacity(0.9))
                        .padding(.vertical, 4)
                    
                    
                    HStack{
                        Text(filmDetayViewModel.filmDetayi?.genre ?? "Tür göster")
                        Text(filmDetayViewModel.filmDetayi?.year ?? "Yıl gösterilecek")
                    }.frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.white.opacity(0.7)).font(.system(size: 15, weight: .regular))
                    
                    
                    
                    Text("\"\(filmDetayViewModel.filmDetayi?.plot ?? "Film plot gösterilecek")\"").padding().foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true).bold().italic()
                    
                    VStack(spacing: 12) {
                        InfoDisclosure(
                            title: "Yönetmen",
                            text: filmDetayViewModel.filmDetayi?.director ?? "Film yönetmeni gösterilecek",
                            systemImage: "person.fill"
                        )
                        
                        InfoDisclosure(
                            title: "Yazar",
                            text: filmDetayViewModel.filmDetayi?.writer ?? "Film yazarı gösterilecek",
                            systemImage: "pencil"
                        )
                        
                        InfoDisclosure(
                            title: "Ödüller",
                            text: filmDetayViewModel.filmDetayi?.awards ?? "Ödüller gösterilecek",
                            systemImage: "trophy.fill"
                        )
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                }
            }.onAppear(perform: {self.filmDetayViewModel
                    .filmDetayiAl(imdbId: imdbId)
            })
            
        }
    }
    
    
}
struct InfoDisclosure:View{
    let title:String
    let text:String
    let systemImage:String
    @State private var isExpanded=false
    
    var body:some View{
        DisclosureGroup(isExpanded: $isExpanded){
            Text(text)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .padding(.top, 4)
            
        } label:{HStack{
            Image(systemName: systemImage)
                .font(.system(size: 16))
            Text(title)
                .font(.system(size: 15, weight: .semibold))
            Spacer()
            
        }
            
        .foregroundColor(.white)
            
        }
        .padding()
        .background(Color.white.opacity(0.08))
        .cornerRadius(12)
    }
}
#Preview {
    DetayView(imdbId: "test")
}
