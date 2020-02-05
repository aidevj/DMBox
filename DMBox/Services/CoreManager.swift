//
//  CoreManager.swift
//  DMBox
//
//  Created by Consultant on 2/5/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import CoreData

final class CoreManager {
    
    static let shared = CoreManager()
    private init() {}
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DMBox")
        
        container.loadPersistentStores { (storeDescrip, err) in
            if let error = err {
                fatalError(error.localizedDescription)
            }
        }
        
        return container
    }()
    
    //MARK: Save funcs
    func save(_ combat: Combat) {
        let entity = NSEntityDescription.entity(forEntityName: "CoreCombat", in: context)!
        let coreCombat = CoreCombat(entity: entity, insertInto: context)
        
        // TODO: set properties
        
        saveContext()
    }
    
    //MARK: Load funcs
    func load() -> [Combat] {
        let fetch = NSFetchRequest<CoreCombat>(entityName: "CoreCombat")
        var combats = [Combat]()
        
        do {
            let coreCombats = try context.fetch(fetch)
            for core in coreCombats {
                //let combat = Combat(core)
                //combats.append(combat)
            }
        } catch {
            print("Couldn't fetch combats: \(error.localizedDescription)")
        }
        
        return combats
    }
    
    
    //MARK: Helper
    func saveContext() {
        do {
            try context.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    
}
