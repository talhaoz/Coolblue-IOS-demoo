//
//  ViewState.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 12/05/2025.
//

enum ViewState: Equatable {
    case idle
    case loading([Product])
    case success([Product])
    case failure(String)
}
