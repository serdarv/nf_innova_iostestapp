//    
//  RepoTagVisual.swift
//  RepoFeature
//

import Foundation

public struct RepoTagVisual {
    public let name: String
    public let commitSha: String
    public let shortCommitSha: String
    
    public init(
        name: String,
        commitSha: String,
        shortCommitSha: String
    ) {
        self.name = name
        self.commitSha = commitSha
        self.shortCommitSha = shortCommitSha
    }
}