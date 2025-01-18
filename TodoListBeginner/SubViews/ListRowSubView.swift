//
//  ListRowSubView.swift
//  TodoListBeginner
//
//  Created by Alisina Haidari on 17.01.2025.
//

import SwiftUI

struct ListRowSubView: View {
    let task: String
    @State private var isDone: Bool = false
    var body: some View {
        HStack {
            Image(
                systemName: isDone ?"checkmark.circle.fill" : "circle"
            )
                .onTapGesture {
                    isDone.toggle()
                }
            Text(task)
        }
    }
}
