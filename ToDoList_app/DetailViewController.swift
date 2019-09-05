//
//  DetailViewController.swift
//  ToDoList_app
//
//  Created by Video on 9/5/19.
//

import Foundation
import UIKit

public class DetailViewController: UIViewController {
    @IBOutlet weak var lblTask: UITextField!
    @IBOutlet weak var switchIsDone: UISwitch!
    
    
    @IBAction func btnFinished(_ sender: Any) {
        ToDoItemDatabase.getInstance().itemToEdit!.itemName = lblTask.text!
        navigationController?.popViewController(animated: true)
        
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        let it: ToDoItem = (ToDoItemDatabase.getInstance().itemToEdit)!
        
        lblTask.text = it.itemName
        switchIsDone.setOn(false, animated: true)
    }
}
