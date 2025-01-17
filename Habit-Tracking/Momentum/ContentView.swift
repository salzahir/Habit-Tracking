//
//  ContentView.swift
//  Momentum
//
//  Created by Salman Z on 1/5/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var activityStore = ActivityStore()
    @State var isAdding : Bool = false
    @State private var addActvityMode: AddActivityMode = .add
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.red, .purple]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                ActivityListView(
                    activityStore: activityStore,
                    isAdding: $isAdding,
                    addActvityMode: $addActvityMode
                )
                    .sheet(isPresented: $isAdding){
                        AddActivityView(
                            activityStore: activityStore,
                            isAdding: $isAdding, mode: $addActvityMode
                        )
                    }
                    .navigationTitle("Habit Tracking")                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Add", action: {
                                addActvityMode = .add
                                isAdding.toggle()
                            })
                            AddButton(isAdding: $isAdding)
                        }
                        ToolbarItem(placement: .topBarLeading) {
                            EditButton()
                        }
                    }
                    .padding()
            }
        }
        .onAppear{
            activityStore.loadHabits()
        }
    }
}

#Preview {
    ContentView()
}
