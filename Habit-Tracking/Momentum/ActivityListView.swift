//
//  ActivityListView.swift
//  Momentum
//
//  Created by Salman Z on 1/7/25.
//

import SwiftUI

struct ActivityListView: View {
    @ObservedObject var activityStore: ActivityStore
    @Binding var isAdding: Bool
    @Binding var addActvityMode: AddActivityMode
    
    var body: some View {
        List {
            ForEach(activityStore.activities, id: \.id ) { activity in
                NavigationLink{
                    HabitView(
                        activityStore: activityStore,
                        activity: activity,
                        isAdding: $isAdding,
                        addActvityMode: $addActvityMode
                    )
                } label: {
                    Text(activity.title)
                        .padding()
                        .foregroundStyle(.black)
                }
            }
            .onDelete(perform: activityStore.removeRows)
        }
        
    }
}
