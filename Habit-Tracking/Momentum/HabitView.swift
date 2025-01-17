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
    @Binding var isAdding: Bool
    @Binding var addActvityMode: AddActivityMode

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                    Section() {
                        Text("Title")
                            .bold()
                        
                        Text(activity.title)
                            .textModifier(color: Color.blue)
                    }
                }
                
                HStack {
                    Section() {
                        Text("Description")
                            .bold()
                        Text(activity.description)
                            .textModifier(color: .pink)
                    }
                }
                
                HStack {
                    Section() {
                        Text("Category")
                        Label(activity.category.rawValue, systemImage: activity.category.icon)
                            .textModifier(color: .blue)
                    }
                    .foregroundStyle(activity.category.color)
                }
         
                HStack {
                    Section("Count") {
                        Text("Completed \(activity.completionCount) times")
                            .textModifier(color: .orange)
                        
                    }
                }
                
                Button("Increment Completion Count") {
                    incrementCompletionCount()
                }
                .textModifier(color: .yellow)
                
                Button("Decrement Completion Count") {
                    decrementCompletionCount()
                }
                .textModifier(color: .red)
         
            }
            .navigationTitle("Detailed Habit View")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    isAdding.toggle()
                    addActvityMode = .edit
                }) {
                    Label("Edit", systemImage: "pencil")
                }
                .sheet(isPresented: $isAdding) {
                    AddActivityView(activityStore: activityStore, isAdding: $isAdding, mode: $addActvityMode)
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
            if updatedActivity.completionCount > 0 {
                updatedActivity.completionCount -= 1
                activityStore.activities[index] = updatedActivity
            }
        }
    }
}

//
//#Preview {
//    HabitView(activityStore: ActivityStore(), activity: Activity(title: "Coding", description: "Coding for hours", category: .learning)
//}
