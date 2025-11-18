//
//  RepoTagModel.swift
//  iostestapp
//

import Foundation

struct RepoTagModel: Codable, Sendable {
    let name: String
    let zipballURL: String
    let tarballURL: String
    let commit: TagCommit
    let nodeID: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case zipballURL = "zipball_url"
        case tarballURL = "tarball_url" 
        case commit
        case nodeID = "node_id"
    }
}

struct TagCommit: Codable, Sendable {
    public let sha: String
    public let url: String
}
