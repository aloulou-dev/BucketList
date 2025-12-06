//
//  DetailView.swift
//  BucketList
//
//  Created by Malek Aloulou on 11/17/25.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @State var goal : Goal
    @State var title: String
    @State var notes: String
    @State var completed: Bool
    @State var completedOn: Date
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading){
            Text("Goal:").bold()
                
            TextField("Goal", text: $title)
            
            Text("Notes:").bold()
                            TextField("notes", text: $title)
            
            Toggle("Completed?", isOn: $completed)
                .bold()
                .padding(.bottom)
            
            if completed{
                HStack{
                    Text("Completed On:").bold()
                    
                    DatePicker("", selection: $completedOn, displayedComponents: [.date])
                        
                    
                    
                    
                }
            }
            Spacer()
        }
        .font(.title2)
        .padding(.horizontal)
        .onAppear{
            title = goal.title
            notes = goal.notes
            completed = goal.completed
            completedOn = goal.completedOn
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            }
            ToolbarItem(placement: .topBarTrailing){
                Button{
                    goal.title = title
                    goal.notes = notes
                    goal.completed = completed
                    goal.completedOn = completedOn
                    modelContext.insert(goal)
                    guard let _ = try? modelContext.save() else {
                        print("ERROR: save on goal did not work")
                        return
                    }
                } label: {
                    Image(systemName: "checkmark")
                }
            }
            
        }
    }
    
}

#Preview {
    DetailView(goal: Goal(), title: "hello", notes: "test", completed: false, completedOn: Date(timeIntervalSinceNow: 0))
}
