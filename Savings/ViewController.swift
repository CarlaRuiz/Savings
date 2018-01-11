//
//  ViewController.swift
//  Savings
//
//  Created by Carla Ruiz on 12/13/17.
//  Copyright © 2017 Carla Ruiz. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var transactions: [Transaction] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func add(_ sender: Any) {
        
        
        // pop up alrt
        let alert = UIAlertController(title: "New Item", message: "Add Savings Item", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { (textfield) in
            textfield.placeholder = "name"
        }
        alert.addTextField(configurationHandler: ({ (textfield) in
            textfield.placeholder = "amount"
        }))
        alert.addAction(UIAlertAction(title: "Save", style: UIAlertActionStyle.default, handler: { action in
            let name = alert.textFields![0].text
            let amountString = alert.textFields![1].text
            let transaction = Transaction(name: name!, amount: Int(amountString!)!)
            self.transactions.append(transaction)
            self.tableView.reloadData()

        }))
        alert.addAction(UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel, handler: nil))

        present(alert, animated: true, completion: nil)
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) 
        -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = transactions[indexPath.row].name
            cell.detailTextLabel?.text = "\(transactions[indexPath.row].amount)"
        return cell
    }
}
class Transaction: NSObject {
    var name: String
    var amount: Int
    
    init(name:String, amount:Int){
        self.name = name
        self.amount = amount
        super.init()
        
    }
}
