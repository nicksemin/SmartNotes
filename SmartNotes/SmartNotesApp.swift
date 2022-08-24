//
//  SmartNotesApp.swift
//  SmartNotes
//
//  Created by Nick Semin on 19.06.2022.
//

import SwiftUI

@main
struct SmartNotesApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
