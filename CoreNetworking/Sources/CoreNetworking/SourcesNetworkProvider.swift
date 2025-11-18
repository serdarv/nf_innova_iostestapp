//
//  Provider.swift
//  CoreNetworking
//

import Foundation

// Re-export commonly used types for external consumption
public typealias RequestHeaders = [String: String]
public typealias RequestParameters = [String: Any?]

public enum NetworkError: Error {
    case networkError(String)
    case decodingError(String)
    case unknown(Error)
    
    public var localizedDescription: String {
        switch self {
        case .networkError(let message):
            return "Network error: \(message)"
        case .decodingError(let message):
            return "Decoding error: \(message)"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}

// Protocol for network operations
public protocol NetworkProviderProtocol: Sendable {
    func fetch(from url: URL) async throws -> Data
    func execute(request: URLRequest) async throws -> Data
    func execute<Request: RequestProtocol>(_ endpoint: Request) async throws -> Request.Response
}

// Default implementation using URLSession
public final class NetworkProvider: NetworkProviderProtocol {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    public func fetch(from url: URL) async throws -> Data {
        let (data, response) = try await session.data(from: url)
        try validateResponse(response)
        return data
    }
    
    public func execute(request: URLRequest) async throws -> Data {
        let (data, response) = try await session.data(for: request)
        try validateResponse(response)
        return data
    }
    
    public func execute<Request: RequestProtocol>(_ endpoint: Request) async throws -> Request.Response {
        guard let urlRequest = endpoint.urlRequest() else {
            throw NetworkError.networkError("Failed to create URL request")
        }
        
        let data = try await execute(request: urlRequest)
        
        do {
            return try JSONDecoder().decode(Request.Response.self, from: data)
        } catch {
            throw NetworkError.decodingError("Failed to decode response: \(error.localizedDescription)")
        }
    }
    
    private func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.networkError("Invalid response type")
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            // Success - do nothing
            break
        case 401:
            throw NetworkError.networkError("HTTP 401: Unauthorized - Check your authentication credentials")
        case 403:
            throw NetworkError.networkError("HTTP 403: Forbidden - You may have hit the API rate limit. Consider adding authentication or wait before trying again.")
        case 404:
            throw NetworkError.networkError("HTTP 404: Resource not found")
        case 429:
            throw NetworkError.networkError("HTTP 429: Too Many Requests - API rate limit exceeded")
        case 500...599:
            throw NetworkError.networkError("HTTP \(httpResponse.statusCode): Server error")
        default:
            throw NetworkError.networkError("HTTP Error: \(httpResponse.statusCode)")
        }
    }
}
