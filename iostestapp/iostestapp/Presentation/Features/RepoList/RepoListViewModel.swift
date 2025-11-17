//    
//  RepoListViewModel.swift
//  iostestapp
//

import Foundation
import Combine
import RepoFeature

class RepoListViewModel: ObservableObject {
    private let repoService = DIManager.shared.resolve(GithubServiceProtocol.self)

    @Published var repos: [RepoModel] = []
    @Published var isLoading = false
    @Published var hasError = false

    func fetchRepos() async {
        await MainActor.run {
            isLoading = true
            hasError = false
        }
        
        do {
            let fetchedRepos = try await repoService.getRepos()
            await MainActor.run {
                self.repos = fetchedRepos
                self.isLoading = false
            }
        } catch {
            await MainActor.run {
                self.hasError = true
                self.isLoading = false
            }
        }
    }
}
