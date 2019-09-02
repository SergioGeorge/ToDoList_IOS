//
//  WelcomeViewController.swift
//  ToDoList_app
//
//  Created by Video on 8/29/19.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblClass: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var dummyVar = "Sergio"
        var nameOfClass = "Apps Moviles"
        
        var itemsDatabase: ToDoItemDatabase = ToDoItemDatabase.getInstance()
        
        //print(itemsDatabase)
        itemsDatabase.appendItem(it:ToDoItem(name: "Do Homework"))
        print("\(itemsDatabase.description)  :)")
        itemsDatabase.appendItem(it: ToDoItem(name: "Go to movies"))
        print(itemsDatabase.description)
        
        lblUser.text = dummyVar
        lblClass.text = nameOfClass
        //print("Hola: \(dummyVar)")//n string, c string
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//Esto 'UIStoryboardSegue' es la linea que conecta otras pantallas
        
        
        print(segue)
        print(segue.destination)
        var destination: ListTableViewController = (segue.destination) as! ListTableViewController
        
          destination.message = "dsfsdfdsfsdfdsf"
        
    }
    
}
