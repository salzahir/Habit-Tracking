//
//  ActivityCategory.swift
//  Momentum
//
//  Created by Salman Z on 1/14/25.
//

import SwiftUI

enum ActivityCategory: String, CaseIterable, Codable {
    case health = "Health & Wellness"
    case fitness = "Fitness & Exercise"
    case productivity = "Productivity"
    case learning = "Learning & Education"
    case mindfulness = "Mindfulness & Mental Health"
    case social = "Social & Relationships"
    case creativity = "Creative Activities"
    case finance = "Finance & Budget"
    case home = "Home & Organization"
    case career = "Career & Professional"
    
    var icon: String {
        switch self {
        case .health: return "heart.fill"
        case .fitness: return "figure.run"
        case .productivity: return "checklist"
        case .learning: return "book.fill"
        case .mindfulness: return "brain.head.profile"
        case .social: return "person.2.fill"
        case .creativity: return "paintbrush.fill"
        case .finance: return "dollarsign.circle.fill"
        case .home: return "house.fill"
        case .career: return "briefcase.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .health: return .red
        case .fitness: return .orange
        case .productivity: return .blue
        case .learning: return .green
        case .mindfulness: return .teal
        case .social: return .pink
        case .creativity: return .yellow
        case .finance: return .purple
        case .home: return .brown
        case .career: return .gray
        }
    }
}
