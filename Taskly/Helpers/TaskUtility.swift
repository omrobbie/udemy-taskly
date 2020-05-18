//
//  TaskUtility.swift
//  Taskly
//
//  Created by omrobbie on 18/05/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class TaskUtility {

    private static let key = "tasks"

    private static func archive(_ tasks: [[Task]]) -> Data {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false)
            return data
        } catch {
            fatalError("Can't encode archive data: \(error)")
        }
    }

    static func fetch() -> [[Task]]? {
        guard let unarchivedData = UserDefaults.standard.object(forKey: key) as? Data else {return nil}
        do {
            let data = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(unarchivedData) as? [[Task]]
            return data
        } catch {
            fatalError("Can't encode fetch data: \(error)")
        }
    }

    static func save(_ tasks: [[Task]]) {
        let archiveTasks = archive(tasks)

        UserDefaults.standard.set(archiveTasks, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
