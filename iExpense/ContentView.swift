//
//  ContentView.swift
//  iExpense
//
//  Created by Kyle Warren on 8/15/22.
//

import SwiftUI

struct ContentView: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    //Now, I mentioned that SwiftUI provides an @AppStorage property wrapper around UserDefaults, and in simple situations like this one it’s really helpful. What it does is let us effectively ignore UserDefaults entirely, and just use @AppStorage rather than @State, like this:
    
    //Our access to the UserDefaults system is through the @AppStorage property wrapper. This works like @State: when the value changes, it will reinvoked the body property so our UI reflects the new data.
    //We attach a string name, which is the UserDefaults key where we want to store the data. I’ve used “tapCount”, but it can be anything at all – it doesn’t need to match the property name.
    //The rest of the property is declared as normal, including providing a default value of 0. That will be used if there is existing value saved inside UserDefaults.

    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
            //We need to use UserDefaults.standard. This is the built-in instance of UserDefaults that is attached to our app, but in more advanced apps you can create your own instances. For example, if you want to share defaults across several app extensions you might create your own UserDefaults instance.
            //There is a single set() method that accepts any kind of data – integers, Booleans, strings, and more.
            //We attach a string name to this data, in our case it’s the key “Tap”. This key is case-sensitive, just like regular Swift strings, and it’s important – we need to use the same key to read the data back out of UserDefaults.
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
