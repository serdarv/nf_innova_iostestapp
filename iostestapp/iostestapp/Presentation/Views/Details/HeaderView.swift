//
//  RepoHeaderView.swift
//  iostestapp
//

import Foundation
import SwiftUI
import RepoFeature
import Common

struct HeaderView: View {
    let repository: RepoModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppConstants.Spacing.medium) {
            // User info section
            HStack(spacing: AppConstants.Spacing.medium) {
                AsyncImage(url: URL(string: repository.owner.avatarURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .overlay {
                            Image(systemName: SystemImages.personCircleFill.name)
                                .foregroundColor(.gray)
                        }
                }
                .frame(width: AppConstants.IconSize.large, height: AppConstants.IconSize.large)
                .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(repository.owner.login)
                        .titleStyle()
                    
                    Text(repository.owner.type.capitalized)
                        .captionStyle()
                }
                
                Spacer()
            }
            
            // Repository name
            Text(repository.name)
                .repoTitleStyle()
            
            // Repository description
            if let description = repository.description, !description.isEmpty {
                Text(description)
                    .descriptionStyle(lineLimit: 3)
            }
            
            // Stats section
            HStack(spacing: AppConstants.Spacing.extraLarge) {
                StatsView(
                    icon: SystemImages.starFill.name,
                    count: repository.stargazersCount,
                    label: "stars".localized,
                    color: .yellow
                )
                
                StatsView(
                    icon: SystemImages.tuningfork.name,
                    count: repository.forksCount,
                    label: "forks".localized,
                    color: .blue
                )
                
                StatsView(
                    icon: SystemImages.eyeFill.name,
                    count: repository.watchersCount,
                    label: "watchers".localized,
                    color: .green
                )
                
                if repository.openIssuesCount > 0 {
                    StatsView(
                        icon: SystemImages.exclamationCircleFill.name,
                        count: repository.openIssuesCount,
                        label: "issues".localized,
                        color: .red
                    )
                }
            }
            
            // Language and additional info
            HStack {
                if let language = repository.language {
                    Label(language, systemImage: SystemImages.chevronLeftSlashChevronRight.name)
                        .captionStyle()
                }
                
                Spacer()
                
                if repository.isPrivate {
                    Label("private".localized, systemImage: SystemImages.lockFill.name)
                        .privateStatusStyle()
                } else {
                    Label("public".localized, systemImage: SystemImages.globe.name)
                        .publicStatusStyle()
                }
            }
        }
        .padding(AppConstants.Padding.standard)
        .background(Color(.systemBackground))
    }
}
