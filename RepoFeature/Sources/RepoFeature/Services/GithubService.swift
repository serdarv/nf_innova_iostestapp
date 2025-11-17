//    
//  GithubService.swift
//  iostestapp
//

import Foundation
import CoreNetworking

public protocol GithubServiceProtocol {
    func getRepos() async throws -> [RepoModel]
    func getRepoDetails(owner: String, repo: String) async throws -> RepoModel
    func getRepoTags(owner: String, repo: String) async throws -> [RepoTagModel]
}

public class GithubService: GithubServiceProtocol {
    private let networkProvider: NetworkProviderProtocol = NetworkProvider()
    private let baseURL: String
    
    public init(baseURL: String) {
        self.baseURL = baseURL
    }

    public func getRepos() async throws -> [RepoModel] {
        do {
            let endpoint: GithubEndpoint<[RepoModel]> = .getRepos(baseURL: baseURL)
            
            guard let urlRequest = endpoint.urlRequest() else {
                throw NetworkError.networkError("Failed to create URL request")
            }
            
            let data = try await networkProvider.execute(request: urlRequest)
            return try JSONDecoder().decode([RepoModel].self, from: data)
        } catch {
            // Fallback to mock data when network request fails
            return try loadMockRepos()
        }
    }
    
    private func loadMockRepos() throws -> [RepoModel] {
        guard let url = Bundle.main.url(forResource: "ReposMock", withExtension: "json") else {
            throw NetworkError.networkError("Failed to locate ReposMock.json file")
        }
        
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([RepoModel].self, from: data)
    }
    
    public func getRepoDetails(owner: String, repo: String) async throws -> RepoModel {
        let endpoint: GithubEndpoint<RepoModel> = .getRepoDetails(baseURL: baseURL, owner: owner, repo: repo)
        
        guard let urlRequest = endpoint.urlRequest() else {
            throw NetworkError.networkError("Failed to create URL request")
        }
        
        let data = try await networkProvider.execute(request: urlRequest)
        return try JSONDecoder().decode(RepoModel.self, from: data)
    }
    
    public func getRepoTags(owner: String, repo: String) async throws -> [RepoTagModel] {
        let endpoint: GithubEndpoint<[RepoTagModel]> = .getRepoTags(baseURL: baseURL, owner: owner, repo: repo)
        
        guard let urlRequest = endpoint.urlRequest() else {
            throw NetworkError.networkError("Failed to create URL request")
        }
        
        let data = try await networkProvider.execute(request: urlRequest)
        return try JSONDecoder().decode([RepoTagModel].self, from: data)
    }
}
