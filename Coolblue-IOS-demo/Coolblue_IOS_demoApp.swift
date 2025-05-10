//
//  Coolblue_IOS_demoApp.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 11/05/2025.
//

import SwiftUI

@main
struct Coolblue_IOS_demoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
