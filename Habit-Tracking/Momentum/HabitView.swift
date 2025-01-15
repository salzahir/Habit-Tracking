//
//  HabitView.swift
//  Momentum
//
//  Created by Salman Z on 1/7/25.
//
import SwiftUI

struct HabitView: View {
    @ObservedObject var activityStore: ActivityStore
    var activity: Activity
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                
                Section("Title") {
                    Text(activity.title)
                        .textModifier(color: Color.blue)
                }

                Section("Description") {
                    Text(activity.description)
                        .textModifier(color: .pink)
                }
                
                Section("Count") {
                    Text("Completed \(activity.completionCount) times")
                        .textModifier(color: .orange)
                    
                    Button("Increment Completion Count") {
                        incrementCompletionCount()
                    }
                    .textModifier(color: .yellow)
                    
                    Button("Decrement Completion Count") {
                        decrementCompletionCount()
                    }
                    .textModifier(color: .red)
                }

            }
            .navigationTitle("Detailed Habit View")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    // Implement editing of the view
                }) {
                    Label("Edit", systemImage: "pencil")
                }
            }
        }

    }
    
    func incrementCompletionCount() {
        if let index = activityStore.activities.firstIndex(of: activity) {
            var updatedActivity = activityStore.activities[index]
            updatedActivity.completionCount += 1
            activityStore.activities[index] = updatedActivity
        }
    }
    
    func decrementCompletionCount() {
        if let index = activityStore.activities.firstIndex(of: activity) {
            var updatedActivity = activityStore.activities[index]
            updatedActivity.completionCount -= 1
            activityStore.activities[index] = updatedActivity
        }
    }

}
