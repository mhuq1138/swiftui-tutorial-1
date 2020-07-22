//
//  ContentView.swift
//  Shared
//
//  Created by Mazharul Huq on 7/22/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: ContactListStore
    
    var body: some View {
        NavigationView{
            List{
                ForEach(0..<store.contacts.count, id:\.self){i in
                    NavigationLink(destination: ContactView(store:store,i:i))
                    {
                        ListRowView(contact: store.contacts[i])
                    }
                }.onDelete { indexSet in store.contacts.remove(atOffsets: indexSet)
                }
            }.navigationTitle("Contact List")
             .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                   EditButton()
                  
               }
                
                 ToolbarItem(placement: .navigationBarTrailing) {
                   NavigationLink(
                       destination: ContactView(store:store,i:-1)){
                           Text("Add")
                   }
                }
             }
        }
    }
}

struct ListRowView: View {
    let contact: Contact
    
    var body: some View {
        HStack{
            Text(contact.name)
            Spacer()
            Text(contact.city)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: ContactListStore())
    }
}
