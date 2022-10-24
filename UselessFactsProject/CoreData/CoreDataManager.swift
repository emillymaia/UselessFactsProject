//
//  CoreDataManager.swift
//  UselessFactsProject
//
//  Created by Emilly Maia on 19/10/22.
//

import Foundation
import CoreData

final class CoreDataManager {
    // MARK: - Create persistent container
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavoriteFactsDataModel")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Save data in persistent container
    func saveContext(uselessFact: String) {
        let contextManager = CoreDataManager.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "FavoriteFactEntity",
                                                      in: contextManager) else { return }
        let favoriteFact = NSManagedObject.init(entity: entity, insertInto: contextManager)
        favoriteFact.setValue(uselessFact, forKey: "uselessFact")
        do {
            try contextManager.save()
            print("Salvou")
        } catch {
            print("Erro ao salvar no coredata")
        }
    }

    // MARK: - Get saved facts on persistent container
    func fetchUselessFacts() -> [String] {
        let contextManager = CoreDataManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteFactEntity")
        do {
            let data = try contextManager.fetch(fetchRequest)
            var dataToReturn = [String]()
            for item in data {
                dataToReturn.append("\(item.value(forKey: "uselessFact")!)")
            }
            return dataToReturn
        } catch {
            print("Falha ao trazer os arquivos")
        }
        return [String]()
    }
}
