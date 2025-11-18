//    
//  RepoDetailsVisual.swift
//  RepoFeature
//

import Foundation

public struct RepoDetailsVisual {
    // Owner information
    public let ownerAvatarURL: String
    public let ownerLogin: String
    public let ownerType: String
    
    // Repository details
    public let name: String
    public let description: String?
    public let language: String?
    public let isPrivate: Bool
    
    // Statistics
    public let stargazersCount: Int
    public let forksCount: Int
    public let watchersCount: Int
    public let openIssuesCount: Int
    public let hasOpenIssues: Bool
    
    // Tags information
    public let tagsCount: Int
    public let hasTags: Bool
    
    public init(
        ownerAvatarURL: String,
        ownerLogin: String,
        ownerType: String,
        name: String,
        description: String?,
        language: String?,
        isPrivate: Bool,
        stargazersCount: Int,
        forksCount: Int,
        watchersCount: Int,
        openIssuesCount: Int,
        hasOpenIssues: Bool,
        tagsCount: Int,
        hasTags: Bool
    ) {
        self.ownerAvatarURL = ownerAvatarURL
        self.ownerLogin = ownerLogin
        self.ownerType = ownerType
        self.name = name
        self.description = description
        self.language = language
        self.isPrivate = isPrivate
        self.stargazersCount = stargazersCount
        self.forksCount = forksCount
        self.watchersCount = watchersCount
        self.openIssuesCount = openIssuesCount
        self.hasOpenIssues = hasOpenIssues
        self.tagsCount = tagsCount
        self.hasTags = hasTags
    }
}
