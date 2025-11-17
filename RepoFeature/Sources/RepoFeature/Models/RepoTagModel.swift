//
//  RepoTagModel.swift
//  iostestapp
//

import Foundation

public struct RepoTagModel: Codable, Sendable {
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

public struct TagCommit: Codable, Sendable {
    let sha: String
    let url: String
}