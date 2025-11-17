//    
//  SystemImages.swift
//  iostestapp
//

import Foundation

enum SystemImages: String, CaseIterable {
    // MARK: - Error & Alert Icons
    case exclamationTriangleFill = "exclamationmark.triangle.fill"
    case exclamationCircleFill = "exclamationmark.circle.fill"
    case exclamationCircle = "exclamationmark.circle"
    
    // MARK: - Actions & Controls
    case arrowClockwise = "arrow.clockwise"
    
    // MARK: - Tags & Labels
    case tagFill = "tag.fill"
    case number = "number"
    
    // MARK: - General Icons
    case globe = "globe"
    case personCircleFill = "person.circle.fill"
    
    // MARK: - Repository Stats
    case starFill = "star.fill"
    case tuningfork = "tuningfork"
    case eyeFill = "eye.fill"
    
    // MARK: - Code & Development
    case chevronLeftSlashChevronRight = "chevron.left.slash.chevron.right"
    
    // MARK: - Security & Privacy
    case lockFill = "lock.fill"
}

// MARK: - Convenience Extensions
extension SystemImages {
    /// Returns the raw string value for use with Image(systemName:)
    var name: String {
        return self.rawValue
    }
}