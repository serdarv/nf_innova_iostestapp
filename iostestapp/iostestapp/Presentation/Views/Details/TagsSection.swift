//
//  RepoTagsSection.swift
//  iostestapp
//

import Foundation
import SwiftUI
import RepoFeature
import Common

struct TagsSection: View {
    let tags: [RepoTagModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppConstants.Spacing.medium) {
            // Section header
            HStack {
                Text("tags".localized)
                    .sectionHeaderStyle()
                
                Spacer()
                
                Text("\(tags.count)")
                    .badgeTextStyle()
                    .padding(.horizontal, AppConstants.Padding.small)
                    .padding(.vertical, AppConstants.Padding.extraSmall)
                    .background(Color(.systemGray5))
                    .clipShape(Capsule())
            }
            .padding(.horizontal)
            
            // Tags list
            if tags.isEmpty {
                Text("no_tags_available".localized)
                    .emptyStateStyle()
                    .padding()
            } else {
                LazyVStack(alignment: .leading, spacing: AppConstants.Spacing.small) {
                    ForEach(tags, id: \.name) { tag in
                        TagItemView(tag: tag)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
