//
//  NetworkService.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 11/05/2025.
//

import Foundation

protocol NetworkService {
  func fetch<T: Decodable>(from url: URL) async throws -> T
}
