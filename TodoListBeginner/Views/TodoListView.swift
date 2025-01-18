//
//  TodoListView.swift
//  TodoListBeginner
//
//  Created by Alisina Haidari on 17.01.2025.
//

import SwiftUI

struct TodoListView: View {
    
    @State var todoList: [String] = [
        "Buy a Macbook",
        "Clean the home",
        "Wash my car",
        "Go to shopping",
        "Buy a AirPods",
        "Talk with someone"
    ]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(todoList, id: \.self) { task in
                    ListRowSubView(task: task)
                }
            }
            .navigationTitle("Todo List 📝")
            .listStyle(PlainListStyle())
            .toolbar {
                ToolbarItem {
                    NavigationLink("Add") {
                        AddTaskView()
                    }
                }
            }
        }
    }
}

#Preview {
    TodoListView()
}


