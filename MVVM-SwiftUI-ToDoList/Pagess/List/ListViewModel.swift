//
//  ListViewModel.swift
//  MVVM-SwiftUI-ToDoList
//
//  Created by Çağrı Tuğberk Masat on 15.05.2023.
//

import Foundation
import Combine



extension DateFormatter {
    static let current: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}

struct ListItemPresentation: Identifiable {
    let id: UUID = .init()
    let itemId: String
    let title: String
    let description: String
    let priorityText: String
    let dueDateText: String
    let isCompleted: Bool
    
    init(model: ItemModel) {
        self.itemId = model.id
        self.title = model.title
        self.description = model.description
        self.priorityText = model.priority.title
        self.dueDateText = DateFormatter.current.string(from: model.dueDate)
        self.isCompleted = model.isCompleted
    }
}

class ListViewModel: ObservableObject {
    private let dataController: ListDataController
    
    @Published var presentations: [ListItemPresentation] = []

    private var cancellables = Set<AnyCancellable>()
    
    init(dataController: ListDataController) {
        self.dataController = dataController
        addListeners()
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
    
    private func addListeners() {
        dataController
            .items
            .receive(on: DispatchQueue.main)
            .sink { [weak self] items in
                guard let self else {
                    return
                }
                self.presentations = items
                    .map { .init(model: $0) }
            }
            .store(in: &cancellables)
        
    }
    
    func initialize() {
        dataController.getItems()
    }
    
    func itemTapped(_ presentation: ListItemPresentation) {
        // Bu fonksiyon girdiğinde view update ekranına gitmeli 
    }
    
    func deleteItem(indexSet: IndexSet) {
        dataController.deleteItem(indexSet: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
      
    }
    
    func addItem(title: String, description: String, priority: Int, dueDate: Date) {
       
    }
    
    func updateItem(item: ItemModel) {
       
    }
    
    func updateCheckIcon(item: ItemModel) {
//        if let index = items.firstIndex(where: { $0.id == item.id }) {
//            items[index] = item.updateCheckItemCompletion()
//        }
    }
    
    func saveItems() {
      
    }
    
    
    
}
