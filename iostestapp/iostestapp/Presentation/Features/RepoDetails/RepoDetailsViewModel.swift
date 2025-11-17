//    
//  RepoDetailsViewModel.swift
//  iostestapp
//

import Foundation
import Combine
import RepoFeature

class RepoDetailsViewModel: ObservableObject {
    private let repoService = DIManager.shared.resolve(GithubServiceProtocol.self)

    private let repoName: String
    @Published var repo: RepoModel?
    @Published var tags: [RepoTagModel] = []
    @Published var isLoading = false
    @Published var hasError = false

    init(repoName: String) {
        self.repoName = repoName
    }

    func fetchRepoDetails() async {
        await MainActor.run {
            isLoading = true
            hasError = false
        }
        
        do {
            let repoDetails = try await repoService.getRepoDetails(owner: "octocat", repo: repoName)
            let repoTags = try await repoService.getRepoTags(owner: "octocat", repo: repoName)
            
            await MainActor.run {
                self.repo = repoDetails
                self.tags = repoTags
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
