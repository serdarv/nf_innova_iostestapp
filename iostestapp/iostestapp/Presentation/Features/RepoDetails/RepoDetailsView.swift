//    
//  RepoDetailsView.swift
//  iostestapp
//

import Foundation
import SwiftUI
import RepoFeature
import Common

struct RepoDetailsView: View {
    @StateObject var viewModel: RepoDetailsViewModel

    var body: some View {
        BaseView(
            state: viewModel.viewState,
            loadingMessage: "loading_repository_details",
            onRetry: { await viewModel.fetchRepoDetails() }
        ) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Header Section
                    if let repository = viewModel.repo {
                        HeaderView(repository: repository)

                        Divider()
                            .padding(.horizontal)
                        
                        // Tags Section
                        TagsSection(tags: viewModel.tags)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(viewModel.repo?.name ?? "repository")
        }
        .task {
            await viewModel.fetchRepoDetails()
        }
    }
}
