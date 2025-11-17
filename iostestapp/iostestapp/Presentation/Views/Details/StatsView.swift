//
//  RepoStatsView.swift
//  iostestapp
//

import Foundation
import SwiftUI

struct StatsView: View {
    let icon: String
    let count: Int
    let label: String
    let color: Color
    
    var body: some View {
        VStack(spacing: AppConstants.Spacing.extraSmall) {
            HStack(spacing: AppConstants.Spacing.extraSmall) {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.caption)
                
                Text("\(count)")
                    .statsTextStyle()
            }
            
            Text(label)
                .caption2Style()
        }
    }
}
