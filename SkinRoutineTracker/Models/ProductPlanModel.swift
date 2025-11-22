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
    var periodDays: Int16?
    var breakDays: Int16?
    var selectedDays: [String]?
    var intervalDays: Int16?
    var createdAt: Date = Date()
}
