//
//  AddActivityView.swift
//  Momentum
//
//  Created by Salman Z on 1/7/25.
//

import SwiftUI

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
