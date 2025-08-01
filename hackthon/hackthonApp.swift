//
//  hackthonApp.swift
//  hackthon
//
//  Created by Alanoud Abaalkhail on 30/07/2025.
//

import SwiftUI

@main
struct hackthonApp: App {
    @StateObject private var gameData = GameDataManager.shared
    @StateObject private var audioManager = AudioManager.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SplashScreen()
            }
            .onAppear {
                // Start background music when app launches
                audioManager.startBackgroundMusic()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                // Stop background music when app goes to background
                audioManager.stopBackgroundMusic()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willTerminateNotification)) { _ in
                // Stop background music when app terminates
                audioManager.stopBackgroundMusic()
            }
        }
    }
}
