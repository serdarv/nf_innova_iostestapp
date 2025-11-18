//    
//  BaseViewModel.swift
//  iostestapp
//

import Foundation
import Combine

class BaseViewModel: ObservableObject {
    @Published var viewState: ViewState = .idle

    func setLoading() {
        viewState = .loading
    }

    func setError(_ message: String? = nil) {
        viewState = .error(message)
    }

    func setIdle() {
        viewState = .idle
    }
}
