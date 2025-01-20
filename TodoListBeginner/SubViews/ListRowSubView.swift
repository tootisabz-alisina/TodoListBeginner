//
//  ListRowSubView.swift
//  TodoListBeginner
//
//  Created by Alisina Haidari on 17.01.2025.
//

import SwiftUI

struct ListRowSubView: View {
    let task: ItemModel

    var body: some View {
        HStack {
            Image(
                systemName: task.isCompleted ? "checkmark.circle.fill" : "circle"
            )
            Text(task.title)
        }
    }
}
