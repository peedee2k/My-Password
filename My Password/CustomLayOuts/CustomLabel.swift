//
//  CustomLabel.swift
//  My Password
//
//  Created by Pankaj Sharma on 7/31/18.
//  Copyright © 2018 Pankaj Sharma. All rights reserved.
//

import UIKit

class CustomeLabels: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()

    }
    
    private func setupLabel() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}
