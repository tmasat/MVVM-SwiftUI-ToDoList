//
//  ListRowView.swift
//  MVVM-SwiftUI-ToDoList
//
//  Created by Çağrı Tuğberk Masat on 15.05.2023.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        VStack {
            HStack {
                Text(item.title)
                    .font(.title)
                    .padding(.leading, 35)
                Spacer()
            }
            
            HStack {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .red)
                Text(item.description)
                Spacer()
            }
            .font(.title2)
            .padding(.vertical, 8)
            
            HStack {
                Text("Priority: \(priorityParser(index:item.priority))")
                Spacer()
                Text("Date")
            }
            .padding(.leading, 35)
            .padding(.trailing, 35)
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
}


struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First Item", description: "first description", priority: 1, isCompleted: false)
    static var item2 = ItemModel(title: "Second Item", description: "second description", priority: 2, isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}
