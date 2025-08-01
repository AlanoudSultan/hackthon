//
//  SplashScreen.swift
//  hackthon
//
//  Created by Alanoud Abaalkhail on 31/07/2025.
//

import SwiftUI
import WebKit

struct GIFView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.backgroundColor = .clear
        webView.isOpaque = false
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let path = Bundle.main.path(forResource: gifName, ofType: "gif") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                uiView.load(data, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: URL(fileURLWithPath: path))
            }
        }
    }
}

struct SplashScreen: View {
    @State private var showNextScreen = false
    @State private var isFirstTimeUser = UserDefaults.standard.bool(forKey: "isFirstTimeUser") == false
    @ObservedObject private var gameData = GameDataManager.shared
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    GIFView(gifName: "Untitled")
                        .frame(width: 1000, height: 600)
                        .position(x : 420 , y : 130)
                    
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.bottom,20)
                }
                
                // Navigation Links
                if isFirstTimeUser {
                    NavigationLink(
                        destination: story(),
                        isActive: $showNextScreen
                    ) {
                        EmptyView()
                    }
                    .hidden()
                } else {
                    NavigationLink(
                        destination: ContentView(),
                        isActive: $showNextScreen
                    ) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .rotationEffect(.degrees(geometry.size.width > geometry.size.height ? 0 : 90))
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                showNextScreen = true
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    SplashScreen()
}
