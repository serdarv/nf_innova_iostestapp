//    
//  ContentView.swift
//  iostestapp
//

import SwiftUI
import RepoFeature
import Common

struct ContentView: View {
    let githubService = DIManager.shared.resolve(GithubServiceProtocol.self)
    var body: some View {
        VStack {
            Image(systemName: SystemImages.globe.name)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("hello_world".localized)
        }
        .onAppear {
            Task {
                do {
                    let repos = try await self.githubService.getRepos()
                    print(repos)
                } catch {
                    let errorMessage = "error_fetching_repos".localized
                    print(String(format: errorMessage, error.localizedDescription))
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
