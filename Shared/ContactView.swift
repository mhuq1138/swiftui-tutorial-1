//
//  ContactView.swift
//  Contact List
//
//  Created by Mazharul Huq on 7/22/20.
//

import SwiftUI

struct ContactView: View {
    @ObservedObject var store: ContactListStore
    @Environment(\.presentationMode) var presentationMode
    let i:Int
    @State var name = ""
    @State var street = ""
    @State var city = ""
    @State var state = ""
    @State var zip = ""
    @State var email = ""
    
    var body: some View {
        Form{
            ContactItem(label: "Name:", item: $name)
            ContactItem(label: "Street:", item: $street)
            ContactItem(label: "City:", item: $city)
            ContactItem(label: "State:", item: $state)
            ContactItem(label: "Zip:", item: $zip)
            ContactItem(label: "Email:", item: $email)
            Button(action: {
                self.save()
            }){
                Text("Save")
            }
        }.navigationTitle(i < 0 ? "Add New Contact": "Edit Contact")
         .onAppear(){
            fillEnry()
         }
    }
    
    func fillEnry(){
        if i > -1{
        name = store.contacts[i].name
        street = store.contacts[i].street
        city = store.contacts[i].city
        state = store.contacts[i].state
        zip = store.contacts[i].zipCode
        email = store.contacts[i].email
        }
    }
    
    func resetFields(){
        store.contacts[i].name = name
        store.contacts[i].street = street
        store.contacts[i].city = city
        store.contacts[i].state = state
        store.contacts[i].zipCode = zip
        store.contacts[i].email = email
    }
    
    func save(){
        if i == -1{
            let contact = Contact(name: name, street: street, city: city, state: state, zipCode: zip, email: email)
            store.contacts.append(contact)
        }
        else{
           resetFields()
        }
        presentationMode.wrappedValue.dismiss()
    }
}

struct ContactItem: View {
    let label:String
    @Binding var item: String
     var body: some View {
        HStack{
            Text(label)
                .frame(width: 100, alignment: .leading)
            TextField(label, text: $item)
               .textFieldStyle(RoundedBorderTextFieldStyle())
        }.font(.title)
    }
}



