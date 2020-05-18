//
//  SceneDelegate.swift
//  Taskly
//
//  Created by omrobbie on 17/05/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        let taskController = window?.rootViewController?.children.first as? TaskViewController
        taskController?.taskStore = TaskStore()
    }

    func getDummyData() -> TaskStore {
        let todoTasks = [
            Task.init(name: "Meditate"),
            Task.init(name: "Buy banana"),
            Task.init(name: "Run a 5K"),
        ]

        let doneTasks = [
            Task.init(name: "Watch NetFlix"),
        ]

        let taskStore = TaskStore()
        taskStore.tasks = [todoTasks, doneTasks]

        return taskStore
    }
}
