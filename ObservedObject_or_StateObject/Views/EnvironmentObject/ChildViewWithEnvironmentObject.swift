//
//  ChildViewWithEnvironmentObject.swift
//  ObservedObject_or_StateObject
//
//  Created by hiraoka on 2021/04/04.
//

import SwiftUI

struct ChildViewWithEnvironmentObject: View {
    @EnvironmentObject private var data: ProjectData

    private let filename = (#file as NSString).lastPathComponent

    init() {
        print("init: \(filename)")
    }

    var body: some View {
        VStack(spacing: 8.0) {

            Text(filename).font(.headline)

            Text("stringValue: \(data.stringValue)")

            TextField("stringValue", text: $data.stringValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)

            Text("intValue: \(data.intValue)")

            Button(action: data.countUp) {
                Text("Count up").padding()
            }
            .background(Capsule().foregroundColor(.accentColor))

        }
        .padding()
        .onAppear {
            print("onAppear: \(filename)")
        }
        .onDisappear {
            print("onDisappear: \(filename)")
        }
    }
}

struct ChildViewWithEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        ChildViewWithEnvironmentObject()
    }
}
