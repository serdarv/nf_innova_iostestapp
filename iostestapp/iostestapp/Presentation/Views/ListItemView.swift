//    
//  ListItemView.swift
//  iostestapp
//

import SwiftUI
import RepoFeature
import Common

struct ListItemView: View {

    let repoItem: RepoListVisual

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: AppConstants.Spacing.extraSmall) {
                    Text(repoItem.name)
                        .titleStyle()
                    
                    if let description = repoItem.description {
                        Text(description)
                            .descriptionStyle()
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: AppConstants.Spacing.extraSmall) {
                    Label("\(repoItem.openIssuesCount)", systemImage: SystemImages.exclamationCircle.name)
                        .issueCountStyle(hasIssues: repoItem.hasIssues)
                    
                    Text("open_issues")
                        .caption2Style()
                }
            }
            .padding(AppConstants.Padding.standard)

            Divider()
        }
    }
}
