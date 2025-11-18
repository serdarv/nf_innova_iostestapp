//    
//  RepoDetailsViewModel.swift
//  iostestapp
//

import Foundation
import Combine
import RepoFeature
import Common

class RepoDetailsViewModel: BaseViewModel {
    private let repoService = DIManager.shared.resolve(GithubVisualServiceProtocol.self)

    private let repoName: String
    @Published var repo: RepoDetailsVisual?
    @Published var tags: [RepoTagVisual] = []

    init(repoName: String) {
        self.repoName = repoName
        super.init()
    }

    func fetchRepoDetails() async {
        await MainActor.run {
            setLoading()
        }
        
        do {
            let repoDetails = try await repoService.getRepoDetailsVisual(owner: "octocat", repo: repoName)
            let repoTags = try await repoService.getRepoTagsVisual(owner: "octocat", repo: repoName)
            
            await MainActor.run {
                self.repo = repoDetails
                self.tags = repoTags
                setIdle()
            }
        } catch {
            await MainActor.run {
                setError(error.localizedDescription)
            }
        }
    }
}
