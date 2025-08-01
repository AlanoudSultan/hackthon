//
//  userStore.swift
//  hackthon
//
//  Created by حصه العجالين on 07/02/1447 AH.
//

import SwiftUI

struct UserStore: View {
    var body: some View {
        NavigationView {
            ZStack {
                // الخلفية
                Image("shop")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                // الكلام والزر في منتصف الشاشة
                VStack(spacing: 20) {
                    Spacer()

                    Text("👴 أهلاً بك في محلك، اذهب للسوق وتسوق له بذكاء!")
                        .multilineTextAlignment(.center)
                        .font(.custom("SFArabicRounded", size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(12)
                        .frame(maxWidth: 400)

                    NavigationLink(destination: map()) {
                        Text("اذهب للسوق")
                            .foregroundColor(Color("BackgroundColor"))
                            .font(.custom("SFArabicRounded", size: 22))
                            .fontWeight(.bold)
                            .frame(width: 200, height: 50)
                            .background(Color("secondcolor"))
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color("green"), lineWidth: 2)
                            )
                    }

                    Spacer()
                }

                // الشيخ ثابت أسفل يمين الشاشة
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image("shayeb3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180)
                            .padding(.trailing, 20)
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)

    }
}


#Preview {
    UserStore()
}
