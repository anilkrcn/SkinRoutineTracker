

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}

    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SkinRoutineModel") // xcdatamodeld ismi
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data yüklenemedi: \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        container.viewContext
    }

    func saveContext() {
        if context.hasChanges {
            try? context.save()
        }
    }
}
