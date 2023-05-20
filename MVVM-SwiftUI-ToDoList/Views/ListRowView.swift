//
//  ListRowView.swift
//  MVVM-SwiftUI-ToDoList
//
//  Created by Çağrı Tuğberk Masat on 15.05.2023.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    @State var cellIsTapped: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text(item.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 30)
                Spacer()
            }
            
            HStack {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .red)
                Text(item.description)
                Spacer()
            }
            .font(.title2)
            .padding(.bottom, 5)
            
            HStack {
                Text("Priority: \(priorityParser(index:item.priority))")
                Spacer()
                Text(dateFormatter(date: item.dueDate))
            }
            .padding(.leading, 35)
            .padding(.trailing, 35)
            .onLongPressGesture {
                cellIsTapped.toggle()
            }
            NavigationLink("", destination: AddView(willUpdate: true), isActive: $cellIsTapped)
        }
    }
    
    private func priorityParser(index: Int) -> String {
        switch index {
        case 1: return "Low"
        case 2: return "Medium"
        case 3: return "High"
        default: return "Error"
        }
    }
    
    private func dateFormatter(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
