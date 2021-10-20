//
//  dreamsApp.swift
//  dreams
//
//  Created by Alina Potapova on 20.10.2021.
//

import SwiftUI

@main
struct dreamsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
