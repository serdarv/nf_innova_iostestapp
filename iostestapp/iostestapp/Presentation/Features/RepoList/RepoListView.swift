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
            Text("list_view")
                .headerStyle()
            
            BaseView(
                state: viewModel.viewState,
                onRetry: { await viewModel.fetchRepos() }
            ) {
                List(viewModel.repos) { repo in
                    ListItemView(repoItem: repo)
                        .listRowSeparator(.hidden)
                        .listRowInsets(.zero)
                        .onTapGesture {
                            router.addToRoute(AppRoutes.details(repo.name))
                        }
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
