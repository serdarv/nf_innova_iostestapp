//    
//  RepoDetailsConfigurator.swift
//  iostestapp
//

import Foundation

final class RepoDetailsConfigurator {

    public static func configureRepoDetailsView(
        repoName: String
    ) -> RepoDetailsView {
        let viewModel: RepoDetailsViewModel = RepoDetailsViewModel(repoName: repoName)
        let view = RepoDetailsView(viewModel: viewModel)
        return view
    }
}
