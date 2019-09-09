//
//  AddTaskViewController.swift
//  ToDoList_app
//
//  Created by Video on 9/9/19.
//

import Foundation
import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var lbl_task: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnAdd_action(_ sender: Any) {
        var newItem: ToDoItem = ToDoItem(name: lbl_task.text!)//ponemos ! para indicar que nos importa poco si hay datos o no en text
        ToDoItemDatabase.getInstance().appendItem(it: newItem)
        navigationController?.popViewController(animated: true)
    }
}
