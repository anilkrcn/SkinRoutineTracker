//
//  ProductPlanModel.swift
//  SkinRoutineTracker
//
//  Created by Anıl Karacan on 11.11.2025.
//

import Foundation

struct ProductPlanModel: Codable {
    var id: UUID
    var planType: PlanType
    var reminderTimes: [String]?
    var periodDays: Int?
    var breakDays: Int?
    var selectedDays: [String]?
    var intervalDays: Int?
    var createdAt: Date = Date()
}
