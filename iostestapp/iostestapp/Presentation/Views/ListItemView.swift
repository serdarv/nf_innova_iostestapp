//    
//  ListItemView.swift
//  iostestapp
//

import SwiftUI
import RepoFeature
import Common

struct ListItemView: View {

    let repoItem: RepoModel

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(repoItem.name)
                        .titleStyle()
                    
                    if let description = repoItem.description {
                        Text(description)
                            .descriptionStyle()
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Label("\(repoItem.openIssuesCount)", systemImage: "exclamationmark.circle")
                        .font(.caption)
                        .foregroundColor(repoItem.openIssuesCount > 0 ? .orange : .secondary)
                    
                    Text("open_issues".localized)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding()

            Divider()
        }
    }
}
