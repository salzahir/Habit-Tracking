//
//  ActivityStore.swift
//  Momentum
//
//  Created by Salman Z on 1/7/25.
//

import SwiftUI

class ActivityStore: ObservableObject {
    @Published var activities: [Activity] = [] {
        didSet {
            saveHabits()
        }
    }
    
    func saveHabits() {
        
        if let savedHabits = try? JSONEncoder().encode(activities) {
            UserDefaults.standard.set(savedHabits, forKey: "habits")
        }
        
    }
    func loadHabits() {
        if let loadedHabits = UserDefaults.standard.data(forKey: "habits"){
            let decoder = JSONDecoder()
            if let decodedHabits = try? decoder.decode([Activity].self, from: loadedHabits) {
                activities = decodedHabits
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        activities.remove(atOffsets: offsets)
    }
            
}
