//
//  ChildViewWithStateObject.swift
//  ObservedObject_or_StateObject
//
//  Created by hiraoka on 2021/04/03.
//

import SwiftUI

struct ChildViewWithStateObject: View {
    @StateObject var data: ProjectData = .init()
    
    private let filename = (#file as NSString).lastPathComponent
    
    init() {
        print("init: \(filename)")
    }
    
    var body: some View {
        VStack(spacing: 8.0) {
            
            Text("\((#file as NSString).lastPathComponent)").font(.headline)
            
            TextField("data.stringValue", text: $data.stringValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
            
            Text("data.stringValue: \(data.intValue)")
            
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

struct ChildViewWithStateObject_Previews: PreviewProvider {
    static var previews: some View {
        ChildViewWithStateObject()
    }
}
