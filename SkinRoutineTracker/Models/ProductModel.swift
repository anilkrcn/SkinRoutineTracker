//
//  ProductModel.swift
//  SkinRoutineTracker
//
//  Created by Anıl Karacan on 11.11.2025.
//

import Foundation

struct ProductModel: Identifiable, Codable{
    var id: UUID =  UUID()
    var name: String
    var type: String?
    var createdAt: Date = Date()
    var expirationDate: Date?
    var plan: ProductPlanModel?
}
