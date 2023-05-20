//
//  AddView.swift
//  MVVM-SwiftUI-ToDoList
//
//  Created by Çağrı Tuğberk Masat on 15.05.2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var titleTextFieldText: String = ""
    @State var descriptionTextFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State private var selectedPriority = 1
    @State private var dueDate = Date()
    
    var willUpdate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Title: ")
                        .font(.title)
                        .frame(alignment: .leading)
                    
                    TextField("Type title here..", text: $titleTextFieldText)
                        .cornerRadius(10)
                        .font(.headline)
                        .backgroundStyle(.gray)
                        .frame(height: 55)
                }
                
                TextField("Type something here..", text: $descriptionTextFieldText, axis: .vertical)
                    .frame(minHeight: 55)
                    .cornerRadius(10)
                    .lineLimit(2...6)
                    .padding()
                
                Picker(selection: $selectedPriority, label: Text("Priority")) {
                    Text("Low").tag(1)
                    Text("Medium").tag(2)
                    Text("High").tag(3)
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 20)
                
             
                    DatePicker(
                        "Due Date",
                        selection: $dueDate,
                        displayedComponents: [.date]
                    )
                    .padding(.bottom, 20)
                
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor((.white))
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(12)
        }
        
        .navigationTitle((willUpdate ? "Update Item" : "Add an Item"))
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(
                title: titleTextFieldText,
                description: descriptionTextFieldText,
                priority: selectedPriority,
                dueDate: dueDate
            )
            
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if (titleTextFieldText.count != 0) && descriptionTextFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
