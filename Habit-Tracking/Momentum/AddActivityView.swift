//
//  AddActivityView.swift
//  Momentum
//
//  Created by Salman Z on 1/7/25.
//

import SwiftUI

enum AddActivityMode {
    case add
    case edit
    
    var title: String {
        switch self {
        case .add:
            return "Add Activity"
        case .edit:
            return "Edit Activity"
        }
    }
    
    var cta: String {
        switch self {
        case .add:
            return "Submit"
            
        case .edit:
            return "Update"
        }
    }
}

struct AddActivityView: View {
    @ObservedObject var activityStore: ActivityStore
    @Environment(\.dismiss) var dismiss
    @Binding var isAdding: Bool
    @Binding var mode: AddActivityMode
    @State var activityTitle: String = ""
    @State var description: String = ""
    @State var selectedCategory: ActivityCategory = .learning
    
    var body: some View {
        VStack(spacing: 20) {
            Text(mode.title)
                .font(.title)
                .bold()
                .fontWeight(.heavy)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.indigo)
            
            Form {
                TextField("Activity Name", text: $activityTitle)
                    .textModifier(color: .teal)
                
                Section("Description") {
                    TextEditor(text: $description)
                        .textModifier(color: .brown)
                }
                
                Picker("Choose category", selection: $selectedCategory) {
                    ForEach(ActivityCategory.allCases, id: \.self) { category in
                        Label(category.rawValue, systemImage: category.icon)
                            .textModifier(color: .blue)
                    }
                }
                .pickerStyle(.inline)
            }
            
            HStack {
                Button(mode.cta) {
                    activityStore.activities.append(
                        Activity(
                            title: activityTitle,
                            description: description,
                            category: selectedCategory
                        ))
                    isAdding.toggle()
                }
                .textModifier(color: .green)
                
                Button("Cancel") {
                    dismiss()
                }
                .textModifier(color: .red)
            }
        }
    }
}

struct TextModifier: ViewModifier {
    var color: Color?
    
    func body(content: Content) -> some View{
        content
            .frame(width: .infinity)
            .padding()
            .fontWeight(.bold)
            .background(color)
            .foregroundColor(.black)
            .cornerRadius(10)
            .shadow(radius: 10)
            .multilineTextAlignment(.center)
    }
}

extension View {
    func textModifier(color: Color? = nil) -> some View {
        self.modifier(TextModifier(color: color))
    }
}

//#Preview {
//    AddActivityView(activityStore: ActivityStore(), isAdding: $true)
//}

