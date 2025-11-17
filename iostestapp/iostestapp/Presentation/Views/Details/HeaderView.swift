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
        VStack(alignment: .leading, spacing: 12) {
            // User info section
            HStack(spacing: 12) {
                AsyncImage(url: URL(string: repository.owner.avatarURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .overlay {
                            Image(systemName: "person.circle.fill")
                                .foregroundColor(.gray)
                        }
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(repository.owner.login)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(repository.owner.type.capitalized)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            // Repository name
            Text(repository.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            // Repository description
            if let description = repository.description, !description.isEmpty {
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
            }
            
            // Stats section
            HStack(spacing: 20) {
                StatsView(
                    icon: "star.fill",
                    count: repository.stargazersCount,
                    label: "stars".localized,
                    color: .yellow
                )
                
                StatsView(
                    icon: "tuningfork",
                    count: repository.forksCount,
                    label: "forks".localized,
                    color: .blue
                )
                
                StatsView(
                    icon: "eye.fill",
                    count: repository.watchersCount,
                    label: "watchers".localized,
                    color: .green
                )
                
                if repository.openIssuesCount > 0 {
                    StatsView(
                        icon: "exclamationmark.circle.fill",
                        count: repository.openIssuesCount,
                        label: "issues".localized,
                        color: .red
                    )
                }
            }
            
            // Language and additional info
            HStack {
                if let language = repository.language {
                    Label(language, systemImage: "chevron.left.slash.chevron.right")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                if repository.isPrivate {
                    Label("private".localized, systemImage: "lock.fill")
                        .font(.caption)
                        .foregroundColor(.orange)
                } else {
                    Label("public".localized, systemImage: "globe")
                        .font(.caption)
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
    }
}
