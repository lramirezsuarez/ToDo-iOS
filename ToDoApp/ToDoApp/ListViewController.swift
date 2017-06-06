//
//  ListViewController.swift
//  ToDoApp
//
//  Created by Luis Ramirez on 6/5/17.
//  Copyright © 2017 Lucho. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var todoTableView: UITableView!
    var todoArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "task")
        
        cell.textLabel?.text = todoArray[indexPath.row]
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let todoObject = UserDefaults.standard.array(forKey: "todoList") as? [String] else {
            return
        }
        
        todoArray = todoObject
        
        todoTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            todoArray.remove(at: indexPath.row)
            todoTableView.deleteRows(at: [indexPath], with: .automatic)
            UserDefaults.standard.set(todoArray, forKey: "todoList")
            todoTableView.reloadData()
        }
    }
}
