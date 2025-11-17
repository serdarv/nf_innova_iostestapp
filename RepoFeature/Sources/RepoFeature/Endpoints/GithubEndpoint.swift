//
//  GithubEndpoint.swift
//  iostestapp
//
import Foundation
import CoreNetworking

public enum GithubEndpoint<ResponseType: Decodable> {
    case getRepos(baseURL: String)
    case getRepoDetails(baseURL: String, owner: String, repo: String)
    case getRepoTags(baseURL: String, owner: String, repo: String)
}

extension GithubEndpoint: RequestProtocol {
    public typealias Response = ResponseType

    public var path: String {
        switch self {
        case .getRepos:
            return "/users/octocat/repos"
        case .getRepoDetails(_, let owner, let repo):
            return "/repos/\(owner)/\(repo)"
        case .getRepoTags(_, let owner, let repo):
            return "/repos/\(owner)/\(repo)/tags"
        }
    }

    public var method: RequestMethod {
        switch self {
        case .getRepos, .getRepoDetails, .getRepoTags:
            return .get
        }
    }

    public func baseURL() -> String {
        switch self {
        case .getRepos(let baseURL), .getRepoDetails(let baseURL, _, _), .getRepoTags(let baseURL, _, _):
            return baseURL
        }
    }

    public var headers: RequestHeaders? {
        return [
            "Accept": "application/vnd.github.v3+json",
            "User-Agent": "iOS-App"
        ]
    }

    public var parameters: RequestParameters? {
        return nil
    }

    public var queryParameters: RequestParameters? {
        return nil
    }

    public var requestType: RequestType {
        return .data
    }

    public var responseDataType: ResponseDataType {
        return .json
    }

    public var data: Data? {
        return nil
    }

    public var maxRetryCount: Int {
        return 3
    }
}
