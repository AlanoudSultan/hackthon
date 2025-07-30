//
//  FinanceStage.swift
//  hackthon
//
//  Created by Alanoud Abaalkhail on 30/07/2025.
//

import Foundation

struct FinanceStage: Codable, Identifiable {
    let id = UUID()
    let name: String
    let averageDailyIncome: Int
    let saving: Int
    let investment: Int
    let goal: String
}

struct FinanceStagesData: Codable {
    let stages: [FinanceStage]
} 