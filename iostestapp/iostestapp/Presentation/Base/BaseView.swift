//    
//  BaseView.swift
//  iostestapp
//

import SwiftUI
import Common

struct BaseView<Content: View>: View {
    let state: ViewState
    let loadingMessage: LocalizedStringKey
    let onRetry: () async -> Void
    @ViewBuilder let content: () -> Content
    
    init(
        state: ViewState,
        loadingMessage: LocalizedStringKey = "loading",
        onRetry: @escaping () async -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.state = state
        self.loadingMessage = loadingMessage
        self.onRetry = onRetry
        self.content = content
    }
    
    var body: some View {
        switch state {
        case .idle:
            content()
        case .loading:
            VStack {
                ProgressView(loadingMessage)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        case .error(let errorMessage):
            ErrorView(
                subtitle: errorMessage ?? "try_again_later"
            ) {
                await onRetry()
            }
        }
    }
}
