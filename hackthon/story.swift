//
//  story.swift
//  hackthon
//
//  Created by Alanoud Abaalkhail on 31/07/2025.
//


import SwiftUI

struct story: View {
    @State private var currentScene = 0
    @State private var showContentView = false

    let scenes = [
        "قبل زمن... في أحد الأسواق الشعبية، كان جدي يحلم بأن يصبح تاجرًا معروفًا، ولكن للأسف أصبح الأمر شاقًا عليه خاصةً مع تقدم العمر.",
        "حتى أتى اليوم الذي عرض علي جدي إدارة متجره!\n\nمع جملة لم أنسها:\n\"القرش الأبيض ينفع في اليوم الأسود، يا ولدي.\"",
        "ومن هنا بدأت رحلتي...\nبين البيع والشراء والتخطيط والادخار،\nوبتعلم دروس المال، خطوة بخطوة...\nلكي أحقق طموح جدي."
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                // الخلفية العامة
                Image("story_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        // صورة الشايب
                        VStack {
                            Image("shayeb4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180)
                                .shadow(radius: 10)
                        }
                        .padding(.leading, 90)
                        .padding(.bottom, -150)
                        
                        Spacer()
                        
                        VStack(spacing: 20) {
                            // صندوق النص
                            ZStack {
                                Color.black.opacity(0.5)
                                    .frame(width: 350, height: 200)
                                    .cornerRadius(16)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                                
                                Text(scenes[currentScene])
                                    .font(.custom("SFArabic", size: 24))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 320, height: 230)
                            }

                            // Navigation Button
                            Button(action: {
                                withAnimation {
                                    if currentScene < scenes.count - 1 {
                                        currentScene += 1
                                    } else {
                                        UserDefaults.standard.set(false, forKey: "isFirstTimeUser")
                                        showContentView = true
                                    }
                                }
                            }) {
                                Text(currentScene < scenes.count - 1 ? "التالي" : "ابدأ رحلتك")
                                    .foregroundColor(Color("BackgroundColor"))
                                    .font(.custom("SFArabicRounded", size: 30))
                                    .frame(width: 230, height: 50)
                                    .background(Color("secondcolor"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color("BackgroundColor"), lineWidth: 5)
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            .padding(.bottom, 30)
                        }
                        .padding(.trailing, 20)
                    }

                    Spacer().frame(height: 40)
                }

                // Navigation destination trigger
                NavigationLink(
                    destination: ContentView(),
                    isActive: $showContentView
                ) {
                    EmptyView()
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)

        }
    }
}

#Preview {
    story()
}
