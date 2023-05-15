//
//  ListView.swift
//  MVVM-SwiftUI-ToDoList
//
//  Created by Çağrı Tuğberk Masat on 15.05.2023.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "First title", isCompleted: false),
        ItemModel(title: "Second title", isCompleted: true)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: deleteItem)
            .onMove(perform: onMove)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func onMove(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
