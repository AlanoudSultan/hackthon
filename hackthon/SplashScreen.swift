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
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                GIFView(gifName: "Untitled")
                    .frame(width: geometry.size.width * 1, height: geometry.size.height * 1)
                    .position(x : 373 , y : 100)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .rotationEffect(.degrees(geometry.size.width > geometry.size.height ? 0 : 90))
        }
    }
}

#Preview {
    SplashScreen()
}
