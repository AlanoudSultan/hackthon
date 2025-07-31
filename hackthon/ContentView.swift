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
                    .padding(.bottom, 10)
                    .padding(.trailing, 70)
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
