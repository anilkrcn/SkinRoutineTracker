//
//  NewProductViewModel.swift
//  SkinRoutineTracker
//
//  Created by Anıl Karacan on 12.11.2025.
//

import Foundation
import Combine
import CoreData

class ProductPlanViewModel: ObservableObject{
    private let context = CoreDataManager.shared.context
    
    func saveProduct(model: ProductModel){
        let product = Product(context: context)
        product.id = model.id
        product.name = model.name
        product.createdAt = model.createdAt
        product.type = model.type
        product.expirationDate = model.expirationDate
        
        let plan = ProductPlan(context: context)
        plan.id = model.plan?.id
        plan.planType = model.plan?.planType.rawValue
        plan.createdAt = model.plan?.createdAt
        
        plan.breakDays = model.plan?.breakDays != nil ? Int16((model.plan?.breakDays!)!) : 0
        
        
    }
    
}
