//
//  EventHeaderViewTableViewCell.swift
//  Toza
//
//  Created by Farhad Saadatpei on 11/18/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit

class EventHeaderViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var barcodePreview: UIImageView!
    @IBOutlet weak var eventName: UITextView!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventAddress: UILabel!
    @IBOutlet weak var rsvpButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //Images
        barcodePreview.layer.cornerRadius = 5
        barcodePreview.clipsToBounds = true
        
        //Texts
        
        //Buttons
        rsvpButton.layer.cornerRadius = min(rsvpButton.frame.size.width, rsvpButton.frame.size.height) / 2
        rsvpButton.layer.shadowColor = UIColor.black.cgColor
        rsvpButton.layer.shadowRadius = 10
        rsvpButton.layer.shadowOpacity = 0.2
        rsvpButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        rsvpButton.layer.masksToBounds = false
        
        shareButton.layer.cornerRadius = min(rsvpButton.frame.size.width, rsvpButton.frame.size.height) / 2
        shareButton.layer.shadowColor = UIColor.black.cgColor
        shareButton.layer.shadowRadius = 10
        shareButton.layer.shadowOpacity = 0.2
        shareButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        shareButton.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
