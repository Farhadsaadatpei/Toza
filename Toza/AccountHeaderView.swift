//
//  AccountHeaderView.swift
//  Toza
//
//  Created by Farhad Saadatpei on 11/10/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit
import TextFieldEffects

class AccountHeaderView: UIView, UITextFieldDelegate {
    
    //User Details
    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet weak var userFirstName: HoshiTextField!
    @IBOutlet weak var userLastName: HoshiTextField!

    //Badges
    @IBOutlet weak var guestBadge: UILabel!
    @IBOutlet weak var promoterBadge: UILabel!
    @IBOutlet weak var hostBadge: UILabel!

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //User Details
        userProfilePicture.layer.cornerRadius = min(userProfilePicture.frame.size.width, userProfilePicture.frame.size.height) / 2
        userProfilePicture.layer.masksToBounds = true
        
        //TextField
        userFirstName.delegate = self
        userLastName.delegate = self
        
        //Badges
        guestBadge.layer.cornerRadius = 5
        guestBadge.layer.masksToBounds = true
        promoterBadge.layer.cornerRadius = 5
        promoterBadge.layer.masksToBounds = true
        hostBadge.layer.cornerRadius = 5
        hostBadge.layer.masksToBounds = true

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}
