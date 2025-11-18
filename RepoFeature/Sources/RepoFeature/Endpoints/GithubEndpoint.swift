//
//  GithubEndpoint.swift
//  iostestapp
//
import Foundation
import CoreNetworking

enum GithubEndpoint<ResponseType: Decodable> {
    case getRepos(baseURL: String)
    case getRepoDetails(baseURL: String, owner: String, repo: String)
    case getRepoTags(baseURL: String, owner: String, repo: String)
}

extension GithubEndpoint: RequestProtocol {
    typealias Response = ResponseType

    var path: String {
        switch self {
        case .getRepos:
            return "users/octocat/repos"
        case .getRepoDetails(_, let owner, let repo):
            return "repos/\(owner)/\(repo)"
        case .getRepoTags(_, let owner, let repo):
            return "repos/\(owner)/\(repo)/tags"
        }
    }

    var method: RequestMethod {
        switch self {
        case .getRepos, .getRepoDetails, .getRepoTags:
            return .get
        }
    }

    func baseURL() -> String {
        switch self {
        case .getRepos(let baseURL), .getRepoDetails(let baseURL, _, _), .getRepoTags(let baseURL, _, _):
            return baseURL
        }
    }
}
