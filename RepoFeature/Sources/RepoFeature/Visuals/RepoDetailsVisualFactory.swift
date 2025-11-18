//    
//  RepoDetailsVisualFactory.swift
//  RepoFeature
//

import Foundation

internal struct RepoDetailsVisualFactory {
    
    static func create(from repoModel: RepoModel, tags: [RepoTagModel]) -> RepoDetailsVisual {
        return RepoDetailsVisual(
            ownerAvatarURL: repoModel.owner.avatarURL,
            ownerLogin: repoModel.owner.login,
            ownerType: repoModel.owner.type.capitalized,
            name: repoModel.name,
            description: repoModel.description,
            language: repoModel.language,
            isPrivate: repoModel.isPrivate,
            stargazersCount: repoModel.stargazersCount,
            forksCount: repoModel.forksCount,
            watchersCount: repoModel.watchersCount,
            openIssuesCount: repoModel.openIssuesCount,
            hasOpenIssues: repoModel.openIssuesCount > 0,
            tagsCount: tags.count,
            hasTags: !tags.isEmpty
        )
    }
}

