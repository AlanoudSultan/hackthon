//
//  ContentView.swift
//  hackthon
//
//  Created by Alanoud Abaalkhail on 30/07/2025.
//

import SwiftUI

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
                        .font(.custom("SFArabicRounded", size: 16))
                        .fontWeight(.medium)
                        .frame(width: 100, height: 35)
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
                            .font(.custom("SFArabicRounded", size: 36))
                            .fontWeight(.heavy)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("yellow"))
                            .font(.title)
                            .fontWeight(.heavy)
                            .overlay(
                                Image(systemName: "star")
                                    .foregroundColor(Color("secondcolor"))
                                    .font(.title)
                                    .fontWeight(.heavy)
                            )
                    
                        ZStack {
                            // Background rectangle (unfilled)
                            Rectangle()
                                .fill(Color.yellow.opacity(0.178877 ))
                                .stroke(Color("secondcolor"), lineWidth: 8)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .frame(width: 90, height: 12)
                            
                            // Progress rectangle (filled) on top
                            Rectangle()
                                .fill(Color("yellow"))
                                .frame(width: 40, height: 7)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(.trailing, 42)
                        }
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
                            // Target button action here
                        }) {
                            Image(systemName: "target")
                                .foregroundColor(Color("red"))
                                .font(.system(size: 50))
                                .fontWeight(.heavy)
                                .overlay(
                                    Circle()
                                        .stroke(Color("BackgroundColor"), lineWidth: 3)
                                )
                        }
                        .padding(.trailing, 90)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    Button(action: {
                        // Button action here
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
            }
        )
    }
}

#Preview {
    ContentView()
}
