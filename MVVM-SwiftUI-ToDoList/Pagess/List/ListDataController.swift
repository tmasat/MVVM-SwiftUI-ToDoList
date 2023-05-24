//
//  ListDataController.swift
//  MVVM-SwiftUI-ToDoList
//
//  Created by aybek kaya on 24.05.2023.
//

import Foundation
import Combine

final class ListDataController {
    private let itemsKey: String = "items_list"
    private(set) var items: CurrentValueSubject<[ItemModel], Never> = .init([])
    
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items.send(savedItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        var items = items.value
        items.remove(atOffsets: indexSet)
        self.items.send(items)
    }

    func moveItem(from: IndexSet, to: Int) {
        var items = items.value
        items.move(fromOffsets: from, toOffset: to)
        self.items.send(items)
    }
    
    func addItem(title: String, description: String, priority: Int, dueDate: Date) {
        let newItem = ItemModel(title: title, description: description, priority: priority, dueDate: dueDate, isCompleted: false)
        var items = items.value
        items.append(newItem)
        self.items.send(items)
    }
    
    func saveItems() {
        var arrItems = items.value
        if let encodedData = try? JSONEncoder().encode(arrItems) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    func updateItem(item: ItemModel) {
        var arrItems = items.value
        if let index = arrItems.firstIndex(where: { $0.id == item.id }) {
            arrItems[index] = item.updateCompletion()
        }
    }
    
}
