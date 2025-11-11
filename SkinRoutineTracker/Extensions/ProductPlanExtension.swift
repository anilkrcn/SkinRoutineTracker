
import CoreData

extension ProductPlanModel {
    init(entity: ProductPlan) {
        self.id = entity.id ?? UUID()
        self.planType = PlanType(rawValue: entity.planType ?? "") ?? .everyDay
        self.reminderTimes = entity.reminderTimes?.decoded()
        self.periodDays = Int(entity.periodDays)
        self.breakDays = Int(entity.breakDays)
        self.selectedDays = entity.selectedDays?.decoded()
        self.intervalDays = Int(entity.intervalDays)
        self.createdAt = entity.createdAt ?? Date()
    }
}

extension ProductPlan {
    func update(from model: ProductPlanModel) {
        self.id = model.id
        self.planType = model.planType.rawValue
        self.reminderTimes = model.reminderTimes?.encoded()
        self.selectedDays = model.selectedDays?.encoded()
        self.periodDays = Int16(model.periodDays ?? 0)
        self.breakDays = Int16(model.breakDays ?? 0)
        self.intervalDays = Int16(model.intervalDays ?? 0)
        self.createdAt = model.createdAt
    }
}
