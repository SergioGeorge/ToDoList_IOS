//
//  WelcomeViewController.swift
//  ToDoList_app
//
//  Created by Video on 8/29/19.
//

import Foundation
import UIKit

class WelcomeViewController:UIViewController, NSURLConnectionDelegate, NSURLConnectionDataDelegate{
    
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblClass: UILabel!
    
    var data: NSMutableData = NSMutableData();
    
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
        startConn()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//Esto 'UIStoryboardSegue' es la linea que conecta otras pantallas
        
        
        print(segue)
        print(segue.destination)
        var destination: ListTableViewController = (segue.destination) as! ListTableViewController
        
          destination.message = "dsfsdfdsfsdfdsf"
        
    }
    /**************/
    func startConn() {
        let urlPath:String = "https://raw.githubusercontent.com/joekreatera/apptogo/master/todolist.json"
        var url: NSURL = NSURL(string: urlPath)!
        var request: NSURLRequest = NSURLRequest(url: url as URL)
        var connection: NSURLConnection = NSURLConnection(request: request as URLRequest, delegate: self, startImmediately: false)!
        print("starting")
        connection.start()
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print(error)
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        print("Trying \(data)")
        self.data.append(data)
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        do {
            let json:NSDictionary = try JSONSerialization.jsonObject(with: self.data as Data, options: .mutableContainers) as! NSDictionary
            
            print(json)
            var dt:NSArray = json["todoListData"] as! NSArray
            print(dt[0])
            print(dt[1])
            print(dt[2])
            
        }catch{
            print("no can do")
        }
    }
    
}
