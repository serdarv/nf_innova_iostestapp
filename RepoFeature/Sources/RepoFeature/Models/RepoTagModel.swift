//
//  RepoTagModel.swift
//  iostestapp
//

import Foundation

public struct RepoTagModel: Codable, Sendable {
    public let name: String
    public let zipballURL: String
    public let tarballURL: String
    public let commit: TagCommit
    public let nodeID: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case zipballURL = "zipball_url"
        case tarballURL = "tarball_url" 
        case commit
        case nodeID = "node_id"
    }
}

public struct TagCommit: Codable, Sendable {
    public let sha: String
    public let url: String
}