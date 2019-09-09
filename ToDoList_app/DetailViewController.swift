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
        var it = ToDoItemDatabase.getInstance().itemToEdit!
        it.itemName = lblTask.text!
        it.switchState = switchIsDone.isOn
        navigationController?.popViewController(animated: true)
        
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        let it: ToDoItem = (ToDoItemDatabase.getInstance().itemToEdit)!
        
        lblTask.text = it.itemName
        switchIsDone.setOn(false, animated: true)
        
        if it.switchState == true {
            switchIsDone.setOn(true, animated: true)
        }
    }
}
