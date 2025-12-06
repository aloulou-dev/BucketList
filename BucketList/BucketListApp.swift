//
//  BucketListApp.swift
//  BucketList
//
//  Created by Malek Aloulou on 11/17/25.
//

import SwiftUI
import SwiftData

@main
struct BucketListApp: App {
    var body: some Scene {
        WindowGroup {
            BucketListView()
                .modelContainer(for: Goal.self)
        }
    }
    
    init(){
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
