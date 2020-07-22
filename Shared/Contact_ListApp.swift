//
//  Contact_ListApp.swift
//  Shared
//
//  Created by Mazharul Huq on 7/22/20.
//

import SwiftUI

@main
struct Contact_ListApp: App {
    @StateObject var store = ContactListStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
