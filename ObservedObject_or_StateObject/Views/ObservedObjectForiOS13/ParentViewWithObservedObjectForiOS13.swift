//
//  ParentViewWithObservedObjectForiOS13.swift
//  ObservedObject_or_StateObject
//
//  Created by hiraoka on 2021/04/04.
//

import SwiftUI

struct ParentViewWithObservedObjectForiOS13: View {
    @State private var background: Color = .random
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
ParentView で データオブジェクトのインスタンスを生成しているパターンです。

デプロイメントターゲットに iOS13 を含める場合は、@StateObject を使用できません。
ChildView でのインスタンスの生成は避け、ParentView で ChildView が必要とするデータオブジェクトを保持するといいでしょう。
ChildView がo再描画された場合でも、ParentView で保持されているデータは初期化されないからです。

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
