//
//  ActivityListView.swift
//  Momentum
//
//  Created by Salman Z on 1/7/25.
//

import SwiftUI

struct ActivityListView: View {
    @ObservedObject var activityStore: ActivityStore
    
    var body: some View {
        List {
            ForEach(activityStore.activities, id: \.id ) { activity in
                NavigationLink{
                    DetailView(activityStore: activityStore, activity: activity)
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
