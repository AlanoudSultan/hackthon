//
//  StageGoalView.swift
//  hackthon
//
//  Created by حصه العجالين on 07/02/1447 AH.
//

import SwiftUI

struct StageGoalView: View {
    @ObservedObject var gameData = GameDataManager.shared
    
    var body: some View {
        if let currentStage = gameData.getCurrentStage() {
            ZStack {
                Color("BackgroundColor") // البيج الترابي
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    Text("مرحلتك: \(currentStage.name)")
                        .font(.custom("SFArabicRounded", size: 36))
                        .foregroundColor(Color("green")) // أخضر تراثي
                        .fontWeight(.bold)

                    VStack(alignment: .leading, spacing: 15) {
                        Text("💰 رصيدك الابتدائي: \(gameData.currentMoney) قرش")
                        Text("📈 دخلك اليومي: \(currentStage.averageDailyIncome) قرش")
                        Text("🎯 الهدف: \(currentStage.goal)")
                    }
                    .font(.custom("SFArabicRounded", size: 24))
                    .foregroundColor(Color("red")) // لون تراثي للتمييز
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("gold").opacity(0.15)) // ذهبي ناعم للخلفية
                    .cornerRadius(16)
                    .padding(.horizontal, 30)

                    Spacer()

                    NavigationLink(destination: map()) {
                        Text("ابدأ المرحلة")
                            .foregroundColor(Color("BackgroundColor")) // لون بيج للنص
                            .font(.custom("SFArabicRounded", size: 28))
                            .fontWeight(.bold)
                            .frame(width: 250, height: 60)
                            .background(Color("secondcolor")) // زر أزرق نيلي
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color("green"), lineWidth: 3)
                            )
                    }

                    Spacer().frame(height: 40)
                }
                .padding(.top, 80)
            }
        } else {
            Text("لا توجد مرحلة حالية")
                .foregroundColor(.red)
        }
    }
}


#Preview {
    StageGoalView()
}
