//    
//  ServiceAssembly.swift
//  iostestapp
//

import Foundation
import Swinject
import CoreNetworking
import RepoFeature

class ServiceAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        // Register Network NetworkProvider
        container.register(NetworkProviderProtocol.self) { _ in
            return NetworkProvider()
        }
        .inObjectScope(.container)
        
        // Register GithubService
        container.register(GithubVisualServiceProtocol.self) { _ in
            return GithubService(baseURL: APIEnvironment.baseURL)
        }
        .inObjectScope(.container)
    }
}
