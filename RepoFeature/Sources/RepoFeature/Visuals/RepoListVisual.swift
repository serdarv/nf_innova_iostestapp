//    
//  RepoListVisual.swift
//  RepoFeature
//

import Foundation

public struct RepoListVisual: Identifiable {
    public var id: String { name }
    public let name: String
    public let description: String?
    public let openIssuesCount: Int
    public let hasIssues: Bool
    
    public init(
        name: String,
        description: String?,
        openIssuesCount: Int,
        hasIssues: Bool
    ) {
        self.name = name
        self.description = description
        self.openIssuesCount = openIssuesCount
        self.hasIssues = hasIssues
    }
}

