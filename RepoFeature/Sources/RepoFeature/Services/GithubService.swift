//    
//  GithubService.swift
//  iostestapp
//

import Foundation
import CoreNetworking

// Public Visual interface for external use
public protocol GithubVisualServiceProtocol {
    func getReposVisual() async throws -> [RepoListVisual]
    func getRepoDetailsVisual(owner: String, repo: String) async throws -> RepoDetailsVisual
    func getRepoTagsVisual(owner: String, repo: String) async throws -> [RepoTagVisual]
}

public class GithubService: GithubVisualServiceProtocol {
    private let networkProvider: NetworkProviderProtocol = NetworkProvider()
    private let baseURL: String
    
    public init(baseURL: String) {
        self.baseURL = baseURL
    }

    // MARK: - Internal API Methods

    internal func getRepoTags(owner: String, repo: String) async throws -> [RepoTagModel] {
        let endpoint: GithubEndpoint<[RepoTagModel]> = .getRepoTags(baseURL: baseURL, owner: owner, repo: repo)
        return try await networkProvider.execute(endpoint)
    }

    internal func getRepos() async throws -> [RepoModel] {
        do {
            let endpoint: GithubEndpoint<[RepoModel]> = .getRepos(baseURL: baseURL)
            return try await networkProvider.execute(endpoint)
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
    
    internal func getRepoDetails(owner: String, repo: String) async throws -> RepoModel {
        let endpoint: GithubEndpoint<RepoModel> = .getRepoDetails(baseURL: baseURL, owner: owner, repo: repo)
        return try await networkProvider.execute(endpoint)
    }
    
    // MARK: - Visual Service Methods (Public Protocol Implementation)
    
    public func getReposVisual() async throws -> [RepoListVisual] {
        let repoModels = try await getRepos()
        return RepoListVisualFactory.create(from: repoModels)
    }
    
    public func getRepoDetailsVisual(owner: String, repo: String) async throws -> RepoDetailsVisual {
        let repoModel = try await getRepoDetails(owner: owner, repo: repo)
        let tags = try await getRepoTags(owner: owner, repo: repo)
        return RepoDetailsVisualFactory.create(from: repoModel, tags: tags)
    }
    
    public func getRepoTagsVisual(owner: String, repo: String) async throws -> [RepoTagVisual] {
        let tagModels = try await getRepoTags(owner: owner, repo: repo)
        return RepoTagVisualFactory.create(from: tagModels)
    }
}
