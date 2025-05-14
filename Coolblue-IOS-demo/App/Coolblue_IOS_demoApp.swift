//
//  Coolblue_IOS_demoApp.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 11/05/2025.
//

import SwiftUI

@main
@MainActor
struct Coolblue_IOS_demoApp: App {
    let container = AppDIContainer()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(container)
        }
    }
}
