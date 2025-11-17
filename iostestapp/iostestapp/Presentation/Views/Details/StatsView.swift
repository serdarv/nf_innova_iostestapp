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
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.caption)
                
                Text("\(count)")
                    .font(.caption)
                    .fontWeight(.medium)
            }
            
            Text(label)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }
}
