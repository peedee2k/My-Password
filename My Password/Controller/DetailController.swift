//
//  DetailController.swift
//  My Password
//
//  Created by Pankaj Sharma on 7/31/18.
//  Copyright © 2018 Pankaj Sharma. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var acNumLbl: CustomeLabels!
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBOutlet weak var passwordLbl: UILabel!
    
    @IBOutlet weak var phoneNumLbl: UILabel!
    
    @IBOutlet weak var urlLbl: UILabel!
    
    @IBOutlet weak var noteViewLbl: UILabel!
    
    var selectedAccount: Account? {
        didSet {
            
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        
    }
    // MARK: - Setup Labels
    
    func setupLabels() {
        guard let label = selectedAccount?.accountTitle else { return }
        navigationItem.title = label
        guard let acNum = selectedAccount?.accountNumber else { return }
        acNumLbl.text = acNum
        guard let user = selectedAccount?.userName else { return }
        userNameLbl.text = user
//        guard let password = selectedAccount?.password else { return }
        passwordLbl.text = "**********"
        guard let url = selectedAccount?.url else { return }
        urlLbl.text = url
        guard let note = selectedAccount?.note else { return }
        noteViewLbl.text = note

        
        
        
    }
}
