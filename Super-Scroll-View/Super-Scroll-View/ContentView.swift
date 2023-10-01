//
//  ContentView.swift
//  Super-Scroll-View
//
//  Created by Jaimin Raval on 30/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockData.items) { item in
                    Circle()
//                        .frame(width: 100, height: 100)
//                    instead we use .containerRelativeFrame
                        .containerRelativeFrame(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/, count: verticalSizeClass == .regular ? 2 : 4, spacing: 16)
                        .foregroundStyle(item.color.gradient)
//
                        .scrollTransition { ContentMode, phase in
                            ContentMode
                                .opacity(phase.isIdentity ? 1.0 : 0.2)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.2,
                                             y: phase.isIdentity ? 1.0 : 0.2)
                                .offset(y: phase.isIdentity ? 0 : 50)
                        }
                    
                }
            }
            .scrollTargetLayout()
        }
//        .padding()
//        while using padding we loose the intutive 3rd circle peek on the right side which let user know that it's scrollable, so instead we use .contentMargins
        .contentMargins(16, for: .scrollContent)
//  to make scroll more intutive and in ordered manner; it stops when the given input size of views are in the view of user
        .scrollTargetBehavior(.viewAligned)
//
    }
}

#Preview {
    ContentView()
}



struct Item: Identifiable {
    let id = UUID()
    let color: Color
}


struct MockData {
    static var items = [Item(color: .teal),
                        Item(color: .pink),
                        Item(color: .indigo),
                        Item(color: .orange),
                        Item(color: .purple),
                        Item(color: .yellow),
                        Item(color: .green),
                        Item(color: .blue),
                        Item(color: .brown),
                        Item(color: .red)]
}
