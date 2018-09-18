//
//  TallerNavigationBar.swift
//  Toza
//
//  Created by Farhad Saadatpei on 11/8/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit

class TozaNavigationBar: UINavigationBar {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let newSize: CGSize = CGSize(width: (superview?.layer.frame.width)!, height: 60)
        return newSize
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
