//
//  Goal.swift
//  BucketList
//
//  Created by Malek Aloulou on 11/17/25.
//

import Foundation
import SwiftData

@Model


class Goal: Identifiable {
    var title: String
    var notes: String
    var completed: Bool
    var completedOn = Date()
    
    init(title: String, notes: String, completed: Bool, completedOn: Date = Date()) {
        self.title = title
        self.notes = notes
        self.completed = completed
        self.completedOn = completedOn
    }
    
    convenience init() {
        self.init(title: "", notes: "", completed: false)
    }
}

extension Goal{
    static var preview: ModelContainer{
        let container = try! ModelContainer(for: Goal.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        Task { @MainActor in
            
            container.mainContext.insert(Goal(
                title: "Dive the Great Barrier Reef",
                notes: "Need scuba certification first",
                completed: false
            ))
            
            container.mainContext.insert(Goal(
                title: "Become Scuba Certified",
                notes: "East Coast Divers is in Brookline, MA that can do this",
                completed: true
            ))
            
            container.mainContext.insert(Goal(
                title: "Hike the Great Wall",
                notes: "Maybe during study abroad",
                completed: true
            ))
            
            container.mainContext.insert(Goal(
                title: "Safari in Kenya",
                notes: "Try to schedule something during the Great Migration",
                completed: false
            ))
            
            container.mainContext.insert(Goal(
                title: "Hike Machu Picchu",
                notes: "Learning to surf in Lima might also be cool.",
                completed: false
            ))
            
        }
        return container
    }
}
