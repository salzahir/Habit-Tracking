//
//  ContentView.swift
//  Habit-Tracking
//
//  Created by Salman Z on 1/5/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var activityStore = ActivityStore()
    var body: some View {
        
        NavigationStack{
            VStack {
                ForEach(activityStore.activities, id: \.id ) { activity in
                    DetailView(activity: activity)
                }
            }
            .navigationTitle("Habit Tracking")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {print("Hello World")}) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.blue)
                    }
                }
            }
            .padding()
        }
    }
}


struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    var activityTitle: String
    var description: String
}

class ActivityStore: ObservableObject {
    @Published var activities: [Activity] = []
    
}

struct DetailView: View {
    var activity: Activity
    
    var body: some View {
        Text(activity.activityTitle)
        Text(activity.description)
    }
}

#Preview {
    ContentView()
}
