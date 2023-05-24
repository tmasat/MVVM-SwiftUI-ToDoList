//
//  ListRowView.swift
//  MVVM-SwiftUI-ToDoList
//
//  Created by Çağrı Tuğberk Masat on 15.05.2023.
//

import SwiftUI
import Combine

struct ListRowView: View {
    private let item: ListItemPresentation
    @ObservedObject private var viewModel: ListViewModel
    
    init(item: ListItemPresentation, viewModel: ListViewModel) {
        self.item = item
        self.viewModel = viewModel
    }
    
    var body: some View {
        contentView
            .onTapGesture {
                self.viewModel.itemTapped(self.item)
            }
        
    
//        VStack {
//            HStack {
//                Text(item.title)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.leading, 30)
//                Spacer()
//            }
//
//            HStack {
//                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
//                    .foregroundColor(item.isCompleted ? .green : .red)
//                Text(item.description)
//                Spacer()
//            }
//            .font(.title2)
//            .padding(.bottom, 5)
//
//            HStack {
//                Text("Priority: \(priorityParser(index:item.priority.rawValue))")
//                Spacer()
//                Text(dateFormatter(date: item.dueDate))
//            }
//            .padding(.leading, 35)
//            .padding(.trailing, 35)
//
//        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        HStack {
            checkBoxView
            VStack {
                infoView
                priorityDateView
                    .padding(.top, 8)
            }
           Spacer()
        }
    }
    
    @ViewBuilder
    private var infoView: some View {
        VStack {
            HStack {
                Text(item.title)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            
            HStack {
                Text(item.description)
                    .font(.title2)
                    .fontWeight(.regular)
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private var priorityDateView: some View {
        HStack {
            Text("Priority: \(item.priorityText)")
            Spacer()
            Text(item.dueDateText)
        }
    }
    
    @ViewBuilder
    private var checkBoxView: some View {
        Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
            .foregroundColor(item.isCompleted ? .green : .red)
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
