//
//  ContentView.swift
//  Habit-Tracking
//
//  Created by Salman Z on 1/5/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var activityStore = ActivityStore()
    @State var isAdding : Bool = false
    var body: some View {
        
        NavigationStack{
            List(activityStore.activities, id: \.id ) { activity in
                    NavigationLink{
                        DetailView(activity: activity)
                    } label: {
                        Text(activity.title)
                    }
                }
                .sheet(isPresented: $isAdding){
                    AddActivityView(activityStore: activityStore, isAdding: $isAdding)
                }
                .navigationTitle("Habit Tracking")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {isAdding.toggle()}) {
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
    var title: String
    var description: String
    var completionCount: Int = 0
}

class ActivityStore: ObservableObject {
    @Published var activities: [Activity] = []
    
}

struct DetailView: View {
    var activity: Activity
    
    var body: some View {
        Text(activity.title)
        Text(activity.description)
    }
}

struct AddActivityView: View {
    
    @ObservedObject var activityStore: ActivityStore
    @Binding var isAdding : Bool
    @State var activityTitle: String = ""
    @State var description: String = ""
    
    var body: some View {
        VStack{
            
            Text("Add Activity")
                .font(.title)
                .bold()
                .fontWeight(.heavy)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.indigo)
                        
            TextField("Activity Name", text: $activityTitle)
                .frame(maxWidth: 200)
                .frame(height: 150)
                .padding()
                .foregroundColor(.brown)
            
            TextField("Description", text: $description)
                .frame(maxWidth: 200)
                .frame(height: 150)
                .foregroundColor(Color.orange)
            Spacer()
            Button(
                "Submit actvity",
                action: {activityStore.activities.append(
                    Activity(
                        title: activityTitle,
                        description: description
                    ))
                    isAdding.toggle() })

        }
    }
}

#Preview {
    ContentView()
}
