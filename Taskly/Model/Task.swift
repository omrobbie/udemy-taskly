//
//  Task.swift
//  Taskly
//
//  Created by omrobbie on 17/05/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

class Task {
    var name: String
    var isDone: Bool

    init(name: String, isDone: Bool = false) {
        self.name = name
        self.isDone = isDone
    }
}
