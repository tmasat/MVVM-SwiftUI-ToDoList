//
//  ItemModel.swift
//  MVVM-SwiftUI-ToDoList
//
//  Created by Çağrı Tuğberk Masat on 15.05.2023.
//

import Foundation

enum ItemModelPriority: Int, Codable {
    case low
    case medium
    case high
    
    var title: String {
        switch self {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
}

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let priority: ItemModelPriority
    let dueDate: Date
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, description: String, priority: Int, dueDate: Date, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.priority = ItemModelPriority(rawValue: priority) ?? .high
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
    
    func updateCheckItemCompletion() -> ItemModel {
        ItemModel(id: id, title: title, description: description, priority: priority.rawValue, dueDate: dueDate, isCompleted: !isCompleted)
    }
    
    func updateCompletion() -> ItemModel {
        ItemModel(id: id, title: title, description: description, priority: priority.rawValue, dueDate: dueDate, isCompleted: isCompleted)
    }
}

/*
 TODOS
 1) Add new folder structer for every page
 2) Add presenters
 3) Add Combine
 */
