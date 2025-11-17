//    
//  TextModifiers.swift
//  iostestapp
//

import SwiftUI

// MARK: - Header Text Modifier
struct HeaderTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .multilineTextAlignment(.leading)
    }
}

// MARK: - Title Text Modifier
struct TitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.primary)
            .multilineTextAlignment(.leading)
    }
}

// MARK: - Description Text Modifier
struct DescriptionTextModifier: ViewModifier {
    let lineLimit: Int
    
    init(lineLimit: Int = 2) {
        self.lineLimit = lineLimit
    }
    
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.secondary)
            .lineLimit(lineLimit)
            .multilineTextAlignment(.leading)
    }
}

// MARK: - Error Title Text Modifier
struct ErrorTitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.primary)
            .multilineTextAlignment(.center)
    }
}

// MARK: - Error Subtitle Text Modifier
struct ErrorSubtitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
    }
}

// MARK: - Caption Text Modifier
struct CaptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.secondary)
    }
}

// MARK: - Repository Title Text Modifier
struct RepoTitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.primary)
    }
}

// MARK: - Empty State Text Modifier
struct EmptyStateTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.secondary)
    }
}

// MARK: - Section Header Modifier
struct SectionHeaderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.primary)
    }
}

// MARK: - Badge Text Modifier
struct BadgeTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.secondary)
    }
}

// MARK: - Body Text Modifier
struct BodyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .fontWeight(.medium)
            .foregroundColor(.primary)
    }
}

// MARK: - Caption2 Text Modifier  
struct Caption2TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .foregroundColor(.secondary)
    }
}

// MARK: - Stats Text Modifier
struct StatsTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .fontWeight(.medium)
    }
}

// MARK: - Issue Count Modifier
struct IssueCountModifier: ViewModifier {
    let hasIssues: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(hasIssues ? .orange : .secondary)
    }
}

// MARK: - Status Label Modifiers
struct PrivateStatusModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.orange)
    }
}

struct PublicStatusModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.green)
    }
}

// MARK: - Button Text Modifier
struct ButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .fontWeight(.medium)
    }
}

// MARK: - View Extensions
extension View {
    func headerStyle() -> some View {
        modifier(HeaderTextModifier())
    }
    
    func titleStyle() -> some View {
        modifier(TitleTextModifier())
    }
    
    func descriptionStyle(lineLimit: Int = 2) -> some View {
        modifier(DescriptionTextModifier(lineLimit: lineLimit))
    }
    
    func errorTitleStyle() -> some View {
        modifier(ErrorTitleTextModifier())
    }
    
    func errorSubtitleStyle() -> some View {
        modifier(ErrorSubtitleTextModifier())
    }
    
    func captionStyle() -> some View {
        modifier(CaptionTextModifier())
    }
    
    func repoTitleStyle() -> some View {
        modifier(RepoTitleTextModifier())
    }
    
    func emptyStateStyle() -> some View {
        modifier(EmptyStateTextModifier())
    }
    
    func sectionHeaderStyle() -> some View {
        modifier(SectionHeaderModifier())
    }
    
    func badgeTextStyle() -> some View {
        modifier(BadgeTextModifier())
    }
    
    func bodyStyle() -> some View {
        modifier(BodyTextModifier())
    }
    
    func caption2Style() -> some View {
        modifier(Caption2TextModifier())
    }
    
    func statsTextStyle() -> some View {
        modifier(StatsTextModifier())
    }
    
    func issueCountStyle(hasIssues: Bool) -> some View {
        modifier(IssueCountModifier(hasIssues: hasIssues))
    }
    
    func privateStatusStyle() -> some View {
        modifier(PrivateStatusModifier())
    }
    
    func publicStatusStyle() -> some View {
        modifier(PublicStatusModifier())
    }
    
    func buttonTextStyle() -> some View {
        modifier(ButtonTextModifier())
    }
}
