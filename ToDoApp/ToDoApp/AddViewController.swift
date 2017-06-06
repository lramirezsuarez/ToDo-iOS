//
//  AddViewController.swift
//  ToDoApp
//
//  Created by Luis Ramirez on 6/5/17.
//  Copyright © 2017 Lucho. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var taskTextField: UITextField!
    
    var todoArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let todoObject = UserDefaults.standard.object(forKey: "todoList") as? [String] else {
            return
        }
        
        todoArray = todoObject
    }

    @IBAction func didAddTask(_ sender: Any) {
        
        if (taskTextField.text != "") {
            todoArray.append(taskTextField.text!)
            taskTextField.text = ""
        } else {
            let alert = UIAlertController(title: "Danger!", message: "You can't add an empty task", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        UserDefaults.standard.set(todoArray, forKey: "todoList")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
