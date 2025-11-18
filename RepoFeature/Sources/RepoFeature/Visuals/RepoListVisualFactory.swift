//    
//  RepoListVisualFactory.swift
//  RepoFeature
//

import Foundation

internal struct RepoListVisualFactory {
    
    // Internal method that uses API models (not exposed outside module)
    static func create(from repoModel: RepoModel) -> RepoListVisual {
        return RepoListVisual(
            name: repoModel.name,
            description: repoModel.description,
            openIssuesCount: repoModel.openIssuesCount,
            hasIssues: repoModel.openIssuesCount > 0
        )
    }
    
    // Internal method that uses API models (not exposed outside module)
    static func create(from repoModels: [RepoModel]) -> [RepoListVisual] {
        return repoModels.map { create(from: $0) }
    }
    
    // Public method for external use - creates visual model from individual parameters
    static func create(
        name: String,
        description: String?,
        openIssuesCount: Int
    ) -> RepoListVisual {
        return RepoListVisual(
            name: name,
            description: description,
            openIssuesCount: openIssuesCount,
            hasIssues: openIssuesCount > 0
        )
    }
}

