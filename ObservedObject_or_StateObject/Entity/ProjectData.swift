//
//  ProjectData.swift
//  ObservedObject_or_StateObject
//
//  Created by hiraoka on 2021/04/03.
//

import SwiftUI

class ProjectData: ObservableObject {

    @Published var stringValue: String = ""
    @Published var intValue: Int = 0

    func countUp() {
        intValue += 1
    }

}

extension ProjectData: Equatable {
    static func == (lhs: ProjectData, rhs: ProjectData) -> Bool {
        lhs.stringValue == rhs.stringValue && lhs.stringValue == rhs.stringValue
    }
}
