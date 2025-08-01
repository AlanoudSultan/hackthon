//
//  CarpetShop.swift
//  hackthon
//
//  Created by حصه العجالين on 07/02/1447 AH.
//

import SwiftUI

struct CarpetShop: View {
    @State private var selectedAnswer: Int? = nil
    @State private var showWisdom = false
    @State private var wisdomText = ""
    @ObservedObject var gameData = GameDataManager.shared
    @Environment(\.presentationMode) var presentationMode

    let question = "مرحبًا بك في محل السجاد!\nلدينا العديد من العروض، اختر ما يناسبك:"
    
    let answers: [(text: String, cost: Int, wisdom: String)] = [
        ("قطعة سجاد واحدة", 15, "خيار بسيط لكن غير فعّال ماليًا."),
        ("قطعتي سجاد", 20, "غالي مقارنة بالعروض المتاحة!"),
        ("اشتر قطعة والثانية مجانًا", 15, "ذكي جدًا! عرض توفير ممتاز 👏")
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Image("carpet")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    // زر الرجوع
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
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    // مربع السؤال
                    VStack(spacing: 30) {
                        Text(question)
                            .foregroundColor(.white)
                            .font(.custom("SFArabicRounded", size: 22))
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: 600)
                            .background(Color("brown"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.yellow, lineWidth: 7)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.horizontal, 40)
                        
                        // الخيارات
                        HStack(spacing: 15) {
                            ForEach(0..<answers.count, id: \.self) { index in
                                let answer = answers[index]

                                Button(action: {
                                    if gameData.currentMoney >= answer.cost {
                                        gameData.earnMoney(-answer.cost)
                                        selectedAnswer = index
                                        wisdomText = answer.wisdom
                                    } else {
                                        wisdomText = "⚠️ لا تملك رصيدًا كافيًا لهذا الخيار!"
                                    }
                                    showWisdom = true
                                }) {
                                    VStack(spacing: 10) {
                                        Text(answer.text)
                                            .multilineTextAlignment(.center)
                                            .font(.custom("SFArabicRounded", size: 18))
                                        Text("💰 \(answer.cost) قرش")
                                            .font(.caption)
                                            .foregroundColor(.yellow)
                                    }
                                    .foregroundColor(.white)
                                    .frame(width: 120, height: 100)
                                    .background(Color("secondcolor"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(selectedAnswer == index ? Color.yellow : Color.yellow.opacity(0.3), lineWidth: selectedAnswer == index ? 7 : 1)
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                            }
                        }
                        .padding(.horizontal, 40)
                    }
                    
                    Spacer()
                }
                
                // حكمة شيخ المال
                if showWisdom {
                    VStack {
                        Spacer()
                        Text("👴 شيخ الحكمة:\n\(wisdomText)")
                            .multilineTextAlignment(.center)
                            .font(.custom("SFArabicRounded", size: 20))
                            .foregroundColor(Color("red"))
                            .padding()
                            .background(Color("BackgroundColor").opacity(0.95))
                            .cornerRadius(12)
                            .padding()
                        Spacer()
                    }
                    .transition(.opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            showWisdom = false
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    CarpetShop()
}
