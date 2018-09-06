//
//  Account.swift
//  My Password
//
//  Created by Pankaj Sharma on 7/28/18.
//  Copyright © 2018 Pankaj Sharma. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Account: Object {
    @objc dynamic var accountTitle: String = ""
    @objc dynamic var accountNumber: String = ""
    @objc dynamic var userName: String = ""
   @objc dynamic var password: String = ""
   @objc dynamic var phoneNumber: String = ""
   @objc dynamic var url: String = ""
   @objc dynamic var note: String = ""
    
}
