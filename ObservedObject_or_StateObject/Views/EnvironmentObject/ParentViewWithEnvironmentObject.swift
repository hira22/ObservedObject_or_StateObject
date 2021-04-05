//
//  ParentViewWithEnvironmentObject.swift
//  ObservedObject_or_StateObject
//
//  Created by hiraoka on 2021/04/04.
//

import SwiftUI

struct ParentViewWithEnvironmentObject: View {
    @State private var background: Color = .random

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
データオブジェクトのインスタンス生成は ParentView を呼び出す ContentView で行なっています。

@EnvironmentObject を使うことで、iOS 13 でも Single source of truth を実現できます。

.environmentObject() を使用して、データオブジェクトを設定する箇所は ParentView でも可能です。
ContentView で設定するか ParentView で設定するかは状況によって変わるでしょう。
今回は、以下の2点を考慮して、ContentView で設定しています。
- ParentView では使用されないデータのため
- このアプリのルートとなる ContentView でデータを保持することで、他の View と共有する場合でも、.environmentObject() を付与するだけで変更できるため。

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
