//
//  PotteryShop.swift
//  hackthon
//
//  Created by حصه العجالين on 07/02/1447 AH.
//

import SwiftUI

struct PotteryShop: View {
    @State private var selectedAnswer: Int? = nil
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                // الخلفية
                Image("pottery")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    // Back button
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
                    
                    // Question box
                    VStack(spacing: 30) {
                        Text("سؤال")
                            .foregroundColor(.white)
                            .font(.custom("SFArabicRounded", size: 30))
                            .fontWeight(.bold)
                            .frame(maxWidth: 600)
                            .frame(height: 60)
                            .background(Color("brown"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.yellow, lineWidth: 7)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.horizontal, 40)
                        
                        // Answer options
                        HStack(spacing: 15) {
                            ForEach(0..<3, id: \.self) { index in
                                Button(action: {
                                    selectedAnswer = index
                                }) {
                                    Text("جواب")
                                        .foregroundColor(.white)
                                        .font(.custom("SFArabicRounded", size: 30))
                                        .fontWeight(.medium)
                                        .frame(width: 190, height: 100)
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
            }
        }
    }
}

#Preview {
    PotteryShop()
}
