//
//  TodoListView.swift
//  TodoListBeginner
//
//  Created by Alisina Haidari on 17.01.2025.
//

import SwiftUI

struct TodoListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var animate: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                if listViewModel.items.isEmpty {
                    NoItemSubView()
                        .transition(.opacity)
                        .animation(.easeIn, value: animate)
                }else{
                    
                    List {
                        ForEach(listViewModel.items) { task in
                            ListRowSubView(task: task)
                        }
                        .onDelete(perform: listViewModel.delete)
                        .onMove(perform: listViewModel.moveItem)
                        .listStyle(PlainListStyle())
                    }
                }
            }
            .navigationTitle("Todo List 📝")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
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
        .environmentObject(ListViewModel())
}


