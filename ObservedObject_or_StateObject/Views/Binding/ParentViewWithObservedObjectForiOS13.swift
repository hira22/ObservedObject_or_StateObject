//
//  ParentViewWithObservedObjectForiOS13.swift
//  ObservedObject_or_StateObject
//
//  Created by hiraoka on 2021/04/04.
//

import SwiftUI

struct ParentViewWithObservedObjectForiOS13: View {
    @State var background: Color = .orange
    @ObservedObject var projectData: ProjectData = .init()

    private let filename = (#file as NSString).lastPathComponent

    init() {
        print("init: \(filename)")
    }

    var body: some View {
        ZStack {

            background

            VStack(spacing: 32.0) {
                Text(filename).font(.headline)

                Button(action: changeColor) {
                    Text("Change background color").padding()
                }
                .background(Capsule().foregroundColor(.accentColor))

                ChildViewWithObservedObjectForiOS13(projectData: projectData)
                    .background(RoundedRectangle(cornerRadius: 16.0).foregroundColor(.secondary))


                Text("""
よくわからない
""")
            }
            .font(.subheadline)
            .foregroundColor(.white)
            .padding()

        }
        .ignoresSafeArea()
        .onAppear {
            print("onAppear: \(filename)")
        }
        .onDisappear {
            print("onDisappear: \(filename)")
        }
    }

    private func changeColor() {
        background = .random
    }
}

struct ParentViewWithBinding_Previews: PreviewProvider {
    static var previews: some View {
        ParentViewWithObservedObjectForiOS13()
    }
}