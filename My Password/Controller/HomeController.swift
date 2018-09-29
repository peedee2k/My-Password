//
//  ViewController.swift
//  My Password
//
//  Created by Pankaj Sharma on 7/28/18.
//  Copyright © 2018 Pankaj Sharma. All rights reserved.
//

import UIKit
import RealmSwift

class HomeController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet weak var myTableView: UITableView!
    var accounts: Results<Account>?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.red
        navigationController?.navigationBar.barTintColor = UIColor.yellow
      //  navigationItem.leftBarButtonItem = UIBarButtonItem(title: "SignOut", style: .plain, target: self, action: #selector(showEditing))
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.title = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "My Password"
        showAccounts()
    }
    
    
    @IBAction func signOutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func showEditing() {
        dismiss(animated: true, completion: nil)
        
//        myTableView.setEditing(myTableView.isEditing, animated: true)
//        if myTableView.isEditing == true {
//            myTableView.isEditing = false
//            navigationItem.leftBarButtonItem?.title = "Edit"
//        } else {
//            myTableView.isEditing = true
//            navigationItem.leftBarButtonItem?.title = "Done"
//        }
    }
    // MARK: - Read data from Realm Object
    func showAccounts() {
        accounts = realm.objects(Account.self)
        myTableView.reloadData()
    }


}
extension HomeController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return accounts?.count ?? 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = accounts?[indexPath.row].accountTitle
            //
        cell.textLabel?.textColor = UIColor.red
        cell.tintColor = UIColor.red
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == MyKeys.toNewVC {
//            let destinationVC = segue.destination as! NewACController
//          //  destinationVC.delegate = self
//        }
        
        if segue.identifier == MyKeys.toDetailVC {
            let destinationVC = segue.destination as! DetailController
            if let indexPath = myTableView.indexPathForSelectedRow {
              destinationVC.selectedAccount = accounts?[indexPath.row]
            }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = accounts?[indexPath.row].accountTitle
        performSegue(withIdentifier: MyKeys.toDetailVC, sender: cell)
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let ac = accounts?[indexPath.row] else { return }
            confirmToDeleteCell(cell: ac)
//
//       // confirmToDeleteCell(cell: ac)
//            do {
//                try realm.write {
//                    realm.delete(ac)
//
//                }
//
//            } catch {
//                print("Error while deleteing object: \(error)")
//            }
//
            //myTableView.reloadData()
        }
    }
    func  confirmToDeleteCell(cell: Account) {
        let alert = UIAlertController(title: "Delete Account", message: "Do you want to to delete this account ?", preferredStyle: .alert)
        
        let actionYes = UIAlertAction(title: "Yes", style: .default) { (showAlert) in
            do {
                try self.realm.write {
                    self.realm.delete(cell)
                    
                }
                
            } catch {
                print("Error while deleteing object: \(error)")
            }
            self.myTableView.reloadData()
        }
        let actionNo = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        
        present(alert, animated: true, completion: nil)
    }
    
    
}
//extension HomeController: AccountDetail {
//    func addAccountDetail(Ac detail: Account) {
//        
//       // accounts.append(detail)
//       showAccounts()
//        myTableView.reloadData()
//        
//    }
//    
//}

