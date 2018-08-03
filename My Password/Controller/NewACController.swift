//
//  ACDetailController.swift
//  My Password
//
//  Created by Pankaj Sharma on 7/28/18.
//  Copyright © 2018 Pankaj Sharma. All rights reserved.
//

import UIKit

protocol AccountDetail {
    func addAccountDetail(Ac detail: Account)
}

class NewACController: UIViewController {
    
    var delegate: AccountDetail? = nil
    
    @IBOutlet weak var saveButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var acTitleField: UITextField!
    
    @IBOutlet weak var acNumField: UITextField!
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var phoneNumField: UITextField!
    
    @IBOutlet weak var urlField: UITextField!
    
    @IBOutlet weak var noteView: UITextView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        acTitleField.delegate = self
        navigationItem.rightBarButtonItem?.isEnabled = false
        navigationItem.title = "Add new account" 
//        navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "111", style: .plain, target: self, action: #selector(savetapped))
    
    }
    
    
//    @objc func savetapped() {
//        dismiss(animated: true, completion: nil)
//    }
    
    
    
    
    @IBAction func SaveFromNavBarTapped(_ sender: Any) {
        addAccountDetails()
        // view.backgroundColor = UIColor.cyan
        dismiss(animated: true, completion: nil)
    }
    func addAccountDetails() {
        
        if acTitleField.text != nil {
            let ac = Account(accountTitle: acTitleField.text!,accountNumber: acNumField.text!, userName: userNameField.text!, password: passwordField.text!, phoneNumber: phoneNumField.text!, url: urlField.text!, note: noteView.text!)
                
            delegate?.addAccountDetail(Ac: ac)
            emptyAlTExtField()
            navigationItem.rightBarButtonItem?.isEnabled = false
        } else {
            
        }
    }
    
    
    func emptyAlTExtField() {
        acTitleField.text = nil
        acNumField.text = nil
        userNameField.text = nil
        passwordField.text = nil
        phoneNumField.text = nil
        urlField.text = nil
        noteView.text = nil
    }
    
    
}
extension NewACController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
      
        if acTitleField.text != nil  {
            navigationItem.rightBarButtonItem?.isEnabled = true
        }

    }
}
