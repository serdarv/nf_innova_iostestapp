//    
//  RepoListViewModel.swift
//  iostestapp
//

import Foundation
import Combine
import RepoFeature

class RepoListViewModel: BaseViewModel {
    private let repoService = DIManager.shared.resolve(GithubVisualServiceProtocol.self)

    @Published var repos: [RepoListVisual] = []

    override init() {
        super.init()
    }

    func fetchRepos() async {
        await MainActor.run {
            setLoading()
        }
        
        do {
            let fetchedRepos = try await repoService.getReposVisual()
            await MainActor.run {
                self.repos = fetchedRepos
                setIdle()
            }
        } catch {
            await MainActor.run {
                setError(error.localizedDescription)
            }
        }
    }
}
