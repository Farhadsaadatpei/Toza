//
//  UserAccountTableViewCell.swift
//  Toza
//
//  Created by Farhad Saadatpei on 11/7/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit
import PhoneNumberKit

class UserAccountTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    
    @IBOutlet weak var attributeName: UILabel!
    @IBOutlet weak var attributeDetail: UITextField!
    @IBOutlet weak var attributePhoneNumber: UITextField!
    @IBOutlet weak var attributeHint: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //TextFields
        attributeDetail.delegate = self
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
