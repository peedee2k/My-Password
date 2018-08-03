//
//  ViewController.swift
//  My Password
//
//  Created by Pankaj Sharma on 7/28/18.
//  Copyright © 2018 Pankaj Sharma. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    var accounts = [Account]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.red
        navigationController?.navigationBar.barTintColor = UIColor.yellow
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.title = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "My Password"
    }
    


}
extension HomeController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return accounts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = accounts[indexPath.row].accountTitle
            //
        cell.textLabel?.textColor = UIColor.red
        cell.tintColor = UIColor.red
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == MyKeys.toNewVC {
            let destinationVC = segue.destination as! NewACController
            destinationVC.delegate = self
        }
        
        if segue.identifier == MyKeys.toDetailVC {
            let destinationVC = segue.destination as! DetailController
            if let indexPath = myTableView.indexPathForSelectedRow {
              destinationVC.selectedAccount = accounts[indexPath.row]
            }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = accounts[indexPath.row].accountTitle
        performSegue(withIdentifier: MyKeys.toDetailVC, sender: cell)
        
    }
    
}
extension HomeController: AccountDetail {
    func addAccountDetail(Ac detail: Account) {
        accounts.append(detail)
       
        myTableView.reloadData()
        
    }
}

