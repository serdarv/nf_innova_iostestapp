//    
//  AppRoutes.swift
//  iostestapp
//

import Common
import SwiftUI

enum AppRoutes: AppRoute {

    case details(String)

    func navigateTo() -> AnyView {
        switch self {
        case .details(let name):
            AnyView(RepoDetailsConfigurator.configureRepoDetailsView(repoName: name))
        }
    }

    static func == (lhs: AppRoutes, rhs: AppRoutes) -> Bool {
        lhs.id == rhs.id
    }
}
