//
//  MVVM_SwiftUI_ToDoListApp.swift
//  MVVM-SwiftUI-ToDoList
//
//  Created by Çağrı Tuğberk Masat on 15.05.2023.
//

import SwiftUI

@main
struct MVVM_SwiftUI_ToDoListApp: App {
    private let listView: ListView = {
        let dataController = ListDataController()
        let viewModel = ListViewModel(dataController: dataController)
        let view = ListView(listViewModel: viewModel)
        return view
    }()
    

    var body: some Scene {
        WindowGroup {
            NavigationView {
                listView
            }
           // .environmentObject(listViewModel)
        }
    }
}
