//
//  ParentViewWithObservedObject.swift
//  ObservedObject_or_StateObject
//
//  Created by hiraoka on 2021/04/03.
//

import SwiftUI

struct ParentViewWithObservedObject: View {
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

                ChildViewWithObservedObject()
                    .background(RoundedRectangle(cornerRadius: 16.0).foregroundColor(.secondary))


                Text("""
ChildView で @ObservedObject を使用し、データオブジェクトのインスタンスを生成しているパターンです。

ChildView で値の更新を行なった後に、背景色を変更してみましょう。

ChildViewの値がクリアされます。
（値が残っているように見えることもありますが、改めて値を変更しようとするとリセットされます。）

ParentView の @State が更新され、ParentView が再描画されるときに ChildView も再描画がされます。
@ObservedObject は View のライフサイクルに紐づいているためです。

Xcode のコンソール の init のログを確認しながら、動かしてみましょう。
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

struct ParentViewWithObservedObject_Previews: PreviewProvider {
    static var previews: some View {
        ParentViewWithObservedObject()
    }
}
