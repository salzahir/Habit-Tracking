//
//  Activity.swift
//  Momentum
//
//  Created by Salman Z on 1/7/25.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount: Int = 0
    var category: ActivityCategory
}


