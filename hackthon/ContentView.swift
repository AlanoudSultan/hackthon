//
//  ContentView.swift
//  hackthon
//
//  Created by Alanoud Abaalkhail on 30/07/2025.
//

import SwiftUI

struct TargetPopupView: View {
    @Binding var isShowing: Bool
    @ObservedObject var gameData: GameDataManager
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture {
                    isShowing = false
                }
            
            if let stage = gameData.getCurrentStage() {
                VStack(spacing: 25) {
                    Text("مرحلتك: \(stage.name)")
                        .font(.custom("SFArabicRounded", size: 30))
                        .foregroundColor(Color("BackgroundColor"))
                        .fontWeight(.bold)

                    Text("💰 رصيدك الابتدائي: \(gameData.currentMoney) قرش")
                        .font(.custom("SFArabicRounded", size: 20))
                        .foregroundColor(.white)
                    
                    Text("📈 دخلك اليومي: \(stage.averageDailyIncome) قرش")
                        .font(.custom("SFArabicRounded", size: 20))
                        .foregroundColor(.white)
                    
                    Text("🎯 الهدف: \(stage.goal)")
                        .font(.custom("SFArabicRounded", size: 20))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)

        
                    
                    // Close button
                    Button(action: {
                        isShowing = false
                    }) {
                        Text("حسناً")
                            .foregroundColor(.white)
                            .font(.custom("SFArabicRounded", size: 20))
                            .fontWeight(.bold)
                            .frame(width: 130, height: 35)
                            .background(Color("secondcolor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(30)
                .background(Color("brown"))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.yellow, lineWidth: 7)
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, 40)
            }
        }
    }
}

struct PopupView: View {
    @Binding var isShowing: Bool
    @ObservedObject var gameData: GameDataManager
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture {
                    isShowing = false
                }
            
            VStack(spacing: 20) {
                // Top section with money bag and text
                HStack {
                    Image("money bag")
                        .resizable()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("لتحصل على قسيمة مقدمة من بنك")
                            .foregroundColor(.white)
                            .font(.custom("SFArabicRounded", size: 20))
                        Text("الانماء يجب عليك ان تجمع ۱۰۰۰ قرش")
                            .foregroundColor(.white)
                            .font(.custom("SFArabicRounded", size: 20))
                    }
                   // Spacer()
                }
                
                // Middle section with current money and progress bar
                HStack {
                    Image("money")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("\(gameData.currentMoney)")
                        .foregroundColor(.white)
                        .font(.custom("SFArabicRounded", size: 18))
                        .fontWeight(.bold)
                    
                    // Progress bar
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.yellow.opacity(0.5))
                            .frame(height: 8)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                        
                        Rectangle()
                            .fill(Color.yellow)
                            .frame(width: CGFloat(gameData.currentMoney) / 1000.0 * 150, height: 8)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                    .frame(width: 150)
                    
                    // Spacer()
                }
                
                // Bottom button
                Button(action: {
                    isShowing = false
                }) {
                    Text("حسناً")
                        .foregroundColor(.white)
                        .font(.custom("SFArabicRounded", size: 20))
                        .fontWeight(.medium)
                        .frame(width: 130, height: 35)
                        .background(Color("secondcolor"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(30)
            .background(Color("brown"))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.yellow, lineWidth: 7)
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 40)
        }
    }
}

struct ContentView: View {
    @State private var showPopup = false
    @State private var showTargetPopup = false
    @State private var showUserStore = false
    @ObservedObject private var gameData = GameDataManager.shared
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("HomeImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("\(gameData.currentStage + 1)")
                            .foregroundColor(Color("secondcolor"))
                            .font(.custom("SFRounded", size: 40))
                            .fontWeight(.heavy)
                            .padding(.bottom, 20)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("yellow"))
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .overlay(
                                Image(systemName: "star")
                                    .foregroundColor(Color("secondcolor"))
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                            )
                            .padding(.bottom, 20)
                        
                        ZStack(alignment: .leading) {
                            // Progress rectangle (filled) on top
                            Rectangle()
                                .fill(Color("yellow"))
                                .frame(width: CGFloat(gameData.currentStage + 1) / 4.0 * 100, height: 8)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            // Background rectangle (unfilled)
                            Rectangle()
                                .fill(Color.yellow.opacity(0.3 ))
                                .stroke(Color("secondcolor"), lineWidth: 8)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .frame(width: 100, height: 14)
                        }
                        .padding(.bottom, 20)
                        Spacer()
                        
                        Text("\(gameData.currentMoney)")
                            .foregroundColor(Color("secondcolor"))
                            .font(.custom("SFArabicRounded", size: 36))
                            .fontWeight(.heavy)
 
                        Image("money")
                            .resizable()
                            .frame(width: 60, height: 50)
                            .padding(.trailing, 10)
                        
                        Button(action: {
                            showPopup = true
                        }) {
                            Image(systemName: "gift.circle.fill")
                                .foregroundColor(Color("red"))
                                .font(.system(size: 50))
                                .fontWeight(.heavy)
                                .overlay(
                                    Circle()
                                        .stroke(Color("BackgroundColor"), lineWidth: 3)
                                )
                        }
                        .padding(.trailing, 20)
                        
                        Button(action: {
                            showTargetPopup = true
                        }) {
                            Image(systemName: "target")
                                .foregroundColor(Color("secondcolor"))
                                .font(.system(size: 50))
                                .fontWeight(.heavy)
                                .overlay(
                                    Circle()
                                        .stroke(Color("BackgroundColor"), lineWidth: 3)
                                )
                        }
                        .padding(.trailing, 60)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    Button(action: {
                        showUserStore = true
                    }) {
                        Text("ابدأ")
                            .foregroundColor(Color("BackgroundColor"))
                            .font(.custom("SFArabicRounded", size: 30, relativeTo: .body))
                            .fontWeight(.heavy)
                            .frame(width: 230, height: 50)
                            .background(Color("secondcolor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("BackgroundColor"), lineWidth: 5)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .padding(.bottom, 20)
                    .padding(.trailing, 90)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .rotationEffect(.degrees(geometry.size.width > geometry.size.height ? 0 : 90))
        }
        .overlay(
            Group {
                if showPopup {
                    PopupView(isShowing: $showPopup, gameData: gameData)
                }
                if showTargetPopup {
                    TargetPopupView(isShowing: $showTargetPopup, gameData: gameData)
                }
            }
        )
        .navigationDestination(isPresented: $showUserStore) {
            UserStore()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    ContentView()
}
