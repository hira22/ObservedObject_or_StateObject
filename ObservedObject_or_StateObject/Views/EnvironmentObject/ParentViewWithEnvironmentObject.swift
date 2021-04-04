//
//  ParentViewWithEnvironmentObject.swift
//  ObservedObject_or_StateObject
//
//  Created by hiraoka on 2021/04/04.
//

import SwiftUI

struct ParentViewWithEnvironmentObject: View {
    @State var background: Color = .orange

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

                ChildViewWithEnvironmentObject()
                    .background(RoundedRectangle(cornerRadius: 16.0).foregroundColor(.secondary))


                Text("""
ChildView で @EnvironmentObject を使用するパターンです。
データオブジェクトのインスタンス生成は ParentView を呼び出す View で行なっています。

@EnvironmentObject を使うことで、iOS 13 でも Single source of truth を実現できます。
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

struct ParentViewWithEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        ParentViewWithEnvironmentObject()
    }
}
