import Foundation
import CoreData

class BaseSQLiteOperation: AsyncOperation {
    
    override init() {
        super.init()
        createContainer{
            container in
            self.mainContext = container.viewContext
            self.backgroundContext = container.newBackgroundContext()
        }
    }
    var mainContext:NSManagedObjectContext!
    var backgroundContext:NSManagedObjectContext!
    
    private func createContainer(completition: @escaping (NSPersistentContainer) -> () ) {
        let container = NSPersistentContainer(name: "")
        container.loadPersistentStores(completionHandler: {_, error in
            guard error == nil else {fatalError("Failed to load store")}
            completition(container)
        })
    }
    
    func saveContext(context ctx: NSManagedObjectContext) {
        if ctx.hasChanges {
            do {
                try ctx.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
