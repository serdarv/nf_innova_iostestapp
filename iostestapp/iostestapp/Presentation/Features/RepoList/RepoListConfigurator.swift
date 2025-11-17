//    
//  RepoListConfigurator.swift
//  iostestapp
//

import Foundation

final class RepoListConfigurator {

    public static func configureRepoListView(
        with viewModel: RepoListViewModel = RepoListViewModel()
    ) -> RepoListView {
        let view = RepoListView(viewModel: viewModel)
        return view
    }
}
