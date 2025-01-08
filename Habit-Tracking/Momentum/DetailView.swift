//
//  DetailView.swift
//  Momentum
//
//  Created by Salman Z on 1/7/25.
//
import SwiftUI

struct DetailView: View {
    @ObservedObject var activityStore: ActivityStore
    var activity: Activity
    
    var body: some View {
        Text(activity.title)
        Text(activity.description)
        Text("Completed \(activity.completionCount) times")
        Button("Increment Completion Count") {
            incrementCompletionCount()
        }
    }
    
    func incrementCompletionCount() {
        if let index = activityStore.activities.firstIndex(of: activity) {
            var updatedActivity = activityStore.activities[index]
            updatedActivity.completionCount += 1
            activityStore.activities[index] = updatedActivity
        }
    }
}
