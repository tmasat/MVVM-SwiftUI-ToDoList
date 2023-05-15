//
//  ListRowView.swift
//  MVVM-SwiftUI-ToDoList
//
//  Created by Çağrı Tuğberk Masat on 15.05.2023.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text("First Item")
            Spacer()
        }
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "First title")
    }
}
