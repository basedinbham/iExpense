//
//  ContentView.swift
//  iExpense
//
//  Created by Kyle Warren on 8/15/22.
//


//There are several ways of showing views in SwiftUI, and one of the most basic is a sheet: a new view presented on top of our existing one. On iOS this automatically gives us a card-like presentation where the current view slides away into the distance a little and the new view animates in on top.

//Sheets work much like alerts, in that we don’t present them directly with code such as mySheet.present() or similar. Instead, we define the conditions under which a sheet should be shown, and when those conditions become true or false the sheet will either be presented or dismissed respectively.

import SwiftUI

//View we want to display in sheet
struct SecondView: View {
    //to dismiss another view we need another property wrapper – and yes, I realize that so often the solution to a problem in SwiftUI is to use another property wrapper.

    //Anyway, this new one is called @Environment, and it allows us to create properties that store values provided to us externally. Is the user in light mode or dark mode? Have they asked for smaller or larger fonts? What timezone are they on? All these and more are values that come from the environment, and in this instance we’re going to ask the environment to dismiss our view.

    //Yes, we need to ask the environment to dismiss our view, because it might have been presented in any number of different ways. So, we’re effectively saying “hey, figure out how my view was presented, then dismiss it appropriately.”
    @Environment(\.dismiss) var dismiss
    
    //When you create a view like this, you can pass in any parameters it needs to work. For example, we could require that SecondView be sent a name it can display, like this:
    let name: String
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
//        Text("Hello, \(name)")
    }
}

struct ContentView: View {
    //Step 1 - State to track if the sheet is showing or not
    @State private var showingSheet = false
    
    var body: some View {
        // Second - When button is tapped toggle state
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        //Third - we need to attach our sheet somewhere to our view hierarchy. If you remember, we show alerts using isPresented with a two-way binding to our state property, and we use something almost identical here: sheet(isPresented:).
        
        //sheet() is a modifier just like alert(), so please add this modifier to our button now:
        .sheet(isPresented: $showingSheet) {
            //Fourth, we need to decide what should actually be in the sheet. In our case, we already know exactly what we want: we want to create and show an instance of SecondView. In code that means writing SecondView()
            SecondView(name: "kyle")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
