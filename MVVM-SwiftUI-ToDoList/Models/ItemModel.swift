//
//  ItemModel.swift
//  MVVM-SwiftUI-ToDoList
//
//  Created by Çağrı Tuğberk Masat on 15.05.2023.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let priority: Int
    let dueDate: Date
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, description: String, priority: Int, dueDate: Date, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.priority = priority
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        ItemModel(id: id, title: title, description: description, priority: priority, dueDate: dueDate, isCompleted: !isCompleted)
    }
}

/*
 TODOs
 1) Update textfield to be able to write more than 1 line ---- OK
 2) Add title and priorty and date for TODO cells
 3) Add combine
 4) Update folder structure like -> CustomViews, Pages, Models, ViewModels and Views
 5) Add viewModelPresentation
 */
