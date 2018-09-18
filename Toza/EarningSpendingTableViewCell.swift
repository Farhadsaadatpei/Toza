//
//  PromoterEarningTableViewCell.swift
//  Toza
//
//  Created by Farhad Saadatpei on 11/7/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit

class EarningSpendingTableViewCell: UITableViewCell {
    
    //Statistics
    @IBOutlet weak var numberOfGuest: UILabel!
    @IBOutlet weak var averageCostPerGuest: UILabel!
    @IBOutlet weak var numberOfEvents: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
