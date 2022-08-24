//
//  DataController.swift
//  SmartNotes
//
//  Created by Nick Semin on 13.07.2022.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "SmartNote")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Corde data failed to load: \(error.localizedDescription )")
            }
        }
    }
}
