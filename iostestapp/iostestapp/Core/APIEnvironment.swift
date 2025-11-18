//    
//  APIEnvironment.swift
//  iostestapp
//

import Foundation
import CoreNetworking

struct APIEnvironment {
    enum InfoPlistKeys: String {
        case baseURL = "BASE_URL"
        case githubToken = "GITHUB_TOKEN"
    }

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    /// The default HTTP request headers for the given environment.
    static var headers: RequestHeaders? {
        var defaultHeaders: RequestHeaders = [
            "Content-Type": "application/json",
        ]
        
        // Add GitHub authentication if token is available
        if let token = githubToken {
            defaultHeaders["Authorization"] = "Bearer \(token)"
        }
        
        return defaultHeaders
    }

    private static func getValue(for key: InfoPlistKeys) -> String {
        guard let value = infoDictionary[key.rawValue] as? String else {
            fatalError("\(key.rawValue) not set in plist")
        }
        return value
    }
    
    private static func getOptionalValue(for key: InfoPlistKeys) -> String? {
        return infoDictionary[key.rawValue] as? String
    }

    // MARK: - Plist values

    /// The base URL of the given environment.
    static var baseURL: String {
        getValue(for: .baseURL)
    }
    
    /// The GitHub personal access token (optional)
    static var githubToken: String? {
        getOptionalValue(for: .githubToken)
    }
}
