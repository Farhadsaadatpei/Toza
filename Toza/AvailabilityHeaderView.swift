//
//  AvailabilityHeaderView.swift
//  Toza
//
//  Created by Farhad Saadatpei on 11/18/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit

class AvailabilityHeaderView: UIView {
    
    @IBOutlet weak var costPerPerson: UILabel!
    @IBOutlet weak var promoterStatus: UILabel!
    @IBOutlet weak var sendMessage: UIButton!

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        //Send Message Button
        sendMessage.layer.cornerRadius = 5
    }
}
