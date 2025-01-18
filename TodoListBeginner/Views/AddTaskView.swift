//
//  AddTaskView.swift
//  TodoListBeginner
//
//  Created by Alisina Haidari on 17.01.2025.
//

import SwiftUI

struct AddTaskView: View {
    
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
                    
                } label: {
                    Text("save".uppercased())
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding()
                }

                Spacer()
                    .navigationTitle("Add Task")
            }

        }

    }
}

#Preview {
    AddTaskView()
}
