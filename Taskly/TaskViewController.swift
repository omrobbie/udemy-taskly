//
//  TaskViewController.swift
//  Taskly
//
//  Created by omrobbie on 17/05/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class TaskViewController: UITableViewController {

    var taskStore = TaskStore()

    override func viewDidLoad() {
        super.viewDidLoad()

        let todoTasks = [
            Task.init(name: "Meditate"),
            Task.init(name: "Buy banana"),
            Task.init(name: "Run a 5K"),
        ]

        let doneTasks = [
            Task.init(name: "Watch NetFlix"),
        ]

        taskStore.tasks = [todoTasks, doneTasks]
    }

    @IBAction func btnAddTaskTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)

        let addAction = UIAlertAction(title: "Add", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        alertController.addTextField { (textField) in
            textField.placeholder = "Enter task name..."
        }

        alertController.addAction(addAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true)
    }
}

extension TaskViewController {

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "To-Do" : "Done"
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 54
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return taskStore.tasks.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore.tasks[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let item = taskStore.tasks[indexPath.section][indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
}
