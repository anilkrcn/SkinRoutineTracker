import CoreData

extension ProductModel {
    init(entity: Product) {
        self.id = entity.id ?? UUID()
        self.name = entity.name ?? ""
        self.type = entity.type
        self.createdAt = entity.createdAt ?? Date()
        self.expirationDate = entity.expirationDate ?? Date()
        if let planEntity = entity.plan {
            self.plan = ProductPlanModel(entity: planEntity)
        }
    }
}

extension Product {
    func update(from model: ProductModel, context: NSManagedObjectContext) {
        self.id = model.id
        self.name = model.name
        self.brand = model.brand
        if let planModel = model.plan {
            let planEntity = self.plan ?? ProductPlan(context: context)
            planEntity.update(from: planModel)
            self.plan = planEntity
        }
    }
}
