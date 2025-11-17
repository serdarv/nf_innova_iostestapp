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
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                // Tag icon and name
                HStack(spacing: 8) {
                    Image(systemName: "tag.fill")
                        .foregroundColor(.blue)
                        .font(.caption)
                    
                    Text(tag.name)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
                
                Spacer()
            }
            
            // Commit SHA
            HStack(spacing: 6) {
                Image(systemName: "number")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                
                Text("sha".localized + "\(tag.commit.sha.prefix(8))")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
