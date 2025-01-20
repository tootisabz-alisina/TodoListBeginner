//
//  AddTaskView.swift
//  TodoListBeginner
//
//  Created by Alisina Haidari on 17.01.2025.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var taskController = ""
    
    init(taskController: String = "") {
        self.taskController = taskController
        print("Add Screen Init")
    }
    
    var body: some View {
        NavigationStack{
            ScrollView {
                
                TextField("Add a task here...", text: $taskController)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
                
                
                Button {
                    listViewModel.addItem(title: taskController)
                    taskController = ""
                } label: {
                    Text("save".uppercased())
                        .colorInvert()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.primary)
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding()
                }
                .disableWithOpacity(taskController.count < 5)

                Spacer()
                    .navigationTitle("Add Task")
            }

        }

    }
}

extension View{
    
    @ViewBuilder
    func disableWithOpacity(_ condition: Bool)->some View{
        self.disabled(condition).opacity(condition ? 0.5 : 1)
    }
}


#Preview {
    AddTaskView()
}
