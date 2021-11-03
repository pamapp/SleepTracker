//
//  dreamsApp.swift
//  dreams
//
//  Created by Alina Potapova on 20.10.2021.
//

import SwiftUI

@main
struct dreamsApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environmentObject(dataController)
        }
    }
}
