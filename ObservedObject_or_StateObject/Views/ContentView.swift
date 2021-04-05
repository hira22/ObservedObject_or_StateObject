//
//  ContentView.swift
//  ObservedObject_or_StateObject
//
//  Created by hiraoka on 2021/04/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var environmentProjectData: ProjectData = .init()

    var body: some View {
        NavigationView {
            List {
                NavigationLink("ObservedObject(It doesn't work as expected)", destination: ParentViewWithObservedObject())
                NavigationLink("StateObject", destination: ParentViewWithStateObject())
                NavigationLink("EnvironmentObject",
                               destination: ParentViewWithEnvironmentObject()
                                .environmentObject(environmentProjectData))
                NavigationLink("ObservedObject for iOS13", destination: ParentViewWithObservedObjectForiOS13())

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
