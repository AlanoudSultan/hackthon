//
//  map.swift
//  hackthon
//
//  Created by حصه العجالين on 07/02/1447 AH.
//

import SwiftUI

struct map: View {
    @State private var showPotteryShop = false
    @State private var showCarpetShop = false
    @ObservedObject private var gameData = GameDataManager.shared
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            // الخلفية
            Image("map") // تأكد إنك أضفت الصورة في Assets
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                // Top header - only current money
                HStack {
                    Button(action: {
                    presentationMode.wrappedValue.dismiss()
                                            }) {
                                                Image(systemName: "arrowshape.left.fill")
                                                    .foregroundColor(Color("secondcolor"))
                                                    .font(.title2)
                                                    .frame(width: 40, height: 40)
                                                    .background(Color("ramli"))
                                                    .overlay(
                                                        Circle()
                                                            .stroke(Color("secondcolor"), lineWidth: 7)
                                                    )
                                                    .clipShape(Circle())
                                            }
                                            Spacer()
                    Spacer()
                    
                    Text("\(gameData.currentMoney)")
                        .foregroundColor(Color("BackgroundColor"))
                        .font(.custom("SFArabicRounded", size: 36))
                        .fontWeight(.heavy)
 
                    Image("money")
                        .resizable()
                        .frame(width: 60, height: 50)
                        .padding(.trailing, 10)
                }
                .padding(.horizontal, 40)
                .padding(.top, 30)
                
                Spacer()
            }
            
            // زر عند محل الفخار
            Button(action: {
                showPotteryShop = true
            }) {
                CircleButton()
            }
            .offset(x: -305, y: 99) // اضبط حسب موقع باب الفخار

            // زر عند محل السجاد
            Button(action: {
                showCarpetShop = true
            }) {
                CircleButton()
            }
            .offset(x: -70, y:99) // اضبط حسب موقع باب السجاد

            // Hidden NavigationLinks
            NavigationLink(
                destination: PotteryShop(showMap: $showPotteryShop),
                isActive: $showPotteryShop
            ) {
                EmptyView()
            }
            .hidden()
            
            NavigationLink(
                destination: CarpetShop(showMap: $showCarpetShop),
                isActive: $showCarpetShop
            ) {
                EmptyView()
            }
            .hidden()
        }
        .navigationBarHidden(true)
    }
}

// زر دائري فيه أيقونة تشغيل
struct CircleButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.background.opacity(0.8))
                .frame(width: 50, height: 50)
                .shadow(radius: 4)
                .overlay(
                    Circle()
                        .stroke(Color("secondcolor"), lineWidth: 3)
                )
            
            Image(systemName: "play.fill")
                .foregroundColor(.secondcolor)
                .font(.system(size: 24))
        }
    }
}


#Preview {
    map()
}
