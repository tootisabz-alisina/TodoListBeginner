//
//  NoItemSubView.swift
//  TodoListBeginner
//
//  Created by TOTI SABZ on 1/20/25.
//

import SwiftUI

struct NoItemSubView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        VStack(spacing: 15){
            Text("There are not items!")
                .font(.headline.weight(.black))
            
            Text("Add an item to see it here!")
                .font(.headline.weight(.light))
            
            NavigationLink(destination: AddTaskView()) {
                Text("Add your first task now!")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? Color.red : Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .foregroundStyle(Color.white)
                    .font(.headline.weight(.black))
                    .padding(.horizontal,animate ? 40 : 60)
                    .scaleEffect(animate ? 0.9 : 1)
                    .offset(y:animate ? -10 : 0)
                    .shadow(
                        color: animate ? Color.red : Color.blue,
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 60 : 40
                    )
            }
            
        }
        .onAppear(perform: startAnimation)
    }
    
    func startAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation.easeInOut(duration: 1.5).repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemSubView()
}
