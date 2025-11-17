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
        VStack(spacing: AppConstants.Spacing.extraLarge) {
            // Error Icon
            Image(systemName: SystemImages.exclamationTriangleFill.name)
                .font(.system(size: AppConstants.FontSize.system50))
                .foregroundColor(.orange)
            
            // Error Messages
            VStack(spacing: AppConstants.Spacing.small) {
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
                    Image(systemName: SystemImages.arrowClockwise.name)
                        .font(.system(size: AppConstants.IconSize.small, weight: .medium))
                    
                    Text("retry".localized)
                        .font(.body)
                        .fontWeight(.medium)
                }
                .foregroundColor(.white)
                .padding(.horizontal, AppConstants.Padding.extraLarge)
                .padding(.vertical, AppConstants.Padding.medium)
                .background(Color.blue)
                .clipShape(Capsule())
            }
            .buttonStyle(.plain)
        }
        .padding(AppConstants.Padding.container)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ErrorView {
        print("Retry tapped")
    }
}