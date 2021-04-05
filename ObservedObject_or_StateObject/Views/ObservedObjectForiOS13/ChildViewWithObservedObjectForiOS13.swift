//
//  ChildViewWithObservedObjectForiOS13.swift
//  ObservedObject_or_StateObject
//
//  Created by hiraoka on 2021/04/04.
//

import SwiftUI

struct ChildViewWithObservedObjectForiOS13: View {
    @ObservedObject var projectData: ProjectData

    private let filename = (#file as NSString).lastPathComponent

    init(projectData: ProjectData) {
        self.projectData = projectData
        print("init: \(filename)")
    }

    var body: some View {
        VStack(spacing: 8.0) {

            Text(filename).font(.headline)

            Text("stringValue: \(projectData.stringValue)")

            TextField("stringValue", text: $projectData.stringValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)

            Text("intValue: \(projectData.intValue)")

            Button(action: projectData.countUp) {
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

struct ChildViewWithObservedObjectForiOS13_Previews: PreviewProvider {
    static var previews: some View {
        ChildViewWithObservedObjectForiOS13(projectData: ProjectData())
    }
}
