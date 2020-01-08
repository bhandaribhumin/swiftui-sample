//
//  ContentView.swift
//  swiftui-sample
//
//  Created by Mike Hartington on 12/19/19.
//  Copyright © 2019 Mike Hartington. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // Declare this state variable below
    @State private var show_modal: Bool = false

    var body: some View {
        NavigationView {
            Button(action: {
                print("Button Pushed")
                self.show_modal = true
            }) {
                Text("Show Modal")
            }.sheet(isPresented: self.$show_modal) {
                 ModalView()
                }
                .navigationBarTitle(Text("World"), displayMode: .inline)

        }
        }
    }

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        // 2. Embed Text in a VStack
        VStack {
            // 3. Add a button with the following action
            Button(action: {
                print("dismisses form")
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }.padding(.bottom, 50)
            Text("This is a modal")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
