//
//  RepoTagItemView.swift
//  iostestapp
//

import Foundation
import SwiftUI
import RepoFeature
import Common

struct TagItemView: View {
    let tag: RepoTagModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppConstants.Spacing.small) {
            HStack {
                // Tag icon and name
                HStack(spacing: AppConstants.Spacing.small) {
                    Image(systemName: SystemImages.tagFill.name)
                        .foregroundColor(.blue)
                        .font(.caption)
                    
                    Text(tag.name)
                        .bodyStyle()
                }
                
                Spacer()
            }
            
            // Commit SHA
            HStack(spacing: 6) {
                Image(systemName: SystemImages.number.name)
                    .foregroundColor(.secondary)
                    .font(.caption2)
                
                Text("sha".localized + "\(tag.commit.sha.prefix(8))")
                    .captionStyle()
            }
        }
        .padding(.vertical, AppConstants.Padding.small)
        .padding(.horizontal, AppConstants.Padding.medium)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: AppConstants.CornerRadius.small))
    }
}
