//
//  Model.swift
//  UIKit-HW5-1
//
//  Created by Дима on 11/27/24.
//

import Foundation
enum ObjectType {
    case user, group
}
struct Object {
    let type: ObjectType
    let name: String
    let description: String?
    let image: String
    
    static func mockData() -> [Object] {
        [
            Object(type: .user, name: "Elizabeth", description: nil, image: "Elizabeth"),
            Object(type: .user, name: "Lilia", description: nil, image: "Lilia"),
            Object(type: .user, name: "Alexander", description: nil, image: "Alexander"),
            Object(type: .user, name: "Julia", description: nil, image: "Julia"),
            Object(type: .group, name: "Family", description: "2 members", image: "Family"),
            Object(type: .group, name: "Personal", description: "4 members", image: "Personal"),
            Object(type: .group, name: "Church", description: "10 members", image: "Church"),
            Object(type: .group, name: "University", description: "3 members", image: "University"),
        ]
    }
}
