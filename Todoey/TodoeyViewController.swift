//
//  ViewController.swift
//  Todoey
//
//  Created by Nebojsa Nadj on 1/10/19.
//  Copyright © 2019 Nebojsa Nadj. All rights reserved.
//

import UIKit
import SnapKit

class TodoeyViewController: UITableViewController  {
        var itemArray = ["byach", "fish", "monkey", "Donkey", "crazyFart"]
        let toDoeyId = "toDoeyId"
        let defaults = UserDefaults.standard

    var selectedIndexPaths = [IndexPath]()
    override func viewDidLoad() {
    super.viewDidLoad()
        navigationItem.title = "Todoey"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: toDoeyId)
        if let items = defaults.array(forKey: "itemArray") as? [String] {
            itemArray = items
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoeyId", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        cell.accessoryType = selectedIndexPaths.contains(indexPath) ? .checkmark : .none
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let index = selectedIndexPaths.lastIndex(where: {$0 == indexPath}) {
           selectedIndexPaths.remove(at: index)
        } else {
            selectedIndexPaths.append(indexPath)
        }
        tableView.reloadData()
    }
    @objc func addTapped() {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new Todoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
        alertTextField.placeholder = "Create new item"
        textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        print("addTapped")
    }

}

