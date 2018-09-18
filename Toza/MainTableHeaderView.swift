//
//  MainTableHeaderView.swift
//  Toza
//
//  Created by Farhad Saadatpei on 11/8/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit

class MainTableHeaderView: UIView {

    @IBOutlet weak var nameAttribute: UILabel!
    @IBOutlet weak var selectionAttributeTitle: UILabel!
    @IBOutlet weak var selectionAttributeIcon: UIButton!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
       selectionAttributeIcon.titleLabel?.font = UIFont.fontAwesome(ofSize: 11)
    }
    

}
