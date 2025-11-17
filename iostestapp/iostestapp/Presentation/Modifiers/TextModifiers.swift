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
}
