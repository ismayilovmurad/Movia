//
//  MoviaApp.swift
//  Movia
//
//  Created by Murad Ismayilov on 17.05.23.
//

import SwiftUI

@main
struct MoviaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
