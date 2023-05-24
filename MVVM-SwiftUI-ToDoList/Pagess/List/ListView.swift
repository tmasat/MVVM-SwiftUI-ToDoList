//
//  ListView.swift
//  MVVM-SwiftUI-ToDoList
//
//  Created by Çağrı Tuğberk Masat on 15.05.2023.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.presentations) { item in
                ListRowView(item: item, viewModel: listViewModel)
            }
        }
//        List {
//            ForEach(listViewModel.presentations) { item in
//                ListRowView(item: item)
//                    .onTapGesture {
//                        withAnimation(.linear) {
//                            listViewModel.updateCheckIcon(item: item)
//                        }
//                    }
//            }
//            .onDelete(perform: listViewModel.deleteItem)
//            .onMove(perform: listViewModel.moveItem)
        
        .onAppear {
            listViewModel.initialize()
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

// NavigationLink("", destination: AddView(item: self.item), isActive: $cellIsTapped)

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ListView()
//        }
//        .environmentObject(ListViewModel())
//    }
//}
