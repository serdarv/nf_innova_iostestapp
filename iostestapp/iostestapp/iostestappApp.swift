//    
//  iostestappApp.swift
//  iostestapp
//

import SwiftUI
import Common

@main
struct iostestappApp: App {
    @StateObject private var router = AppRouter()

    init() {
        DIManager.shared.setup()
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.selectionPath) {
                RepoListConfigurator.configureRepoListView()
                    .navigationDestination(for: AppRoutes.self ) { path in
                        router.navigateTo(path)
                    }
            }
            .environment(\.colorScheme, .light)
            .environmentObject(router)
        }
    }
}
