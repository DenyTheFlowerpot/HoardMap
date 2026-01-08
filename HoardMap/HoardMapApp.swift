//
//  HoardMapApp.swift
//  HoardMap
//
//  Created by Theodor Gheghea on 07.01.2026.
//

import SwiftUI
import HoardMap_Persistence

@main
struct HoardMapApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
