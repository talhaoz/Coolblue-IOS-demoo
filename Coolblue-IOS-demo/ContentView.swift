//
//  ContentView.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 11/05/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var container: AppDIContainer

    var body: some View {
        SearchView(viewModel: container.makeSearchViewModel())
    }
}

#Preview {
    ContentView()
}
