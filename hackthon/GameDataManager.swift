//
//  GameDataManager.swift
//  hackthon
//
//  Created by Alanoud Abaalkhail on 30/07/2025.
//

import Foundation

class GameDataManager: ObservableObject {
    static let shared = GameDataManager()
    
    @Published var currentStage: Int = 0
    @Published var currentMoney: Int = 50
    @Published var totalSavings: Int = 0
    @Published var totalInvestment: Int = 0
    @Published var stages: [FinanceStage] = []
    
    private let userDefaults = UserDefaults.standard
    private let currentStageKey = "currentStage"
    private let currentMoneyKey = "currentMoney"
    private let totalSavingsKey = "totalSavings"
    private let totalInvestmentKey = "totalInvestment"
    private let lastLoginDateKey = "lastLoginDate"
    private let hasReceivedFirstTimeBonusKey = "hasReceivedFirstTimeBonus"
    
    private init() {
        loadStages()
        loadGameData()
        checkAndGiveBonuses()
    }
    
    private func loadStages() {
        guard let url = Bundle.main.url(forResource: "FinanceStages", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let stagesData = try? JSONDecoder().decode(FinanceStagesData.self, from: data) else {
            // Fallback to hardcoded stages if JSON loading fails
            stages = [
                FinanceStage(name: "مبتدئ", averageDailyIncome: 50, saving: 10, investment: 5, goal:  "ادخر حتى تصل إلى 100 قرش لتطوير الكشك الأول."),
                FinanceStage(name: "متوسط", averageDailyIncome: 150, saving: 30, investment: 30, goal:  "ادخر حتى تصل الى 500 قرش وقم بتوسيع الكشك وإضافة منتجات ."),
                FinanceStage(name: "متقدم", averageDailyIncome: 300, saving: 60, investment: 90, goal:  "ادخر حتى تصل الى 1000 قرش وامتلك متجرًا كبيرًا في السوق  ."),
                FinanceStage(name: "تاجر" , averageDailyIncome: 600, saving: 120, investment: 240, goal: "ادخر حتى تصل الى 2000 قرش وامتلك متجرًا اخر في السوق")
            ]
            return
        }
        stages = stagesData.stages
    }
    
    private func loadGameData() {
        currentStage = userDefaults.integer(forKey: currentStageKey)
        currentMoney = userDefaults.integer(forKey: currentMoneyKey)
        totalSavings = userDefaults.integer(forKey: totalSavingsKey)
        totalInvestment = userDefaults.integer(forKey: totalInvestmentKey)
        objectWillChange.send()
    }
    
    private func checkAndGiveBonuses() {
        let isFirstTimeUser = userDefaults.bool(forKey: "isFirstTimeUser") == false
        let hasReceivedFirstTimeBonus = userDefaults.bool(forKey: hasReceivedFirstTimeBonusKey)
        
        // Give first-time user bonus (50 money)
        if isFirstTimeUser && !hasReceivedFirstTimeBonus {
            earnMoney(50)
            userDefaults.set(true, forKey: hasReceivedFirstTimeBonusKey)
            print("🎁 First-time user bonus: +50 money")
        }
        
        // Check daily login bonus (10 money)
        checkDailyLoginBonus()
    }
    
    private func checkDailyLoginBonus() {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todayString = dateFormatter.string(from: today)
        
        let lastLoginDate = userDefaults.string(forKey: lastLoginDateKey)
        
        // If it's a new day, give the daily bonus
        if lastLoginDate != todayString {
            earnMoney(10)
            userDefaults.set(todayString, forKey: lastLoginDateKey)
            print("💰 Daily login bonus: +10 money")
        }
    }
    
    func saveGameData() {
        userDefaults.set(currentStage, forKey: currentStageKey)
        userDefaults.set(currentMoney, forKey: currentMoneyKey)
        userDefaults.set(totalSavings, forKey: totalSavingsKey)
        userDefaults.set(totalInvestment, forKey: totalInvestmentKey)
    }
    
    func getCurrentStage() -> FinanceStage? {
        guard currentStage < stages.count else { return nil }
        return stages[currentStage]
    }
    
    func earnMoney(_ amount: Int) {
        currentMoney += amount
        saveGameData()
        objectWillChange.send()
    }
    
    func saveMoney(_ amount: Int) {
        guard currentMoney >= amount else { return }
        currentMoney -= amount
        totalSavings += amount
        saveGameData()
        objectWillChange.send()
    }
    
    func investMoney(_ amount: Int) {
        guard currentMoney >= amount else { return }
        currentMoney -= amount
        totalInvestment += amount
        saveGameData()
        objectWillChange.send()
    }
    
    func canAdvanceToNextStage() -> Bool {
        guard let currentStageData = getCurrentStage() else { return false }
        
        switch currentStage {
        case 0: // مبتدئ
            return totalSavings >= 100
        case 1: // متوسط
            return currentMoney >= 500
        case 2: // متقدم
            return currentMoney >= 1000
        case 3:
            return currentMoney >= 2000
            
        default:
            return false
        }
    }
    
    func advanceToNextStage() {
        if canAdvanceToNextStage() && currentStage < stages.count - 1 {
            currentStage += 1
            saveGameData()
            objectWillChange.send()
        }
    }
    
    func resetGame() {
        currentStage = 0
        currentMoney = 50
        totalSavings = 0
        totalInvestment = 0
        userDefaults.removeObject(forKey: hasReceivedFirstTimeBonusKey)
        userDefaults.removeObject(forKey: lastLoginDateKey)
        saveGameData()
        objectWillChange.send()
    }
    
}
