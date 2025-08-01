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
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SplashScreen()
            }
        }
    }
}
