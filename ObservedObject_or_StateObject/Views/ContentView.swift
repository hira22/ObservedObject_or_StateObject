//
//  ContentView.swift
//  ObservedObject_or_StateObject
//
//  Created by hiraoka on 2021/04/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("ObservedObject", destination: ParentViewWithObservedObject())
                NavigationLink("StateObject", destination: ParentViewWithStateObject())

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
