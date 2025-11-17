//    
//  CoreNetworking.swift
//  CoreNetworking
//

import Foundation

// Re-export commonly used types for external consumption
public typealias RequestHeaders = [String: String]
public typealias RequestParameters = [String: Any?]

// Main CoreNetworking module interface
public struct CoreNetworking {
    public static func createProvider(session: URLSession = .shared) -> NetworkProviderProtocol {
        return NetworkProvider(session: session)
    }
}
