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
    var body: some View {
        NavigationStack{
            ZStack{
                Color.teal
                    .ignoresSafeArea()
                
                ActivityListView(activityStore: activityStore)
                    .sheet(isPresented: $isAdding){
                        AddActivityView(
                            activityStore: activityStore,
                            isAdding: $isAdding
                        )
                    }
                    .navigationTitle("Habit Tracking")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            AddButton(isAdding: $isAdding)
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
