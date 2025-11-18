//    
//  Constants.swift
//  iostestapp
//

import SwiftUI

struct AppConstants {
    // MARK: - Spacing & Padding
    struct Spacing {
        static let extraSmall: CGFloat = 4
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let large: CGFloat = 16
        static let extraLarge: CGFloat = 20
        static let xxl: CGFloat = 24
        static let xxxl: CGFloat = 40
    }
    
    struct Padding {
        static let extraSmall: CGFloat = 4
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let standard: CGFloat = 16
        static let large: CGFloat = 20
        static let extraLarge: CGFloat = 24
        static let container: CGFloat = 40
    }
    
    // MARK: - Corner Radius
    struct CornerRadius {
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let large: CGFloat = 16
    }
    
    // MARK: - Icon Sizes
    struct IconSize {
        static let small: CGFloat = 16
        static let medium: CGFloat = 24
        static let large: CGFloat = 50
    }
    
    // MARK: - Font Sizes
    struct FontSize {
        static let system50: CGFloat = 50
    }
}

// MARK: - EdgeInsets Extensions
extension EdgeInsets {
    static let zero = EdgeInsets()
    static let standard = EdgeInsets(top: AppConstants.Padding.standard, 
                                   leading: AppConstants.Padding.standard, 
                                   bottom: AppConstants.Padding.standard, 
                                   trailing: AppConstants.Padding.standard)
}
