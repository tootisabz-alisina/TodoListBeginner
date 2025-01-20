//
//  TodoListBeginnerApp.swift
//  TodoListBeginner
//
//  Created by Alisina Haidari on 17.01.2025.
//

import SwiftUI

@main
struct TodoListBeginnerApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            TodoListView()
                .environmentObject(listViewModel)
        }
    }
}
