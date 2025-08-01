//
//  ContentView.swift
//  hackthon
//
//  Created by Alanoud Abaalkhail on 30/07/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("HomeImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("١")
                            .foregroundColor(Color("yellow"))
                            .font(.custom("SFArabicRounded", size: 36))
                            .fontWeight(.heavy)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("yellow"))
                            .font(.title)
                            .fontWeight(.heavy)
                        
                        ZStack {
                            // Background rectangle (unfilled)
                            Rectangle()
                                .fill(Color.yellow.opacity(0.178877 ))
                                .stroke(Color("yellow"), lineWidth: 4)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .frame(width: 90, height: 12)
                            
                            // Progress rectangle (filled) on top
                            Rectangle()
                                .fill(Color("yellow"))
                                .frame(width: 40, height: 8)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(.trailing, 50)
                        }
                        Spacer()
                          
                        Image("money")
                            .resizable()
                            .frame(width: 60, height: 50)
                            .padding(.trailing, 10)
                        
                        Image(systemName: "gift.circle.fill")
                            .foregroundColor(Color("red"))
                            .font(.system(size: 50))
                            .fontWeight(.heavy)
                            .overlay(
                                Circle()
                                    .stroke(Color("BackgroundColor"), lineWidth: 3)
                            )
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
    }
}

#Preview {
    ContentView()
}
