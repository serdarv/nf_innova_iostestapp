//
//  ErrorView.swift
//  iostestapp
//

import SwiftUI
import Common

struct ErrorView: View {
    let title: String
    let subtitle: String
    let retryAction: () async -> Void
    
    init(
        title: String = "something_went_wrong".localized,
        subtitle: String = "try_again_later".localized,
        retryAction: @escaping () async -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.retryAction = retryAction
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // Error Icon
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 50))
                .foregroundColor(.orange)
            
            // Error Messages
            VStack(spacing: 8) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            
            // Retry Button
            Button {
                Task {
                    await retryAction()
                }
            } label: {
                HStack {
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 16, weight: .medium))
                    
                    Text("retry".localized)
                        .font(.body)
                        .fontWeight(.medium)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(Color.blue)
                .clipShape(Capsule())
            }
            .buttonStyle(.plain)
        }
        .padding(40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ErrorView {
        print("Retry tapped")
    }
}