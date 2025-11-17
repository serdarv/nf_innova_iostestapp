//    
//  ContentView.swift
//  iostestapp
//

import SwiftUI
import RepoFeature

struct ContentView: View {
    let githubService = DIManager.shared.resolve(GithubServiceProtocol.self)
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear {
            Task {
                do {
                    let repos = try await self.githubService.getRepos()
                    print(repos)
                } catch {
                    print("Error fetching repos: \(error)")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
