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
        Group {
            if viewModel.isLoading {
                // Loading state
                VStack {
                    ProgressView("loading_repository_details".localized)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            } else if viewModel.hasError {
                // Error state
                ErrorView {
                    await viewModel.fetchRepoDetails()
                }
            } else if let repository = viewModel.repo {
                // Success state
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Header Section
                        HeaderView(repository: repository)

                        Divider()
                            .padding(.horizontal)
                        
                        // Tags Section
                        TagsSection(tags: viewModel.tags)
                    }
                }
            } else {
                // Empty state (shouldn't normally happen)
                ErrorView {
                    await viewModel.fetchRepoDetails()
                }
            }
        }
        .task {
            await viewModel.fetchRepoDetails()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.repo?.name ?? "repository".localized)
    }
}
