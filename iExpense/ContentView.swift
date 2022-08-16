//
//  ContentView.swift
//  iExpense
//
//  Created by Kyle Warren on 8/15/22.
//

import SwiftUI

//Swift will automatically generate some code for us that will archive and unarchive User instances for us as needed, but we still need to tell Swift when to archive and what to do with the data.
struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
