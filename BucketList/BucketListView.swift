//
//  ContentView.swift
//  BucketList
//
//  Created by Malek Aloulou on 11/17/25.
//

import SwiftUI
import SwiftData

struct BucketListView: View {
    enum Segments: String, CaseIterable{
        case all = "All", completed = "Completed", open = "Open"
    }
    
    @Query private var goals: [Goal]
    @State private var sheetIsPresented: Bool = false
    @State private var selectedSegment: String = ""
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        NavigationStack {
            List{
                ForEach(goals) { goal in
                    NavigationLink{
                        DetailView(goal:goal)
                    } label: {
                        HStack{
                            VStack{
                                if goal.completed{
                                    Image(systemName: "checkmark.square")
                                }else {
                                    Image(systemName: "square")
                                }
                            }.font(.title2)
                            
                            Text(goal.title)
                                .font(.title2)
                        }
                        
                    }
                    .swipeActions{
                        Button("Delete", role: .destructive){
                            modelContext.delete(goal)
                            guard let _ = try? modelContext.save() else {
                                print("ERROR: save on goal did not work")
                                return
                            }
                            
                        }
                    }
                    
                    
                   
                    
                    
                        
                        
                    
                    
                }
            }
            
            
            .listStyle(.plain)
            
            .navigationTitle("Bucket List:")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .buttonStyle(.borderedProminent)
                

                }
            }
        }
        .padding()
        .sheet(isPresented: $sheetIsPresented) {
            NavigationStack{
                DetailView(goal: Goal(), title: "", notes: "", completed: false, completedOn: Date(timeIntervalSinceNow: 0))
            }
        }
    }
}

#Preview {
    BucketListView()
        .modelContainer(Goal.preview)
}
