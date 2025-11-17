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
        VStack(alignment: .leading, spacing: 12) {
            // Section header
            HStack {
                Text("tags".localized)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(tags.count)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color(.systemGray5))
                    .clipShape(Capsule())
            }
            .padding(.horizontal)
            
            // Tags list
            if tags.isEmpty {
                Text("no_tags_available".localized)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding()
            } else {
                LazyVStack(alignment: .leading, spacing: 8) {
                    ForEach(tags, id: \.name) { tag in
                        TagItemView(tag: tag)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
