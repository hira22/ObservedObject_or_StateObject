//
//  ParentViewWithStateObject.swift
//  ObservedObject_or_StateObject
//
//  Created by hiraoka on 2021/04/03.
//

import SwiftUI

struct ParentViewWithStateObject: View {
    @State private var background: Color = .random
    
    private let filename = (#file as NSString).lastPathComponent
    
    init() {
        print("init: \(filename)")
    }
    
    var body: some View {
        ZStack {
            
            background
            
            VStack(spacing: 32.0) {
                Text("\((#file as NSString).lastPathComponent)").font(.headline)
                
                Button(action: changeColor) {
                    Text("Change background color").padding()
                }
                .background(Capsule().foregroundColor(.accentColor))
                
                ChildViewWithStateObject()
                    .background(RoundedRectangle(cornerRadius: 16.0).foregroundColor(.secondary))
                
                
                Text("""
ChildView で @StateObject を使用し、データオブジェクトのインスタンスを生成しているパターンです。

ChildView で値の更新を行なった後に、背景色を変更してみましょう。

ChildViewの値が保持されています。

@StateObject は View ではなく、SwiftUI によって管理されます。onAppear から onDisappear の間、値は保持されます。

Xcode のコンソール の onAppear と onDisappear のログを確認しながら、動かしてみましょう。
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

struct ParentViewWithStateObject_Previews: PreviewProvider {
    static var previews: some View {
        ParentViewWithStateObject()
    }
}
