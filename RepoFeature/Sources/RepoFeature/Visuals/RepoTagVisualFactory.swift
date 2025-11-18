//    
//  RepoTagVisualFactory.swift
//  RepoFeature
//

import Foundation

internal struct RepoTagVisualFactory {
    
    static func create(from repoTagModel: RepoTagModel) -> RepoTagVisual {
        return RepoTagVisual(
            name: repoTagModel.name,
            commitSha: repoTagModel.commit.sha,
            shortCommitSha: String(repoTagModel.commit.sha.prefix(8))
        )
    }
    
    static func create(from repoTagModels: [RepoTagModel]) -> [RepoTagVisual] {
        return repoTagModels.map { create(from: $0) }
    }
}