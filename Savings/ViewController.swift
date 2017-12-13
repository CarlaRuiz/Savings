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
        let transaction = Transaction(name: "Tesla", amount: 200000)
        transactions.append(transaction)
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) 
        -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = transactions[indexPath.row].name
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
