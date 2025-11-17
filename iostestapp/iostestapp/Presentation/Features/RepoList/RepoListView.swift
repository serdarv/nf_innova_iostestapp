//    
//  RepoListView.swift
//  iostestapp
//

import Foundation
import SwiftUI
import Common
import RepoFeature

struct RepoListView: View {
    @StateObject var viewModel: RepoListViewModel
    @EnvironmentObject var router: AppRouter

    var body: some View {
        VStack {
            Text("list_view".localized)
                .headerStyle()
            
            if viewModel.isLoading {
                // Loading state
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if viewModel.hasError {
                // Error state
                ErrorView {
                    await viewModel.fetchRepos()
                }
            } else {
                // Success state
                List(viewModel.repos) { repo in
                    ListItemView(repoItem: repo)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .onTapGesture {
                            router.addToRoute(AppRoutes.details(repo.name))
                        }
                }
                .refreshable {
                    await viewModel.fetchRepos()
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
        }
        .task {
            await viewModel.fetchRepos()
        }
    }
}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView(viewModel: RepoListViewModel())
    }
}
